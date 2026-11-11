import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/connect/data/repositories/connect_repository.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/touch/cubit/touch_cubit.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockConnectRepository() extends Mock implements ConnectRepository;

void main() {
  late ConnectRepository repository;
  const cards = [HelpItem(slug: 'a', title: 'Deem as mãos'), HelpItem(slug: 'b', title: 'Abracem')];

  setUp(() {
    repository = _MockConnectRepository();
    when(() => repository.getTouchTopicsEnabled()).thenAnswer((_) async => true);
    when(() => repository.getTouchCards()).thenAnswer((_) async => cards);
    when(() => repository.setTouchTopicsEnabled(enabled: any(named: 'enabled')))
        .thenAnswer((_) async {});
  });

  test('loading with touch on brings the cards', () async {
    final cubit = TouchCubit(connectRepository: repository);

    await cubit.load();

    expect(cubit.state.isEnabled, const Success(true));
    expect(cubit.state.cards, cards);
  });

  test('with touch off no cards are read', () async {
    when(() => repository.getTouchTopicsEnabled()).thenAnswer((_) async => false);
    final cubit = TouchCubit(connectRepository: repository);

    await cubit.load();

    expect(cubit.state.isEnabled, const Success(false));
    expect(cubit.state.cards, isEmpty);
    verifyNever(() => repository.getTouchCards());
  });

  test('next wraps around the cards', () async {
    final cubit = TouchCubit(connectRepository: repository);
    await cubit.load();

    cubit
      ..next()
      ..next();

    expect(cubit.state.index, 0);
  });

  test('switching off saves it for both and reloads', () async {
    final cubit = TouchCubit(connectRepository: repository);

    await cubit.setEnabled(enabled: false);

    verify(() => repository.setTouchTopicsEnabled(enabled: false)).called(1);
    verify(() => repository.getTouchTopicsEnabled()).called(1);
  });

  test('a failed read shows a failure', () async {
    when(() => repository.getTouchTopicsEnabled()).thenThrow(Exception('offline'));
    final cubit = TouchCubit(connectRepository: repository);

    await cubit.load();

    expect(cubit.state.isEnabled, isA<Failure>());
  });
}
