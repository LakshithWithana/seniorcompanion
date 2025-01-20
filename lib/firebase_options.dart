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
    apiKey: 'AIzaSyCVm3LmMrSzVlQu_FgQSVkmzJIQj_S11Pc',
    appId: '1:285205140731:android:5b30703503697f5fe84c5e',
    messagingSenderId: '285205140731',
    projectId: 'senior-companion-app',
    storageBucket: 'senior-companion-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCj37qZ-QEOCRUFi_mpgMI9SHME6n3hAus',
    appId: '1:285205140731:ios:b390b6cecfd4942fe84c5e',
    messagingSenderId: '285205140731',
    projectId: 'senior-companion-app',
    storageBucket: 'senior-companion-app.appspot.com',
    androidClientId: '285205140731-487cvhr2a14ncf9p2r4mucmdg8hkun51.apps.googleusercontent.com',
    iosClientId: '285205140731-n2lclibfr3d2tks4vdhhl1jnfednv2ju.apps.googleusercontent.com',
    iosBundleId: 'com.doughnutlabs.newseniiorcompaniion',
  );

}