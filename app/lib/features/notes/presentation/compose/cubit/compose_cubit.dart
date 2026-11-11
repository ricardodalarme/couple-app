import 'dart:typed_data';
import 'dart:ui';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notes/data/models/sent_message.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/drawing_stroke.dart';

part 'compose_state.dart';

/// Turns the strokes into the PNG that is uploaded.
typedef DrawingExporter = Future<Uint8List> Function(List<DrawingStroke> strokes);

const double _eraserRadius = 0.04;

class ComposeCubit({
  required final NotesRepository _notesRepository,
  required final DrawingExporter _exportDrawing,
}) extends Cubit<ComposeState> {
  this : super(const ComposeState());

  Future<void> load() async {
    if (state.sent is! Success) emit(state.copyWith(sent: const Loading()));
    try {
      emit(state.copyWith(sent: Success(await _notesRepository.getSent())));
    } catch (exception) {
      if (state.sent is Success) return;
      emit(state.copyWith(sent: Failure.fromObject(exception)));
    }
  }

  void onKindChanged(MessageKind kind) => emit(state.copyWith(kind: kind));

  void onTextChanged(String text) => emit(state.copyWith(text: text));

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
    if (!state.canSend || state.sendAction.isLoading) return;

    emit(state.copyWith(sendAction: const Loading()));
    try {
      switch (state.kind) {
        case MessageKind.note:
          await _notesRepository.sendNote(body: state.text, forWidget: state.forWidget);
        case MessageKind.drawing:
          await _notesRepository.sendDrawing(
            png: await _exportDrawing(state.strokes),
            forWidget: state.forWidget,
          );
      }
      emit(state.copyWith(text: '', strokes: const [], sendAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(sendAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(sendAction: const Initial()));
  }

  Future<void> delete(SentMessage message) async {
    try {
      await _notesRepository.delete(message);
      await load();
    } catch (exception) {
      emit(state.copyWith(sendAction: Failure.fromObject(exception)));
      emit(state.copyWith(sendAction: const Initial()));
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
