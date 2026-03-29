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

  void onUsernameChanged(String username) {
    emit(state.copyWith(username: NonEmptyInput.dirty(username)));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: NonEmptyInput.dirty(password)));
  }

  Future<void> onSubmit() async {
    if (state.isNotValid) return;

    emit(state.copyWith(login: const Loading()));

    try {
      await _authenticationRepository.logInWithUsernameAndPassword(
        username: state.username.value,
        password: state.password.value,
      );

      emit(state.copyWith(login: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(login: Failure.fromObject(exception)));
      emit(state.copyWith(login: const Initial()));
    }
  }

  Future<void> onLoginWithGoogle() async {
    await _authenticationRepository.logInWithGoogle();
  }

  Future<void> onLoginWithFacebook() async {
    await _authenticationRepository.logInWithFacebook();
  }
}
