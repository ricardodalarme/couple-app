import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'signup_state.dart';

class SignupCubit({required final AuthenticationRepository _authenticationRepository})
    extends Cubit<SignupState> {
  this : super(const SignupState());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: FormInput(email)));
  }

  void onPasswordChanged(String password) {
    emit(
      state.copyWith(
        password: FormInput(password),
        confirmPassword: state.confirmPassword.toPure(),
      ),
    );
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: FormInput(confirmPassword)));
  }

  Future<void> onSubmit() async {
    if (!_validateForm()) return;

    emit(state.copyWith(submission: const Loading()));

    try {
      await _authenticationRepository.signup(
        email: state.email.value,
        password: state.password.value,
      );
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );

      emit(state.copyWith(submission: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(submission: Failure.fromObject(exception)));
      emit(state.copyWith(submission: const Initial()));
    }
  }

  Future<void> onSignInWithGoogle() async {
    emit(state.copyWith(submission: const Loading()));

    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(submission: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(submission: Failure.fromObject(exception)));
      emit(state.copyWith(submission: const Initial()));
    }
  }

  Future<void> onSignInWithApple() async {
    emit(state.copyWith(submission: const Loading()));

    try {
      await _authenticationRepository.logInWithApple();
      emit(state.copyWith(submission: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(submission: Failure.fromObject(exception)));
      emit(state.copyWith(submission: const Initial()));
    }
  }

  bool _validateForm() {
    emit(
      state.copyWith(
        email: state.email.validate(const EmailValidator()),
        password: state.password.validate(const PasswordValidator()),
        confirmPassword: state.confirmPassword.validate(
          ConfirmValueValidator(state.password.value),
        ),
      ),
    );

    return state.email.isValid && state.password.isValid && state.confirmPassword.isValid;
  }
}
