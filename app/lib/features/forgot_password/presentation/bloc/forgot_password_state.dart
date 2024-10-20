part of 'forgot_password_bloc.dart';

final class ForgotPasswordState with EquatableMixin, FormzMixin {
  const ForgotPasswordState({
    this.email = const EmailInput.pure(),
    this.submission = const Initial(),
  });

  final EmailInput email;
  final Resource<void> submission;

  ForgotPasswordState copyWith({
    EmailInput? email,
    Resource<void>? submission,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      submission: submission ?? this.submission,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email];

  @override
  List<Object?> get props => [email, submission];
}
