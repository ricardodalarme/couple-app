import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/restore/cubit/restore_purchases_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPlusRepository() extends Mock implements PlusRepository;

void main() {
  late PlusRepository repository;

  setUp(() => repository = _MockPlusRepository());

  RestorePurchasesCubit build() => RestorePurchasesCubit(plusRepository: repository);

  test('a restore that finds Plus reports it unlocked', () async {
    when(() => repository.restorePurchases()).thenAnswer((_) async => RestoreOutcome.unlocked);
    final cubit = build();

    await cubit.restore();

    expect((cubit.state.restoreAction as Success<RestoreOutcome>).value, RestoreOutcome.unlocked);
  });

  test('a restore with nothing found reports nothing, not an error', () async {
    when(() => repository.restorePurchases()).thenAnswer((_) async => RestoreOutcome.nothing);
    final cubit = build();

    await cubit.restore();

    expect((cubit.state.restoreAction as Success<RestoreOutcome>).value, RestoreOutcome.nothing);
  });

  test('a store purchase waiting on the server reports pending', () async {
    when(() => repository.restorePurchases()).thenAnswer((_) async => RestoreOutcome.pending);
    final cubit = build();

    await cubit.restore();

    expect((cubit.state.restoreAction as Success<RestoreOutcome>).value, RestoreOutcome.pending);
  });

  test('an unavailable store is a failure the screen can retry', () async {
    when(() => repository.restorePurchases())
        .thenThrow(const LocalizedException(l10nKey: 'storeUnavailable'));
    final cubit = build();

    await cubit.restore();

    expect((cubit.state.restoreAction as Failure).exception.l10nKey, 'storeUnavailable');
  });

  test('an unexpected failure stays a localized failure', () async {
    when(() => repository.restorePurchases()).thenThrow(StateError('boom'));
    final cubit = build();

    await cubit.restore();

    expect((cubit.state.restoreAction as Failure).exception.l10nKey, 'other');
  });
}
