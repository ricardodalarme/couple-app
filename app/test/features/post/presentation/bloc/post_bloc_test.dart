import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';

class MockEditProfileRepository extends Mock implements EditProfileRepository {}

void main() {
  group('EditProfileBloc', () {
    late EditProfileRepository editProfileRepository;
    late EditProfileBloc editProfileBloc;

    setUp(() {
      editProfileRepository = MockEditProfileRepository();
      editProfileBloc =
          EditProfileBloc(editProfileRepository: editProfileRepository);
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
          status: FormzSubmissionStatus.initial,
        ),
      );
    });

    blocTest<EditProfileBloc, EditProfileState>(
      'emits [EditProfileState] when [EditProfileFirstNameChanged] is added',
      build: () => editProfileBloc,
      act: (bloc) => bloc.add(const EditProfileFirstNameChanged('John')),
      expect: () =>
          [const EditProfileState(firstName: NonEmptyInput.dirty('John'))],
    );

    blocTest<EditProfileBloc, EditProfileState>(
      'emits [EditProfileState] when [EditProfileLastNameChanged] is added',
      build: () => editProfileBloc,
      act: (bloc) => bloc.add(const EditProfileLastNameChanged('Doe')),
      expect: () =>
          [const EditProfileState(lastName: NonEmptyInput.dirty('Doe'))],
    );

    blocTest<EditProfileBloc, EditProfileState>(
      'emits [EditProfileState] when [EditProfileEmailChanged] is added',
      build: () => editProfileBloc,
      act: (bloc) =>
          bloc.add(const EditProfileEmailChanged('john@example.com')),
      expect: () =>
          [const EditProfileState(email: EmailInput.dirty('john@example.com'))],
    );
  });
}
