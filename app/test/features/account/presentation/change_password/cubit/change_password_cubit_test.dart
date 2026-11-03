import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_bloc_starter/features/account/presentation/change_password/cubit/change_password_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class MockAccountRepository() extends Mock implements AccountRepository;

void main() {
  group('ChangePasswordCubit', () {
    late AccountRepository accountRepository;
    late ChangePasswordCubit changePasswordCubit;

    setUp(() {
      accountRepository = MockAccountRepository();
      changePasswordCubit = ChangePasswordCubit(accountRepository: accountRepository);
    });

    tearDown(() {
      changePasswordCubit.close();
    });

    test('initial state is correct', () {
      expect(
        changePasswordCubit.state,
        const ChangePasswordState(
          currentPassword: NonEmptyInput.pure(),
          password: PasswordInput.pure(),
          confirmPassword: ConfirmedPasswordInput.pure(),
          submission: Initial(),
        ),
      );
    });

    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits [ChangePasswordState] when onCurrentPasswordChanged is called',
      build: () => changePasswordCubit,
      act: (cubit) => cubit.onCurrentPasswordChanged('password'),
      expect: () => [const ChangePasswordState(currentPassword: NonEmptyInput.dirty('password'))],
    );

    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits [ChangePasswordState] when onNewPasswordChanged is called',
      build: () => changePasswordCubit,
      act: (cubit) => cubit.onNewPasswordChanged('password'),
      expect: () => [
        const ChangePasswordState(
          password: PasswordInput.dirty('password'),
          confirmPassword: ConfirmedPasswordInput.pure(password: 'password'),
        ),
      ],
    );

    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits [ChangePasswordState] when onConfirmPasswordChanged is called',
      build: () => changePasswordCubit,
      act: (cubit) => cubit.onConfirmPasswordChanged('password'),
      expect: () => [
        const ChangePasswordState(
          confirmPassword: ConfirmedPasswordInput.dirty(password: '', value: 'password'),
        ),
      ],
    );
  });
}
