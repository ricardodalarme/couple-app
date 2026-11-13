import 'dart:async';

import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/diary_entry.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/diary/cubit/diary_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class _MockProgramsRepository() extends Mock implements ProgramsRepository;

void main() {
  late ProgramsRepository repository;

  final fixedNow = DateTime(2026, 3, 10, 12);

  void testWithClock(String description, FutureOr<void> Function() body) =>
      test(description, () => withClock(Clock.fixed(fixedNow), body));

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  setUp(() {
    repository = _MockProgramsRepository();
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => []);
    when(() => repository.deleteDiaryEntry(any())).thenAnswer((_) async {});
    when(
      () => repository.saveDiaryEntry(
        entryDate: any(named: 'entryDate'),
        body: any(named: 'body'),
        mood: any(named: 'mood'),
        id: any(named: 'id'),
      ),
    ).thenAnswer((_) async => 'new');
  });

  DiaryCubit build() => DiaryCubit(programsRepository: repository);

  testWithClock('today entry is prefilled and stays private', () async {
    final today = DiaryEntry(
      id: 'j1',
      entryDate: clock.now(),
      body: 'Hoje eu me senti em paz.',
      mood: 'calm',
    );
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => [today]);
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.body.value, 'Hoje eu me senti em paz.');
    expect(cubit.state.mood, 'calm');
    expect(cubit.state.editingId, 'j1');
    expect((cubit.state.entries as Success<List<DiaryEntry>>).value.single.id, 'j1');
  });

  testWithClock('a new entry inserts today and can then be edited', () async {
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

  testWithClock('editing an existing entry updates the same row', () async {
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
      entryDate: clock.now(),
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

  testWithClock('a failed save keeps the text and the chosen mood', () async {
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

    expect(cubit.state.body.value, 'Não quero perder isto');
    expect(cubit.state.mood, 'heavy');
    expect(cubit.state.saveAction, isA<Initial>());
  });

  testWithClock('deleting removes the entry and clears it from the form', () async {
    final entry = DiaryEntry(id: 'j1', entryDate: clock.now(), body: 'Para apagar.', mood: 'calm');
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => [entry]);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.delete(entry);

    verify(() => repository.deleteDiaryEntry('j1')).called(1);
    expect(cubit.state.body.value, '');
    expect(cubit.state.editingId, isNull);
    expect(cubit.state.mood, isNull);
  });

  testWithClock('editing a mood-less entry clears the previous mood', () async {
    final entry = DiaryEntry(id: 'j1', entryDate: clock.now(), body: 'Sem humor.');
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => [entry]);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    cubit
      ..onMoodChanged('calm')
      ..edit(entry);

    expect(cubit.state.mood, isNull);
  });

  testWithClock('a new entry opens today instead of creating a second one', () async {
    final today = DiaryEntry(id: 'j1', entryDate: clock.now(), body: 'Hoje.');
    when(() => repository.getDiaryEntries()).thenAnswer((_) async => [today]);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    cubit
      ..onBodyChanged('Outro texto.')
      ..newEntry();

    expect(cubit.state.editingId, 'j1');
    expect(cubit.state.body.value, 'Hoje.');
  });

  testWithClock('a load that resolves after typing keeps the typed text', () async {
    final response = Completer<List<DiaryEntry>>();
    when(() => repository.getDiaryEntries()).thenAnswer((_) => response.future);
    final cubit = build();
    addTearDown(cubit.close);

    final loading = cubit.load();
    cubit.onBodyChanged('Texto enquanto carrega.');
    response.complete([]);
    await loading;

    expect(cubit.state.body.value, 'Texto enquanto carrega.');
    expect(cubit.state.editingId, isNull);
  });

  testWithClock('a failed load is honest and retryable', () async {
    when(() => repository.getDiaryEntries())
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.entries, isA<Failure>());
  });

  testWithClock('an empty body cannot be saved', () async {
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.save();
    expect(cubit.state.body.error, NonEmptyValidationError.empty);

    cubit.onBodyChanged('a' * (journalBodyMaxLength + 1));
    await cubit.save();
    expect(cubit.state.body.error, MaxLengthValidationError.tooLong);

    cubit.onBodyChanged('Um texto.');
    await cubit.save();
    expect(cubit.state.body.isValid, isTrue);
  });
}
