part of 'signup_bloc.dart';

sealed class SignupEvent {
  const SignupEvent();
}

final class SignupUsernameChanged extends SignupEvent {
  const SignupUsernameChanged(this.username);

  final String username;
}

final class SignupEmailChanged extends SignupEvent {
  const SignupEmailChanged(this.email);

  final String email;
}

final class SignupPasswordChanged extends SignupEvent {
  const SignupPasswordChanged(this.password);

  final String password;
}

final class SignupConfirmPasswordChanged extends SignupEvent {
  const SignupConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;
}

final class SignupSubmitted extends SignupEvent {
  const SignupSubmitted();
}
