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
    apiKey: 'AIzaSyB0DWPoWQEhWd0tL2dkvu4cncZ-Yq_8jQg',
    appId: '1:556243944038:web:5cb186b2cc372e15df23a7',
    messagingSenderId: '556243944038',
    projectId: 'fast-trivia-954a0',
    authDomain: 'fast-trivia-954a0.firebaseapp.com',
    storageBucket: 'fast-trivia-954a0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHH2pa2xtOLHJtSGrORqEcU8pAZi5v-LA',
    appId: '1:556243944038:android:3341eb85665764c0df23a7',
    messagingSenderId: '556243944038',
    projectId: 'fast-trivia-954a0',
    storageBucket: 'fast-trivia-954a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIb8i0JqjuH1--Z2527aIAArZGnNhR-dQ',
    appId: '1:556243944038:ios:77bc3a2ad23d6930df23a7',
    messagingSenderId: '556243944038',
    projectId: 'fast-trivia-954a0',
    storageBucket: 'fast-trivia-954a0.appspot.com',
    iosClientId: '556243944038-rlvovcu99kc7pl9qdusgvmla2uudllj6.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastTrivia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIb8i0JqjuH1--Z2527aIAArZGnNhR-dQ',
    appId: '1:556243944038:ios:89e08031931a5e4cdf23a7',
    messagingSenderId: '556243944038',
    projectId: 'fast-trivia-954a0',
    storageBucket: 'fast-trivia-954a0.appspot.com',
    iosClientId: '556243944038-m72r0chrg743dbmft1e402bue81ks2k5.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastTrivia.RunnerTests',
  );
}
