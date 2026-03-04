import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadProfilePicture(String uid, XFile image) async {
    try {
      final ref = _storage.ref().child('profile_pictures').child('$uid.jpg');

      if (kIsWeb) {
        await ref.putData(
          await image.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'),
        );
      } else {
        await ref.putData(await image.readAsBytes());
      }

      return await ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProfilePicture(String uid) async {
    try {
      final ref = _storage.ref().child('profile_pictures').child('$uid.jpg');
      await ref.delete();
    } catch (e) {
      // Handle known non-fatal errors
      if (e is FirebaseException) {
        if (e.code == 'object-not-found') {
          debugPrint('StorageService: Image not found, nothing to delete.');
          return;
        }
        if (e.code == 'retry-limit-exceeded') {
          debugPrint(
              'StorageService: Storage deletion timed out/exceeded retry limit. Skipping cleanup.');
          return;
        }
      }
      debugPrint('StorageService: Error deleting profile picture: $e');
      rethrow;
    }
  }
}
