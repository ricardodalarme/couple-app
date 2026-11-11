import 'package:flutter_bloc_starter/features/games/data/models/game_item.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final created = DateTime.utc(2026, 11, 1, 10);
  final now = created.add(const Duration(hours: 1));

  const a = GameItem(slug: 'a', title: 'A?');
  const b = GameItem(slug: 'b', title: 'B?');
  const c = GameItem(slug: 'c', title: 'C?');
  const items = [a, b];
  const guessItems = [a, b, a, b];

  GameSession session({
    GameKind game = GameKind.meOrYou,
    GameStatus status = GameStatus.active,
    String invitedBy = 'me',
    List<String> slugs = const ['a', 'b'],
    DateTime? at,
  }) => GameSession(
    id: 's1',
    game: game,
    status: status,
    invitedBy: invitedBy,
    itemSlugs: slugs,
    createdAt: at ?? created,
  );

  test('finds the first unanswered step and stops at the end', () {
    final play = GamePlay(
      kind: GameKind.meOrYou,
      selfId: 'me',
      session: session(slugs: const ['a', 'b', 'c']),
      items: const [a, b, c],
      own: const {0: 'x'},
    );

    expect(play.totalSteps, 3);
    expect(play.currentStep, 1);
    expect(play.isOwnDone, isFalse);
    expect(play.stepItem, b);

    final done = play.withOwnAnswer(1, 'y').withOwnAnswer(2, 'z');

    expect(done.currentStep, 3);
    expect(done.isOwnDone, isTrue);
    expect(done.stepItem, isNull);
  });

  test('a game with no session has no steps', () {
    const play = GamePlay(kind: GameKind.meOrYou, selfId: 'me');

    expect(play.totalSteps, 0);
    expect(play.currentStep, 0);
    expect(play.isOwnDone, isFalse);
    expect(play.stepItem, isNull);
  });

  test('the guess flow switches from answering to guessing at the halfway point', () {
    final answering = GamePlay(
      kind: GameKind.howWell,
      selfId: 'me',
      session: session(game: GameKind.howWell, slugs: const ['a', 'b', 'a', 'b']),
      items: guessItems,
      own: const {0: 'x'},
    );

    expect(answering.stepPhase, GamePhase.answer);

    final guessing = answering.withOwnAnswer(1, 'y');

    expect(guessing.currentStep, 2);
    expect(guessing.stepPhase, GamePhase.guess);
  });

  test('maps both picks from the reader point of view', () {
    const play = GamePlay(
      kind: GameKind.meOrYou,
      selfId: 'me',
      items: items,
      own: {0: pickSelf, 1: pickPartner},
      partner: {0: pickSelf, 1: pickPartner},
    );
    final results = play.pickResults;

    expect(results, hasLength(2));
    expect(results[0].mine, GamePerson.self);
    expect(results[0].theirs, GamePerson.partner);
    expect(results[0].agree, isFalse);
    expect(results[1].mine, GamePerson.partner);
    expect(results[1].theirs, GamePerson.self);
    expect(results[1].agree, isFalse);
  });

  test('a pick agrees when both people point at the same person', () {
    const play = GamePlay(
      kind: GameKind.meOrYou,
      selfId: 'me',
      items: [a],
      own: {0: pickSelf},
      partner: {0: pickPartner},
    );

    expect(play.pickResults.single.agree, isTrue);
    expect(play.pickResults.single.theirs, GamePerson.self);
  });

  test('maps a both pick and a skipped pick', () {
    const play = GamePlay(
      kind: GameKind.meOrYou,
      selfId: 'me',
      items: items,
      own: {0: gameSkippedAnswer},
      partner: {0: pickBoth},
    );

    expect(play.pickResults[0].mine, isNull);
    expect(play.pickResults[0].theirs, GamePerson.both);
  });

  test('combines each answer with both guesses and their matches', () {
    const play = GamePlay(
      kind: GameKind.howWell,
      selfId: 'me',
      items: guessItems,
      own: {0: 'Café', 1: 'Chá', 2: 'Café', 3: 'Suco'},
      partner: {0: 'Café', 1: 'Chá', 2: 'Café', 3: 'Chá'},
    );
    final results = play.guessResults;

    expect(results, hasLength(2));
    expect(results[0].ownAnswer, 'Café');
    expect(results[0].partnerAnswer, 'Café');
    expect(results[0].ownGuess, 'Café');
    expect(results[0].partnerGuess, 'Café');
    expect(results[0].ownGuessMatched, isTrue);
    expect(results[0].partnerGuessMatched, isTrue);
    expect(results[1].ownGuessMatched, isFalse);
    expect(results[1].partnerGuessMatched, isTrue);
  });

  test('a guess match ignores case and surrounding spaces', () {
    const play = GamePlay(
      kind: GameKind.howWell,
      selfId: 'me',
      items: guessItems,
      own: {0: 'Café', 2: '  café '},
      partner: {0: 'Café'},
    );

    expect(play.guessResults.first.ownGuessMatched, isTrue);
  });

  test('keeps both talk answers separate and treats a skip as missing', () {
    const play = GamePlay(
      kind: GameKind.neverHaveWe,
      selfId: 'me',
      items: items,
      own: {0: 'sim', 1: gameSkippedAnswer},
      partner: {1: 'não'},
    );
    final results = play.talkResults;

    expect(results[0].mine, 'sim');
    expect(results[0].theirs, isNull);
    expect(results[1].mine, isNull);
    expect(results[1].theirs, 'não');
  });

  test('reads both date reflections and treats a skip as missing', () {
    const play = GamePlay(
      kind: GameKind.mission,
      selfId: 'me',
      items: [a],
      own: {0: 'great'},
      partner: {0: 'ok'},
    );

    expect(dateReflections, ['great', 'ok', 'did_not_happen']);
    expect(play.ownReflection, 'great');
    expect(play.partnerReflection, 'ok');
    expect(play.withOwnAnswer(0, gameSkippedAnswer).ownReflection, isNull);
  });

  test('starts a session with the first available items, twice for guesses', () {
    const available = [a, b, c];

    expect(
      const GamePlay(kind: GameKind.meOrYou, selfId: 'me', available: available).startSlugs(),
      ['a', 'b', 'c'],
    );
    expect(const GamePlay(kind: GameKind.howWell, selfId: 'me', available: [a, b]).startSlugs(), [
      'a',
      'b',
      'a',
      'b',
    ]);
    expect(const GamePlay(kind: GameKind.meOrYou, selfId: 'me').startSlugs(), isEmpty);
  });

  test('maps every stage of a session', () {
    expect(
      const GamePlay(kind: GameKind.meOrYou, selfId: 'me', hasPartner: false).stage(now),
      GameStage.noPartner,
    );
    expect(const GamePlay(kind: GameKind.meOrYou, selfId: 'me').stage(now), GameStage.noContent);
    expect(
      const GamePlay(kind: GameKind.meOrYou, selfId: 'me', available: [a]).stage(now),
      GameStage.start,
    );
    expect(
      GamePlay(
        kind: GameKind.meOrYou,
        selfId: 'me',
        session: session(status: GameStatus.invited),
        items: items,
      ).stage(now),
      GameStage.waiting,
    );
    expect(
      GamePlay(
        kind: GameKind.meOrYou,
        selfId: 'me',
        session: session(status: GameStatus.invited, invitedBy: 'partner'),
        items: items,
      ).stage(now),
      GameStage.invitation,
    );
    expect(
      GamePlay(kind: GameKind.meOrYou, selfId: 'me', session: session(), items: items).stage(now),
      GameStage.playing,
    );
    expect(
      GamePlay(
        kind: GameKind.meOrYou,
        selfId: 'me',
        session: session(),
        items: const [a],
      ).stage(now),
      GameStage.contentMissing,
    );
    expect(
      GamePlay(
        kind: GameKind.meOrYou,
        selfId: 'me',
        session: session(),
        items: items,
        own: const {0: 'x', 1: 'y'},
      ).stage(now),
      GameStage.waitingForPartner,
    );
    expect(
      GamePlay(
        kind: GameKind.meOrYou,
        selfId: 'me',
        session: session(status: GameStatus.finished),
        items: items,
      ).stage(now),
      GameStage.finished,
    );
    expect(
      GamePlay(
        kind: GameKind.meOrYou,
        selfId: 'me',
        session: session(status: GameStatus.cancelled),
        available: const [a],
      ).stage(now),
      GameStage.start,
    );
    expect(
      GamePlay(
        kind: GameKind.meOrYou,
        selfId: 'me',
        session: session(status: GameStatus.invited, at: now.subtract(const Duration(hours: 49))),
        available: const [a],
      ).stage(now),
      GameStage.start,
    );
  });
}
