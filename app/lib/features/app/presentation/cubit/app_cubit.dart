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
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';

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
  final WidgetsRepository? _widgetsRepository,
}) extends Cubit<AppState> {
  this : super(AppState.unauthenticated) {
    _authStateChangesSubscription = _authenticationRepository.isAuthenticatedStream.listen(
      _onStatusChanged,
      onError: _onAuthError,
    );
    _connectivitySubscription = _connectivityService.onStatusChange.listen((isOnline) {
      if (isOnline) unawaited(_flushSupport());
    });
  }

  StreamSubscription<bool>? _authStateChangesSubscription;
  StreamSubscription<bool>? _connectivitySubscription;
  bool _wasAuthenticated = false;
  bool _explicitSignOut = false;
  int _authEpoch = 0;

  void _onStatusChanged(bool isAuthenticated) {
    if (isAuthenticated) {
      _authEpoch++;
      _explicitSignOut = false;
      unawaited(_resolve(true));
      return;
    }

    _authEpoch++;
    final epoch = _authEpoch;
    if (_explicitSignOut) {
      _explicitSignOut = false;
      unawaited(_resolve(false));
      return;
    }

    if (_wasAuthenticated) {
      _wasAuthenticated = false;
      unawaited(_expireSession(epoch));
      return;
    }

    unawaited(_resolve(false));
  }

  void _onAuthError(Object error, StackTrace stackTrace) {
    _authEpoch++;
    final epoch = _authEpoch;
    if (_wasAuthenticated) {
      _wasAuthenticated = false;
      unawaited(_expireSession(epoch));
      return;
    }

    unawaited(_resolve(false));
  }

  Future<void> _expireSession(int epoch) async {
    await _clearWidgetData();
    if (epoch != _authEpoch || isClosed) return;
    emit(AppState.sessionExpired);
  }

  Future<void> initialize() => _resolve(_authenticationRepository.isAuthenticated);

  /// Moves on from the profile step once it has been saved.
  void completeOnboarding() => emit(AppState.authenticated);

  /// Marks the next auth loss as a deliberate sign-out rather than an expiry.
  void markExplicitSignOut() => _explicitSignOut = true;

  void cancelExplicitSignOut() => _explicitSignOut = false;

  Future<void> logout() async {
    markExplicitSignOut();
    try {
      final unregistered = await _notificationsRepository.unregisterCurrentDevice();
      if (!unregistered) await _devicesRepository.revokeCurrentDevice();
      await _authenticationRepository.logOut();
    } catch (_) {
      cancelExplicitSignOut();
      rethrow;
    }
  }

  Future<void> _resolve(bool isAuthenticated) async {
    final epoch = _authEpoch;
    if (!isAuthenticated) {
      _wasAuthenticated = false;
      await _clearSupportQueue();
      await _clearWidgetData();
      if (epoch != _authEpoch || isClosed) return;
      emit(AppState.unauthenticated);
      return;
    }

    _explicitSignOut = false;
    _wasAuthenticated = true;
    final isRecovering = state == AppState.sessionExpired;
    if (!isRecovering && !isClosed) emit(AppState.checking);
    try {
      final profile = await _profileRepository.ensureProfile();
      await _uploadIntroAnswers(profile.id);
      final settings = await _profileRepository.getMySettings();
      await _rememberTheme(settings.theme);
      unawaited(_slipRepository.flushPending());
      unawaited(_supportRepository.flushPending(authorId: profile.id));
      unawaited(_reminderSyncService.sync());
      unawaited(_widgetsRepository?.syncQuietly());
      if (epoch != _authEpoch || isClosed) return;
      emit(settings.isOnboarded ? AppState.authenticated : AppState.onboarding);
    } on Object {
      // The repository already logged it. Offline people still reach their own space.
      if (epoch != _authEpoch || isClosed) return;
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

  Future<void> _clearWidgetData() async {
    try {
      await _widgetsRepository?.clearOnSignOut();
    } on Object {
      // Widget cleanup is best-effort; auth state still moves on.
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
