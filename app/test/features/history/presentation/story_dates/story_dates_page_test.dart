import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/story_dates/cubit/story_dates_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/story_dates/story_dates_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockHistoryRepository() extends Mock implements HistoryRepository;

void main() {
  late HistoryRepository repository;

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  setUp(() {
    repository = _MockHistoryRepository();
    when(() => repository.getOverview()).thenAnswer((_) async => HistoryOverview.fake());
    when(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: any(named: 'profileId'),
        kind: any(named: 'kind'),
        title: any(named: 'title'),
        date: any(named: 'date'),
        existingEventId: any(named: 'existingEventId'),
        existingEventIsMine: any(named: 'existingEventIsMine'),
        coupleId: any(named: 'coupleId'),
        updateTogetherSince: any(named: 'updateTogetherSince'),
      ),
    ).thenAnswer((_) async {});
  });

  Future<StoryDatesCubit> pumpPage(WidgetTester tester) async {
    final cubit = StoryDatesCubit(historyRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const StoryDatesPage()));
    await tester.pumpAndSettle();

    return cubit;
  }

  testWidgets('renders the 4 canonical story dates and note (X-142)', (tester) async {
    await pumpPage(tester);

    expect(find.text('Datas da nossa história'), findsOneWidget);
    expect(find.text('Nos conhecemos'), findsOneWidget);
    expect(find.text('Começamos a namorar'), findsOneWidget);
    expect(find.text('Noivamos'), findsOneWidget);
    expect(find.text('Casamos'), findsOneWidget);
    expect(find.text('Tudo opcional. A data de início alimenta o contador.'), findsOneWidget);
  });

  testWidgets('tapping a story date opens the picker without an inline field', (tester) async {
    await pumpPage(tester);

    expect(find.byType(BaseDateField), findsNothing);

    await tester.tap(find.text('Começamos a namorar'));
    await tester.pumpAndSettle();

    expect(find.byType(BaseSheet), findsOneWidget);
    expect(
      find.descendant(of: find.byType(BaseSheet), matching: find.text('Começamos a namorar')),
      findsOneWidget,
    );
    expect(find.text('Confirm'), findsOneWidget);
  });

  testWidgets('confirming the picker saves the story date', (tester) async {
    await pumpPage(tester);

    await tester.tap(find.text('Começamos a namorar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();

    verify(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: 'fake-self',
        kind: 'dating',
        title: 'Começamos a namorar',
        date: any(named: 'date'),
        existingEventId: null,
        existingEventIsMine: true,
        coupleId: 'fake-couple',
        updateTogetherSince: true,
      ),
    ).called(1);
    expect(find.byType(BaseSheet), findsNothing);
  });

  testWidgets('dismissing the picker saves nothing', (tester) async {
    await pumpPage(tester);

    await tester.tap(find.text('Noivamos'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(AppIcons.close));
    await tester.pumpAndSettle();

    verifyNever(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: any(named: 'profileId'),
        kind: any(named: 'kind'),
        title: any(named: 'title'),
        date: any(named: 'date'),
        existingEventId: any(named: 'existingEventId'),
        existingEventIsMine: any(named: 'existingEventIsMine'),
        coupleId: any(named: 'coupleId'),
        updateTogetherSince: any(named: 'updateTogetherSince'),
      ),
    );
  });
}
