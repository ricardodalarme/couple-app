import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/relationship/cubit/relationship_settings_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_details.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

final _details = RelationshipDetails(
  profileId: 'p1',
  phase: RelationshipPhase.dating,
  togetherSince: DateTime(2024, 5, 1),
);

void main() {
  late ProfileRepository profile;
  late PairingRepository pairing;
  late RelationshipSettingsCubit cubit;

  setUpAll(() {
    registerFallbackValue(RelationshipPhase.dating);
    registerFallbackValue(DateTime(2024));
  });

  setUp(() {
    profile = _MockProfileRepository();
    pairing = _MockPairingRepository();
    when(() => profile.getRelationshipDetails()).thenAnswer((_) async => _details);
    cubit = RelationshipSettingsCubit(profileRepository: profile, pairingRepository: pairing);
  });

  tearDown(() => cubit.close());

  test('loads the phase, date and partner name', () async {
    when(
      () => pairing.getPartner(),
    ).thenAnswer((_) async => const Profile(id: 'p2', avatarKind: 'initial', displayName: 'Rui'));

    await cubit.load();

    expect(cubit.state.current?.phase, RelationshipPhase.dating);
    expect(cubit.state.current?.togetherSince, DateTime(2024, 5, 1));
    expect(cubit.state.current?.partnerName, 'Rui');
    expect(cubit.state.hasPartner, isTrue);
  });

  test('keeps the relationship page when the partner read fails', () async {
    when(() => pairing.getPartner()).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));

    await cubit.load();

    expect(cubit.state.current?.phase, RelationshipPhase.dating);
    expect(cubit.state.hasPartner, isNull);
    expect(cubit.state.partnerLoadFailed, isTrue);

    when(
      () => pairing.getPartner(),
    ).thenAnswer((_) async => const Profile(id: 'p2', avatarKind: 'initial', displayName: 'Rui'));
    await cubit.loadPartner();

    expect(cubit.state.partnerLoadFailed, isFalse);
    expect(cubit.state.hasPartner, isTrue);
  });

  test('a partner without a display name still keeps the unpair path', () async {
    when(() => pairing.getPartner())
        .thenAnswer((_) async => const Profile(id: 'p2', avatarKind: 'initial'));

    await cubit.load();

    expect(cubit.state.hasPartner, isTrue);
    expect(cubit.state.current?.partnerName, isNull);
    expect(cubit.state.partnerLoadFailed, isFalse);
  });

  test('saves a new phase and reverts it when the save fails', () async {
    when(() => pairing.getPartner()).thenAnswer((_) async => null);
    await cubit.load();
    when(
      () => profile.updateRelationshipPhase(
        profileId: any(named: 'profileId'),
        phase: any(named: 'phase'),
      ),
    ).thenAnswer((_) async {});

    await cubit.onPhaseChanged(RelationshipPhase.married);

    verify(() => profile.updateRelationshipPhase(profileId: 'p1', phase: RelationshipPhase.married))
        .called(1);
    expect(cubit.state.current?.phase, RelationshipPhase.married);

    when(
      () => profile.updateRelationshipPhase(
        profileId: any(named: 'profileId'),
        phase: any(named: 'phase'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));

    await cubit.onPhaseChanged(RelationshipPhase.longDistance);

    expect(cubit.state.current?.phase, RelationshipPhase.married);
  });

  test('saves only the relationship date', () async {
    when(() => pairing.getPartner()).thenAnswer((_) async => null);
    await cubit.load();
    when(
      () => profile.updateTogetherSince(
        profileId: any(named: 'profileId'),
        togetherSince: any(named: 'togetherSince'),
      ),
    ).thenAnswer((_) async {});

    await cubit.onDateChanged(DateTime(2025, 1, 2));

    verify(() => profile.updateTogetherSince(profileId: 'p1', togetherSince: DateTime(2025, 1, 2)))
        .called(1);
    verifyNever(
      () => profile.updateRelationshipPhase(
        profileId: any(named: 'profileId'),
        phase: any(named: 'phase'),
      ),
    );
    expect(cubit.state.current?.togetherSince, DateTime(2025, 1, 2));
  });

  test('reverts the relationship date when the save fails', () async {
    when(() => pairing.getPartner()).thenAnswer((_) async => null);
    await cubit.load();
    when(
      () => profile.updateTogetherSince(
        profileId: any(named: 'profileId'),
        togetherSince: any(named: 'togetherSince'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));

    await cubit.onDateChanged(DateTime(2025, 1, 2));

    expect(cubit.state.current?.togetherSince, DateTime(2024, 5, 1));
  });

  test('a future relationship date is allowed', () async {
    when(() => pairing.getPartner()).thenAnswer((_) async => null);
    await cubit.load();
    when(
      () => profile.updateTogetherSince(
        profileId: any(named: 'profileId'),
        togetherSince: any(named: 'togetherSince'),
      ),
    ).thenAnswer((_) async {});
    final future = DateTime(2026, 4, 9);

    await cubit.onDateChanged(future);

    expect(cubit.state.current?.togetherSince, future);
  });
}
