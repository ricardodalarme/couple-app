import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/account/data/repositories/account_repository.dart';
import 'package:quickstart_flutter_bloc/features/account/presentation/edit_profile/bloc/edit_profile_bloc.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  group('EditProfileBloc', () {
    late AccountRepository accountRepository;
    late EditProfileBloc editProfileBloc;

    setUp(() {
      accountRepository = MockAccountRepository();
      editProfileBloc = EditProfileBloc(accountRepository: accountRepository);
    });

    tearDown(() {
      editProfileBloc.close();
    });

    test('initial state is correct', () {
      expect(
        editProfileBloc.state,
        const EditProfileState(
          firstName: NonEmptyInput.pure(),
          lastName: NonEmptyInput.pure(),
          email: EmailInput.pure(),
          submission: Initial(),
        ),
      );
    });

    blocTest<EditProfileBloc, EditProfileState>(
      'emits [EditProfileState] when [EditProfileFirstNameChanged] is added',
      build: () => editProfileBloc,
      act: (bloc) => bloc.add(const EditProfileFirstNameChanged('John')),
      expect: () => [
        const EditProfileState(firstName: NonEmptyInput.dirty('John')),
      ],
    );

    blocTest<EditProfileBloc, EditProfileState>(
      'emits [EditProfileState] when [EditProfileLastNameChanged] is added',
      build: () => editProfileBloc,
      act: (bloc) => bloc.add(const EditProfileLastNameChanged('Doe')),
      expect: () => [
        const EditProfileState(lastName: NonEmptyInput.dirty('Doe')),
      ],
    );

    blocTest<EditProfileBloc, EditProfileState>(
      'emits [EditProfileState] when [EditProfileEmailChanged] is added',
      build: () => editProfileBloc,
      act: (bloc) =>
          bloc.add(const EditProfileEmailChanged('john@example.com')),
      expect: () => [
        const EditProfileState(email: EmailInput.dirty('john@example.com')),
      ],
    );
  });
}
