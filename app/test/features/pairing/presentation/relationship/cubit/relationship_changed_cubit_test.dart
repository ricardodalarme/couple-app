import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/relationship/cubit/relationship_changed_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_details.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_status.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockProfileRepository() extends Mock implements ProfileRepository;

const _details = RelationshipDetails(
  profileId: 'p1',
  relationshipStatus: RelationshipStatus.together,
);

void main() {
  late ProfileRepository profile;
  late RelationshipChangedCubit cubit;

  setUpAll(() => registerFallbackValue(RelationshipStatus.together));

  setUp(() {
    profile = _MockProfileRepository();
    when(() => profile.getRelationshipDetails()).thenAnswer((_) async => _details);
    cubit = RelationshipChangedCubit(profileRepository: profile);
  });

  tearDown(() => cubit.close());

  test('loads the saved relationship status into the selection', () async {
    await cubit.load();

    expect(cubit.state.selected, RelationshipStatus.together);
    expect(cubit.state.canContinue, isTrue);
  });

  test('choosing a status only changes the selection', () async {
    await cubit.load();

    cubit.choose(RelationshipStatus.ended);

    expect(cubit.state.selected, RelationshipStatus.ended);
    verifyNever(
      () => profile.updateRelationshipStatus(
        profileId: any(named: 'profileId'),
        status: any(named: 'status'),
      ),
    );
  });

  test('continue saves the selected status and moves on', () async {
    when(
      () => profile.updateRelationshipStatus(
        profileId: any(named: 'profileId'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async {});
    await cubit.load();
    cubit.choose(RelationshipStatus.ended);

    final saved = await cubit.save();

    expect(saved, isTrue);
    verify(
      () => profile.updateRelationshipStatus(profileId: 'p1', status: RelationshipStatus.ended),
    ).called(1);
    expect(cubit.state.current?.relationshipStatus, RelationshipStatus.ended);
  });

  test('a failed save reverts the selection and keeps the page', () async {
    when(
      () => profile.updateRelationshipStatus(
        profileId: any(named: 'profileId'),
        status: any(named: 'status'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    await cubit.load();
    cubit.choose(RelationshipStatus.bereaved);

    final saved = await cubit.save();

    expect(saved, isFalse);
    expect(cubit.state.selected, RelationshipStatus.together);
    expect(cubit.state.saveAction, const Initial());
  });

  test('continuing with the saved status does not write again', () async {
    await cubit.load();

    final saved = await cubit.save();

    expect(saved, isTrue);
    verifyNever(
      () => profile.updateRelationshipStatus(
        profileId: any(named: 'profileId'),
        status: any(named: 'status'),
      ),
    );
  });
}
