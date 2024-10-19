import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';

void main() {
  const email = EmailInput.dirty('email');
  const firstName = NonEmptyInput.dirty('firstName');
  const lastName = NonEmptyInput.dirty('lastName');

  group('EditProfileState', () {
    test('returns same object when no properties are passed', () {
      expect(const EditProfileState().copyWith(), const EditProfileState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const EditProfileState()
            .copyWith(status: FormzSubmissionStatus.initial),
        const EditProfileState(),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const EditProfileState().copyWith(email: email),
        const EditProfileState(email: email),
      );
    });

    test('returns object with updated firstName when firstName is passed', () {
      expect(
        const EditProfileState().copyWith(firstName: firstName),
        const EditProfileState(firstName: firstName),
      );
    });

    test('returns object with updated lastName when lastName is passed', () {
      expect(
        const EditProfileState().copyWith(lastName: lastName),
        const EditProfileState(lastName: lastName),
      );
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const EditProfileState()
            .copyWith(status: FormzSubmissionStatus.success),
        const EditProfileState(status: FormzSubmissionStatus.success),
      );
    });
  });
}
