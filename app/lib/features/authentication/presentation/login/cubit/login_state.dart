part of 'login_cubit.dart';

final class const LoginState({
  final EmailInput email = const EmailInput.pure(),
  final NonEmptyInput password = const NonEmptyInput.pure(),
  final Resource<void> login = const Initial(),
}) with Equatable, FormzMixin {
  LoginState copyWith({EmailInput? email, NonEmptyInput? password, Resource<void>? login}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      login: login ?? this.login,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];

  @override
  List<Object?> get props => [email, password, login];
}
