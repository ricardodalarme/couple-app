part of 'change_password_bloc.dart';

final class ChangePasswordState with EquatableMixin, FormzMixin {
  const ChangePasswordState({
    this.currentPassword = const NonEmptyInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmedPasswordInput.pure(),
    this.submission = const Initial(),
  });

  final NonEmptyInput currentPassword;
  final PasswordInput password;
  final ConfirmedPasswordInput confirmPassword;
  final Resource<void> submission;

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
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [currentPassword, password, confirmPassword];

  @override
  List<Object?> get props =>
      [currentPassword, password, confirmPassword, submission];
}
