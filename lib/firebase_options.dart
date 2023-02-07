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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbhgwTSdw_ZOqTW5hmvX804VzXzAli_fE',
    appId: '1:554281553345:android:97b7f7920482f30c9b7340',
    messagingSenderId: '554281553345',
    projectId: 'swap-7667',
    databaseURL: 'https://swap-7667.firebaseio.com',
    storageBucket: 'swap-7667.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDywGCpGaFED86st_bZUn4c9tE_vfElD4U',
    appId: '1:554281553345:ios:4353687cc380dac79b7340',
    messagingSenderId: '554281553345',
    projectId: 'swap-7667',
    databaseURL: 'https://swap-7667.firebaseio.com',
    storageBucket: 'swap-7667.appspot.com',
    androidClientId: '554281553345-65vspv1bpolgv7ei9q155ro8ue1a1249.apps.googleusercontent.com',
    iosClientId: '554281553345-b46rldhfg32pbd504q5bl20eh3d7j9o7.apps.googleusercontent.com',
    iosBundleId: 'com.swapapp',
  );
}