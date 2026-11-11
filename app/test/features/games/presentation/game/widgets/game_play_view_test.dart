import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_item.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_bloc_starter/features/games/data/repositories/games_repository.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/cubit/game_cubit.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_play_view.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_helpers/pump_app.dart';

class _MockGamesRepository() extends Mock implements GamesRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class const _Harness() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final play = context.select((GameCubit cubit) => cubit.state.play);

    return switch (play) {
      Success(:final value) => GamePlayView(play: value),
      _ => const SizedBox.shrink(),
    };
  }
}

void main() {
  late GamesRepository repository;
  late ProfileRepository profileRepository;

  final created = DateTime.now().subtract(const Duration(hours: 1));

  const a = GameItem(slug: 'a', title: 'Pergunta A');
  const b = GameItem(slug: 'b', title: 'Pergunta B');
  const mission = GameItem(slug: 'm', title: 'Missão do encontro', body: 'Vejam fotos antigas.');
  const drink = GameItem(slug: 'h', title: 'Qual é a bebida favorita dele?', body: 'Café|Chá');

  GameSession session({
    GameKind game = GameKind.meOrYou,
    GameStatus status = GameStatus.active,
    List<String> slugs = const ['a', 'b'],
    DateTime? at,
  }) => GameSession(
    id: 's1',
    game: game,
    status: status,
    invitedBy: 'me',
    itemSlugs: slugs,
    createdAt: at ?? created,
  );

  GamePlay gamePlay({
    GameKind kind = GameKind.meOrYou,
    GameSession? sessionOverride,
    List<GameItem> items = const [a, b],
    Map<int, String> own = const {},
    Map<int, String> partner = const {},
    List<GameItem> available = const [],
  }) => GamePlay(
    kind: kind,
    selfId: 'me',
    partnerName: 'Marina',
    session: sessionOverride ?? session(),
    items: items,
    own: own,
    partner: partner,
    available: available,
  );

  setUpAll(() {
    registerFallbackValue(GameKind.meOrYou);
    registerFallbackValue(session());
    LocaleSettings.setLocaleSync(AppLocale.pt);
  });

  setUp(() {
    repository = _MockGamesRepository();
    profileRepository = _MockProfileRepository();
    when(() => profileRepository.getMySettings())
        .thenAnswer((_) async => const AccountSettings(theme: AppThemeVariant.rose));
    when(() => repository.finishIfComplete(any())).thenAnswer((_) async => null);
    when(
      () => repository.answer(
        session: any(named: 'session'),
        step: any(named: 'step'),
        answer: any(named: 'answer'),
      ),
    ).thenAnswer((_) async {});
  });

  Future<GameCubit> loaded(GamePlay play) async {
    when(
      () => repository.getPlay(
        kind: any(named: 'kind'),
        locale: any(named: 'locale'),
        now: any(named: 'now'),
      ),
    ).thenAnswer((_) async => play);
    final cubit = GameCubit(repository: repository, profileRepository: profileRepository);
    addTearDown(cubit.close);
    await cubit.load(play.kind);

    return cubit;
  }

  Future<void> pumpPlay(WidgetTester tester, GameCubit cubit) async {
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const _Harness()));
    await tester.pump();
  }

  Future<void> settle(WidgetTester tester) async {
    await tester.pump();
    await tester.pump();
  }

  testWidgets('pick shows the prompt and both people as options', (tester) async {
    final cubit = await loaded(gamePlay());

    await pumpPlay(tester, cubit);

    expect(find.text('Pergunta 1 de 2'), findsOneWidget);
    expect(find.text('Pergunta A'), findsOneWidget);
    expect(find.text('Você'), findsOneWidget);
    expect(find.text('Marina'), findsOneWidget);

    await tester.tap(find.text('Marina'));
    await settle(tester);

    verify(
      () => repository.answer(
        session: any(named: 'session'),
        step: 0,
        answer: pickPartner,
      ),
    ).called(1);
    expect(find.text('Pergunta B'), findsOneWidget);
  });

  testWidgets('talk saves a written answer and advances', (tester) async {
    final cubit = await loaded(
      gamePlay(
        kind: GameKind.neverHaveWe,
        sessionOverride: session(game: GameKind.neverHaveWe),
      ),
    );

    await pumpPlay(tester, cubit);

    await tester.enterText(find.byType(BaseTextArea), 'nunca fomos');
    await tester.pump();
    await tester.tap(find.text('Enviar resposta'));
    await settle(tester);

    verify(
      () => repository.answer(
        session: any(named: 'session'),
        step: 0,
        answer: 'nunca fomos',
      ),
    ).called(1);
    expect(find.text('Pergunta B'), findsOneWidget);
  });

  testWidgets('talk can skip a question without an answer', (tester) async {
    final cubit = await loaded(
      gamePlay(
        kind: GameKind.neverHaveWe,
        sessionOverride: session(game: GameKind.neverHaveWe),
      ),
    );

    await pumpPlay(tester, cubit);

    await tester.tap(find.text('Pular esta'));
    await settle(tester);

    verify(
      () => repository.answer(
        session: any(named: 'session'),
        step: 0,
        answer: gameSkippedAnswer,
      ),
    ).called(1);
    expect(find.text('Pergunta B'), findsOneWidget);
  });

  testWidgets('guess answers about the person and then guesses the partner', (tester) async {
    final cubit = await loaded(
      gamePlay(
        kind: GameKind.howWell,
        sessionOverride: session(game: GameKind.howWell, slugs: const ['h', 'h']),
        items: const [drink, drink],
      ),
    );

    await pumpPlay(tester, cubit);

    expect(find.text('SOBRE VOCÊ'), findsOneWidget);
    expect(find.text('Café'), findsOneWidget);

    await tester.tap(find.text('Café'));
    await tester.pump();
    await tester.tap(find.text('Enviar resposta'));
    await settle(tester);

    verify(
      () => repository.answer(
        session: any(named: 'session'),
        step: 0,
        answer: 'Café',
      ),
    ).called(1);
    expect(find.text('SOBRE MARINA'), findsOneWidget);
    expect(find.text('O que Marina respondeu?'), findsOneWidget);

    await tester.tap(find.text('Chá'));
    await tester.pump();
    await tester.tap(find.text('Enviar resposta'));
    await settle(tester);

    verify(
      () => repository.answer(
        session: any(named: 'session'),
        step: 1,
        answer: 'Chá',
      ),
    ).called(1);
    expect(find.text('Você respondeu tudo'), findsOneWidget);
  });

  testWidgets('date starts the mission and saves the reflection', (tester) async {
    final cubit = await loaded(
      gamePlay(
        kind: GameKind.mission,
        sessionOverride: session(game: GameKind.mission, slugs: const ['m']),
        items: const [mission],
      ),
    );

    await pumpPlay(tester, cubit);

    expect(find.text('Missão do encontro'), findsOneWidget);
    expect(find.text('Começar o encontro'), findsOneWidget);

    await tester.tap(find.text('Começar o encontro'));
    await tester.pump();

    expect(find.text('Como foi?'), findsOneWidget);
    expect(find.text('Foi ótimo'), findsOneWidget);

    await tester.tap(find.text('Foi ótimo'));
    await tester.pump();
    await tester.tap(find.text('Enviar resposta'));
    await settle(tester);

    verify(
      () => repository.answer(
        session: any(named: 'session'),
        step: 0,
        answer: 'great',
      ),
    ).called(1);
    expect(find.text('Você respondeu tudo'), findsOneWidget);
    expect(find.text('Foi ótimo'), findsOneWidget);
  });

  testWidgets('waiting shows what was saved and checks again', (tester) async {
    final cubit = await loaded(
      gamePlay(
        kind: GameKind.neverHaveWe,
        sessionOverride: session(game: GameKind.neverHaveWe),
        own: const {0: 'nunca fomos', 1: gameSkippedAnswer},
      ),
    );

    await pumpPlay(tester, cubit);

    expect(find.text('Você respondeu tudo'), findsOneWidget);
    expect(find.text('nunca fomos'), findsOneWidget);
    expect(find.text('Ver de novo'), findsOneWidget);

    await tester.tap(find.text('Ver de novo'));
    await settle(tester);

    verify(
      () => repository.getPlay(
        kind: any(named: 'kind'),
        locale: any(named: 'locale'),
        now: any(named: 'now'),
      ),
    ).called(2);
  });

  testWidgets('finished pick reveals both choices without a cancel action', (tester) async {
    final cubit = await loaded(
      gamePlay(
        sessionOverride: session(status: GameStatus.finished, slugs: const ['a']),
        items: const [a],
        own: const {0: pickSelf},
        partner: const {0: pickPartner},
      ),
    );

    await pumpPlay(tester, cubit);

    expect(find.text('Que conversa boa'), findsOneWidget);
    expect(find.text('Pergunta A'), findsOneWidget);
    expect(find.text('VOCÊS COMBINARAM'), findsOneWidget);
    expect(find.text('Encerrar o jogo'), findsNothing);
    expect(
      find.textContaining(RegExp(r'\d+ (pontos|%)|ranking|sequência', caseSensitive: false)),
      findsNothing,
    );
  });

  testWidgets('finished guess reveals the answers and the matches warmly', (tester) async {
    final cubit = await loaded(
      gamePlay(
        kind: GameKind.howWell,
        sessionOverride: session(
          game: GameKind.howWell,
          status: GameStatus.finished,
          slugs: const ['h', 'h'],
        ),
        items: const [drink, drink],
        own: const {0: 'Café', 1: 'Café'},
        partner: const {0: 'Café', 1: 'Chá'},
      ),
    );

    await pumpPlay(tester, cubit);

    expect(find.text('ACERTOU'), findsOneWidget);
    expect(find.text('Café'), findsWidgets);
    expect(find.text('Chá'), findsOneWidget);
    expect(find.text('Encerrar o jogo'), findsNothing);
    expect(
      find.textContaining(RegExp(r'\d+ (pontos|%)|ranking|sequência', caseSensitive: false)),
      findsNothing,
    );
  });

  testWidgets('finished talk shows both answers side by side', (tester) async {
    final cubit = await loaded(
      gamePlay(
        kind: GameKind.neverHaveWe,
        sessionOverride: session(
          game: GameKind.neverHaveWe,
          status: GameStatus.finished,
          slugs: const ['a'],
        ),
        items: const [a],
        own: const {0: 'nunca fomos'},
        partner: const {0: 'já fomos'},
      ),
    );

    await pumpPlay(tester, cubit);

    expect(find.text('nunca fomos'), findsOneWidget);
    expect(find.text('já fomos'), findsOneWidget);
    expect(find.text('Encerrar o jogo'), findsNothing);
  });

  testWidgets('finished date shows both reflections', (tester) async {
    final cubit = await loaded(
      gamePlay(
        kind: GameKind.mission,
        sessionOverride: session(
          game: GameKind.mission,
          status: GameStatus.finished,
          slugs: const ['m'],
        ),
        items: const [mission],
        own: const {0: 'great'},
        partner: const {0: 'ok'},
      ),
    );

    await pumpPlay(tester, cubit);

    expect(find.text('Foi ótimo'), findsOneWidget);
    expect(find.text('Foi bom'), findsOneWidget);
    expect(find.text('Encerrar o jogo'), findsNothing);
  });

  testWidgets('a cancelled session explains itself on the start screen', (tester) async {
    final cubit = await loaded(
      gamePlay(
        sessionOverride: session(status: GameStatus.cancelled),
        available: const [a],
      ),
    );

    await pumpPlay(tester, cubit);

    expect(find.textContaining('O último convite foi cancelado'), findsOneWidget);
  });

  testWidgets('an expired invitation explains itself on the start screen', (tester) async {
    final cubit = await loaded(
      gamePlay(
        sessionOverride: session(
          status: GameStatus.invited,
          at: DateTime.now().subtract(const Duration(hours: 49)),
        ),
        available: const [a],
      ),
    );

    await pumpPlay(tester, cubit);

    expect(find.textContaining('O convite anterior expirou'), findsOneWidget);
  });
}
