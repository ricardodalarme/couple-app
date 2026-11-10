import 'dart:async';

import 'package:connectivity_service/connectivity_service.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/devices/data/repositories/devices_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';

part 'app_state.dart';

class AppCubit({
  required final AuthenticationRepository _authenticationRepository,
  required final ProfileRepository _profileRepository,
  required final SettingsRepository _settingsRepository,
  required final SlipRepository _slipRepository,
  required final SupportRepository _supportRepository,
  required final ReminderSyncService _reminderSyncService,
  required final ConnectivityService _connectivityService,
  required final NotificationsRepository _notificationsRepository,
  required final DevicesRepository _devicesRepository,
}) extends Cubit<AppState> {
  this : super(AppState.unauthenticated) {
    _authStateChangesSubscription = _authenticationRepository.isAuthenticatedStream.listen(
      _onStatusChanged,
    );
    _connectivitySubscription = _connectivityService.onStatusChange.listen((isOnline) {
      if (isOnline) unawaited(_flushSupport());
    });
  }

  StreamSubscription<bool>? _authStateChangesSubscription;
  StreamSubscription<bool>? _connectivitySubscription;

  void _onStatusChanged(bool isAuthenticated) => unawaited(_resolve(isAuthenticated));

  Future<void> initialize() => _resolve(_authenticationRepository.isAuthenticated);

  /// Moves on from the profile step once it has been saved.
  void completeOnboarding() => emit(AppState.authenticated);

  Future<void> logout() async {
    final unregistered = await _notificationsRepository.unregisterCurrentDevice();
    if (!unregistered) await _devicesRepository.revokeCurrentDevice();
    await _authenticationRepository.logOut();
  }

  Future<void> _resolve(bool isAuthenticated) async {
    if (!isAuthenticated) {
      await _clearSupportQueue();
      return emit(AppState.unauthenticated);
    }

    emit(AppState.checking);
    try {
      final profile = await _profileRepository.ensureProfile();
      await _uploadIntroAnswers(profile.id);
      final settings = await _profileRepository.getMySettings();
      await _rememberTheme(settings.theme);
      unawaited(_slipRepository.flushPending());
      unawaited(_supportRepository.flushPending(authorId: profile.id));
      unawaited(_reminderSyncService.sync());
      emit(settings.isOnboarded ? AppState.authenticated : AppState.onboarding);
    } on Object {
      // The repository already logged it. Offline people still reach their own space.
      emit(AppState.authenticated);
    }
  }

  Future<void> _flushSupport() async {
    final authorId = _authenticationRepository.currentUserId;
    if (authorId == null) return;

    await _supportRepository.flushPending(authorId: authorId);
  }

  Future<void> _clearSupportQueue() async {
    try {
      await _supportRepository.clearPending();
    } on Object {
      // Local storage is unavailable; sign-out still proceeds.
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
    await _connectivitySubscription?.cancel();
    await super.close();
  }
}
