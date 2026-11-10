import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';

part 'sign_in_state.dart';

/// Error codes that mean the person already has an account.
const Set<String> existingAccountCodes = {'identity_already_exists', 'email_exists'};

/// Error codes that mean the person dismissed the provider sheet.
const Set<String> cancelledCodes = {'cancelled', 'canceled', 'user_cancelled'};

class SignInCubit({required final AuthenticationRepository _authenticationRepository})
    extends Cubit<SignInState> {
  this : super(const SignInState());

  Future<void> signInWithApple() => _run(_authenticationRepository.logInWithApple);

  Future<void> signInWithGoogle() => _run(_authenticationRepository.logInWithGoogle);

  Future<void> _run(Future<void> Function() action) async {
    if (state.signInAction.isLoading) return;

    emit(state.copyWith(signInAction: const Loading()));
    try {
      await action();
      emit(state.copyWith(signInAction: const Success(null)));
    } catch (exception) {
      final failure = Failure.fromObject(exception);
      // A dismissed provider sheet is not an error and shows nothing.
      if (cancelledCodes.contains(failure.exception.l10nKey)) {
        emit(state.copyWith(signInAction: const Initial()));
        return;
      }
      emit(state.copyWith(signInAction: failure));
      emit(state.copyWith(signInAction: const Initial()));
    }
  }
}
