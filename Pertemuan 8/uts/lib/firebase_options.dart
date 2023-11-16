// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAnLsdUMYYw9NoiUm6uPDZbFmnX1Wds5yU',
    appId: '1:1072304345941:web:b38ddf3c9904eb38ad15dc',
    messagingSenderId: '1072304345941',
    projectId: 'mobile-uts-2023',
    authDomain: 'mobile-uts-2023.firebaseapp.com',
    storageBucket: 'mobile-uts-2023.appspot.com',
    measurementId: 'G-HFN9LW9JVK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvVUyjwG056yNMEF0Pax579-C-scX5UuU',
    appId: '1:1072304345941:android:308beca09e912583ad15dc',
    messagingSenderId: '1072304345941',
    projectId: 'mobile-uts-2023',
    storageBucket: 'mobile-uts-2023.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtgxZD9pyzu7ouPodWqTatEwg3c_iB4Ig',
    appId: '1:1072304345941:ios:e038c4abbe51e8b2ad15dc',
    messagingSenderId: '1072304345941',
    projectId: 'mobile-uts-2023',
    storageBucket: 'mobile-uts-2023.appspot.com',
    iosBundleId: 'com.example.uts',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtgxZD9pyzu7ouPodWqTatEwg3c_iB4Ig',
    appId: '1:1072304345941:ios:6e41e26a677ebf43ad15dc',
    messagingSenderId: '1072304345941',
    projectId: 'mobile-uts-2023',
    storageBucket: 'mobile-uts-2023.appspot.com',
    iosBundleId: 'com.example.uts.RunnerTests',
  );
}
