part of 'signup_cubit.dart';

final class const SignupState({
  final EmailInput email = const EmailInput.pure(),
  final PasswordInput password = const PasswordInput.pure(),
  final ConfirmedPasswordInput confirmPassword = const ConfirmedPasswordInput.pure(),
  final Resource<void> submission = const Initial(),
}) with Equatable, FormzMixin {
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
