import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/programs/cubit/programs_cubit.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/programs/programs_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockProgramsRepository() extends Mock implements ProgramsRepository;

class _MockPlusRepository() extends Mock implements PlusRepository;

void main() {
  late ProgramsRepository repository;
  late PlusRepository plus;

  const free = Program(
    slug: 'gratitude-7',
    title: '7 dias de gratidão',
    body: 'Sete dias para perceber o que já existe.',
    lessons: [
      Lesson(slug: 'd1', title: 'Primeira', day: 1),
      Lesson(slug: 'd2', title: 'Segunda', day: 2),
    ],
  );
  const paid = Program(
    slug: 'reconnect-5',
    title: 'Reencontro',
    plusOnly: true,
    lessons: [Lesson(slug: 'd1', title: 'Primeira', day: 1)],
  );
  const sensitive = Program(
    slug: 'grief-together',
    title: 'Luto, juntos',
    sensitive: true,
    lessons: [Lesson(slug: 'd1', title: 'O que ajuda hoje?', day: 1)],
  );

  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUp(() {
    repository = _MockProgramsRepository();
    plus = _MockPlusRepository();
    when(() => repository.getPrograms()).thenAnswer((_) async => [free, paid]);
    when(() => plus.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: false));
  });

  Future<ProgramsCubit> loaded() async {
    final cubit = ProgramsCubit(programsRepository: repository, plusRepository: plus);
    addTearDown(cubit.close);
    await cubit.load();

    return cubit;
  }

  testWidgets('free and plus programs are shown honestly, with the diary below', (tester) async {
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ProgramsPage()));
    await tester.pump();

    expect(find.text('7 dias de gratidão'), findsOneWidget);
    expect(find.text('GRÁTIS'), findsOneWidget);
    expect(find.textContaining('2 lições'), findsOneWidget);
    expect(find.text('Reencontro'), findsOneWidget);
    expect(find.text('PLUS'), findsOneWidget);
    expect(find.text('Diário'), findsOneWidget);
  });

  testWidgets('a sensitive program carries its tag', (tester) async {
    when(() => repository.getPrograms()).thenAnswer((_) async => [sensitive]);
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ProgramsPage()));
    await tester.pump();

    expect(find.text('SENSÍVEL'), findsOneWidget);
  });

  testWidgets('the first frame is a skeleton, not a blank page', (tester) async {
    final cubit = ProgramsCubit(programsRepository: repository, plusRepository: plus);
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ProgramsPage()));
    await tester.pump();

    expect(find.byWidgetPredicate((widget) => widget is Skeletonizer), findsOneWidget);
  });

  testWidgets('a language without programs says so instead of inventing them', (tester) async {
    when(() => repository.getPrograms()).thenAnswer((_) async => []);
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ProgramsPage()));
    await tester.pump();

    expect(find.text('Nenhum programa por aqui ainda'), findsOneWidget);
  });

  testWidgets('opening the hub makes no haptic or notification platform call', (tester) async {
    final cubit = await loaded();
    final calls = <MethodCall>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (
      call,
    ) async {
      calls.add(call);

      return null;
    });
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ProgramsPage()));
    await tester.pump();

    expect(
      calls.where(
        (call) =>
            call.method == 'HapticFeedback.vibrate' ||
            call.method.toLowerCase().contains('notification'),
      ),
      isEmpty,
    );
  });
}
