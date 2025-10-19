import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/signup/bloc/signup_bloc.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('SignupBloc', () {
    late AuthenticationRepository authenticationRepository;
    late SignupBloc signupBloc;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();

      signupBloc = SignupBloc(
        authenticationRepository: authenticationRepository,
      );
    });

    tearDown(() {
      signupBloc.close();
    });

    test('initial state is correct', () {
      expect(
        signupBloc.state,
        const SignupState(
          email: EmailInput.pure(),
          password: PasswordInput.pure(),
          confirmPassword: ConfirmedPasswordInput.pure(),
          submission: Initial(),
        ),
      );
    });

    blocTest<SignupBloc, SignupState>(
      'emits [SignupState] when [SignupUsernameChanged] is added',
      build: () => signupBloc,
      act: (bloc) => bloc.add(const SignupUsernameChanged('john')),
      expect: () => [const SignupState(username: NonEmptyInput.dirty('john'))],
    );

    blocTest<SignupBloc, SignupState>(
      'emits [SignupState] when [SignupEmailChanged] is added',
      build: () => signupBloc,
      act: (bloc) => bloc.add(const SignupEmailChanged('john@example.com')),
      expect: () => [
        const SignupState(email: EmailInput.dirty('john@example.com')),
      ],
    );

    blocTest<SignupBloc, SignupState>(
      'emits [SignupState] when [SignupConfirmPasswordChanged] is added',
      build: () => signupBloc,
      act: (bloc) => bloc.add(const SignupConfirmPasswordChanged('password')),
      expect: () => [
        const SignupState(
          confirmPassword: ConfirmedPasswordInput.dirty(
            password: '',
            value: 'password',
          ),
        ),
      ],
    );
  });
}
