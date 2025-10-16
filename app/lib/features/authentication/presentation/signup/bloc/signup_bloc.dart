import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const SignupState()) {
    on<SignupUsernameChanged>(_onUsernameChanged);
    on<SignupEmailChanged>(_onEmailChanged);
    on<SignupPasswordChanged>(_onPasswordChanged);
    on<SignupConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignupSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(SignupUsernameChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(username: NonEmptyInput.dirty(event.username)));
  }

  void _onEmailChanged(SignupEmailChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(email: EmailInput.dirty(event.email)));
  }

  void _onPasswordChanged(SignupPasswordChanged event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        password: PasswordInput.dirty(event.password),
        confirmPassword: ConfirmedPasswordInput.pure(
          password: event.password,
          value: state.confirmPassword.value,
        ),
      ),
    );
  }

  void _onConfirmPasswordChanged(SignupConfirmPasswordChanged event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        confirmPassword: ConfirmedPasswordInput.dirty(
          password: state.password.value,
          value: event.confirmPassword,
        ),
      ),
    );
  }

  Future<void> _onSubmitted(SignupSubmitted event, Emitter<SignupState> emit) async {
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
