abstract interface class Config {
  static const String serverUrl = String.fromEnvironment('SERVER_URL');
  static const String restServerUrl = String.fromEnvironment('REST_SERVER_URL');
}
