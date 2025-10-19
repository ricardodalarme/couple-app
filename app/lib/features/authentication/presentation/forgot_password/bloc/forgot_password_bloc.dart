import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const ForgotPasswordState()) {
    on<ForgotPasswordEmailChanged>(_onEmailChanged);
    on<ForgotPasswordSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onEmailChanged(ForgotPasswordEmailChanged event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(email: EmailInput.dirty(event.email)));
  }

  Future<void> _onSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (state.isNotValid) return;

    emit(state.copyWith(submission: const Loading()));

    try {
      await _authenticationRepository.resetPassword(email: state.email.value);

      emit(state.copyWith(submission: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(submission: Failure.fromObject(exception)));
      emit(state.copyWith(submission: const Initial()));
    }
  }
}
