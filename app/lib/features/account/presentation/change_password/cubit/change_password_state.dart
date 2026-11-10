part of 'change_password_cubit.dart';

final class const ChangePasswordState({
  final FormInput<String> currentPassword = const FormInput<String>(''),
  final FormInput<String> password = const FormInput<String>(''),
  final FormInput<String> confirmPassword = const FormInput<String>(''),
  final Resource<void> submission = const Initial(),
}) with Equatable {
  ChangePasswordState copyWith({
    FormInput<String>? currentPassword,
    FormInput<String>? password,
    FormInput<String>? confirmPassword,
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
  List<Object?> get props => [currentPassword, password, confirmPassword, submission];
}
