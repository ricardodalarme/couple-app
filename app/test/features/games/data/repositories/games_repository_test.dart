import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/games_data_source.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_item.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_bloc_starter/features/games/data/repositories/games_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockGamesDataSource() extends Mock implements GamesDataSource;

void main() {
  setUpAll(() => registerFallbackValue(GameKind.meOrYou));

  late GamesDataSource dataSource;
  late GamesRepository repository;

  final created = DateTime.utc(2026, 11, 1, 10);
  final now = created.add(const Duration(hours: 1));

  GameSessionRecord record({
    String id = 's1',
    String game = 'me_or_you',
    String status = 'active',
    String invitedBy = 'me',
    List<String> slugs = const ['a', 'b'],
  }) => (
    id: id,
    game: game,
    status: status,
    invitedBy: invitedBy,
    itemSlugs: slugs,
    createdAt: created,
  );

  void stubSessions({bool hasCouple = true, List<GameSessionRecord> sessions = const []}) {
    when(() => dataSource.getSessions()).thenAnswer(
      (_) async => (selfId: 'me', hasCouple: hasCouple, partnerName: 'Marina', sessions: sessions),
    );
  }

  void stubItems(List<GameItemRecord> items) {
    when(
      () => dataSource.getItems(
        kind: any(named: 'kind'),
        locale: any(named: 'locale'),
        first: any(named: 'first'),
      ),
    ).thenAnswer((_) async => items);
    when(
      () => dataSource.getItemsBySlug(
        kind: any(named: 'kind'),
        locale: any(named: 'locale'),
        slugs: any(named: 'slugs'),
      ),
    ).thenAnswer((_) async => items);
  }

  setUp(() {
    dataSource = _MockGamesDataSource();
    repository = GamesRepository(dataSource: dataSource);
  });

  test('maps session rows and ignores games the app has no screens for', () async {
    stubSessions(
      sessions: [
        record(),
        record(id: 's2', game: 'compliments'),
      ],
    );

    final overview = await repository.getOverview();

    expect(overview.selfId, 'me');
    expect(overview.hasPartner, isTrue);
    expect(overview.partnerName, 'Marina');
    expect(overview.sessions.map((session) => session.id), ['s1']);
    expect(overview.sessions.single.game, GameKind.meOrYou);
    expect(overview.sessions.single.status, GameStatus.active);
  });

  test('a person without a couple gets no game content', () async {
    stubSessions(hasCouple: false);

    final play = await repository.getPlay(kind: GameKind.meOrYou, locale: 'pt-BR', now: now);

    expect(play.hasPartner, isFalse);
    expect(play.stage(now), GameStage.noPartner);
    verifyNever(
      () => dataSource.getItems(
        kind: any(named: 'kind'),
        locale: any(named: 'locale'),
        first: any(named: 'first'),
      ),
    );
  });

  test('a game with no published content comes back empty instead of invented', () async {
    stubSessions();
    stubItems(const []);

    final play = await repository.getPlay(kind: GameKind.meOrYou, locale: 'pt-BR', now: now);

    expect(play.available, isEmpty);
    expect(play.stage(now), GameStage.noContent);
  });

  test('a game with no content kind never asks the server for items', () async {
    stubSessions();

    final play = await repository.getPlay(kind: GameKind.twentyQuestions, locale: 'pt-BR');

    expect(play.available, isEmpty);
    expect(play.stage(now), GameStage.noContent);
    verifyNever(
      () => dataSource.getItems(
        kind: any(named: 'kind'),
        locale: any(named: 'locale'),
        first: any(named: 'first'),
      ),
    );
  });

  test('a new game offers the first items so an invitation can start', () async {
    stubSessions();
    stubItems(const [(slug: 'a', title: 'Quem é mais organizado?', body: null)]);

    final play = await repository.getPlay(kind: GameKind.meOrYou, locale: 'pt-BR', now: now);

    expect(play.available.map((item) => item.slug), ['a']);
    expect(play.stage(now), GameStage.start);
  });

  test('an open invitation does not read items twice or answers', () async {
    stubSessions(
      sessions: [record(status: 'invited', invitedBy: 'partner')],
    );
    stubItems(const [(slug: 'a', title: 'A?', body: null), (slug: 'b', title: 'B?', body: null)]);

    final play = await repository.getPlay(kind: GameKind.meOrYou, locale: 'pt-BR', now: now);

    expect(play.stage(now), GameStage.invitation);
    expect(play.available, isEmpty);
    verifyNever(() => dataSource.getAnswers(any()));
  });

  test('keeps a cancelled session so the start screen can explain it', () async {
    stubSessions(sessions: [record(status: 'cancelled')]);
    stubItems(const [(slug: 'a', title: 'A?', body: null)]);

    final play = await repository.getPlay(kind: GameKind.meOrYou, locale: 'pt-BR', now: now);

    expect(play.session?.status, GameStatus.cancelled);
    expect(play.stage(now), GameStage.start);
    expect(play.available.map((item) => item.slug), ['a']);
  });

  test('keeps an expired invitation so the start screen can explain it', () async {
    stubSessions(sessions: [record(status: 'invited')]);
    stubItems(const [(slug: 'a', title: 'A?', body: null)]);
    final later = created.add(const Duration(hours: 49));

    final play = await repository.getPlay(kind: GameKind.meOrYou, locale: 'pt-BR', now: later);

    expect(play.session?.isExpired(later), isTrue);
    expect(play.stage(later), GameStage.start);
    expect(play.available.map((item) => item.slug), ['a']);
  });

  test('splits the answers the server returns by author', () async {
    stubSessions(sessions: [record(status: 'finished')]);
    stubItems(const [(slug: 'a', title: 'A?', body: null), (slug: 'b', title: 'B?', body: null)]);
    when(() => dataSource.getAnswers('s1')).thenAnswer(
      (_) async => [
        (authorId: 'me', idx: 0, answer: pickSelf),
        (authorId: 'partner', idx: 0, answer: pickPartner),
      ],
    );

    final play = await repository.getPlay(kind: GameKind.meOrYou, locale: 'pt-BR', now: now);

    expect(play.own, {0: pickSelf});
    expect(play.partner, {0: pickPartner});
    expect(play.stage(now), GameStage.finished);
  });

  test('invites with the first items of the game', () async {
    when(
      () => dataSource.invite(
        game: any(named: 'game'),
        itemSlugs: any(named: 'itemSlugs'),
      ),
    ).thenAnswer((_) async => record(status: 'invited'));
    const play = GamePlay(
      kind: GameKind.meOrYou,
      selfId: 'me',
      available: [
        GameItem(slug: 'a', title: 'A?'),
        GameItem(slug: 'b', title: 'B?'),
      ],
    );

    final session = await repository.invite(play);

    expect(session.status, GameStatus.invited);
    verify(() => dataSource.invite(game: 'me_or_you', itemSlugs: ['a', 'b'])).called(1);
  });

  test('keeps the server code when another game is already open', () async {
    when(
      () => dataSource.invite(
        game: any(named: 'game'),
        itemSlugs: any(named: 'itemSlugs'),
      ),
    ).thenThrow(ServerResponseException('GAME_ALREADY_OPEN', Exception('open')));
    const play = GamePlay(
      kind: GameKind.meOrYou,
      selfId: 'me',
      available: [GameItem(slug: 'a', title: 'A?')],
    );

    await expectLater(
      repository.invite(play),
      throwsA(
        isA<ServerResponseException>().having(
          (exception) => exception.l10nKey,
          'l10nKey',
          'GAME_ALREADY_OPEN',
        ),
      ),
    );
  });

  test('refuses to invite when there is nothing to play', () async {
    const play = GamePlay(kind: GameKind.meOrYou, selfId: 'me');

    await expectLater(repository.invite(play), throwsA(isA<NoDataException>()));
    verifyNever(
      () => dataSource.invite(
        game: any(named: 'game'),
        itemSlugs: any(named: 'itemSlugs'),
      ),
    );
  });

  test('joins and cancels with the server actions', () async {
    when(
      () => dataSource.update(
        sessionId: any(named: 'sessionId'),
        action: any(named: 'action'),
        outcome: any(named: 'outcome'),
      ),
    ).thenAnswer((invocation) async {
      final action = invocation.namedArguments[#action] as String;

      return record(status: action == 'join' ? 'active' : 'cancelled');
    });
    final session = GameSession(
      id: 's1',
      game: GameKind.meOrYou,
      status: GameStatus.invited,
      invitedBy: 'partner',
      createdAt: created,
    );

    expect((await repository.join(session)).status, GameStatus.active);
    expect((await repository.cancel(session)).status, GameStatus.cancelled);
    verify(() => dataSource.update(sessionId: 's1', action: 'join')).called(1);
    verify(() => dataSource.update(sessionId: 's1', action: 'cancel')).called(1);
  });

  test('finishing returns null while the partner is still answering', () async {
    when(
      () => dataSource.update(
        sessionId: any(named: 'sessionId'),
        action: any(named: 'action'),
        outcome: any(named: 'outcome'),
      ),
    ).thenThrow(ServerResponseException(gameNotCompleteCode, Exception('incomplete')));
    final session = GameSession(
      id: 's1',
      game: GameKind.meOrYou,
      status: GameStatus.active,
      invitedBy: 'me',
      createdAt: created,
    );

    expect(await repository.finishIfComplete(session), isNull);
  });

  test('finishing rethrows any other failure', () async {
    when(
      () => dataSource.update(
        sessionId: any(named: 'sessionId'),
        action: any(named: 'action'),
        outcome: any(named: 'outcome'),
      ),
    ).thenThrow(ServerResponseException('NOT_FOUND', Exception('gone')));
    final session = GameSession(
      id: 's1',
      game: GameKind.meOrYou,
      status: GameStatus.active,
      invitedBy: 'me',
      createdAt: created,
    );

    await expectLater(
      repository.finishIfComplete(session),
      throwsA(isA<ServerResponseException>()),
    );
  });

  test('saves a trimmed answer at the step index', () async {
    when(
      () => dataSource.answer(
        sessionId: any(named: 'sessionId'),
        idx: any(named: 'idx'),
        answer: any(named: 'answer'),
      ),
    ).thenAnswer((_) async {});
    final session = GameSession(
      id: 's1',
      game: GameKind.meOrYou,
      status: GameStatus.active,
      invitedBy: 'me',
      createdAt: created,
    );

    await repository.answer(session: session, step: 2, answer: '  oi  ');

    verify(() => dataSource.answer(sessionId: 's1', idx: 2, answer: 'oi')).called(1);
  });
}
