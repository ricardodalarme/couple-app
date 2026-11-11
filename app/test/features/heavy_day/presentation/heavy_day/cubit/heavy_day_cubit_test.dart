import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/heavy_day/presentation/heavy_day/cubit/heavy_day_cubit.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_bloc_starter/features/privacy/data/repositories/privacy_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPrivacyRepository() extends Mock implements PrivacyRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockNotesRepository() extends Mock implements NotesRepository;

const _body = 'Um dia delicado. Um pouco mais de carinho ajuda.';

void main() {
  late PrivacyRepository privacy;
  late ProfileRepository profile;
  late NotesRepository notes;

  setUpAll(() {
    registerFallbackValue(ConsentKind.sensitiveTracks);
    registerFallbackValue(HeavyDaySharing.ask);
  });

  setUp(() {
    privacy = _MockPrivacyRepository();
    profile = _MockProfileRepository();
    notes = _MockNotesRepository();
    when(() => privacy.getConsents()).thenAnswer((_) async => {ConsentKind.sensitiveTracks: true});
    when(() => privacy.setConsent(any(), granted: any(named: 'granted'))).thenAnswer((_) async {});
    when(() => profile.getMySettings()).thenAnswer(
      (_) async => const AccountSettings(
        theme: .rose,
        profileId: 'p1',
        partnerName: 'Marina',
        heavyDaySharing: HeavyDaySharing.ask,
      ),
    );
    when(
      () => profile.updateHeavyDaySharing(
        profileId: any(named: 'profileId'),
        sharing: any(named: 'sharing'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => notes.sendNote(
        body: any(named: 'body'),
        forWidget: any(named: 'forWidget'),
      ),
    ).thenAnswer((_) async {});
  });

  HeavyDayCubit build() =>
      HeavyDayCubit(privacyRepository: privacy, profileRepository: profile, notesRepository: notes);

  test('load reads the consent, the frequency and the partner name', () async {
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.currentSetup?.hasConsent, isTrue);
    expect(cubit.state.currentSetup?.sharing, HeavyDaySharing.ask);
    expect(cubit.state.currentSetup?.partnerName, 'Marina');
  });

  test('activating records the consent and turns the notice on', () async {
    when(() => privacy.getConsents()).thenAnswer((_) async => {});
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    final activated = await cubit.activate();

    expect(activated, isTrue);
    expect(cubit.state.currentSetup?.hasConsent, isTrue);
    expect(cubit.state.currentSetup?.sharing, HeavyDaySharing.ask);
    verify(() => privacy.setConsent(ConsentKind.sensitiveTracks, granted: true)).called(1);
    verify(() => profile.updateHeavyDaySharing(profileId: 'p1', sharing: HeavyDaySharing.ask))
        .called(1);
  });

  test('choosing always updates the stored frequency', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.setSharing(HeavyDaySharing.always);

    expect(cubit.state.currentSetup?.sharing, HeavyDaySharing.always);
    verify(() => profile.updateHeavyDaySharing(profileId: 'p1', sharing: HeavyDaySharing.always))
        .called(1);
  });

  test('sharing sends the fixed sentence once as a widget note', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    final sent = await cubit.share(body: _body);

    expect(sent, isTrue);
    expect(cubit.state.isSent, isTrue);
    verify(() => notes.sendNote(body: _body, forWidget: true)).called(1);
  });

  test('a missing consent never sends', () async {
    when(() => privacy.getConsents()).thenAnswer((_) async => {});
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    final sent = await cubit.share(body: _body);

    expect(sent, isFalse);
    expect(cubit.state.isSent, isFalse);
    verifyNever(
      () => notes.sendNote(
        body: any(named: 'body'),
        forWidget: any(named: 'forWidget'),
      ),
    );
  });

  test('a failed send keeps the page open without the confirmation', () async {
    when(
      () => notes.sendNote(
        body: any(named: 'body'),
        forWidget: any(named: 'forWidget'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    final sent = await cubit.share(body: _body);

    expect(sent, isFalse);
    expect(cubit.state.isSent, isFalse);
    expect(cubit.state.action, isA<Initial>());
  });
}
