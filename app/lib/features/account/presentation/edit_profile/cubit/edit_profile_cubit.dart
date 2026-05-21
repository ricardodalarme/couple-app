import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this._accountRepository}) : super(const EditProfileState());

  final AccountRepository _accountRepository;

  void onFirstNameChanged(String firstName) {
    emit(state.copyWith(firstName: NonEmptyInput.dirty(firstName)));
  }

  void onLastNameChanged(String lastName) {
    emit(state.copyWith(lastName: NonEmptyInput.dirty(lastName)));
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(email: EmailInput.dirty(email)));
  }

  Future<void> onSubmit() async {
    if (state.isNotValid) return;

    emit(state.copyWith(submission: const Loading()));

    try {
      await _accountRepository.updateProfile(
        firstName: state.firstName.value,
        lastName: state.lastName.value,
        email: state.email.value,
      );
      emit(state.copyWith(submission: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(submission: Failure.fromObject(exception)));
      emit(state.copyWith(submission: const Initial()));
    }
  }
}
