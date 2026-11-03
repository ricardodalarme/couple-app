part of 'signup_cubit.dart';

final class SignupState with Equatable, FormzMixin {
  const SignupState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmedPasswordInput.pure(),
    this.submission = const Initial(),
  });

  final EmailInput email;
  final PasswordInput password;
  final ConfirmedPasswordInput confirmPassword;
  final Resource<void> submission;

  SignupState copyWith({
    EmailInput? email,
    PasswordInput? password,
    ConfirmedPasswordInput? confirmPassword,
    Resource<void>? submission,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      submission: submission ?? this.submission,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password, confirmPassword];

  @override
  List<Object?> get props => [email, password, confirmPassword, submission];
}
