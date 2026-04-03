import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required AuthenticationRepository authenticationRepository,
    required SettingsRepository settingsRepository,
  }) : _authenticationRepository = authenticationRepository,
       _settingsRepository = settingsRepository,
       super(AppState.unauthenticated) {
    _authStateChangesSubscription = _authenticationRepository.isAuthenticatedStream.listen(
      _onStatusChanged,
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final SettingsRepository _settingsRepository;
  StreamSubscription<bool>? _authStateChangesSubscription;

  void _onStatusChanged(bool isAuthenticated) {
    if (isAuthenticated) {
      emit(AppState.authenticated);
    } else {
      emit(AppState.unauthenticated);
    }
  }

  void initialize() {
    final Settings settings = _settingsRepository.get();
    if (!settings.hasOnboarded) return emit(AppState.onboarding);
    if (!_authenticationRepository.isAuthenticated) return emit(AppState.unauthenticated);
    return emit(AppState.authenticated);
  }

  Future<void> logout() async {
    await _authenticationRepository.logOut();
  }

  @override
  Future<void> close() async {
    await _authStateChangesSubscription?.cancel();
    await super.close();
  }
}
