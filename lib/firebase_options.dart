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
    apiKey: 'AIzaSyBs4jacP4KgYknrFaHfmkG7-3OClpofc00',
    appId: '1:671512218186:web:bd78eda8383a480d5e74b3',
    messagingSenderId: '671512218186',
    projectId: 'oua-quiz-app',
    authDomain: 'oua-quiz-app.firebaseapp.com',
    storageBucket: 'oua-quiz-app.appspot.com',
    measurementId: 'G-PD8E301XB7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcDefGNKwsE_85MveEZT4G0t3nEmXbGDQ',
    appId: '1:671512218186:android:130ff3e2d039cd965e74b3',
    messagingSenderId: '671512218186',
    projectId: 'oua-quiz-app',
    storageBucket: 'oua-quiz-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrBAYXleVoaNmZoLfOvm2fuvcY7oXh1Lc',
    appId: '1:671512218186:ios:e24c86f8bf5891b45e74b3',
    messagingSenderId: '671512218186',
    projectId: 'oua-quiz-app',
    storageBucket: 'oua-quiz-app.appspot.com',
    iosBundleId: 'com.example.quizzAi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDrBAYXleVoaNmZoLfOvm2fuvcY7oXh1Lc',
    appId: '1:671512218186:ios:e24c86f8bf5891b45e74b3',
    messagingSenderId: '671512218186',
    projectId: 'oua-quiz-app',
    storageBucket: 'oua-quiz-app.appspot.com',
    iosBundleId: 'com.example.quizzAi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBs4jacP4KgYknrFaHfmkG7-3OClpofc00',
    appId: '1:671512218186:web:b0bc9bd26d7439265e74b3',
    messagingSenderId: '671512218186',
    projectId: 'oua-quiz-app',
    authDomain: 'oua-quiz-app.firebaseapp.com',
    storageBucket: 'oua-quiz-app.appspot.com',
    measurementId: 'G-CR7X8H5LSY',
  );
}
