import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/dev_menu/debug_sign_in/cubit/debug_sign_in_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  late AuthenticationRepository repository;

  setUp(() => repository = _MockAuthenticationRepository());

  DebugSignInCubit build() => DebugSignInCubit(authenticationRepository: repository);

  blocTest<DebugSignInCubit, DebugSignInState>(
    'asks for the confirmation email when sign-up creates no session',
    build: () {
      when(
        () => repository.signUpWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async {});
      when(() => repository.isAuthenticated).thenReturn(false);

      return build();
    },
    act: (cubit) => cubit.signUp(),
    verify: (cubit) => expect(cubit.state.awaitingEmailConfirmation, isTrue),
  );

  blocTest<DebugSignInCubit, DebugSignInState>(
    'keeps the confirmation hint off when sign-up signs the person in',
    build: () {
      when(
        () => repository.signUpWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async {});
      when(() => repository.isAuthenticated).thenReturn(true);

      return build();
    },
    act: (cubit) => cubit.signUp(),
    verify: (cubit) => expect(cubit.state.awaitingEmailConfirmation, isFalse),
  );

  blocTest<DebugSignInCubit, DebugSignInState>(
    'a failed sign-up keeps the confirmation hint off',
    build: () {
      when(
        () => repository.signUpWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(const LocalizedException(l10nKey: 'over_email_send_rate_limit'));

      return build();
    },
    act: (cubit) => cubit.signUp(),
    expect: () => [
      const DebugSignInState(signInAction: Loading()),
      const DebugSignInState(
        signInAction: Failure(LocalizedException(l10nKey: 'over_email_send_rate_limit')),
      ),
      const DebugSignInState(),
    ],
  );
}
