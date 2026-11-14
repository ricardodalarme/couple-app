import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/games/data/mappers/game_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final created = DateTime.utc(2026, 11, 1, 10);

  GameSession session({GameStatus status = GameStatus.invited, String invitedBy = 'me'}) =>
      GameSession(
        id: 's1',
        game: GameKind.meOrYou,
        status: status,
        invitedBy: invitedBy,
        createdAt: created,
      );

  test('maps every server status and treats unknown values as cancelled', () {
    expect(EnumGameStatus.invited.toModel(), GameStatus.invited);
    expect(EnumGameStatus.active.toModel(), GameStatus.active);
    expect(EnumGameStatus.finished.toModel(), GameStatus.finished);
    expect(EnumGameStatus.cancelled.toModel(), GameStatus.cancelled);
    expect(EnumGameStatus.$unknown.toModel(), GameStatus.cancelled);
  });

  test('maps server game keys and ignores games the app has no screens for', () {
    expect(GameKind.fromKey('me_or_you'), GameKind.meOrYou);
    expect(GameKind.fromKey('how_well'), GameKind.howWell);
    expect(GameKind.fromKey('twenty_questions'), GameKind.twentyQuestions);
    expect(GameKind.fromKey('never_have_we'), GameKind.neverHaveWe);
    expect(GameKind.fromKey('mission'), GameKind.mission);
    expect(GameKind.fromKey('compliments'), isNull);
  });

  test('an invitation waits for 48 hours and then expires', () {
    final invited = session();

    expect(invited.isExpired(created.add(const Duration(hours: 47, minutes: 59))), isFalse);
    expect(invited.isExpired(created.add(const Duration(hours: 48, minutes: 1))), isTrue);
  });

  test('an expired invitation no longer blocks a new session', () {
    final invited = session();

    expect(invited.isOpen(created.add(const Duration(hours: 1))), isTrue);
    expect(invited.isOpen(created.add(const Duration(hours: 49))), isFalse);
  });

  test('active sessions stay open and ended sessions do not', () {
    final later = created.add(const Duration(days: 10));

    expect(session(status: GameStatus.active).isOpen(later), isTrue);
    expect(session(status: GameStatus.finished).isOpen(later), isFalse);
    expect(session(status: GameStatus.cancelled).isOpen(later), isFalse);
  });

  test('knows who sent the invitation', () {
    expect(session().isInvitedBy('me'), isTrue);
    expect(session().isInvitedBy('partner'), isFalse);
  });
}
