import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/diary_entry.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/diary/cubit/diary_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockProgramsRepository() extends Mock implements ProgramsRepository;

void main() {
  late ProgramsRepository repository;

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  setUp(() {
    repository = _MockProgramsRepository();
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => []);
    when(() => repository.deleteDiaryEntry(any())).thenAnswer((_) async {});
  });

  DiaryCubit build() => DiaryCubit(programsRepository: repository);

  test('today entry is prefilled and stays private', () async {
    final today = DiaryEntry(
      id: 'j1',
      entryDate: DateTime.now(),
      body: 'Hoje eu me senti em paz.',
      mood: 'calm',
    );
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => [today]);
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.body, 'Hoje eu me senti em paz.');
    expect(cubit.state.mood, 'calm');
    expect(cubit.state.editingId, 'j1');
    expect((cubit.state.entries as Success<List<DiaryEntry>>).value.single.id, 'j1');
  });

  test('a new entry inserts today and can then be edited', () async {
    when(
      () => repository.saveDiaryEntry(
        entryDate: any(named: 'entryDate'),
        body: 'Hoje foi calmo.',
        mood: 'calm',
        id: null,
      ),
    ).thenAnswer((_) async => 'j1');
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    cubit
      ..onBodyChanged('  Hoje foi calmo.  ')
      ..onMoodChanged('calm');

    await cubit.save();

    verify(
      () => repository.saveDiaryEntry(
        entryDate: any(named: 'entryDate'),
        body: 'Hoje foi calmo.',
        mood: 'calm',
        id: null,
      ),
    ).called(1);
    expect(cubit.state.editingId, 'j1');
  });

  test('editing an existing entry updates the same row', () async {
    when(
      () => repository.saveDiaryEntry(
        entryDate: any(named: 'entryDate'),
        body: 'Texto novo.',
        mood: 'tired',
        id: 'j1',
      ),
    ).thenAnswer((_) async => 'j1');
    final entry = DiaryEntry(
      id: 'j1',
      entryDate: DateTime.now(),
      body: 'Texto antigo.',
      mood: 'tired',
    );
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => [entry]);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    cubit.onBodyChanged('Texto novo.');

    await cubit.save();

    verify(
      () => repository.saveDiaryEntry(
        entryDate: any(named: 'entryDate'),
        body: 'Texto novo.',
        mood: 'tired',
        id: 'j1',
      ),
    ).called(1);
  });

  test('a failed save keeps the text and the chosen mood', () async {
    when(
      () => repository.saveDiaryEntry(
        entryDate: any(named: 'entryDate'),
        body: 'Não quero perder isto',
        mood: 'heavy',
        id: null,
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    cubit
      ..onBodyChanged('Não quero perder isto')
      ..onMoodChanged('heavy');

    await cubit.save();

    expect(cubit.state.body, 'Não quero perder isto');
    expect(cubit.state.mood, 'heavy');
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('deleting removes the entry and clears it from the form', () async {
    final entry = DiaryEntry(
      id: 'j1',
      entryDate: DateTime.now(),
      body: 'Para apagar.',
      mood: 'calm',
    );
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => [entry]);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.delete(entry);

    verify(() => repository.deleteDiaryEntry('j1')).called(1);
    expect(cubit.state.body, '');
    expect(cubit.state.editingId, isNull);
    expect(cubit.state.mood, isNull);
  });

  test('editing a mood-less entry clears the previous mood', () async {
    final entry = DiaryEntry(id: 'j1', entryDate: DateTime.now(), body: 'Sem humor.');
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => [entry]);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    cubit
      ..onMoodChanged('calm')
      ..edit(entry);

    expect(cubit.state.mood, isNull);
  });

  test('a new entry opens today instead of creating a second one', () async {
    final today = DiaryEntry(id: 'j1', entryDate: DateTime.now(), body: 'Hoje.');
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => [today]);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    cubit
      ..onBodyChanged('Outro texto.')
      ..newEntry();

    expect(cubit.state.editingId, 'j1');
    expect(cubit.state.body, 'Hoje.');
  });

  test('a load that resolves after typing keeps the typed text', () async {
    final response = Completer<List<DiaryEntry>>();
    when(() => repository.getDiaryEntries()).thenAnswer((_) => response.future);
    final cubit = build();
    addTearDown(cubit.close);

    final loading = cubit.load();
    cubit.onBodyChanged('Texto enquanto carrega.');
    response.complete([]);
    await loading;

    expect(cubit.state.body, 'Texto enquanto carrega.');
    expect(cubit.state.editingId, isNull);
  });

  test('a failed load is honest and retryable', () async {
    when(() => repository.getDiaryEntries())
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.entries, isA<Failure>());
  });

  test('an empty body cannot be saved', () {
    final cubit = build();
    addTearDown(cubit.close);

    expect(cubit.state.canSave, isFalse);
    cubit.onBodyChanged('a' * (journalBodyMaxLength + 1));
    expect(cubit.state.canSave, isFalse);
    cubit.onBodyChanged('Um texto.');
    expect(cubit.state.canSave, isTrue);
  });
}
