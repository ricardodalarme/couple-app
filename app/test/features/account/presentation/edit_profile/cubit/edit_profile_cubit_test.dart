import 'package:authentication_service/authentication_service.dart';
import 'package:bloc_test/bloc_test.dart';
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
      expect(editProfileCubit.state, const EditProfileState());
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
            firstName: FormInput('John'),
            lastName: FormInput('Doe'),
            email: FormInput('john@example.com'),
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
        'fills empty names from the signed-in user',
        build: () {
          when(
            () => accountRepository.currentUser,
          ).thenReturn(const CurrentUser(email: 'john@example.com', firstName: '', lastName: ''));
          return editProfileCubit;
        },
        act: (cubit) => cubit.loadCurrentUser(),
        expect: () => [const EditProfileState(email: FormInput('john@example.com'))],
      );
    });

    blocTest<EditProfileCubit, EditProfileState>(
      'emits [EditProfileState] when onFirstNameChanged is called',
      build: () => editProfileCubit,
      act: (cubit) => cubit.onFirstNameChanged('John'),
      expect: () => [const EditProfileState(firstName: FormInput('John'))],
    );

    blocTest<EditProfileCubit, EditProfileState>(
      'emits [EditProfileState] when onLastNameChanged is called',
      build: () => editProfileCubit,
      act: (cubit) => cubit.onLastNameChanged('Doe'),
      expect: () => [const EditProfileState(lastName: FormInput('Doe'))],
    );

    blocTest<EditProfileCubit, EditProfileState>(
      'emits [EditProfileState] when onEmailChanged is called',
      build: () => editProfileCubit,
      act: (cubit) => cubit.onEmailChanged('john@example.com'),
      expect: () => [const EditProfileState(email: FormInput('john@example.com'))],
    );

    blocTest<EditProfileCubit, EditProfileState>(
      'emits validation errors and does not update the profile when the form is empty',
      build: () => editProfileCubit,
      act: (cubit) => cubit.onSubmit(),
      expect: () => [
        const EditProfileState(
          firstName: FormInput('', error: NonEmptyValidationError.empty),
          lastName: FormInput('', error: NonEmptyValidationError.empty),
          email: FormInput('', error: EmailValidationError.invalid),
        ),
      ],
      verify: (_) {
        verifyNever(
          () => accountRepository.updateProfile(
            firstName: any(named: 'firstName'),
            lastName: any(named: 'lastName'),
            email: any(named: 'email'),
          ),
        );
      },
    );
  });
}
