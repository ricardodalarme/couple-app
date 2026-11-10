import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';

part 'app_state.dart';

class AppCubit({required final AuthenticationRepository _authenticationRepository})
    extends Cubit<AppState> {
  this : super(AppState.unauthenticated) {
    _authStateChangesSubscription = _authenticationRepository.isAuthenticatedStream.listen(
      _onStatusChanged,
    );
  }

  StreamSubscription<bool>? _authStateChangesSubscription;

  void _onStatusChanged(bool isAuthenticated) {
    emit(isAuthenticated ? AppState.authenticated : AppState.unauthenticated);
  }

  void initialize() {
    emit(
      _authenticationRepository.isAuthenticated ? AppState.authenticated : AppState.unauthenticated,
    );
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
