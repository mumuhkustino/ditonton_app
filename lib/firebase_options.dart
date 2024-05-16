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
    apiKey: 'AIzaSyD7ZEiGIcOKDerqXyutsQ22uOqx2DVzuNc',
    appId: '1:399099263137:web:007b6237b62513a1c618e0',
    messagingSenderId: '399099263137',
    projectId: 'ditonton-app-1083b',
    authDomain: 'ditonton-app-1083b.firebaseapp.com',
    storageBucket: 'ditonton-app-1083b.appspot.com',
    measurementId: 'G-PQM1FV1JPF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPXTZTJmEjgw9xBVA5XGlBmW-fzB2xKhc',
    appId: '1:399099263137:android:e6b295654c466a75c618e0',
    messagingSenderId: '399099263137',
    projectId: 'ditonton-app-1083b',
    storageBucket: 'ditonton-app-1083b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAD1W73WYa7iXj3iyCbwXuoZkdl79X3xnU',
    appId: '1:399099263137:ios:21823d2e4fa03a89c618e0',
    messagingSenderId: '399099263137',
    projectId: 'ditonton-app-1083b',
    storageBucket: 'ditonton-app-1083b.appspot.com',
    iosBundleId: 'com.dicoding.ditonton',
  );
}