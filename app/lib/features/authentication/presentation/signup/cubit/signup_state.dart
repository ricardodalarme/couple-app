part of 'signup_cubit.dart';

final class const SignupState({
  final FormInput<String> email = const FormInput<String>(''),
  final FormInput<String> password = const FormInput<String>(''),
  final FormInput<String> confirmPassword = const FormInput<String>(''),
  final Resource<void> submission = const Initial(),
}) with Equatable {
  SignupState copyWith({
    FormInput<String>? email,
    FormInput<String>? password,
    FormInput<String>? confirmPassword,
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
  List<Object?> get props => [email, password, confirmPassword, submission];
}
