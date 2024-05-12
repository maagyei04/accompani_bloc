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
    apiKey: 'AIzaSyAKTjrbKau6NEfLEF-o_FWT_BYsMzogtYQ',
    appId: '1:32942490702:web:1f7164d88579a6abaa2f1f',
    messagingSenderId: '32942490702',
    projectId: 'accompani-app',
    authDomain: 'accompani-app.firebaseapp.com',
    storageBucket: 'accompani-app.appspot.com',
    measurementId: 'G-VVC35N9JJ9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkpOyQsq3U8iSWZgUkDelz7DoUgHSlxCc',
    appId: '1:32942490702:android:ec44ba75da1c0ce1aa2f1f',
    messagingSenderId: '32942490702',
    projectId: 'accompani-app',
    storageBucket: 'accompani-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQGyTH8_pFDbJUrGoWWw-murKb9VfKZzE',
    appId: '1:32942490702:ios:8c8264e953183236aa2f1f',
    messagingSenderId: '32942490702',
    projectId: 'accompani-app',
    storageBucket: 'accompani-app.appspot.com',
    androidClientId: '32942490702-0sn8rvghtvm55hoqh56trviml0h30vrk.apps.googleusercontent.com',
    iosClientId: '32942490702-r2f5k531qteiah106kmm825pjj6psdet.apps.googleusercontent.com',
    iosBundleId: 'com.example.accompaniBloc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQGyTH8_pFDbJUrGoWWw-murKb9VfKZzE',
    appId: '1:32942490702:ios:91d9542999bf2ecbaa2f1f',
    messagingSenderId: '32942490702',
    projectId: 'accompani-app',
    storageBucket: 'accompani-app.appspot.com',
    androidClientId: '32942490702-0sn8rvghtvm55hoqh56trviml0h30vrk.apps.googleusercontent.com',
    iosClientId: '32942490702-q1kb7obacfo9do024m5dns1u2ts5evj7.apps.googleusercontent.com',
    iosBundleId: 'com.example.accompaniBloc.RunnerTests',
  );
}