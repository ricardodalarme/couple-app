import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform => switch (defaultTargetPlatform) {
        TargetPlatform.android => android,
        TargetPlatform.iOS => ios,
        _ => throw UnsupportedError(
            'Unsupported platform: $defaultTargetPlatform',
          ),
      };

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: Config.firebaseAndroidApiKey,
    appId: Config.firebaseAndroidAppId,
    messagingSenderId: Config.firebaseMessagingSenderId,
    projectId: Config.firebaseProjectId,
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: Config.firebaseIosApiKey,
    appId: Config.firebaseIosAppId,
    messagingSenderId: Config.firebaseMessagingSenderId,
    projectId: Config.firebaseProjectId,
  );
}
