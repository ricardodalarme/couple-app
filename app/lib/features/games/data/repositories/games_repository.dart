import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/games_data_source.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_item.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_bloc_starter/features/games/data/models/games_overview.dart';
import 'package:logger/logger.dart';
import 'package:network/network.dart';

/// The code the server raises when finishing before both people answered every item.
const String gameNotCompleteCode = 'GAME_NOT_COMPLETE';

class GamesRepository({required final GamesDataSource _dataSource}) {
  final Logger _logger = Logger('GamesRepository');

  /// The couple's games with their latest sessions; no answers are read.
  Future<GamesOverview> getOverview() => _run('read the games', () async {
    final record = await _dataSource.getSessions();

    return _overview(record);
  });

  /// One game with its latest session, items and the answers the server lets this person see.
  ///
  /// When there is no session, the items a new one could start with are read instead. A
  /// cancelled or expired session is kept so the start screen can explain what happened. A
  /// game without published content comes back with no items.
  Future<GamePlay> getPlay({required GameKind kind, required String locale, DateTime? now}) =>
      _run('read a game', () async {
        final record = await _dataSource.getSessions();
        final overview = _overview(record);
        if (!record.hasCouple) {
          return GamePlay(kind: kind, selfId: record.selfId, hasPartner: false);
        }

        final session = overview.latestFor(kind);
        final isOpen = session != null && session.isOpen(now ?? clock.now());
        final isFinished = session?.status == GameStatus.finished;
        final available = isOpen ? const <GameItem>[] : await _available(kind, locale);
        if (session == null) {
          return GamePlay(
            kind: kind,
            selfId: record.selfId,
            partnerName: record.partnerName,
            available: available,
          );
        }
        if (!isOpen && !isFinished) {
          return GamePlay(
            kind: kind,
            selfId: record.selfId,
            partnerName: record.partnerName,
            session: session,
            available: available,
          );
        }

        final items = await _items(kind, locale, session.itemSlugs);
        final answers = session.status == GameStatus.invited
            ? const <GameAnswerRecord>[]
            : await _dataSource.getAnswers(session.id);

        return GamePlay(
          kind: kind,
          selfId: record.selfId,
          partnerName: record.partnerName,
          session: session,
          items: items,
          available: available,
          own: {
            for (final row in answers)
              if (row.authorId == record.selfId) row.idx: row.answer,
          },
          partner: {
            for (final row in answers)
              if (row.authorId != record.selfId) row.idx: row.answer,
          },
        );
      });

  /// Starts a session of [play]'s game with the first items the content offers.
  Future<GameSession> invite(GamePlay play) => _run('invite to a game', () async {
    final slugs = play.startSlugs();
    if (slugs.isEmpty) throw const NoDataException();
    final record = await _dataSource.invite(game: play.kind.key, itemSlugs: slugs);

    return _session(record)!;
  });

  Future<GameSession> join(GameSession session) => _update('join a game', session, 'join');

  Future<GameSession> cancel(GameSession session) => _update('cancel a game', session, 'cancel');

  /// Saves one answer; answering the same [step] again replaces it.
  Future<void> answer({required GameSession session, required int step, required String answer}) =>
      _run(
        'save a game answer',
        () => _dataSource.answer(sessionId: session.id, idx: step, answer: answer.trim()),
      );

  /// Finishes the session when both people answered every item, or returns null when the
  /// partner is still answering.
  Future<GameSession?> finishIfComplete(GameSession session) async {
    try {
      final record = await _dataSource.update(sessionId: session.id, action: 'finish');

      return _session(record);
    } on LocalizedException catch (exception) {
      if (exception.l10nKey == gameNotCompleteCode) return null;
      _logger.error('Failed to finish a game (${exception.l10nKey})');
      rethrow;
    }
  }

  Future<GameSession> _update(String what, GameSession session, String action) =>
      _run(what, () async {
        final record = await _dataSource.update(sessionId: session.id, action: action);

        return _session(record)!;
      });

  Future<List<GameItem>> _available(GameKind kind, String locale) async {
    final contentKind = kind.contentKind;
    if (contentKind == null) return const [];
    final records = await _dataSource.getItems(
      kind: contentKind,
      locale: locale,
      first: kind.itemCount,
    );

    return [for (final record in records) _item(record)];
  }

  Future<List<GameItem>> _items(GameKind kind, String locale, List<String> slugs) async {
    final contentKind = kind.contentKind;
    if (contentKind == null || slugs.isEmpty) return const [];
    final records = await _dataSource.getItemsBySlug(
      kind: contentKind,
      locale: locale,
      slugs: slugs.toSet().toList(),
    );
    final bySlug = {for (final record in records) record.slug: _item(record)};

    return [for (final slug in slugs) ?bySlug[slug]];
  }

  GamesOverview _overview(GameSessionsRecord record) => GamesOverview(
    selfId: record.selfId,
    hasPartner: record.hasCouple,
    partnerName: record.partnerName,
    sessions: [for (final session in record.sessions) ?_session(session)],
  );

  GameItem _item(GameItemRecord record) =>
      GameItem(slug: record.slug, title: record.title, body: record.body);

  /// Maps a session row, or null when the app has no screens for its game.
  GameSession? _session(GameSessionRecord record) {
    final game = GameKind.fromKey(record.game);
    if (game == null) return null;

    return GameSession(
      id: record.id,
      game: game,
      status: GameStatus.fromKey(record.status),
      invitedBy: record.invitedBy,
      itemSlugs: record.itemSlugs,
      createdAt: record.createdAt,
    );
  }

  Future<T> _run<T>(String what, Future<T> Function() action) async {
    try {
      return await action();
    } catch (exception) {
      final key = exception is LocalizedException
          ? exception.l10nKey
          : exception.runtimeType.toString();
      _logger.error('Failed to $what ($key)');
      rethrow;
    }
  }
}
