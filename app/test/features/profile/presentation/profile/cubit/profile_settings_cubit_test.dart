import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile_details.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/profile/presentation/profile/cubit/profile_settings_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

class _MockSettingsRepository() extends Mock implements SettingsRepository;

const _details = ProfileDetails(
  profileId: 'p1',
  displayName: 'Marina Sobrenome',
  pronouns: 'ela/dela',
  timeZone: 'America/Sao_Paulo',
  theme: AppThemeVariant.rose,
);

void main() {
  late ProfileRepository profile;
  late AuthenticationRepository authentication;
  late SettingsRepository settings;
  late ProfileSettingsCubit cubit;

  setUpAll(() {
    registerFallbackValue(const Settings.empty());
    registerFallbackValue(AppThemeVariant.rose);
  });

  setUp(() {
    profile = _MockProfileRepository();
    authentication = _MockAuthenticationRepository();
    settings = _MockSettingsRepository();
    when(() => authentication.loginProvider).thenReturn('apple');
    when(() => settings.get()).thenReturn(const Settings.empty());
    when(() => settings.save(any())).thenAnswer((_) async {});
    cubit = ProfileSettingsCubit(
      profileRepository: profile,
      authenticationRepository: authentication,
      settingsRepository: settings,
    );
  });

  tearDown(() => cubit.close());

  Future<void> load() async {
    when(() => profile.getProfileDetails()).thenAnswer((_) async => _details);
    await cubit.load();
  }

  test('loads the profile, settings and login provider', () async {
    await load();

    expect(cubit.state.current, _details);
    expect(cubit.state.loginProvider, 'apple');
  });

  test('rejects an empty display name without saving', () async {
    await load();

    cubit.onNameChanged('   ');
    await cubit.saveName();

    expect(cubit.state.hasNameError, isTrue);
    expect(cubit.state.nameDraft, '   ');
    expect(cubit.state.current?.displayName, 'Marina Sobrenome');
    verifyNever(
      () => profile.updateDisplayName(
        profileId: any(named: 'profileId'),
        displayName: any(named: 'displayName'),
      ),
    );
  });

  test('saves the sanitized display name', () async {
    await load();
    when(
      () => profile.updateDisplayName(
        profileId: any(named: 'profileId'),
        displayName: any(named: 'displayName'),
      ),
    ).thenAnswer((_) async {});

    final actions = <Resource<void>>[];
    final subscription = cubit.stream.listen((state) => actions.add(state.saveAction));
    addTearDown(subscription.cancel);

    cubit.onNameChanged('Marina 💕');
    await cubit.saveName();
    await pumpEventQueue();

    verify(() => profile.updateDisplayName(profileId: 'p1', displayName: 'Marina')).called(1);
    expect(cubit.state.current?.displayName, 'Marina');
    expect(cubit.state.nameDraft, 'Marina');
    expect(cubit.state.hasNameError, isFalse);
    expect(actions.whereType<Success<void>>(), isEmpty);
  });

  test('flushes a pending name when the page closes', () async {
    await load();
    when(
      () => profile.updateDisplayName(
        profileId: any(named: 'profileId'),
        displayName: any(named: 'displayName'),
      ),
    ).thenAnswer((_) async {});

    cubit.onNameChanged('Bia');
    await cubit.close();

    verify(() => profile.updateDisplayName(profileId: 'p1', displayName: 'Bia')).called(1);
  });

  test('reverts the display name when the save fails', () async {
    await load();
    when(
      () => profile.updateDisplayName(
        profileId: any(named: 'profileId'),
        displayName: any(named: 'displayName'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));

    final actions = <Resource<void>>[];
    final subscription = cubit.stream.listen((state) => actions.add(state.saveAction));
    addTearDown(subscription.cancel);

    cubit.onNameChanged('Marina');
    await cubit.saveName();
    await pumpEventQueue();

    expect(cubit.state.current?.displayName, 'Marina Sobrenome');
    expect(cubit.state.nameDraft, 'Marina Sobrenome');
    expect(actions.whereType<Failure>(), isNotEmpty);
  });

  test('saves pronouns and clears them when emptied', () async {
    await load();
    when(
      () => profile.updatePronouns(
        profileId: any(named: 'profileId'),
        pronouns: any(named: 'pronouns'),
      ),
    ).thenAnswer((_) async {});

    cubit.onPronounsChanged('  ele/dele  ');
    await cubit.savePronouns();

    verify(() => profile.updatePronouns(profileId: 'p1', pronouns: 'ele/dele')).called(1);

    cubit.onPronounsChanged('');
    await cubit.savePronouns();

    verify(() => profile.updatePronouns(profileId: 'p1', pronouns: null)).called(1);
    expect(cubit.state.current?.pronouns, isNull);
  });

  test('caps pronouns at 30 characters and shows a field error', () async {
    await load();

    cubit.onPronounsChanged('a' * 31);
    await cubit.savePronouns();

    expect(cubit.state.hasPronounsError, isTrue);
    verifyNever(
      () => profile.updatePronouns(
        profileId: any(named: 'profileId'),
        pronouns: any(named: 'pronouns'),
      ),
    );
  });

  test('saves the theme and keeps it on failure', () async {
    await load();
    when(
      () => profile.updateTheme(
        profileId: any(named: 'profileId'),
        theme: any(named: 'theme'),
      ),
    ).thenAnswer((_) async {});

    await cubit.onThemeChanged(AppThemeVariant.blue);

    expect(cubit.state.current?.theme, AppThemeVariant.blue);
    verify(() => settings.save(const Settings(themeVariant: 'blue'))).called(1);

    when(
      () => profile.updateTheme(
        profileId: any(named: 'profileId'),
        theme: any(named: 'theme'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));

    await cubit.onThemeChanged(AppThemeVariant.neutral);

    verify(() => settings.save(const Settings(themeVariant: 'neutral'))).called(1);
    expect(cubit.state.current?.theme, AppThemeVariant.blue);
  });

  test('applies the server theme locally on load', () async {
    when(() => profile.getProfileDetails()).thenAnswer(
      (_) async => const ProfileDetails(profileId: 'p1', displayName: 'Marina', theme: .blue),
    );

    await cubit.load();

    verify(() => settings.save(const Settings(themeVariant: 'blue'))).called(1);
  });

  test('saves the time zone and reverts it on failure', () async {
    await load();
    when(
      () => profile.updateTimeZone(
        profileId: any(named: 'profileId'),
        timeZone: any(named: 'timeZone'),
      ),
    ).thenAnswer((_) async {});

    await cubit.onTimeZoneChanged('Europe/Lisbon');
    expect(cubit.state.current?.timeZone, 'Europe/Lisbon');

    when(
      () => profile.updateTimeZone(
        profileId: any(named: 'profileId'),
        timeZone: any(named: 'timeZone'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));

    await cubit.onTimeZoneChanged('Asia/Tokyo');
    expect(cubit.state.current?.timeZone, 'Europe/Lisbon');
  });
}
