import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  late AuthenticationRepository repository;

  setUp(() => repository = _MockAuthenticationRepository());

  group('SignInCubit', () {
    blocTest<SignInCubit, SignInState>(
      'signs in with Apple and reports success',
      build: () {
        when(() => repository.logInWithApple()).thenAnswer((_) async {});
        return SignInCubit(authenticationRepository: repository);
      },
      act: (cubit) => cubit.signInWithApple(),
      expect: () => const [
        SignInState(signInAction: Loading()),
        SignInState(signInAction: Success(null)),
      ],
    );

    blocTest<SignInCubit, SignInState>(
      'reports a failure then resets it so the listener can fire again',
      build: () {
        when(() => repository.logInWithGoogle())
            .thenAnswer((_) async => throw const LocalizedException(l10nKey: 'NETWORK'));
        return SignInCubit(authenticationRepository: repository);
      },
      act: (cubit) => cubit.signInWithGoogle(),
      expect: () => const [
        SignInState(signInAction: Loading()),
        SignInState(signInAction: Failure(LocalizedException(l10nKey: 'NETWORK'))),
        SignInState(),
      ],
    );

    blocTest<SignInCubit, SignInState>(
      'a dismissed provider sheet shows no error',
      build: () {
        when(() => repository.logInWithApple())
            .thenAnswer((_) async => throw const LocalizedException(l10nKey: 'cancelled'));
        return SignInCubit(authenticationRepository: repository);
      },
      act: (cubit) => cubit.signInWithApple(),
      expect: () => const [SignInState(signInAction: Loading()), SignInState()],
    );
  });
}
