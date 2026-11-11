import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/spice/data/repositories/spice_repository.dart';
import 'package:flutter_bloc_starter/features/spice/presentation/spice/cubit/spice_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSpiceRepository() extends Mock implements SpiceRepository;

void main() {
  late SpiceRepository repository;

  setUp(() {
    repository = _MockSpiceRepository();
    when(() => repository.isHidden).thenReturn(false);
    when(repository.getView).thenAnswer((_) async => const SpiceView(stage: SpiceStage.off));
    when(() => repository.setEnabled(enabled: any(named: 'enabled'))).thenAnswer((_) async {});
  });

  test('safe mode hides the section and reads nothing', () async {
    when(() => repository.isHidden).thenReturn(true);
    final cubit = SpiceCubit(spiceRepository: repository);

    await cubit.load();

    expect(cubit.state.isHidden, isTrue);
    verifyNever(repository.getView);
  });

  test('a person who has not opted in sees the off stage', () async {
    final cubit = SpiceCubit(spiceRepository: repository);

    await cubit.load();

    expect(cubit.state.view, const Success(SpiceView(stage: SpiceStage.off)));
  });

  test('turning it on saves for this person and reads the state again', () async {
    final cubit = SpiceCubit(spiceRepository: repository);

    await cubit.setEnabled(enabled: true);

    verify(() => repository.setEnabled(enabled: true)).called(1);
    verify(repository.getView).called(1);
  });

  test('cards wrap around when drawn', () async {
    when(repository.getView)
        .thenAnswer((_) async => const SpiceView(stage: SpiceStage.ready, cards: ['a', 'b']));
    final cubit = SpiceCubit(spiceRepository: repository);
    await cubit.load();

    cubit
      ..next()
      ..next();

    expect(cubit.state.index, 0);
  });

  test('a failed change shows a failure and keeps the screen usable', () async {
    when(() => repository.setEnabled(enabled: any(named: 'enabled'))).thenThrow(Exception('x'));
    final cubit = SpiceCubit(spiceRepository: repository);

    await cubit.setEnabled(enabled: true);

    expect(cubit.state.toggleAction, isA<Initial>());
  });
}
