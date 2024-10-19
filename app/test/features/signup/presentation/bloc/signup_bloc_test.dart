import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/signup/domain/repositories/signup_repository.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/bloc/signup_bloc.dart';

class MockSignupRepository extends Mock implements SignupRepository {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('SignupBloc', () {
    late SignupRepository signupRepository;
    late AuthenticationRepository authenticationRepository;
    late SignupBloc signupBloc;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      signupRepository = MockSignupRepository();

      signupBloc = SignupBloc(
        signupRepository: signupRepository,
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
          status: FormzSubmissionStatus.initial,
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
      expect: () =>
          [const SignupState(email: EmailInput.dirty('john@example.com'))],
    );

    blocTest<SignupBloc, SignupState>(
      'emits [SignupState] when [SignupConfirmPasswordChanged] is added',
      build: () => signupBloc,
      act: (bloc) => bloc.add(const SignupConfirmPasswordChanged('password')),
      expect: () => [
        const SignupState(
          confirmPassword:
              ConfirmedPasswordInput.dirty(password: '', value: 'password'),
        ),
      ],
    );
  });
}
