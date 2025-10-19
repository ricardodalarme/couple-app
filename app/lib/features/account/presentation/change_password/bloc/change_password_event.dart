part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent {
  const ChangePasswordEvent();
}

final class ChangePasswordCurrentPasswordChanged extends ChangePasswordEvent {
  const ChangePasswordCurrentPasswordChanged(this.currentPassword);

  final String currentPassword;
}

final class ChangePasswordNewPasswordChanged extends ChangePasswordEvent {
  const ChangePasswordNewPasswordChanged(this.password);

  final String password;
}

final class ChangePasswordConfirmPasswordChanged extends ChangePasswordEvent {
  const ChangePasswordConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;
}

final class ChangePasswordSubmitted extends ChangePasswordEvent {
  const ChangePasswordSubmitted();
}
