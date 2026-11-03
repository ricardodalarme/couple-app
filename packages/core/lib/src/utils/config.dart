abstract interface class Config() {
  static const String serverUrl = String.fromEnvironment('SERVER_URL');
  static const String serverApiKey = String.fromEnvironment('SERVER_API_KEY');
  static const String restServerUrl = String.fromEnvironment('REST_SERVER_URL');
  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
}
