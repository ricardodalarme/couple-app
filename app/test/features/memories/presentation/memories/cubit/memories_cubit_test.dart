import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/memories/data/repositories/memories_repository.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/memories/cubit/memories_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockMemoriesRepository() extends Mock implements MemoriesRepository;

void main() {
  late MemoriesRepository repository;

  final memory = Memory(id: 'm1', title: 'Primeiro jantar', happenedOn: DateTime(2026, 5, 12));

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  setUp(() {
    repository = _MockMemoriesRepository();
    when(() => repository.getMemories()).thenAnswer((_) async => [memory]);
    when(
      () => repository.addMemory(
        id: any(named: 'id'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        place: any(named: 'place'),
        happenedOn: any(named: 'happenedOn'),
      ),
    ).thenAnswer((_) async {});
    when(() => repository.deleteMemory(any())).thenAnswer((_) async {});
  });

  MemoriesCubit build() => MemoriesCubit(memoriesRepository: repository);

  test('a memory needs a title and a note within its limit', () {
    final cubit = build();
    expect(cubit.state.canSave, isFalse);

    cubit.onTitleChanged('Primeiro jantar');
    expect(cubit.state.canSave, isTrue);

    cubit.onBodyChanged('a' * (memoryBodyMaxLength + 1));
    expect(cubit.state.canSave, isFalse);
  });

  test('saving clears the form and reads again', () async {
    final cubit = build()
      ..onTitleChanged('Primeiro jantar')
      ..onBodyChanged('Foi lindo')
      ..onPlaceChanged('Paraty');

    await cubit.save();

    verify(
      () => repository.addMemory(
        id: any(named: 'id'),
        title: 'Primeiro jantar',
        body: 'Foi lindo',
        place: 'Paraty',
        happenedOn: any(named: 'happenedOn'),
      ),
    ).called(1);
    expect(cubit.state.title, '');
    verify(() => repository.getMemories()).called(1);
  });

  test('a failed save keeps the text', () async {
    when(
      () => repository.addMemory(
        id: any(named: 'id'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        place: any(named: 'place'),
        happenedOn: any(named: 'happenedOn'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build()..onTitleChanged('Primeiro jantar');

    await cubit.save();

    expect(cubit.state.title, 'Primeiro jantar');
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('the jar returns a slip, or null when it is empty, and can be closed', () async {
    when(() => repository.drawFromJar()).thenAnswer((_) async => 'Fez café');
    final cubit = build();

    await cubit.drawFromJar();
    expect((cubit.state.jarAction as Success<String?>).value, 'Fez café');

    when(() => repository.drawFromJar()).thenAnswer((_) async => null);
    await cubit.drawFromJar();
    expect((cubit.state.jarAction as Success<String?>).value, isNull);

    cubit.closeJar();
    expect(cubit.state.jarAction, isA<Initial>());
  });

  test('deleting reads the memories again', () async {
    final cubit = build();

    await cubit.delete(memory);

    verify(() => repository.deleteMemory('m1')).called(1);
    verify(() => repository.getMemories()).called(1);
  });
}
