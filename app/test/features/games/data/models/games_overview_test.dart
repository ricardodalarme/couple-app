import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_bloc_starter/features/games/data/models/games_overview.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime.utc(2026, 11, 2, 12);

  GameSession session(
    String id,
    GameKind game,
    GameStatus status, {
    String invitedBy = 'me',
    Duration age = const Duration(hours: 1),
  }) => GameSession(
    id: id,
    game: game,
    status: status,
    invitedBy: invitedBy,
    createdAt: now.subtract(age),
  );

  GameEntryState stateOf(GamesOverview overview, GameKind kind) =>
      overview.entries(now).firstWhere((entry) => entry.kind == kind).state;

  test('lists every playable game, idle when it was never started', () {
    const overview = GamesOverview(selfId: 'me', hasPartner: true);
    final playable = GameKind.values.where((kind) => kind.hasContent);

    expect(overview.entries(now).map((entry) => entry.kind), playable);
    expect(overview.entries(now).every((entry) => entry.state == GameEntryState.idle), isTrue);
  });

  test('hides a game with no content kind from the hub', () {
    const overview = GamesOverview(selfId: 'me', hasPartner: true);

    expect(overview.entries(now).any((entry) => entry.kind == GameKind.twentyQuestions), isFalse);
  });

  test('maps each session status to what the person reads', () {
    final overview = GamesOverview(
      selfId: 'me',
      hasPartner: true,
      sessions: [
        session('1', GameKind.meOrYou, GameStatus.invited),
        session('2', GameKind.howWell, GameStatus.invited, invitedBy: 'partner'),
        session('3', GameKind.twentyQuestions, GameStatus.active),
        session('4', GameKind.neverHaveWe, GameStatus.finished),
        session('5', GameKind.mission, GameStatus.cancelled),
      ],
    );

    expect(stateOf(overview, GameKind.meOrYou), GameEntryState.waiting);
    expect(stateOf(overview, GameKind.howWell), GameEntryState.invited);
    expect(stateOf(overview, GameKind.neverHaveWe), GameEntryState.finished);
    expect(stateOf(overview, GameKind.mission), GameEntryState.cancelled);
    expect(overview.entries(now).any((entry) => entry.kind == GameKind.twentyQuestions), isFalse);
  });

  test('an invitation older than 48 hours reads as expired', () {
    final overview = GamesOverview(
      selfId: 'me',
      hasPartner: true,
      sessions: [
        session('1', GameKind.meOrYou, GameStatus.invited, age: const Duration(hours: 49)),
      ],
    );

    expect(stateOf(overview, GameKind.meOrYou), GameEntryState.expired);
  });

  test('only the newest session of a game decides its state', () {
    final overview = GamesOverview(
      selfId: 'me',
      hasPartner: true,
      sessions: [
        session('old', GameKind.meOrYou, GameStatus.finished, age: const Duration(days: 3)),
        session('new', GameKind.meOrYou, GameStatus.active),
      ],
    );

    expect(overview.latestFor(GameKind.meOrYou)?.id, 'new');
    expect(stateOf(overview, GameKind.meOrYou), GameEntryState.active);
  });

  test('surfaces the partner invitation that is still waiting', () {
    final overview = GamesOverview(
      selfId: 'me',
      hasPartner: true,
      sessions: [session('1', GameKind.howWell, GameStatus.invited, invitedBy: 'partner')],
    );

    expect(overview.pendingInvitation(now)?.kind, GameKind.howWell);
    expect(const GamesOverview(selfId: 'me', hasPartner: true).pendingInvitation(now), isNull);
  });
}
