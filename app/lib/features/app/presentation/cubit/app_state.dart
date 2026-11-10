part of 'app_cubit.dart';

enum AppState() {
  unauthenticated,

  /// Signed in, still learning whether the profile step is done.
  checking,

  /// Signed in, but the first profile step is not finished.
  onboarding,
  authenticated,
}
