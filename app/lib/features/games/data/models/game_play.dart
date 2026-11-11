import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_item.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';

/// The stored answer for a question the person chose to skip.
const String gameSkippedAnswer = '__skipped__';

/// The longest answer the server accepts.
const int gameAnswerMaxLength = 500;

/// The stored picks of a [GameFlow.pick] game, relative to the person who answered.
const String pickSelf = 'me';
const String pickPartner = 'partner';
const String pickBoth = 'both';

/// The stored reflections of a [GameFlow.date] game.
const List<String> dateReflections = ['great', 'ok', 'did_not_happen'];

/// Who a pick points at, from the point of view of the person reading.
enum GamePerson() {
  self,
  partner,
  both,
}

/// What the screen shows for a game right now.
enum GameStage() {
  noPartner,
  noContent,
  start,
  waiting,
  invitation,
  playing,
  waitingForPartner,
  finished,
  contentMissing,
}

/// Whether a step asks about the person or asks for a guess about the partner.
enum GamePhase() {
  answer,
  guess,
}

/// One [GameFlow.pick] question with what each person picked.
final class const GamePickResult({
  required final GameItem item,
  final GamePerson? mine,
  final GamePerson? theirs,
}) with Equatable {
  bool get agree => mine != null && mine == theirs;

  @override
  List<Object?> get props => [item, mine, theirs];
}

/// One [GameFlow.guess] question with both answers and both guesses.
final class const GameGuessResult({
  required final GameItem item,
  final String? ownAnswer,
  final String? partnerAnswer,
  final String? ownGuess,
  final String? partnerGuess,
}) with Equatable {
  /// Whether this person guessed what the partner answered.
  bool get ownGuessMatched => _same(ownGuess, partnerAnswer);

  /// Whether the partner guessed what this person answered.
  bool get partnerGuessMatched => _same(partnerGuess, ownAnswer);

  static bool _same(String? a, String? b) =>
      a != null && b != null && a.trim().toLowerCase() == b.trim().toLowerCase();

  @override
  List<Object?> get props => [item, ownAnswer, partnerAnswer, ownGuess, partnerGuess];
}

/// One [GameFlow.talk] question with both open answers.
final class const GameTalkResult({
  required final GameItem item,
  final String? mine,
  final String? theirs,
}) with Equatable {
  @override
  List<Object?> get props => [item, mine, theirs];
}

/// A game as one person sees it: the session, its items and the answers the server allows.
///
/// The partner's answers are empty until the session is finished, which the server only
/// allows once both people answered every item.
final class const GamePlay({
  required final GameKind kind,
  required final String selfId,
  final bool hasPartner = true,
  final String? partnerName,
  final GameSession? session,
  final List<GameItem> items = const [],
  final List<GameItem> available = const [],
  final Map<int, String> own = const {},
  final Map<int, String> partner = const {},
}) with Equatable {
  factory fake() => const GamePlay(
    kind: GameKind.meOrYou,
    selfId: 'fake',
    partnerName: 'Nome',
    available: [GameItem(slug: 'fake', title: 'Quem é mais organizado?')],
  );

  /// The questions in this session, one per entry of the session's slugs.
  int get totalSteps => session?.itemSlugs.length ?? 0;

  /// The first step this person has not answered, or [totalSteps] when all are answered.
  int get currentStep {
    for (var step = 0; step < totalSteps; step++) {
      if (!own.containsKey(step)) return step;
    }

    return totalSteps;
  }

  /// Whether this person answered or skipped every step.
  bool get isOwnDone => totalSteps > 0 && currentStep >= totalSteps;

  /// Whether the session has every item the slugs name.
  bool get hasAllItems => totalSteps > 0 && items.length == totalSteps;

  /// The item of the step being answered.
  GameItem? get stepItem => currentStep < items.length ? items[currentStep] : null;

  GamePhase get stepPhase => switch (kind.flow) {
    GameFlow.guess when currentStep >= totalSteps ~/ 2 => GamePhase.guess,
    _ => GamePhase.answer,
  };

  /// How many distinct questions the session asks.
  int get questionCount => kind.asksTwice ? totalSteps ~/ 2 : totalSteps;

  GameStage stage(DateTime now) {
    if (!hasPartner) return GameStage.noPartner;
    final current = session;
    if (current == null || current.status == GameStatus.cancelled || current.isExpired(now)) {
      return available.isEmpty ? GameStage.noContent : GameStage.start;
    }

    return switch (current.status) {
      GameStatus.invited when current.isInvitedBy(selfId) => GameStage.waiting,
      GameStatus.invited => GameStage.invitation,
      GameStatus.active when !hasAllItems => GameStage.contentMissing,
      GameStatus.active when isOwnDone => GameStage.waitingForPartner,
      GameStatus.active => GameStage.playing,
      _ => GameStage.finished,
    };
  }

  /// The slugs of the items a new session starts with, in the order they are asked.
  List<String> startSlugs() {
    final picked = [for (final item in available.take(kind.itemCount)) item.slug];

    return kind.asksTwice ? [...picked, ...picked] : picked;
  }

  GamePlay withOwnAnswer(int step, String answer) => GamePlay(
    kind: kind,
    selfId: selfId,
    hasPartner: hasPartner,
    partnerName: partnerName,
    session: session,
    items: items,
    available: available,
    own: {...own, step: answer},
    partner: partner,
  );

  GamePlay withSession(GameSession next) => GamePlay(
    kind: kind,
    selfId: selfId,
    hasPartner: hasPartner,
    partnerName: partnerName,
    session: next,
    items: items,
    available: available,
    own: own,
    partner: partner,
  );

  /// The answer at [step], or null when it is missing or was skipped.
  static String? _read(Map<int, String> answers, int step) {
    final answer = answers[step];

    return answer == null || answer == gameSkippedAnswer ? null : answer;
  }

  static GamePerson? _person(String? pick, {required bool byself}) => switch (pick) {
    pickSelf => byself ? GamePerson.self : GamePerson.partner,
    pickPartner => byself ? GamePerson.partner : GamePerson.self,
    pickBoth => GamePerson.both,
    _ => null,
  };

  List<GamePickResult> get pickResults => [
    for (var step = 0; step < items.length; step++)
      GamePickResult(
        item: items[step],
        mine: _person(_read(own, step), byself: true),
        theirs: _person(_read(partner, step), byself: false),
      ),
  ];

  List<GameGuessResult> get guessResults {
    final half = items.length ~/ 2;

    return [
      for (var step = 0; step < half; step++)
        GameGuessResult(
          item: items[step],
          ownAnswer: _read(own, step),
          partnerAnswer: _read(partner, step),
          ownGuess: _read(own, half + step),
          partnerGuess: _read(partner, half + step),
        ),
    ];
  }

  List<GameTalkResult> get talkResults => [
    for (var step = 0; step < items.length; step++)
      GameTalkResult(item: items[step], mine: _read(own, step), theirs: _read(partner, step)),
  ];

  /// This person's reflection on the date, or null when skipped.
  String? get ownReflection => _read(own, 0);

  /// The partner's reflection on the date, or null when skipped or not yet visible.
  String? get partnerReflection => _read(partner, 0);

  @override
  List<Object?> get props => [
    kind,
    selfId,
    hasPartner,
    partnerName,
    session,
    items,
    available,
    own,
    partner,
  ];
}
