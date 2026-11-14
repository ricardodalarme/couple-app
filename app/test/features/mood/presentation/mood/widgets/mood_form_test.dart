import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_entry.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_share.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/repositories/mood_repository.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/cubit/mood_cubit.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/widgets/mood_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_helpers/pump_app.dart';

class _MockMoodRepository() extends Mock implements MoodRepository;

void main() {
  setUpAll(() {
    registerFallbackValue(MoodKind.happy);
    registerFallbackValue(MoodShare.none);
    registerFallbackValue(NeedKind.hug);
  });

  testWidgets('the form is disabled while a save is in flight', (tester) async {
    final repository = _MockMoodRepository();
    final pending = Completer<MoodEntry>();
    when(repository.getTodayMood).thenAnswer((_) async {
      return (entry: null, partnerName: 'Marina');
    });
    when(
      () => repository.saveMood(
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
      ),
    ).thenAnswer((_) => pending.future);
    final cubit = MoodCubit(moodRepository: repository);
    await cubit.load();
    cubit.selectMood(MoodKind.happy);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const MoodForm()));

    expect(find.text('O que Marina vê'), findsOneWidget);

    await tester.tap(find.text('Salvar'));
    await tester.pump();
    expect(cubit.state.saveAction.isLoading, isTrue);

    await tester.tap(find.text('Triste'));
    final shareOption = find.text('Só meu humor');
    await tester.ensureVisible(shareOption);
    await tester.pump();
    await tester.tap(shareOption);
    await tester.pump();

    expect(cubit.state.mood, MoodKind.happy);
    expect(cubit.state.share, MoodShare.none);

    pending.complete(
      MoodEntry(id: 'm1', day: DateTime(2026, 11, 11), mood: MoodKind.happy, share: MoodShare.none),
    );
    await tester.pump();
    await cubit.close();
  });

  testWidgets('every mood card takes the same width', (tester) async {
    final repository = _MockMoodRepository();
    when(repository.getTodayMood).thenAnswer((_) async => (entry: null, partnerName: 'Marina'));
    final cubit = MoodCubit(moodRepository: repository);
    await cubit.load();
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const MoodForm()));

    final widths = [
      for (final label in ['Feliz', 'Cansado(a)', 'Estressado(a)', 'Brincalhão(ona)'])
        tester
            .getSize(
              find.ancestor(of: find.text(label), matching: find.byType(AnimatedContainer)).first,
            )
            .width,
    ];

    expect(widths, hasLength(4));
    expect(widths.toSet(), hasLength(1));
  });
}
