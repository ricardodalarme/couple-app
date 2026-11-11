import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/heavy_day/presentation/heavy_day/cubit/heavy_day_cubit.dart';
import 'package:flutter_bloc_starter/features/heavy_day/presentation/heavy_day/heavy_day_page.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_bloc_starter/features/privacy/data/repositories/privacy_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockPrivacyRepository() extends Mock implements PrivacyRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockNotesRepository() extends Mock implements NotesRepository;

const _body = 'Um dia delicado. Um pouco mais de carinho ajuda.';

void main() {
  late PrivacyRepository privacy;
  late ProfileRepository profile;
  late NotesRepository notes;

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
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

  Future<HeavyDayCubit> loaded() async {
    final cubit = HeavyDayCubit(
      privacyRepository: privacy,
      profileRepository: profile,
      notesRepository: notes,
    );
    addTearDown(cubit.close);
    await cubit.load();

    return cubit;
  }

  Future<void> pump(WidgetTester tester, HeavyDayCubit cubit) async {
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const HeavyDayPage()));
    await tester.pump();
  }

  testWidgets('without the consent the page offers the activation, never the preview', (
    tester,
  ) async {
    when(() => privacy.getConsents()).thenAnswer((_) async => {});
    final cubit = await loaded();

    await pump(tester, cubit);

    expect(find.text('Ligar'), findsOneWidget);
    expect(find.text('Agora não'), findsOneWidget);
    expect(find.text(_body), findsNothing);
  });

  testWidgets('turning it on records the consent and shows the preview', (tester) async {
    when(() => privacy.getConsents()).thenAnswer((_) async => {});
    final cubit = await loaded();
    await pump(tester, cubit);

    await tester.tap(find.text('Ligar'));
    await tester.pumpAndSettle();

    expect(find.text(_body), findsOneWidget);
    expect(find.text('Marina veria: “$_body”'), findsOneWidget);
    verify(() => privacy.setConsent(ConsentKind.sensitiveTracks, granted: true)).called(1);
    verify(() => profile.updateHeavyDaySharing(profileId: 'p1', sharing: HeavyDaySharing.ask))
        .called(1);
  });

  testWidgets('the preview always shows the exact sentence before sending', (tester) async {
    final cubit = await loaded();

    await pump(tester, cubit);

    expect(find.text(_body), findsOneWidget);
    expect(find.text('Marina veria: “$_body”'), findsOneWidget);
    expect(find.text('A cada vez'), findsOneWidget);
    expect(find.text('Sempre'), findsOneWidget);
  });

  testWidgets('choosing always stores it before the next send', (tester) async {
    final cubit = await loaded();
    await pump(tester, cubit);

    await tester.tap(find.text('Sempre'));
    await tester.pump();

    verify(() => profile.updateHeavyDaySharing(profileId: 'p1', sharing: HeavyDaySharing.always))
        .called(1);
  });

  testWidgets('sharing sends the fixed note once and confirms what the partner sees', (
    tester,
  ) async {
    final cubit = await loaded();
    await pump(tester, cubit);

    await tester.tap(find.text('Compartilhar'));
    await tester.pumpAndSettle();

    expect(find.text('Aviso enviado para Marina'), findsOneWidget);
    expect(find.text(_body), findsOneWidget);
    expect(find.text('Seu par vê no widget de recados, se estiver ativado.'), findsOneWidget);
    verify(() => notes.sendNote(body: _body, forWidget: true)).called(1);
  });

  testWidgets('cancelling sends nothing', (tester) async {
    final cubit = await loaded();
    await pump(tester, cubit);

    await tester.tap(find.text('Não compartilhar'));
    await tester.pumpAndSettle();

    verifyNever(
      () => notes.sendNote(
        body: any(named: 'body'),
        forWidget: any(named: 'forWidget'),
      ),
    );
  });
}
