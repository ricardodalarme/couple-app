part of 'login_bloc.dart';

sealed class LoginEvent {
  const LoginEvent();
}

final class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;
}

final class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

final class LoginWithGoogleSubmitted extends LoginEvent {
  const LoginWithGoogleSubmitted();
}

final class LoginWithFacebookSubmitted extends LoginEvent {
  const LoginWithFacebookSubmitted();
}
