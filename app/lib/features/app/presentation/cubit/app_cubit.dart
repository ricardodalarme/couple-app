import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';

part 'app_state.dart';

class AppCubit({
  required final AuthenticationRepository _authenticationRepository,
  required final ProfileRepository _profileRepository,
  required final SettingsRepository _settingsRepository,
}) extends Cubit<AppState> {
  this : super(AppState.unauthenticated) {
    _authStateChangesSubscription = _authenticationRepository.isAuthenticatedStream.listen(
      _onStatusChanged,
    );
  }

  StreamSubscription<bool>? _authStateChangesSubscription;

  void _onStatusChanged(bool isAuthenticated) => unawaited(_resolve(isAuthenticated));

  Future<void> initialize() => _resolve(_authenticationRepository.isAuthenticated);

  /// Moves on from the profile step once it has been saved.
  void completeOnboarding() => emit(AppState.authenticated);

  Future<void> logout() async {
    await _authenticationRepository.logOut();
  }

  Future<void> _resolve(bool isAuthenticated) async {
    if (!isAuthenticated) return emit(AppState.unauthenticated);

    emit(AppState.checking);
    try {
      final profile = await _profileRepository.ensureProfile();
      await _uploadIntroAnswers(profile.id);
      final settings = await _profileRepository.getMySettings();
      await _rememberTheme(settings.theme);
      emit(settings.isOnboarded ? AppState.authenticated : AppState.onboarding);
    } on Object {
      // The repository already logged it. Offline people still reach their own space.
      emit(AppState.authenticated);
    }
  }

  Future<void> _uploadIntroAnswers(String profileId) async {
    final local = _settingsRepository.get();
    if (!local.hasPendingIntroAnswers) return;

    try {
      await _profileRepository.saveIntroAnswers(
        profileId: profileId,
        phase: local.introPhase,
        goals: local.introGoals,
      );
      await _settingsRepository.save(local.copyWith(introUploaded: true));
    } on Object {
      // Kept on the device and retried at the next start.
    }
  }

  Future<void> _rememberTheme(AppThemeVariant theme) {
    final settings = _settingsRepository.get();
    return _settingsRepository.save(settings.copyWith(themeVariant: theme.name));
  }

  @override
  Future<void> close() async {
    await _authStateChangesSubscription?.cancel();
    await super.close();
  }
}
