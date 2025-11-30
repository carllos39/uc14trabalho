// TODO Implement this library.
// File: lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

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
        return linux;
      default:
        throw UnsupportedError(
          'Plataforma não suportada: $defaultTargetPlatform',
        );
    }
  }

  // 🔥 CONFIG WEB (se usar Firebase Web)
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "SUA_API_KEY_WEB",
    authDomain: "SEU_DOMINIO.firebaseapp.com",
    projectId: "SEU_PROJECT_ID",
    storageBucket: "SEU_BUCKET.appspot.com",
    messagingSenderId: "SEU_SENDER_ID",
    appId: "SEU_APP_ID",
    measurementId: "MEASUREMENT_ID",
  );

  // 🔥 CONFIG ANDROID (google-services.json)
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "SUA_API_KEY_ANDROID",
    appId: "SUA_APP_ID_ANDROID",
    messagingSenderId: "SUA_MESSAGING_SENDER_ID",
    projectId: "SEU_PROJECT_ID",
    storageBucket: "SEU_BUCKET.appspot.com",
  );

  // 🔥 CONFIG iOS (GoogleService-Info.plist)
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "SUA_API_KEY_IOS",
    appId: "SUA_APP_ID_IOS",
    messagingSenderId: "SUA_MESSAGING_SENDER_ID",
    projectId: "SEU_PROJECT_ID",
    storageBucket: "SEU_BUCKET.appspot.com",
    iosBundleId: "SEU_BUNDLE_ID_IOS",
  );

  // OPCIONAIS — Pode deixar igual ao iOS/Android ou ignorar se não for usar
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "SUA_API_KEY_IOS",
    appId: "SUA_APP_ID_IOS",
    messagingSenderId: "SUA_MESSAGING_SENDER_ID",
    projectId: "SEU_PROJECT_ID",
    storageBucket: "SEU_BUCKET.appspot.com",
    iosBundleId: "SEU_BUNDLE_ID_MACOS",
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: "SUA_API_KEY_WINDOWS",
    appId: "SUA_APP_ID_WINDOWS",
    messagingSenderId: "SUA_MESSAGING_SENDER_ID",
    projectId: "SEU_PROJECT_ID",
    storageBucket: "SEU_BUCKET.appspot.com",
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: "SUA_API_KEY_LINUX",
    appId: "SUA_APP_ID_LINUX",
    messagingSenderId: "SUA_MESSAGING_SENDER_ID",
    projectId: "SEU_PROJECT_ID",
    storageBucket: "SEU_BUCKET.appspot.com",
  );
}
