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
    apiKey: 'AIzaSyBK0E6lyyINTL8uwaE5kxKnp1h4KBAfcuY',
    appId: '1:425762305183:web:e196077e3879cae0339eaa',
    messagingSenderId: '425762305183',
    projectId: 'app1-ed31a',
    authDomain: 'app1-ed31a.firebaseapp.com',
    storageBucket: 'app1-ed31a.appspot.com',
    measurementId: 'G-5KEEVLD3DS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAV56zj6nULvQmqAKAIsBIsrfBeVEX83bY',
    appId: '1:425762305183:android:f748eff752d05bdb339eaa',
    messagingSenderId: '425762305183',
    projectId: 'app1-ed31a',
    storageBucket: 'app1-ed31a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtBMSovArSTq6dh7VlaovK7tvW1HQ7ayQ',
    appId: '1:425762305183:ios:f56a7cb8c89bd7cf339eaa',
    messagingSenderId: '425762305183',
    projectId: 'app1-ed31a',
    storageBucket: 'app1-ed31a.appspot.com',
    iosBundleId: 'com.example.firebaseExampleProj1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtBMSovArSTq6dh7VlaovK7tvW1HQ7ayQ',
    appId: '1:425762305183:ios:254336f196e216d7339eaa',
    messagingSenderId: '425762305183',
    projectId: 'app1-ed31a',
    storageBucket: 'app1-ed31a.appspot.com',
    iosBundleId: 'com.example.firebaseExampleProj1.RunnerTests',
  );
}