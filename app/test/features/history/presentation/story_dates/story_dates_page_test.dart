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
  testWidgets('renders the 4 canonical story dates and note (X-142)', (tester) async {
    final repository = _MockHistoryRepository();
    when(repository.getOverview).thenAnswer((_) async => HistoryOverview.fake());

    final cubit = StoryDatesCubit(historyRepository: repository);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const StoryDatesPage()));
    await tester.pumpAndSettle();

    expect(find.text('Datas da nossa história'), findsOneWidget);
    expect(find.text('Nos conhecemos'), findsOneWidget);
    expect(find.text('Começamos a namorar'), findsOneWidget);
    expect(find.text('Noivamos'), findsOneWidget);
    expect(find.text('Casamos'), findsOneWidget);
    expect(find.text('Tudo opcional. A data de início alimenta o contador.'), findsOneWidget);
  });
}
