import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this._accountRepository}) : super(const ChangePasswordState());

  final AccountRepository _accountRepository;

  void onCurrentPasswordChanged(String currentPassword) {
    emit(state.copyWith(currentPassword: NonEmptyInput.dirty(currentPassword)));
  }

  void onNewPasswordChanged(String newPassword) {
    emit(
      state.copyWith(
        password: PasswordInput.dirty(newPassword),
        confirmPassword: ConfirmedPasswordInput.pure(
          password: newPassword,
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
      await _accountRepository.changePassword(
        currentPassword: state.currentPassword.value,
        newPassword: state.password.value,
      );
      emit(state.copyWith(submission: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(submission: Failure.fromObject(exception)));
      emit(state.copyWith(submission: const Initial()));
    }
  }
}
