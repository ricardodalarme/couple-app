import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/repair_path.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/temperature/cubit/temperature_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepairRepository() extends Mock implements RepairRepository;

void main() {
  late RepairRepository repository;

  setUpAll(() => registerFallbackValue(RepairPath.quick));

  setUp(() {
    repository = _MockRepairRepository();
    when(() => repository.recordTemperature(any())).thenAnswer((_) async {});
    when(
      () => repository.startSession(
        id: any(named: 'id'),
        path: any(named: 'path'),
        intensity: any(named: 'intensity'),
      ),
    ).thenAnswer((_) async {});
  });

  TemperatureCubit build() => TemperatureCubit(repairRepository: repository);

  group('pathFor', () {
    test('a good level needs no repair', () {
      expect(pathFor(level: 'good', intensity: 9), isNull);
    });

    test('a fight or high intensity starts with calm', () {
      expect(pathFor(level: 'fight', intensity: 2), RepairPath.pause);
      expect(pathFor(level: 'turbulent', intensity: 7), RepairPath.pause);
    });

    test('middle intensity is guided and low is quick', () {
      expect(pathFor(level: 'turbulent', intensity: 5), RepairPath.guided);
      expect(pathFor(level: 'so_so', intensity: 3), RepairPath.quick);
    });
  });

  test('a good level is stored and ends without a session', () async {
    final cubit = build()..onLevelChosen('good');

    await cubit.continueFromLevel();

    expect(cubit.state.step, TemperatureStep.result);
    expect(cubit.state.path, isNull);
    verify(() => repository.recordTemperature('good')).called(1);
    verifyNever(
      () => repository.startSession(
        id: any(named: 'id'),
        path: any(named: 'path'),
        intensity: any(named: 'intensity'),
      ),
    );
  });

  test('other levels ask for intensity, then store the answer and a session', () async {
    final cubit = build()..onLevelChosen('fight');

    await cubit.continueFromLevel();
    expect(cubit.state.step, TemperatureStep.intensity);

    cubit.onIntensityChanged(8);
    await cubit.finish();

    expect(cubit.state.step, TemperatureStep.result);
    expect(cubit.state.path, RepairPath.pause);
    verify(
      () => repository.startSession(
        id: any(named: 'id'),
        path: RepairPath.pause,
        intensity: 8,
      ),
    ).called(1);
  });

  test('back keeps the chosen level', () async {
    final cubit = build()..onLevelChosen('so_so');
    await cubit.continueFromLevel();

    cubit.back();

    expect(cubit.state.step, TemperatureStep.level);
    expect(cubit.state.level, 'so_so');
  });

  test('a failed save stays on the step and keeps the answers', () async {
    when(() => repository.recordTemperature(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build()..onLevelChosen('turbulent');
    await cubit.continueFromLevel();

    await cubit.finish();

    expect(cubit.state.step, TemperatureStep.intensity);
    expect(cubit.state.level, 'turbulent');
    expect(cubit.state.saveAction, isA<Initial>());
  });
}
