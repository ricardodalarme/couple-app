import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/profile/presentation/setup/cubit/profile_setup_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockSettingsRepository() extends Mock implements SettingsRepository;

void main() {
  late ProfileRepository profileRepository;
  late SettingsRepository settingsRepository;

  setUpAll(() {
    registerFallbackValue(const Settings.empty());
    registerFallbackValue(AppThemeVariant.rose);
  });

  setUp(() {
    profileRepository = _MockProfileRepository();
    settingsRepository = _MockSettingsRepository();
    when(() => settingsRepository.get()).thenReturn(const Settings.empty());
    when(() => settingsRepository.save(any())).thenAnswer((_) async {});
    when(() => profileRepository.getMyProfile()).thenAnswer((_) async => const Profile.fake());
  });

  ProfileSetupCubit build() => ProfileSetupCubit(
    profileRepository: profileRepository,
    settingsRepository: settingsRepository,
  );

  group('sanitizeName', () {
    test('removes emoji and trims', () {
      expect(ProfileSetupCubit.sanitizeName('  Marina 💕 '), 'Marina');
    });

    test('caps at 30 characters', () {
      expect(ProfileSetupCubit.sanitizeName('a' * 45).length, 30);
    });
  });

  group('ProfileSetupCubit', () {
    blocTest<ProfileSetupCubit, ProfileSetupState>(
      'cannot save while the name is empty',
      build: build,
      act: (cubit) => cubit.save(),
      expect: () => const <ProfileSetupState>[],
      verify: (_) => verifyNever(
        () => profileRepository.saveProfileSetup(
          profileId: any(named: 'profileId'),
          displayName: any(named: 'displayName'),
          theme: any(named: 'theme'),
        ),
      ),
    );

    blocTest<ProfileSetupCubit, ProfileSetupState>(
      'saves the sanitized name and chosen theme',
      build: () {
        when(
          () => profileRepository.saveProfileSetup(
            profileId: any(named: 'profileId'),
            displayName: any(named: 'displayName'),
            theme: any(named: 'theme'),
            partnerName: any(named: 'partnerName'),
            togetherSince: any(named: 'togetherSince'),
          ),
        ).thenAnswer((_) async {});
        return build();
      },
      act: (cubit) async {
        cubit
          ..onNameChanged('Marina 💕')
          ..onThemeChanged(AppThemeVariant.blue);
        await cubit.save();
      },
      verify: (cubit) {
        expect(cubit.state.saveAction, const Success<void>(null));
        verify(
          () => profileRepository.saveProfileSetup(
            profileId: 'fake',
            displayName: 'Marina',
            theme: AppThemeVariant.blue,
            partnerName: null,
            togetherSince: null,
          ),
        ).called(1);
      },
    );

    blocTest<ProfileSetupCubit, ProfileSetupState>(
      'rejects a date in the future without calling the server',
      build: build,
      act: (cubit) async {
        cubit
          ..onNameChanged('Marina')
          ..onDateChanged(DateTime.now().add(const Duration(days: 30)));
        await cubit.save();
      },
      verify: (cubit) {
        expect(cubit.state.saveAction, const Initial());
        verifyNever(() => profileRepository.getMyProfile());
      },
    );

    blocTest<ProfileSetupCubit, ProfileSetupState>(
      'reports a failure then resets so the toast can fire again',
      build: () {
        when(
          () => profileRepository.getMyProfile(),
        ).thenAnswer((_) async => throw const LocalizedException(l10nKey: 'NETWORK'));
        return build();
      },
      act: (cubit) async {
        cubit.onNameChanged('Marina');
        await cubit.save();
      },
      verify: (cubit) => expect(cubit.state.saveAction, const Initial()),
    );
  });
}
