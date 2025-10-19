part of 'signup_bloc.dart';

final class SignupState with EquatableMixin, FormzMixin {
  const SignupState({
    this.username = const NonEmptyInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmedPasswordInput.pure(),
    this.submission = const Initial(),
  });

  final NonEmptyInput username;
  final EmailInput email;
  final PasswordInput password;
  final ConfirmedPasswordInput confirmPassword;
  final Resource<void> submission;

  SignupState copyWith({
    NonEmptyInput? username,
    EmailInput? email,
    PasswordInput? password,
    ConfirmedPasswordInput? confirmPassword,
    Resource<void>? submission,
  }) {
    return SignupState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      submission: submission ?? this.submission,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [username, email, password, confirmPassword];

  @override
  List<Object?> get props => [username, email, password, confirmPassword, submission];
}
