part of 'forgot_password_cubit.dart';

final class const ForgotPasswordState({
  final EmailInput email = const EmailInput.pure(),
  final Resource<void> submission = const Initial(),
}) with Equatable, FormzMixin {
  ForgotPasswordState copyWith({EmailInput? email, Resource<void>? submission}) {
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
