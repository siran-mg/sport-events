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
    apiKey: 'AIzaSyDUMy9duwZw_4yn0jRkN8WwBFW7AuO55p0',
    appId: '1:41452549301:web:6076cb44443dbd47b57afc',
    messagingSenderId: '41452549301',
    projectId: 'sport-events-dc18d',
    authDomain: 'sport-events-dc18d.firebaseapp.com',
    storageBucket: 'sport-events-dc18d.appspot.com',
    measurementId: 'G-ZMDBNQMHES',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6WyHyl5M-1bsdyaz9Pia_RC1-48KoUd8',
    appId: '1:41452549301:android:ce6f63ebd92632dbb57afc',
    messagingSenderId: '41452549301',
    projectId: 'sport-events-dc18d',
    storageBucket: 'sport-events-dc18d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdhE906thrpMMi8JKy1frazDNfjy6Yr28',
    appId: '1:41452549301:ios:8b1864f4b508340eb57afc',
    messagingSenderId: '41452549301',
    projectId: 'sport-events-dc18d',
    storageBucket: 'sport-events-dc18d.appspot.com',
    iosClientId: '41452549301-iror84a6t0n9folmhmhu5413dpni6bhe.apps.googleusercontent.com',
    iosBundleId: 'com.siran.sportEvents',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdhE906thrpMMi8JKy1frazDNfjy6Yr28',
    appId: '1:41452549301:ios:8b1864f4b508340eb57afc',
    messagingSenderId: '41452549301',
    projectId: 'sport-events-dc18d',
    storageBucket: 'sport-events-dc18d.appspot.com',
    iosClientId: '41452549301-iror84a6t0n9folmhmhu5413dpni6bhe.apps.googleusercontent.com',
    iosBundleId: 'com.siran.sportEvents',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDUMy9duwZw_4yn0jRkN8WwBFW7AuO55p0',
    appId: '1:41452549301:web:86aadfebe498ca91b57afc',
    messagingSenderId: '41452549301',
    projectId: 'sport-events-dc18d',
    authDomain: 'sport-events-dc18d.firebaseapp.com',
    storageBucket: 'sport-events-dc18d.appspot.com',
    measurementId: 'G-DLE8PK62S7',
  );

}