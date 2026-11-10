part of 'debug_sign_in_cubit.dart';

final class const DebugSignInState({
  final String email = '',
  final String password = '',
  final Resource<void> signInAction = const Initial(),
}) with Equatable {
  DebugSignInState copyWith({String? email, String? password, Resource<void>? signInAction}) {
    return DebugSignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      signInAction: signInAction ?? this.signInAction,
    );
  }

  @override
  List<Object?> get props => [email, password, signInAction];
}
