part of 'change_password_cubit.dart';

final class const ChangePasswordState({
  final NonEmptyInput currentPassword = const NonEmptyInput.pure(),
  final PasswordInput password = const PasswordInput.pure(),
  final ConfirmedPasswordInput confirmPassword = const ConfirmedPasswordInput.pure(),
  final Resource<void> submission = const Initial(),
}) with Equatable, FormzMixin {
  ChangePasswordState copyWith({
    NonEmptyInput? currentPassword,
    PasswordInput? password,
    ConfirmedPasswordInput? confirmPassword,
    Resource<void>? submission,
  }) {
    return ChangePasswordState(
      currentPassword: currentPassword ?? this.currentPassword,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      submission: submission ?? this.submission,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [currentPassword, password, confirmPassword];

  @override
  List<Object?> get props => [currentPassword, password, confirmPassword, submission];
}
