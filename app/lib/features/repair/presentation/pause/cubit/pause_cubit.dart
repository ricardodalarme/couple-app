import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/pause_return.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'pause_state.dart';

class PauseCubit({required final RepairRepository _repairRepository}) extends Cubit<PauseState> {
  this : super(const PauseState());

  /// Fills the message with a ready-made [text] named [preset].
  void onPresetChosen(String preset, String text) =>
      emit(state.copyWith(message: FormInput(text), preset: preset));

  void onMessageChanged(String message) =>
      emit(state.copyWith(message: FormInput(message), clearPreset: true));

  void onReturnChosen(PauseReturn value) => emit(state.copyWith(returnChoice: value));

  /// Starts the pause; both people then see the pause state on Hoje.
  Future<void> send() async {
    if (state.sendAction.isLoading || !_validate() || state.sendAction is Success) return;

    emit(state.copyWith(sendAction: const Loading()));
    try {
      await _repairRepository.startPause(
        returnAt: state.returnChoice.returnAt(clock.now()),
        message: state.message.value,
      );
      emit(state.copyWith(sendAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(sendAction: Failure.fromObject(exception)));
      emit(state.copyWith(sendAction: const Initial()));
    }
  }

  bool _validate() {
    final validatedMessage = state.message.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(pauseMessageMaxLength)]),
    );

    emit(state.copyWith(message: validatedMessage));

    return validatedMessage.isValid;
  }
}
