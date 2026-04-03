import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  void onEmailChanged(String email) {
    emit(state.copyWith(email: EmailInput.dirty(email)));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: NonEmptyInput.dirty(password)));
  }

  Future<void> onSubmit() async {
    if (state.isNotValid) return;

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
}
