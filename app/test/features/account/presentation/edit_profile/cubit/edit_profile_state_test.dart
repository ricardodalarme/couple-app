import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:quickstart_flutter_bloc/features/account/presentation/edit_profile/cubit/edit_profile_cubit.dart';

void main() {
  const email = EmailInput.dirty('email');
  const firstName = NonEmptyInput.dirty('firstName');
  const lastName = NonEmptyInput.dirty('lastName');

  group('EditProfileState', () {
    test('returns same object when no properties are passed', () {
      expect(const EditProfileState().copyWith(), const EditProfileState());
    });

    test('returns object with updated submission when submission is passed', () {
      expect(
        const EditProfileState().copyWith(submission: const Success(null)),
        const EditProfileState(submission: Success(null)),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(const EditProfileState().copyWith(email: email), const EditProfileState(email: email));
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
  });
}
