import 'package:bloc_test/bloc_test.dart';
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
      expect(changePasswordCubit.state, const ChangePasswordState());
    });

    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits [ChangePasswordState] when onCurrentPasswordChanged is called',
      build: () => changePasswordCubit,
      act: (cubit) => cubit.onCurrentPasswordChanged('password'),
      expect: () => [const ChangePasswordState(currentPassword: FormInput('password'))],
    );

    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits [ChangePasswordState] when onNewPasswordChanged is called',
      build: () => changePasswordCubit,
      act: (cubit) => cubit.onNewPasswordChanged('password'),
      expect: () => [const ChangePasswordState(password: FormInput('password'))],
    );

    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits [ChangePasswordState] when onConfirmPasswordChanged is called',
      build: () => changePasswordCubit,
      act: (cubit) => cubit.onConfirmPasswordChanged('password'),
      expect: () => [const ChangePasswordState(confirmPassword: FormInput('password'))],
    );

    blocTest<ChangePasswordCubit, ChangePasswordState>(
      'emits validation errors and does not change the password when the form is empty',
      build: () => changePasswordCubit,
      act: (cubit) => cubit.onSubmit(),
      expect: () => [
        const ChangePasswordState(
          currentPassword: FormInput('', error: NonEmptyValidationError.empty),
          password: FormInput('', error: PasswordValidationError.weak),
        ),
      ],
      verify: (_) {
        verifyNever(
          () => accountRepository.changePassword(
            currentPassword: any(named: 'currentPassword'),
            newPassword: any(named: 'newPassword'),
          ),
        );
      },
    );
  });
}
