import 'dart:typed_data';
import 'dart:ui';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notes/data/models/sent_message.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/drawing_stroke.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'compose_state.dart';

/// Turns the strokes into the PNG that is uploaded.
typedef DrawingExporter = Future<Uint8List> Function(List<DrawingStroke> strokes);

const double _eraserRadius = 0.04;

class ComposeCubit({
  required final NotesRepository _notesRepository,
  required final PairingRepository _pairingRepository,
  required final DrawingExporter _exportDrawing,
}) extends Cubit<ComposeState> {
  this : super(const ComposeState());

  Future<void> load() async {
    if (state.sent is! Success) emit(state.copyWith(sent: const Loading()));
    final isPaired = await _readIsPaired();
    try {
      emit(state.copyWith(sent: Success(await _notesRepository.getSent()), isPaired: isPaired));
    } catch (exception) {
      if (state.sent is Success) return;
      emit(state.copyWith(sent: Failure.fromObject(exception), isPaired: isPaired));
    }
  }

  void onKindChanged(MessageKind kind) => emit(state.copyWith(kind: kind));

  void onTextChanged(String text) => emit(state.copyWith(text: FormInput(text)));

  void onForWidgetChanged(bool value) => emit(state.copyWith(forWidget: value));

  void onToolChanged(DrawingTool tool) => emit(state.copyWith(tool: tool));

  void onPenChanged(int penIndex) =>
      emit(state.copyWith(penIndex: penIndex, tool: DrawingTool.pen));

  void onStrokeStarted(Offset point) {
    if (state.tool == DrawingTool.eraser) return _erase(point);
    emit(
      state.copyWith(
        strokes: [
          ...state.strokes,
          DrawingStroke(points: [point], penIndex: state.penIndex),
        ],
      ),
    );
  }

  void onStrokeUpdated(Offset point) {
    if (state.tool == DrawingTool.eraser) return _erase(point);
    if (state.strokes.isEmpty) return;
    emit(
      state.copyWith(
        strokes: [
          ...state.strokes.sublist(0, state.strokes.length - 1),
          state.strokes.last.withPoint(point),
        ],
      ),
    );
  }

  void undo() {
    if (state.strokes.isEmpty) return;
    emit(state.copyWith(strokes: state.strokes.sublist(0, state.strokes.length - 1)));
  }

  void clearDrawing() => emit(state.copyWith(strokes: const []));

  /// Sends what was composed; on failure it stays so it can be sent again.
  Future<void> send() async {
    if (state.isUnpaired || state.sendAction.isLoading || !_validate()) return;

    emit(state.copyWith(sendAction: const Loading()));
    try {
      switch (state.kind) {
        case MessageKind.note:
          await _notesRepository.sendNote(body: state.text.value, forWidget: state.forWidget);
          emit(state.copyWith(text: const FormInput(''), sendAction: const Success(null)));
        case MessageKind.drawing:
          await _notesRepository.sendDrawing(
            png: await _exportDrawing(state.strokes),
            forWidget: false,
          );
          emit(state.copyWith(strokes: const [], sendAction: const Success(null)));
      }
      await load();
    } catch (exception) {
      emit(state.copyWith(sendAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(sendAction: const Initial()));
  }

  bool _validate() {
    if (state.kind == MessageKind.drawing) return state.strokes.isNotEmpty;

    final validatedText = state.text.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(noteMaxLength)]),
    );

    emit(state.copyWith(text: validatedText));

    return validatedText.isValid;
  }

  Future<void> delete(SentMessage message) async {
    if (state.deleteAction.isLoading) return;

    emit(state.copyWith(deleteAction: const Loading()));
    try {
      await _notesRepository.delete(message);
      emit(state.copyWith(deleteAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(deleteAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(deleteAction: const Initial()));
  }

  Future<bool?> _readIsPaired() async {
    try {
      return (await _pairingRepository.getPartner()) != null;
    } on Object {
      return null;
    }
  }

  void _erase(Offset point) {
    final remaining = [
      for (final stroke in state.strokes)
        if (!stroke.isNear(point, _eraserRadius)) stroke,
    ];
    if (remaining.length != state.strokes.length) emit(state.copyWith(strokes: remaining));
  }
}
