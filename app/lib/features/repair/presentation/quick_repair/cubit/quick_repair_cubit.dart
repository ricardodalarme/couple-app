import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';

part 'quick_repair_state.dart';

/// The longest repair message the server accepts.
const int repairMessageMaxLength = 500;

/// The ready-made short messages, in the order they are offered.
const List<String> repairPresets = ['tone', 'restart', 'five_minutes', 'love'];

class QuickRepairCubit({required final RepairRepository _repairRepository})
    extends Cubit<QuickRepairState> {
  this : super(const QuickRepairState());

  /// Opens with a message carried over from the soft start, if any.
  void start(String text) {
    if (text.trim().isNotEmpty) emit(state.copyWith(text: text));
  }

  /// Fills the message with a ready-made [text] named [preset].
  void onPresetChosen(String preset, String text) =>
      emit(state.copyWith(text: text, preset: preset));

  /// Edits the message by hand, which drops the preset.
  void onTextChanged(String text) => emit(state.copyWith(text: text, clearPreset: true));

  /// Sends the message; on failure it stays as a draft and can be sent again.
  Future<void> send() async {
    if (!state.canSend || state.sendAction.isLoading || state.sendAction is Success) return;

    emit(state.copyWith(sendAction: const Loading()));
    try {
      await _repairRepository.sendRepair(message: state.text, preset: state.preset);
      emit(state.copyWith(sendAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(sendAction: Failure.fromObject(exception)));
      emit(state.copyWith(sendAction: const Initial()));
    }
  }
}
