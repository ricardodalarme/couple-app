part of 'debug_sign_in_cubit.dart';

final class const DebugSignInState({
  final String email = '',
  final String password = '',
  final Resource<void> signInAction = const Initial(),
  final bool awaitingEmailConfirmation = false,
}) with Equatable {
  DebugSignInState copyWith({
    String? email,
    String? password,
    Resource<void>? signInAction,
    bool? awaitingEmailConfirmation,
  }) {
    return DebugSignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      signInAction: signInAction ?? this.signInAction,
      awaitingEmailConfirmation: awaitingEmailConfirmation ?? this.awaitingEmailConfirmation,
    );
  }

  @override
  List<Object?> get props => [email, password, signInAction, awaitingEmailConfirmation];
}
