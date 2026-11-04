import 'package:authentication_service/authentication_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_bloc_starter/features/account/presentation/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class MockAccountRepository() extends Mock implements AccountRepository;

void main() {
  group('EditProfileCubit', () {
    late AccountRepository accountRepository;
    late EditProfileCubit editProfileCubit;

    setUp(() {
      accountRepository = MockAccountRepository();
      when(() => accountRepository.currentUser).thenReturn(null);
      editProfileCubit = EditProfileCubit(accountRepository: accountRepository);
    });

    tearDown(() {
      editProfileCubit.close();
    });

    test('initial state is correct', () {
      expect(
        editProfileCubit.state,
        const EditProfileState(
          firstName: NonEmptyInput.pure(),
          lastName: NonEmptyInput.pure(),
          email: EmailInput.pure(),
          submission: Initial(),
        ),
      );
    });

    group('loadCurrentUser', () {
      blocTest<EditProfileCubit, EditProfileState>(
        'fills the form from the signed-in user',
        build: () {
          when(() => accountRepository.currentUser).thenReturn(
            const CurrentUser(email: 'john@example.com', firstName: 'John', lastName: 'Doe'),
          );
          return editProfileCubit;
        },
        act: (cubit) => cubit.loadCurrentUser(),
        expect: () => [
          const EditProfileState(
            firstName: NonEmptyInput.dirty('John'),
            lastName: NonEmptyInput.dirty('Doe'),
            email: EmailInput.dirty('john@example.com'),
          ),
        ],
      );

      blocTest<EditProfileCubit, EditProfileState>(
        'keeps the form empty when signed out',
        build: () => editProfileCubit,
        act: (cubit) => cubit.loadCurrentUser(),
        expect: () => <EditProfileState>[],
      );

      blocTest<EditProfileCubit, EditProfileState>(
        'leaves missing name metadata pure',
        build: () {
          when(
            () => accountRepository.currentUser,
          ).thenReturn(const CurrentUser(email: 'john@example.com', firstName: '', lastName: ''));
          return editProfileCubit;
        },
        act: (cubit) => cubit.loadCurrentUser(),
        expect: () => [const EditProfileState(email: EmailInput.dirty('john@example.com'))],
      );
    });

    blocTest<EditProfileCubit, EditProfileState>(
      'emits [EditProfileState] when onFirstNameChanged is called',
      build: () => editProfileCubit,
      act: (cubit) => cubit.onFirstNameChanged('John'),
      expect: () => [const EditProfileState(firstName: NonEmptyInput.dirty('John'))],
    );

    blocTest<EditProfileCubit, EditProfileState>(
      'emits [EditProfileState] when onLastNameChanged is called',
      build: () => editProfileCubit,
      act: (cubit) => cubit.onLastNameChanged('Doe'),
      expect: () => [const EditProfileState(lastName: NonEmptyInput.dirty('Doe'))],
    );

    blocTest<EditProfileCubit, EditProfileState>(
      'emits [EditProfileState] when onEmailChanged is called',
      build: () => editProfileCubit,
      act: (cubit) => cubit.onEmailChanged('john@example.com'),
      expect: () => [const EditProfileState(email: EmailInput.dirty('john@example.com'))],
    );
  });
}
