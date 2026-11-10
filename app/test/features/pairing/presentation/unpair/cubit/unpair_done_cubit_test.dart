import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/unpair/cubit/unpair_done_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPairingRepository() extends Mock implements PairingRepository;

void main() {
  late PairingRepository pairing;

  setUp(() {
    pairing = _MockPairingRepository();
    when(() => pairing.resolveSharedItems(keep: any(named: 'keep'))).thenAnswer((_) async {});
  });

  UnpairDoneCubit build() => UnpairDoneCubit(pairingRepository: pairing);

  test('continue waits for an explicit choice', () {
    final cubit = build();

    expect(cubit.state.choice, isNull);
    expect(cubit.state.canContinue, isFalse);
  });

  test('keeping shared items resolves them with keep', () async {
    final cubit = build();
    await cubit.chooseSharedItems(SharedItemsChoice.keep);

    verify(() => pairing.resolveSharedItems(keep: true)).called(1);
    expect(cubit.state.choice, SharedItemsChoice.keep);
    expect(cubit.state.canContinue, isTrue);
  });

  test('deleting shared items resolves them without keep', () async {
    final cubit = build();
    await cubit.chooseSharedItems(SharedItemsChoice.delete);

    verify(() => pairing.resolveSharedItems(keep: false)).called(1);
    expect(cubit.state.choice, SharedItemsChoice.delete);
    expect(cubit.state.canContinue, isTrue);
  });

  test('a failure keeps the person on the choice screen', () async {
    when(() => pairing.resolveSharedItems(keep: any(named: 'keep')))
        .thenAnswer((_) async => throw const LocalizedException(l10nKey: 'STILL_PAIRED'));
    final cubit = build();

    await cubit.chooseSharedItems(SharedItemsChoice.keep);

    expect(cubit.state.resolveAction, isA<Failure>());
    expect(cubit.state.canContinue, isFalse);
  });
}
