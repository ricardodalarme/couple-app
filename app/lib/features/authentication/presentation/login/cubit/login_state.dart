part of 'login_cubit.dart';

final class const LoginState({
  final FormInput<String> email = const FormInput<String>(''),
  final FormInput<String> password = const FormInput<String>(''),
  final Resource<void> login = const Initial(),
}) with Equatable {
  LoginState copyWith({
    FormInput<String>? email,
    FormInput<String>? password,
    Resource<void>? login,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      login: login ?? this.login,
    );
  }

  @override
  List<Object?> get props => [email, password, login];
}
