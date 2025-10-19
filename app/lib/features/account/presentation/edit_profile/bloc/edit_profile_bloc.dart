import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/account/data/repositories/account_repository.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc({required AccountRepository accountRepository})
    : _accountRepository = accountRepository,
      super(const EditProfileState()) {
    on<EditProfileFirstNameChanged>(_onFirstNameChanged);
    on<EditProfileLastNameChanged>(_onLastNameChanged);
    on<EditProfileEmailChanged>(_onEmailChanged);
    on<EditProfileSubmitted>(_onSubmitted);
  }

  final AccountRepository _accountRepository;

  void _onFirstNameChanged(EditProfileFirstNameChanged event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(firstName: NonEmptyInput.dirty(event.firstName)));
  }

  void _onLastNameChanged(EditProfileLastNameChanged event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(lastName: NonEmptyInput.dirty(event.lastName)));
  }

  void _onEmailChanged(EditProfileEmailChanged event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(email: EmailInput.dirty(event.email)));
  }

  Future<void> _onSubmitted(EditProfileSubmitted event, Emitter<EditProfileState> emit) async {
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
