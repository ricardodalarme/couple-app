import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';

/// How long an invitation waits for the partner before it counts as expired.
const Duration gameInviteWindow = Duration(hours: 48);

/// The server lifecycle of a game session.
enum GameStatus() {
  invited,
  active,
  finished,
  cancelled,
}

/// One round of a game between the two partners.
final class const GameSession({
  required final String id,
  required final GameKind game,
  required final GameStatus status,
  required final String invitedBy,
  required final DateTime createdAt,
  final List<String> itemSlugs = const [],
}) with Equatable {
  factory fake() => GameSession(
    id: 'fake',
    game: GameKind.meOrYou,
    status: GameStatus.active,
    invitedBy: 'fake',
    createdAt: DateTime.utc(2026),
  );

  /// Whether the invitation waited longer than [gameInviteWindow] without an answer.
  bool isExpired(DateTime now) =>
      status == GameStatus.invited && now.difference(createdAt) > gameInviteWindow;

  /// Whether the session still blocks a new one for the same game.
  bool isOpen(DateTime now) =>
      status == GameStatus.active || (status == GameStatus.invited && !isExpired(now));

  /// Whether [personId] sent the invitation.
  bool isInvitedBy(String personId) => invitedBy == personId;

  @override
  List<Object?> get props => [id, game, status, invitedBy, createdAt, itemSlugs];
}
