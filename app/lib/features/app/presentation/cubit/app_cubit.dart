import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

part 'app_state.dart';

class AppCubit({
  required final AuthenticationRepository _authenticationRepository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<AppState> {
  this : super(AppState.unauthenticated) {
    _authStateChangesSubscription = _authenticationRepository.isAuthenticatedStream.listen(
      _onStatusChanged,
    );
  }

  StreamSubscription<bool>? _authStateChangesSubscription;

  void _onStatusChanged(bool isAuthenticated) => _apply(isAuthenticated);

  void initialize() => _apply(_authenticationRepository.isAuthenticated);

  Future<void> logout() async {
    await _authenticationRepository.logOut();
  }

  void _apply(bool isAuthenticated) {
    emit(isAuthenticated ? AppState.authenticated : AppState.unauthenticated);
    // The repository already logs the failure; a later screen retries the read.
    if (!isAuthenticated) return;
    unawaited(_profileRepository.ensureProfile().then((_) {}, onError: (_) {}));
  }

  @override
  Future<void> close() async {
    await _authStateChangesSubscription?.cancel();
    await super.close();
  }
}
