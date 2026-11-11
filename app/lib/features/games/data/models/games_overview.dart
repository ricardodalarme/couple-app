import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';

/// Where one game stands for the couple, from the point of view of the person reading.
enum GameEntryState() {
  idle,
  waiting,
  invited,
  active,
  finished,
  cancelled,
  expired,
}

/// A game together with its latest session.
final class const GameEntry({
  required final GameKind kind,
  required final GameEntryState state,
  final GameSession? session,
}) with Equatable {
  @override
  List<Object?> get props => [kind, state, session];
}

/// The couple's games and sessions, without any answer.
final class const GamesOverview({
  required final String selfId,
  required final bool hasPartner,
  final String? partnerName,
  final List<GameSession> sessions = const [],
}) with Equatable {
  factory fake() => GamesOverview(
    selfId: 'fake',
    hasPartner: true,
    partnerName: 'Nome',
    sessions: [GameSession.fake()],
  );

  /// The newest session of [kind], or null when the couple never started it.
  GameSession? latestFor(GameKind kind) {
    GameSession? latest;
    for (final session in sessions) {
      if (session.game != kind) continue;
      if (latest == null || session.createdAt.isAfter(latest.createdAt)) latest = session;
    }

    return latest;
  }

  /// Every playable game with the state of its latest session at [now].
  List<GameEntry> entries(DateTime now) => [
    for (final kind in GameKind.values)
      if (kind.hasContent) _entry(kind, latestFor(kind), now),
  ];

  /// The invitation the partner sent that is still waiting for this person.
  GameEntry? pendingInvitation(DateTime now) {
    for (final entry in entries(now)) {
      if (entry.state == GameEntryState.invited) return entry;
    }

    return null;
  }

  GameEntry _entry(GameKind kind, GameSession? session, DateTime now) {
    final state = switch (session) {
      null => GameEntryState.idle,
      GameSession(status: GameStatus.cancelled) => GameEntryState.cancelled,
      GameSession(status: GameStatus.finished) => GameEntryState.finished,
      GameSession(status: GameStatus.active) => GameEntryState.active,
      _ when session.isExpired(now) => GameEntryState.expired,
      _ when session.isInvitedBy(selfId) => GameEntryState.waiting,
      _ => GameEntryState.invited,
    };

    return GameEntry(kind: kind, state: state, session: session);
  }

  @override
  List<Object?> get props => [selfId, hasPartner, partnerName, sessions];
}
