import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'user_repository.dart';
import 'user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    FirebaseAuth.instance,
    ref.read(userRepositoryProvider),
  );
});

final authStateProvider = StreamProvider<UserModel?>((ref) {
  final authRepo = ref.read(authRepositoryProvider);
  return authRepo.authStateChanges();
});

class AuthRepository {
  final FirebaseAuth _auth;
  final UserRepository _userRepo;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: kIsWeb
        ? '818592913245-krh6bqlkkf033rtu6nkvkatoda43dts0.apps.googleusercontent.com'
        : null,
  );
  UserModel? _currentUser;
  StreamSubscription<UserModel?>? _authStateSubscription;

  AuthRepository(this._auth, this._userRepo) {
    _authStateSubscription = authStateChanges().listen((user) {
      _currentUser = user;
    });
  }

  void dispose() {
    _authStateSubscription?.cancel();
  }

  Stream<UserModel?> authStateChanges() {
    return _auth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      var userModel = await _userRepo.getUser(user.uid);
      if (userModel == null) {
        // Fallback: Create user model if missing in Firestore
        userModel = UserModel(
          uid: user.uid,
          email: user.email ?? '',
          displayName: user.displayName,
          photoUrl: user.photoURL,
          createdAt: DateTime.now(),
          lastLoginAt: DateTime.now(),
        );
        await _userRepo.createUser(userModel);
      }
      return userModel;
    });
  }

  UserModel? get currentUser => _currentUser;

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user != null) {
      final newUser = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        displayName: name,
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );
      await _userRepo.createUser(newUser);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) {
      await _userRepo.updateLastLogin(userCredential.user!.uid);
    }
  }

  Future<void> signInWithGoogle() async {
    UserCredential userCredential;

    if (kIsWeb) {
      // Use direct Firebase Auth popup for web (more reliable than the plugin)
      final googleProvider = GoogleAuthProvider();
      userCredential = await _auth.signInWithPopup(googleProvider);
    } else {
      // Use the google_sign_in plugin for native platforms
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential = await _auth.signInWithCredential(credential);
    }

    if (userCredential.user != null) {
      final existingUser = await _userRepo.getUser(userCredential.user!.uid);
      if (existingUser == null) {
        final newUser = UserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email ?? '',
          displayName: userCredential.user!.displayName,
          photoUrl: userCredential.user!.photoURL,
          createdAt: DateTime.now(),
          lastLoginAt: DateTime.now(),
        );
        await _userRepo.createUser(newUser);
      } else {
        await _userRepo.updateLastLogin(userCredential.user!.uid);
      }
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateProfile({
    String? displayName,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? gender,
    String? country,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final userModel = await _userRepo.getUser(user.uid);
    if (userModel == null) return;

    final updatedModel = userModel.copyWith(
      displayName: displayName,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      gender: gender,
      country: country,
    );

    // 1. Update Firestore (Source of truth)
    await _userRepo.updateUser(updatedModel);

    // 2. Update Firebase Auth display name if changed
    if (displayName != null) {
      await user.updateDisplayName(displayName);
    }

    // 3. Update local cache
    _currentUser = updatedModel;
  }

  Future<void> updateProfilePicture(XFile image) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final storageRef = FirebaseStorage.instance
        .ref()
        .child('profile_pictures')
        .child('${user.uid}.jpg');

    await storageRef.putFile(File(image.path));
    final downloadUrl = await storageRef.getDownloadURL();

    await user.updatePhotoURL(downloadUrl);
    final userModel = await _userRepo.getUser(user.uid);
    if (userModel != null) {
      await _userRepo.updateUser(userModel.copyWith(photoUrl: downloadUrl));
    }
  }

  Future<void> deleteProfilePicture() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final storageRef = FirebaseStorage.instance
        .ref()
        .child('profile_pictures')
        .child('${user.uid}.jpg');

    try {
      await storageRef.delete();
    } catch (_) {}

    await user.updatePhotoURL(null);
    final userModel = await _userRepo.getUser(user.uid);
    if (userModel != null) {
      await _userRepo.updateUser(userModel.copyWith(photoUrl: null));
    }
  }

  Future<void> updateEmail(String newEmail) async {
    final user = _auth.currentUser;
    if (user == null) return;
    await user.verifyBeforeUpdateEmail(newEmail);
  }

  Future<void> updatePassword(
      String currentPassword, String newPassword) async {
    final user = _auth.currentUser;
    if (user == null || user.email == null) return;

    final cred = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );

    await user.reauthenticateWithCredential(cred);
    await user.updatePassword(newPassword);
  }

  Future<void> deleteAccount({String? password}) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final uid = user.uid;

    // 1. Re-authenticate
    if (password != null && user.email != null) {
      final cred = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );
      await user.reauthenticateWithCredential(cred);
    } else if (user.providerData.any((p) => p.providerId == 'google.com')) {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final cred = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await user.reauthenticateWithCredential(cred);
      } else {
        throw FirebaseAuthException(
          code: 'reauthentication-failed',
          message: 'Google re-authentication cancelled.',
        );
      }
    }

    // 2. Cleanup User Data (Async)

    // Delete profile picture from Storage
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_pictures')
          .child('$uid.jpg');
      await storageRef.delete();
    } catch (_) {}

    // Delete activities from Firestore
    final activities = await FirebaseFirestore.instance
        .collection('activities')
        .where('uid', isEqualTo: uid)
        .get();
    for (var doc in activities.docs) {
      await doc.reference.delete();
    }

    // Delete Firestore user document
    await _userRepo.deleteUser(uid);

    // 3. Delete Firebase Auth account
    await user.delete();

    // 4. Local cleanup
    _currentUser = null;
    await _googleSignIn.signOut();
  }
}
