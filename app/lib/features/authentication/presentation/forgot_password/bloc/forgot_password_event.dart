part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

final class ForgotPasswordEmailChanged extends ForgotPasswordEvent {
  const ForgotPasswordEmailChanged(this.email);

  final String email;
}

final class ForgotPasswordSubmitted extends ForgotPasswordEvent {
  const ForgotPasswordSubmitted();
}
