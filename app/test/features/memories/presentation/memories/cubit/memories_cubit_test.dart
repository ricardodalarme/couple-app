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

  test('adds the memory and reads the list again', () async {
    final cubit = build();

    await cubit.add(title: 'Primeiro jantar', body: 'Foi lindo', place: 'Paraty');

    verify(
      () => repository.addMemory(
        id: any(named: 'id'),
        title: 'Primeiro jantar',
        body: 'Foi lindo',
        place: 'Paraty',
        happenedOn: any(named: 'happenedOn'),
      ),
    ).called(1);
    verify(() => repository.getMemories()).called(1);
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('a failed add reports the failure and returns to initial', () async {
    when(
      () => repository.addMemory(
        id: any(named: 'id'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        place: any(named: 'place'),
        happenedOn: any(named: 'happenedOn'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    final actions = <Resource<void>>[];
    final subscription = cubit.stream.listen((state) => actions.add(state.saveAction));
    addTearDown(subscription.cancel);

    await cubit.add(title: 'Primeiro jantar', body: '', place: '');
    await pumpEventQueue();

    expect(actions.whereType<Failure>(), isNotEmpty);
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
