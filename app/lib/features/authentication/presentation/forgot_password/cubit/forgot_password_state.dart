part of 'forgot_password_cubit.dart';

final class const ForgotPasswordState({
  final FormInput<String> email = const FormInput<String>(''),
  final Resource<void> submission = const Initial(),
}) with Equatable {
  ForgotPasswordState copyWith({FormInput<String>? email, Resource<void>? submission}) {
    return ForgotPasswordState(
      email: email ?? this.email,
      submission: submission ?? this.submission,
    );
  }

  @override
  List<Object?> get props => [email, submission];
}
