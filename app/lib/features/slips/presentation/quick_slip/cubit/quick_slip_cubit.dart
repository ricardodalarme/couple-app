import 'dart:async';

import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_category.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:uuid/uuid.dart';

part 'quick_slip_state.dart';

/// The longest slip the capture screen accepts.
const int quickSlipMaxLength = 140;

/// How long the undo stays available after a slip is saved.
const Duration undoWindow = Duration(seconds: 30);

class QuickSlipCubit({required final SlipRepository _slipRepository})
    extends Cubit<QuickSlipState> {
  this : super(const QuickSlipState());

  final Uuid _uuid = const Uuid();
  String? _savedId;
  Timer? _undoTimer;

  /// Restores a draft left less than an hour ago.
  void start() {
    final draft = _slipRepository.readDraft(clock.now());
    if (draft == null) return;

    emit(state.copyWith(text: FormInput(draft.text), category: draft.category));
  }

  void onTextChanged(String text) {
    emit(state.copyWith(text: FormInput(text)));
    unawaited(_persistDraft());
  }

  void onCategoryToggled(SlipCategory category) {
    final isSame = state.category == category;
    emit(state.copyWith(category: isSame ? null : category, clearCategory: isSame));
    unawaited(_persistDraft());
  }

  /// Forgets the stored draft so the next visit starts clean.
  void discardDraft() => unawaited(_slipRepository.clearDraft());

  Future<void> save() async {
    if (state.saveAction.isLoading || state.isSaved || !_validate()) return;

    emit(state.copyWith(saveAction: const Loading()));
    final id = _savedId ??= _uuid.v4();
    try {
      final outcome = await _slipRepository.saveQuick(
        id: id,
        body: state.text.value.trim(),
        createdAt: clock.now(),
        category: state.category,
      );
      await _slipRepository.clearDraft();
      emit(state.copyWith(saveAction: Success(outcome), canUndo: true));
      _undoTimer = Timer(undoWindow, () => emit(state.copyWith(canUndo: false)));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<void> undo() async {
    final id = _savedId;
    if (id == null || !state.canUndo || state.undoAction.isLoading) return;

    emit(state.copyWith(undoAction: const Loading()));
    try {
      await _slipRepository.undo(id);
      _undoTimer?.cancel();
      emit(state.copyWith(undoAction: const Success(null), canUndo: false));
    } catch (exception) {
      emit(state.copyWith(undoAction: Failure.fromObject(exception)));
      emit(state.copyWith(undoAction: const Initial()));
    }
  }

  bool _validate() {
    final validatedText = state.text.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(quickSlipMaxLength)]),
    );

    emit(state.copyWith(text: validatedText));

    return validatedText.isValid;
  }

  Future<void> _persistDraft() =>
      _slipRepository.saveDraft(text: state.text.value, category: state.category, now: clock.now());

  @override
  Future<void> close() {
    _undoTimer?.cancel();
    return super.close();
  }
}
