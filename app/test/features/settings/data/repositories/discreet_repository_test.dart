import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/discreet_local_data_source.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/discreet_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNotificationsRepository() extends Mock implements NotificationsRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockDiscreetLocalDataSource() extends Mock implements DiscreetLocalDataSource;

void main() {
  late ProfileRepository profileRepository;
  late DiscreetLocalDataSource localDataSource;
  late DiscreetRepository repository;

  setUpAll(() => registerFallbackValue(''));

  setUp(() {
    profileRepository = _MockProfileRepository();
    localDataSource = _MockDiscreetLocalDataSource();
    repository = DiscreetRepository(
      notificationsRepository: _MockNotificationsRepository(),
      profileRepository: profileRepository,
      localDataSource: localDataSource,
    );
    when(() => profileRepository.getMyProfile()).thenAnswer((_) async => const Profile.fake());
    when(
      () => profileRepository.setWidgetInDiscreet(
        profileId: any(named: 'profileId'),
        hide: any(named: 'hide'),
      ),
    ).thenAnswer((_) async {});
    when(() => localDataSource.setHideWidgetText(value: any(named: 'value')))
        .thenAnswer((_) async {});
  });

  test('hiding widget text sends the inverted server flag', () async {
    await repository.setHideWidgetText(value: true);

    verify(
      () => profileRepository.setWidgetInDiscreet(profileId: any(named: 'profileId'), hide: false),
    ).called(1);
    verify(() => localDataSource.setHideWidgetText(value: true)).called(1);
  });
}
