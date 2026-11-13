import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/fragments/generated/GameSessionFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/mutations/generated/AnswerGame.graphql.dart';
import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/mutations/generated/InviteToGame.graphql.dart';
import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/mutations/generated/UpdateGame.graphql.dart';
import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/queries/generated/GameAnswers.graphql.dart';
import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/queries/generated/GameItems.graphql.dart';
import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/queries/generated/GameItemsBySlug.graphql.dart';
import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/queries/generated/GameSessions.graphql.dart';
import 'package:network/network.dart';

typedef GameSessionRecord = ({
  String id,
  String game,
  String status,
  String invitedBy,
  List<String> itemSlugs,
  DateTime createdAt,
});

/// The person, the partner and the latest sessions of the couple.
typedef GameSessionsRecord = ({
  String selfId,
  bool hasCouple,
  String? partnerName,
  List<GameSessionRecord> sessions,
});

typedef GameItemRecord = ({String slug, String title, String? body});

typedef GameAnswerRecord = ({String authorId, int idx, String answer});

class GamesDataSource({required final GQLClient _client}) {
  Future<GameSessionsRecord> getSessions() async {
    final response = await _client.query(
      OptionsQueryGameSessions(fetchPolicy: FetchPolicy.networkOnly),
    );
    final data = validateResponseData<QueryGameSessions, QueryGameSessions>(response);
    final selfId = data.myProfile?.id;
    if (selfId == null) throw const NoDataException();

    return (
      selfId: selfId,
      hasCouple: data.myCouple != null,
      partnerName: data.today?.partnerName,
      sessions: [for (final edge in data.gameSessionsCollection.edges) _session(edge.node)],
    );
  }

  /// The published items of a content [kind] for [locale], in editorial order.
  Future<List<GameItemRecord>> getItems({
    required String kind,
    required String locale,
    required int first,
  }) async {
    final response = await _client.query(
      OptionsQueryGameItems(
        variables: VariablesQueryGameItems(kind: kind, locale: locale, first: first),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.contentItemsCollection.edges,
    );

    return [
      for (final edge in edges)
        (slug: edge.node.slug, title: edge.node.title, body: edge.node.body),
    ];
  }

  Future<List<GameItemRecord>> getItemsBySlug({
    required String kind,
    required String locale,
    required List<String> slugs,
  }) async {
    final response = await _client.query(
      OptionsQueryGameItemsBySlug(
        variables: VariablesQueryGameItemsBySlug(kind: kind, locale: locale, slugs: slugs),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.contentItemsCollection.edges,
    );

    return [
      for (final edge in edges)
        (slug: edge.node.slug, title: edge.node.title, body: edge.node.body),
    ];
  }

  /// The answer rows the server lets this person read.
  Future<List<GameAnswerRecord>> getAnswers(String sessionId) async {
    final response = await _client.query(
      OptionsQueryGameAnswers(
        variables: VariablesQueryGameAnswers(sessionId: sessionId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.gameAnswersCollection.edges,
    );

    return [
      for (final edge in edges)
        (authorId: edge.node.authorId, idx: edge.node.idx, answer: edge.node.answer),
    ];
  }

  Future<GameSessionRecord> invite({required String game, required List<String> itemSlugs}) async {
    final response = await _client.mutate(
      OptionsMutationInviteToGame(
        variables: VariablesMutationInviteToGame(game: game, itemSlugs: itemSlugs),
      ),
    );
    final node = validateResponseData(response, getData: (data) => data.inviteToGame);

    return _session(node);
  }

  /// Joins, cancels or finishes a session with a server [action].
  Future<GameSessionRecord> update({
    required String sessionId,
    required String action,
    String? outcome,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateGame(
        variables: VariablesMutationUpdateGame(
          sessionId: sessionId,
          action: action,
          outcome: outcome,
        ),
      ),
    );
    final node = validateResponseData(response, getData: (data) => data.updateGame);

    return _session(node);
  }

  Future<void> answer({required String sessionId, required int idx, required String answer}) async {
    final response = await _client.mutate(
      OptionsMutationAnswerGame(
        variables: VariablesMutationAnswerGame(sessionId: sessionId, idx: idx, answer: answer),
      ),
    );

    validateResponse(response);
  }

  GameSessionRecord _session(FragmentGameSessionFragment node) => (
    id: node.id,
    game: node.game,
    status: node.status,
    invitedBy: node.invitedBy,
    itemSlugs: node.itemSlugs.whereType<String>().toList(),
    createdAt: node.createdAt,
  );
}
