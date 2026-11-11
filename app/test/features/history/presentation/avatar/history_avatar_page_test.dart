import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/avatar/cubit/history_avatar_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/avatar/history_avatar_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockHistoryRepository() extends Mock implements HistoryRepository;

void main() {
  testWidgets('renders avatar segments and privacy note (X-144)', (tester) async {
    final repository = _MockHistoryRepository();
    when(repository.getOverview).thenAnswer((_) async => HistoryOverview.fake());

    final cubit = HistoryAvatarCubit(historyRepository: repository);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const HistoryAvatarPage()));
    await tester.pumpAndSettle();

    expect(find.text('Iniciais'), findsOneWidget);
    expect(find.text('Seu avatar usa as suas iniciais.'), findsOneWidget);
    expect(find.text('Foto'), findsNothing);
    expect(find.text('Ilustração'), findsNothing);
    expect(
      find.text('Cada pessoa escolhe o seu. O app nunca puxa a foto do outro.'),
      findsOneWidget,
    );
  });
}
