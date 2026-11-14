import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/unpair/cubit/unpair_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/today/data/repositories/today_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPairingRepository() extends Mock implements PairingRepository;

class _MockTodayRepository() extends Mock implements TodayRepository;

void main() {
  late PairingRepository pairing;
  late TodayRepository today;

  setUp(() {
    pairing = _MockPairingRepository();
    today = _MockTodayRepository();
    when(() => pairing.getPartner()).thenAnswer(
      (_) async =>
          const Profile(id: 'partner', avatarKind: AvatarKind.initials, displayName: 'Marina'),
    );
    when(() => pairing.unpair()).thenAnswer((_) async {});
    when(() => today.clearCache()).thenAnswer((_) async {});
  });

  UnpairCubit build() => UnpairCubit(pairingRepository: pairing, todayRepository: today);

  test('start loads the partner name', () async {
    final cubit = build();
    await cubit.loadPartner();

    expect(cubit.state.partnerName, 'Marina');
  });

  test('nothing happens without a confirmation', () {
    final cubit = build();

    expect(cubit.state.unpairAction, const Initial());
    verifyNever(() => pairing.unpair());
  });

  test('confirming unpairs once and forgets the local state', () async {
    final cubit = build();
    await cubit.unpair();

    verify(() => pairing.unpair()).called(1);
    verify(() => today.clearCache()).called(1);
    expect(cubit.state.unpairAction, const Success<void>(null));
  });

  test('a failure keeps the page and reports it', () async {
    when(() => pairing.unpair())
        .thenAnswer((_) async => throw const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.loadPartner();

    await cubit.unpair();

    expect(cubit.state.partnerName, 'Marina');
    expect(cubit.state.unpairAction, isA<Failure>());
    verifyNever(() => today.clearCache());
  });
}
