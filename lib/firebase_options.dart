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
    apiKey: 'AIzaSyAMeOzPLX_vBD_SrcJJ9h2a32JNKRzt_uk',
    appId: '1:719289676929:web:3e335a47490e793f26c980',
    messagingSenderId: '719289676929',
    projectId: 'autismconnect-79aad',
    authDomain: 'autismconnect-79aad.firebaseapp.com',
    storageBucket: 'autismconnect-79aad.appspot.com',
    measurementId: 'G-40NR0XD9NP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCesgLbFq9KBWsVV6gJ953ilEuV2osA94E',
    appId: '1:719289676929:android:252595735318315726c980',
    messagingSenderId: '719289676929',
    projectId: 'autismconnect-79aad',
    storageBucket: 'autismconnect-79aad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoYYiKxXh7EUZxYlhybJgd1efRB7rD504',
    appId: '1:719289676929:ios:554ab1bd1337621026c980',
    messagingSenderId: '719289676929',
    projectId: 'autismconnect-79aad',
    storageBucket: 'autismconnect-79aad.appspot.com',
    iosBundleId: 'com.example.fyp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDoYYiKxXh7EUZxYlhybJgd1efRB7rD504',
    appId: '1:719289676929:ios:554ab1bd1337621026c980',
    messagingSenderId: '719289676929',
    projectId: 'autismconnect-79aad',
    storageBucket: 'autismconnect-79aad.appspot.com',
    iosBundleId: 'com.example.fyp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAMeOzPLX_vBD_SrcJJ9h2a32JNKRzt_uk',
    appId: '1:719289676929:web:e3cfc68794ae519926c980',
    messagingSenderId: '719289676929',
    projectId: 'autismconnect-79aad',
    authDomain: 'autismconnect-79aad.firebaseapp.com',
    storageBucket: 'autismconnect-79aad.appspot.com',
    measurementId: 'G-BLDQPJDKT0',
  );
}
