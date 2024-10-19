import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/change_password/domain/repositories/change_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/bloc/change_password_bloc.dart';

class MockChangePasswordRepository extends Mock
    implements ChangePasswordRepository {}

void main() {
  group('ChangePasswordBloc', () {
    late ChangePasswordRepository changePasswordRepository;
    late ChangePasswordBloc changePasswordBloc;

    setUp(() {
      changePasswordRepository = MockChangePasswordRepository();
      changePasswordBloc = ChangePasswordBloc(
        changePasswordRepository: changePasswordRepository,
      );
    });

    tearDown(() {
      changePasswordBloc.close();
    });

    test('initial state is correct', () {
      expect(
        changePasswordBloc.state,
        const ChangePasswordState(
          currentPassword: NonEmptyInput.pure(),
          password: PasswordInput.pure(),
          confirmPassword: ConfirmedPasswordInput.pure(),
          status: FormzSubmissionStatus.initial,
        ),
      );
    });

    blocTest<ChangePasswordBloc, ChangePasswordState>(
      'emits [ChangePasswordState] when [ChangePasswordCurrentPasswordChanged] is added',
      build: () => changePasswordBloc,
      act: (bloc) =>
          bloc.add(const ChangePasswordCurrentPasswordChanged('password')),
      expect: () => [
        const ChangePasswordState(
          currentPassword: NonEmptyInput.dirty('password'),
        ),
      ],
    );

    blocTest<ChangePasswordBloc, ChangePasswordState>(
      'emits [ChangePasswordState] when [ChangePasswordNewPasswordChanged] is added',
      build: () => changePasswordBloc,
      act: (bloc) =>
          bloc.add(const ChangePasswordNewPasswordChanged('password')),
      expect: () => [
        const ChangePasswordState(
          password: PasswordInput.dirty('password'),
          confirmPassword: ConfirmedPasswordInput.pure(
            password: 'password',
          ),
        ),
      ],
    );

    blocTest<ChangePasswordBloc, ChangePasswordState>(
      'emits [ChangePasswordState] when [ChangePasswordConfirmPasswordChanged] is added',
      build: () => changePasswordBloc,
      act: (bloc) =>
          bloc.add(const ChangePasswordConfirmPasswordChanged('password')),
      expect: () => [
        const ChangePasswordState(
          confirmPassword:
              ConfirmedPasswordInput.dirty(password: '', value: 'password'),
        ),
      ],
    );
  });
}
