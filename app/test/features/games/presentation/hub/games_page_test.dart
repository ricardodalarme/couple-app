import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_bloc_starter/features/games/data/models/games_overview.dart';
import 'package:flutter_bloc_starter/features/games/data/repositories/games_repository.dart';
import 'package:flutter_bloc_starter/features/games/presentation/hub/cubit/games_cubit.dart';
import 'package:flutter_bloc_starter/features/games/presentation/hub/games_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockGamesRepository() extends Mock implements GamesRepository;

void main() {
  late GamesRepository repository;

  GameSession session(GameKind game, GameStatus status, {String invitedBy = 'me'}) => GameSession(
    id: game.key,
    game: game,
    status: status,
    invitedBy: invitedBy,
    createdAt: DateTime.now().subtract(const Duration(hours: 1)),
  );

  Future<GamesCubit> loaded(GamesOverview overview) async {
    when(() => repository.getOverview()).thenAnswer((_) async => overview);
    final cubit = GamesCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    return cubit;
  }

  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUp(() => repository = _MockGamesRepository());

  testWidgets('lists the games and shows no score, ranking or streak', (tester) async {
    final cubit = await loaded(const GamesOverview(selfId: 'me', hasPartner: true));

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const GamesPage()));
    await tester.pump();

    expect(find.text('Eu ou ele'), findsOneWidget);
    expect(find.text('Quanto você me conhece'), findsOneWidget);
    expect(find.text('20 perguntas'), findsNothing);
    expect(find.text('Eu nunca, nós dois'), findsOneWidget);
    expect(find.text('Missão do encontro'), findsOneWidget);
    expect(
      find.textContaining(RegExp(r'\d+ (pontos|%)|ranking|sequência', caseSensitive: false)),
      findsNothing,
    );
  });

  testWidgets('shows a lock chip on every game when there is no partner', (tester) async {
    final cubit = await loaded(const GamesOverview(selfId: 'me', hasPartner: false));

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const GamesPage()));
    await tester.pump();

    expect(
      find.text('PRECISA DOS DOIS'),
      findsNWidgets(GameKind.values.where((kind) => kind.hasContent).length),
    );
    expect(find.textContaining('Os jogos precisam dos dois'), findsOneWidget);
  });

  testWidgets('shows the partner invitation and the state of each game', (tester) async {
    final cubit = await loaded(
      GamesOverview(
        selfId: 'me',
        hasPartner: true,
        partnerName: 'Marina',
        sessions: [
          session(GameKind.meOrYou, GameStatus.invited, invitedBy: 'partner'),
          session(GameKind.howWell, GameStatus.invited),
          session(GameKind.twentyQuestions, GameStatus.active),
          session(GameKind.neverHaveWe, GameStatus.active),
          session(GameKind.mission, GameStatus.finished),
        ],
      ),
    );

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const GamesPage()));
    await tester.pump();

    expect(find.text('MARINA CHAMOU VOCÊ'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
    expect(find.textContaining('Aguardando Marina'), findsOneWidget);
    expect(find.textContaining('Em andamento'), findsOneWidget);
    expect(find.textContaining('Terminado'), findsOneWidget);
    expect(find.text('20 perguntas'), findsNothing);
  });

  testWidgets('shows a cancelled session on the hub tile', (tester) async {
    final cubit = await loaded(
      GamesOverview(
        selfId: 'me',
        hasPartner: true,
        sessions: [session(GameKind.mission, GameStatus.cancelled)],
      ),
    );

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const GamesPage()));
    await tester.pump();

    expect(find.textContaining('Convite cancelado'), findsOneWidget);
  });

  testWidgets('a failed read offers to try again', (tester) async {
    when(() => repository.getOverview()).thenThrow(Exception('offline'));
    final cubit = GamesCubit(repository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const GamesPage()));
    await tester.pump();

    expect(find.text('Não deu para abrir os jogos'), findsOneWidget);
    expect(find.text('Tentar novamente'), findsOneWidget);
  });
}
