import 'dart:typed_data';
import 'dart:ui';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/notes/data/models/sent_message.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/compose_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNotesRepository() extends Mock implements NotesRepository;

void main() {
  late NotesRepository repository;
  final message = SentMessage(
    id: 'm1',
    kind: MessageKind.note,
    createdAt: DateTime(2026),
    forWidget: false,
    body: 'Boa sorte',
  );

  setUp(() {
    repository = _MockNotesRepository();
    when(() => repository.getSent()).thenAnswer((_) async => [message]);
    when(
      () => repository.sendNote(
        body: any(named: 'body'),
        forWidget: any(named: 'forWidget'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repository.sendDrawing(
        png: any(named: 'png'),
        forWidget: any(named: 'forWidget'),
      ),
    ).thenAnswer((_) async {});
    when(() => repository.delete(any())).thenAnswer((_) async {});
  });

  setUpAll(() {
    registerFallbackValue(Uint8List(0));
    registerFallbackValue(message);
  });

  ComposeCubit build() => ComposeCubit(
    notesRepository: repository,
    exportDrawing: (_) async => Uint8List.fromList([1]),
  );

  test('a note needs text within the limit', () {
    final cubit = build();
    expect(cubit.state.canSend, isFalse);

    cubit.onTextChanged('a' * (noteMaxLength + 1));
    expect(cubit.state.canSend, isFalse);

    cubit.onTextChanged('Boa sorte');
    expect(cubit.state.canSend, isTrue);
  });

  test('an empty drawing cannot be sent', () async {
    final cubit = build()..onKindChanged(MessageKind.drawing);
    expect(cubit.state.canSend, isFalse);

    await cubit.send();

    verifyNever(
      () => repository.sendDrawing(
        png: any(named: 'png'),
        forWidget: any(named: 'forWidget'),
      ),
    );
  });

  test('a stroke makes the drawing sendable and undo takes it back', () {
    final cubit = build()
      ..onKindChanged(MessageKind.drawing)
      ..onStrokeStarted(const Offset(0.1, 0.1))
      ..onStrokeUpdated(const Offset(0.2, 0.2));

    expect(cubit.state.canSend, isTrue);
    expect(cubit.state.strokes.single.points, hasLength(2));

    cubit.undo();
    expect(cubit.state.canSend, isFalse);
  });

  test('the eraser removes the strokes it touches', () {
    final cubit = build()
      ..onStrokeStarted(const Offset(0.1, 0.1))
      ..onStrokeStarted(const Offset(0.9, 0.9))
      ..onToolChanged(DrawingTool.eraser)
      ..onStrokeStarted(const Offset(0.11, 0.1));

    expect(cubit.state.strokes, hasLength(1));
    expect(cubit.state.strokes.single.points.single, const Offset(0.9, 0.9));
  });

  test('sending a note clears the form and reads the sent list again', () async {
    final cubit = build()
      ..onTextChanged('Boa sorte')
      ..onForWidgetChanged(true);

    await cubit.send();

    verify(() => repository.sendNote(body: 'Boa sorte', forWidget: true)).called(1);
    expect(cubit.state.text, '');
    verify(() => repository.getSent()).called(1);
  });

  test('sending a drawing uploads the rendered image', () async {
    final cubit = build()
      ..onKindChanged(MessageKind.drawing)
      ..onStrokeStarted(const Offset(0.1, 0.1));

    await cubit.send();

    verify(() => repository.sendDrawing(png: Uint8List.fromList([1]), forWidget: false)).called(1);
    expect(cubit.state.strokes, isEmpty);
  });

  test('a failed send keeps what was written', () async {
    when(
      () => repository.sendNote(
        body: any(named: 'body'),
        forWidget: any(named: 'forWidget'),
      ),
    ).thenThrow(Exception('offline'));
    final cubit = build()..onTextChanged('Boa sorte');

    await cubit.send();

    expect(cubit.state.text, 'Boa sorte');
    expect(cubit.state.sendAction, isA<Initial>());
  });

  test('deleting a message reads the list again', () async {
    final cubit = build();

    await cubit.delete(message);

    verify(() => repository.delete(message)).called(1);
    verify(() => repository.getSent()).called(1);
  });
}
