abstract interface class Config {
  static const String serverUrl = String.fromEnvironment('SERVER_URL');
  static const String restServerUrl = String.fromEnvironment('REST_SERVER_URL');
  static const String firebaseMessagingSenderId =
      String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');
  static const String firebaseProjectId =
      String.fromEnvironment('FIREBASE_PROJECT_ID');
  static const String firebaseAndroidAppId =
      String.fromEnvironment('FIREBASE_ANDROID_APP_ID');
  static const String firebaseAndroidApiKey =
      String.fromEnvironment('FIREBASE_ANDROID_API_KEY');
  static const String firebaseIosAppId =
      String.fromEnvironment('FIREBASE_IOS_APP_ID');
  static const String firebaseIosApiKey =
      String.fromEnvironment('FIREBASE_IOS_API_KEY');
}
