import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/remote/mutations/generated/UpdateDisplayName.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/remote/mutations/generated/UpdateHeavyDaySharing.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/remote/profile_data_source.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockProfileDataSource() extends Mock implements ProfileDataSource;

void main() {
  late ProfileDataSource dataSource;
  late ProfileRepository repository;

  setUpAll(
    () => registerFallbackValue(
      VariablesMutationUpdateDisplayName(profileId: 'p1', displayName: 'Marina'),
    ),
  );

  setUp(() {
    dataSource = _MockProfileDataSource();
    repository = ProfileRepository(profileDataSource: dataSource);
  });

  test('a mutation that updates zero rows fails', () async {
    when(() => dataSource.updateDisplayName(any())).thenAnswer((_) async => 0);

    await expectLater(
      repository.updateDisplayName(profileId: 'p1', displayName: 'Marina'),
      throwsA(isA<LocalizedException>()),
    );
  });

  test('the heavy-day setting is saved with its server value', () async {
    when(
      () => dataSource.updateHeavyDaySharing(
        VariablesMutationUpdateHeavyDaySharing(profileId: 'p1', sharing: 'always'),
      ),
    ).thenAnswer((_) async => 1);

    await repository.updateHeavyDaySharing(profileId: 'p1', sharing: HeavyDaySharing.always);

    verify(
      () => dataSource.updateHeavyDaySharing(
        VariablesMutationUpdateHeavyDaySharing(profileId: 'p1', sharing: 'always'),
      ),
    ).called(1);
  });

  test('a saved field notifies the app once', () async {
    when(() => dataSource.updateDisplayName(any())).thenAnswer((_) async => 1);
    final changes = <void>[];
    final subscription = repository.onChanged.listen(changes.add);
    addTearDown(subscription.cancel);

    await repository.updateDisplayName(profileId: 'p1', displayName: 'Marina');
    await pumpEventQueue();

    expect(changes, hasLength(1));
  });
}
