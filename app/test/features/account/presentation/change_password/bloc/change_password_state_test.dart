import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:quickstart_flutter_bloc/features/account/presentation/change_password/bloc/change_password_bloc.dart';

void main() {
  const currentPassword = NonEmptyInput.dirty('password');
  const newPassword = PasswordInput.dirty('password');
  const confirmPassword = ConfirmedPasswordInput.dirty(password: 'password');

  group('ChangePasswordState', () {
    test('returns same object when no properties are passed', () {
      expect(
        const ChangePasswordState().copyWith(),
        const ChangePasswordState(),
      );
    });

    test(
      'returns object with updated submission when submission is passed',
      () {
        expect(
          const ChangePasswordState().copyWith(submission: Success(null)),
          const ChangePasswordState(submission: Success(null)),
        );
      },
    );

    test(
      'returns object with updated currentPassword when currentPassword is passed',
      () {
        expect(
          const ChangePasswordState().copyWith(
            currentPassword: currentPassword,
          ),
          const ChangePasswordState(currentPassword: currentPassword),
        );
      },
    );

    test('returns object with updated password when valid is passed', () {
      expect(
        const ChangePasswordState().copyWith(password: newPassword),
        const ChangePasswordState(password: newPassword),
      );
    });

    test(
      'returns object with updated confirmedPassword when confirmedPassword is passed',
      () {
        expect(
          const ChangePasswordState().copyWith(
            confirmPassword: confirmPassword,
          ),
          const ChangePasswordState(confirmPassword: confirmPassword),
        );
      },
    );
  });
}
