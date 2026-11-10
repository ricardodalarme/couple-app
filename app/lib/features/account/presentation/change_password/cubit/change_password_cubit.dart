import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'change_password_state.dart';

class ChangePasswordCubit({required final AccountRepository _accountRepository})
    extends Cubit<ChangePasswordState> {
  this : super(const ChangePasswordState());

  void onCurrentPasswordChanged(String currentPassword) {
    emit(state.copyWith(currentPassword: FormInput(currentPassword)));
  }

  void onNewPasswordChanged(String newPassword) {
    emit(
      state.copyWith(
        password: FormInput(newPassword),
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

  bool _validateForm() {
    emit(
      state.copyWith(
        currentPassword: state.currentPassword.validate(const NonEmptyValidator()),
        password: state.password.validate(const PasswordValidator()),
        confirmPassword: state.confirmPassword.validate(
          ConfirmValueValidator(state.password.value),
        ),
      ),
    );

    return state.currentPassword.isValid && state.password.isValid && state.confirmPassword.isValid;
  }
}
