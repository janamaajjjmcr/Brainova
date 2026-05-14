
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions get web => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_WEB_API_KEY'] ?? '',
    appId: '1:818592913245:web:c2a998149a9a4d06acfab4',
    messagingSenderId: '818592913245',
    projectId: 'cs-brainova',
    authDomain: 'cs-brainova.firebaseapp.com',
    storageBucket: 'cs-brainova.firebasestorage.app',
    measurementId: 'G-KK4Z8PEM0M',
  );

  static FirebaseOptions get android => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_ANDROID_API_KEY'] ?? '',
    appId: '1:818592913245:android:117d917a9f8b370dacfab4',
    messagingSenderId: '818592913245',
    projectId: 'cs-brainova',
    storageBucket: 'cs-brainova.firebasestorage.app',
  );

  static FirebaseOptions get ios => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_IOS_API_KEY'] ?? '',
    appId: '1:818592913245:ios:6e68050fbc6d6a72acfab4',
    messagingSenderId: '818592913245',
    projectId: 'cs-brainova',
    storageBucket: 'cs-brainova.firebasestorage.app',
    iosClientId:
        '818592913245-krh6bqlkkf033rtu6nkvkatoda43dts0.apps.googleusercontent.com',
    iosBundleId: 'com.brainova.brainova',
  );

  static FirebaseOptions get macos => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_IOS_API_KEY'] ?? '',
    appId: '1:818592913245:ios:6e68050fbc6d6a72acfab4',
    messagingSenderId: '818592913245',
    projectId: 'cs-brainova',
    storageBucket: 'cs-brainova.firebasestorage.app',
    iosClientId:
        '818592913245-krh6bqlkkf033rtu6nkvkatoda43dts0.apps.googleusercontent.com',
    iosBundleId: 'com.brainova.brainova',
  );

  static FirebaseOptions get windows => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_WEB_API_KEY'] ?? '',
    appId: '1:818592913245:web:c2a998149a9a4d06acfab4',
    messagingSenderId: '818592913245',
    projectId: 'cs-brainova',
    authDomain: 'cs-brainova.firebaseapp.com',
    storageBucket: 'cs-brainova.firebasestorage.app',
    measurementId: 'G-KK4Z8PEM0M',
  );
}
