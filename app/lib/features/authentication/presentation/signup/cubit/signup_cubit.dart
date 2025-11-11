import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const SignupState());

  final AuthenticationRepository _authenticationRepository;

  void onUsernameChanged(String username) {
    emit(state.copyWith(username: NonEmptyInput.dirty(username)));
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(email: EmailInput.dirty(email)));
  }

  void onPasswordChanged(String password) {
    emit(
      state.copyWith(
        password: PasswordInput.dirty(password),
        confirmPassword: ConfirmedPasswordInput.pure(
          password: password,
          value: state.confirmPassword.value,
        ),
      ),
    );
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    emit(
      state.copyWith(
        confirmPassword: ConfirmedPasswordInput.dirty(
          password: state.password.value,
          value: confirmPassword,
        ),
      ),
    );
  }

  Future<void> onSubmit() async {
    if (state.isNotValid) return;

    emit(state.copyWith(submission: const Loading()));

    try {
      await _authenticationRepository.signup(
        username: state.username.value,
        email: state.email.value,
        password: state.password.value,
      );
      await _authenticationRepository.logInWithUsernameAndPassword(
        username: state.username.value,
        password: state.password.value,
      );

      emit(state.copyWith(submission: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(submission: Failure.fromObject(exception)));
      emit(state.copyWith(submission: const Initial()));
    }
  }
}
