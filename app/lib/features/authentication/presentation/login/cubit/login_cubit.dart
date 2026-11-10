import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'login_state.dart';

class LoginCubit({required final AuthenticationRepository _authenticationRepository})
    extends Cubit<LoginState> {
  this : super(const LoginState());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: FormInput(email)));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: FormInput(password)));
  }

  Future<void> onSubmit() async {
    if (!_validateForm()) return;

    emit(state.copyWith(login: const Loading()));

    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );

      emit(state.copyWith(login: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(login: Failure.fromObject(exception)));
      emit(state.copyWith(login: const Initial()));
    }
  }

  Future<void> onLoginWithGoogle() async {
    emit(state.copyWith(login: const Loading()));

    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(login: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(login: Failure.fromObject(exception)));
      emit(state.copyWith(login: const Initial()));
    }
  }

  Future<void> onLoginWithApple() async {
    emit(state.copyWith(login: const Loading()));

    try {
      await _authenticationRepository.logInWithApple();
      emit(state.copyWith(login: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(login: Failure.fromObject(exception)));
      emit(state.copyWith(login: const Initial()));
    }
  }

  bool _validateForm() {
    emit(
      state.copyWith(
        email: state.email.validate(const EmailValidator()),
        password: state.password.validate(const NonEmptyValidator()),
      ),
    );

    return state.email.isValid && state.password.isValid;
  }
}
