part of 'login_cubit.dart';

final class LoginState with EquatableMixin, FormzMixin {
  const LoginState({
    this.username = const NonEmptyInput.pure(),
    this.password = const NonEmptyInput.pure(),
    this.login = const Initial(),
  });

  final NonEmptyInput username;
  final NonEmptyInput password;
  final Resource<void> login;

  LoginState copyWith({NonEmptyInput? username, NonEmptyInput? password, Resource<void>? login}) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      login: login ?? this.login,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [username, password];

  @override
  List<Object?> get props => [username, password, login];
}
