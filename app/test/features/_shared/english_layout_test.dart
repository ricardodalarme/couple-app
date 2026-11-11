import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/capsules/data/repositories/capsules_repository.dart';
import 'package:flutter_bloc_starter/features/capsules/presentation/capsules/capsules_page.dart';
import 'package:flutter_bloc_starter/features/capsules/presentation/capsules/cubit/capsules_cubit.dart';
import 'package:flutter_bloc_starter/features/connect/data/repositories/connect_repository.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/touch/cubit/touch_cubit.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/touch/touch_page.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/us/cubit/us_cubit.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/us/us_page.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/compose_page.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/compose_cubit.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_helpers/pump_app.dart';

class _MockCapsules() extends Mock implements CapsulesRepository;

class _MockConnect() extends Mock implements ConnectRepository;

class _MockNotes() extends Mock implements NotesRepository;

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.en));
  tearDownAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  Future<void> pumpNarrow(WidgetTester tester, Widget page) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpApp(
      MediaQuery(
        data: const MediaQueryData(textScaler: TextScaler.linear(1.3)),
        child: page,
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
    when(repository.getSent).thenAnswer((_) async => const []);
    final cubit = ComposeCubit(
      notesRepository: repository,
      exportDrawing: (_) async => throw UnimplementedError(),
    );
    addTearDown(cubit.close);

    await pumpNarrow(tester, BlocProvider.value(value: cubit, child: const ComposePage()));

    expect(find.text('A note or a drawing'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
