import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/capsules/data/repositories/capsules_repository.dart';
import 'package:flutter_bloc_starter/features/capsules/presentation/capsules/capsules_page.dart';
import 'package:flutter_bloc_starter/features/capsules/presentation/capsules/cubit/capsules_cubit.dart';
import 'package:flutter_bloc_starter/features/connect/data/repositories/connect_repository.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/touch/cubit/touch_cubit.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/touch/touch_page.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/us/cubit/us_cubit.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/us/us_page.dart';
import 'package:flutter_bloc_starter/features/distance/data/models/distance_info.dart';
import 'package:flutter_bloc_starter/features/distance/data/repositories/distance_repository.dart';
import 'package:flutter_bloc_starter/features/distance/presentation/distance/cubit/distance_cubit.dart';
import 'package:flutter_bloc_starter/features/distance/presentation/distance/distance_page.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/local/guides_local_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/remote/guides_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/repositories/guides_repository.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/hub/cubit/guides_cubit.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/hub/guides_page.dart';
import 'package:flutter_bloc_starter/features/memories/data/repositories/memories_repository.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/places/cubit/places_cubit.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/places/places_page.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/compose_page.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/compose_cubit.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/language/cubit/language_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/language/language_page.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_helpers/pump_app.dart';

class _MockAuthentication() extends Mock implements AuthenticationRepository;

class _MockCapsules() extends Mock implements CapsulesRepository;

class _MockConnect() extends Mock implements ConnectRepository;

class _MockDistance() extends Mock implements DistanceRepository;

class _MockGuidesDataSource() extends Mock implements GuidesDataSource;

class _MockGuidesLocalDataSource() extends Mock implements GuidesLocalDataSource;

class _MockMemories() extends Mock implements MemoriesRepository;

class _MockNotes() extends Mock implements NotesRepository;

class _MockPairing() extends Mock implements PairingRepository;

class _MockPlus() extends Mock implements PlusRepository;

class _MockSettings() extends Mock implements SettingsRepository;

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.en));
  tearDownAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  Future<void> pumpNarrow(WidgetTester tester, Widget page) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpApp(
      Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.3)),
          child: page,
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
  }

  testWidgets('the capsule page fits in English at a small width and large text', (tester) async {
    final repository = _MockCapsules();
    when(repository.getCapsules).thenAnswer((_) async => const []);
    final cubit = CapsulesCubit(capsulesRepository: repository);
    addTearDown(cubit.close);

    await pumpNarrow(tester, BlocProvider.value(value: cubit, child: const CapsulesPage()));

    expect(find.text('Time capsule'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the us page fits in English at a small width and large text', (tester) async {
    final cubit = UsCubit(connectRepository: _MockConnect());
    addTearDown(cubit.close);

    await pumpNarrow(tester, BlocProvider.value(value: cubit, child: const UsPage()));

    expect(find.text('Send with care'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the touch page fits in English at a small width and large text', (tester) async {
    final repository = _MockConnect();
    when(repository.getTouchTopicsEnabled).thenAnswer((_) async => true);
    when(repository.getTouchCards)
        .thenAnswer((_) async => const [HelpItem(slug: 'a', title: 'Hold hands for one minute.')]);
    final cubit = TouchCubit(connectRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await pumpNarrow(tester, BlocProvider.value(value: cubit, child: const TouchPage()));

    expect(find.text('Hold hands for one minute.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the note page fits in English at a small width and large text', (tester) async {
    final repository = _MockNotes();
    final pairingRepository = _MockPairing();
    when(repository.getSent).thenAnswer((_) async => const []);
    when(pairingRepository.getPartner)
        .thenAnswer((_) async => const Profile(id: 'p1', avatarKind: AvatarKind.initials));
    final cubit = ComposeCubit(
      notesRepository: repository,
      pairingRepository: pairingRepository,
      exportDrawing: (_) async => throw UnimplementedError(),
    );
    addTearDown(cubit.close);

    await pumpNarrow(tester, BlocProvider.value(value: cubit, child: const ComposePage()));

    expect(find.text('A note or a drawing'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the distance page fits in English at a small width and large text', (tester) async {
    final repository = _MockDistance();
    when(repository.getDistance).thenAnswer((_) async => DistanceInfo.fake());
    final cubit = DistanceCubit(distanceRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await pumpNarrow(tester, BlocProvider.value(value: cubit, child: const DistancePage()));

    expect(find.text('Distance'), findsOneWidget);
    expect(find.text('Your partner'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the places page fits in English at a small width and large text', (tester) async {
    final repository = _MockMemories();
    when(repository.getMemories).thenAnswer((_) async => const []);
    final cubit = PlacesCubit(memoriesRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await pumpNarrow(tester, BlocProvider.value(value: cubit, child: const PlacesPage()));

    expect(find.text('Places'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the guides page fits in English at a small width and large text', (tester) async {
    final plusRepository = _MockPlus();
    when(plusRepository.getPlus).thenAnswer((_) async => const PlusState(hasPlus: false));
    final cubit = GuidesCubit(
      repository: GuidesRepository(
        dataSource: _MockGuidesDataSource(),
        localDataSource: _MockGuidesLocalDataSource(),
        authenticationRepository: _MockAuthentication(),
      ),
      plusRepository: plusRepository,
    );
    addTearDown(cubit.close);
    await cubit.load();

    await pumpNarrow(tester, BlocProvider.value(value: cubit, child: const GuidesPage()));

    expect(find.text('One step at a time, in private.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the language page fits in English at a small width and large text', (tester) async {
    final repository = _MockSettings();
    when(repository.get).thenReturn(const Settings.empty());
    final cubit = LanguageCubit(repository: repository);
    addTearDown(cubit.close);

    await pumpNarrow(tester, BlocProvider.value(value: cubit, child: const LanguagePage()));

    expect(find.text('Language'), findsOneWidget);
    expect(find.text('Portuguese (Brazil)'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
