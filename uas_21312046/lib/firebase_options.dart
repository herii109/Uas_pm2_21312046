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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDZqkJ7T_goYumhi33owXkSiS55lcbmsXY',
    appId: '1:718944600438:web:c7baee7f12feea54cf7a57',
    messagingSenderId: '718944600438',
    projectId: 'uas-21312046',
    authDomain: 'uas-21312046.firebaseapp.com',
    storageBucket: 'uas-21312046.appspot.com',
    measurementId: 'G-FTS2CF08PM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6b5jPcINMZLszUchswSINKOwHyvcr1lc',
    appId: '1:718944600438:android:c5087cf98867d422cf7a57',
    messagingSenderId: '718944600438',
    projectId: 'uas-21312046',
    storageBucket: 'uas-21312046.appspot.com',
  );
}
