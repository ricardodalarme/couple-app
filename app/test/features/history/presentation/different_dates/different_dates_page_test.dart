import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/different_dates/cubit/different_dates_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/different_dates/different_dates_page.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockHistoryRepository() extends Mock implements HistoryRepository;

void main() {
  setUpAll(() => registerFallbackValue(DateTime(2026)));

  testWidgets('renders both start dates and updates when partner date is chosen (X-170)', (
    tester,
  ) async {
    final repository = _MockHistoryRepository();
    final overview = HistoryOverview(
      selfId: 'self-1',
      selfName: 'Rafa',
      selfInitials: 'R',
      partnerName: 'Marina',
      partnerInitials: 'M',
      isPaired: true,
      coupleId: 'c1',
      avatarKind: AvatarKind.initials,
      phase: RelationshipPhase.dating,
      togetherSince: DateTime(2024, 3, 14),
      milestones: const [],
      storyDates: StoryDatesSummary(
        met: const StoryDateEntry(kind: 'met'),
        dating: const StoryDateEntry(kind: 'dating'),
        engaged: const StoryDateEntry(kind: 'engaged'),
        married: const StoryDateEntry(kind: 'married'),
        selfStartDate: DateTime(2024, 3, 14),
        partnerStartDate: DateTime(2024, 3, 22),
      ),
      numbers: HistoryNumbers.compute(
        togetherSince: DateTime(2024, 3, 14),
        now: DateTime(2026, 11, 8),
        places: const [],
      ),
    );
    when(repository.getOverview).thenAnswer((_) async => overview);
    when(
      () => repository.updateTogetherSince(
        profileId: any(named: 'profileId'),
        date: any(named: 'date'),
      ),
    ).thenAnswer((_) async {});

    final cubit = DifferentDatesCubit(historyRepository: repository);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const DifferentDatesPage()));
    await tester.pumpAndSettle();

    expect(find.text('14 de março de 2024'), findsOneWidget);
    expect(find.text('22 de março de 2024'), findsOneWidget);
    expect(find.text('Sua data'), findsOneWidget);
    expect(find.text('Data de Marina'), findsOneWidget);
    expect(find.text('Cada um vê a sua. Nada é trocado sem os dois.'), findsOneWidget);

    cubit.selectPartnerDate(true);
    await cubit.confirm();

    verify(() => repository.updateTogetherSince(profileId: 'self-1', date: DateTime(2024, 3, 22)))
        .called(1);
  });
}
