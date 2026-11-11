import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/numbers/cubit/history_numbers_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/numbers/history_numbers_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockHistoryRepository() extends Mock implements HistoryRepository;

void main() {
  testWidgets('renders descriptive history in numbers including days together and places (X-157)', (
    tester,
  ) async {
    final repository = _MockHistoryRepository();
    when(repository.getOverview).thenAnswer((_) async => HistoryOverview.fake());

    final cubit = HistoryNumbersCubit(historyRepository: repository);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const HistoryNumbersPage()));
    await tester.pumpAndSettle();

    expect(find.text('Em números'), findsOneWidget);
    expect(find.text('969 dias'), findsOneWidget);
    expect(find.text('fins de semana juntos'), findsOneWidget);
    expect(find.text('luas cheias'), findsOneWidget);
    expect(find.text('Natais juntos'), findsOneWidget);
    expect(find.text('lugar'), findsOneWidget);
    expect(find.text('Paraty'), findsOneWidget);
  });
}
