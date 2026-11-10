part of 'sign_in_cubit.dart';

final class const SignInState({final Resource<void> signInAction = const Initial()})
    with Equatable {
  SignInState copyWith({Resource<void>? signInAction}) {
    return SignInState(signInAction: signInAction ?? this.signInAction);
  }

  @override
  List<Object?> get props => [signInAction];
}
