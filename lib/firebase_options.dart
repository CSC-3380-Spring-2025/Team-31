//
//firebase_options.dart
// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDfg5HJpoZ8WwDszSoTKZThboDA1cKRZNM',
    appId: '1:34811750205:web:63d8cb0d0f07b50d174754',
    messagingSenderId: '34811750205',
    projectId: 'flashcard-app-54723',
    authDomain: 'flashcard-app-54723.firebaseapp.com',
    storageBucket: 'flashcard-app-54723.firebasestorage.app',
    measurementId: 'G-FTB3F80F2Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDn5ufescTCMWsQteBPeEnAZ3SxYErfqMI',
    appId: '1:34811750205:android:7b2c8934d3eab6d3174754',
    messagingSenderId: '34811750205',
    projectId: 'flashcard-app-54723',
    storageBucket: 'flashcard-app-54723.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArMjxtlFsxPWGLA1qLQx7jOmUZEXb804I',
    appId: '1:34811750205:ios:ea2fb66fc7ca408e174754',
    messagingSenderId: '34811750205',
    projectId: 'flashcard-app-54723',
    storageBucket: 'flashcard-app-54723.firebasestorage.app',
    iosClientId: '34811750205-k21ssi40u9m9k6p3i84grjpr4rg6e4q7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArMjxtlFsxPWGLA1qLQx7jOmUZEXb804I',
    appId: '1:34811750205:ios:ea2fb66fc7ca408e174754',
    messagingSenderId: '34811750205',
    projectId: 'flashcard-app-54723',
    storageBucket: 'flashcard-app-54723.firebasestorage.app',
    iosClientId: '34811750205-k21ssi40u9m9k6p3i84grjpr4rg6e4q7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDfg5HJpoZ8WwDszSoTKZThboDA1cKRZNM',
    appId: '1:34811750205:web:885db77d1b79c824174754',
    messagingSenderId: '34811750205',
    projectId: 'flashcard-app-54723',
    authDomain: 'flashcard-app-54723.firebaseapp.com',
    storageBucket: 'flashcard-app-54723.firebasestorage.app',
    measurementId: 'G-VNGP6D4YBM',
  );

}