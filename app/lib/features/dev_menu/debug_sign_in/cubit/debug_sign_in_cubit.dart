import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';

part 'debug_sign_in_state.dart';

class DebugSignInCubit({required final AuthenticationRepository _authenticationRepository})
    extends Cubit<DebugSignInState> {
  this : super(const DebugSignInState());

  void onEmailChanged(String email) => emit(state.copyWith(email: email));

  void onPasswordChanged(String password) => emit(state.copyWith(password: password));

  Future<void> signIn() => _run(
    () => _authenticationRepository.logInWithEmailAndPassword(
      email: state.email.trim(),
      password: state.password,
    ),
  );

  /// Creates the account; when the backend requires a confirmation email, no session exists yet.
  Future<void> signUp() async {
    if (state.signInAction.isLoading) return;

    emit(state.copyWith(signInAction: const Loading(), awaitingEmailConfirmation: false));
    try {
      await _authenticationRepository.signUpWithEmailAndPassword(
        email: state.email.trim(),
        password: state.password,
      );
      if (isClosed) return;
      emit(
        state.copyWith(
          signInAction: const Success(null),
          awaitingEmailConfirmation: !_authenticationRepository.isAuthenticated,
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(signInAction: Failure.fromObject(exception)));
      emit(state.copyWith(signInAction: const Initial()));
    }
  }

  Future<void> _run(Future<void> Function() action) async {
    emit(state.copyWith(signInAction: const Loading()));
    try {
      await action();
      emit(state.copyWith(signInAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(signInAction: Failure.fromObject(exception)));
      emit(state.copyWith(signInAction: const Initial()));
    }
  }
}
