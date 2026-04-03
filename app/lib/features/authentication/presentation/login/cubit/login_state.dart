part of 'login_cubit.dart';

final class LoginState with EquatableMixin, FormzMixin {
  const LoginState({
    this.email = const EmailInput.pure(),
    this.password = const NonEmptyInput.pure(),
    this.login = const Initial(),
  });

  final EmailInput email;
  final NonEmptyInput password;
  final Resource<void> login;

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
