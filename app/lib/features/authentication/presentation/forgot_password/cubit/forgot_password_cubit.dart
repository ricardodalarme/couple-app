import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit({required final AuthenticationRepository _authenticationRepository})
    extends Cubit<ForgotPasswordState> {
  this : super(const ForgotPasswordState());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: EmailInput.dirty(email)));
  }

  Future<void> onSubmit() async {
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
