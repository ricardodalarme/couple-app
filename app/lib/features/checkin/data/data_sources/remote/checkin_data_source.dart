import 'package:flutter_bloc_starter/features/checkin/data/data_sources/remote/mutations/generated/DeleteCheckinAnswer.graphql.dart';
import 'package:flutter_bloc_starter/features/checkin/data/data_sources/remote/mutations/generated/InsertCheckinAnswer.graphql.dart';
import 'package:flutter_bloc_starter/features/checkin/data/data_sources/remote/mutations/generated/UpdateCheckinAnswer.graphql.dart';
import 'package:flutter_bloc_starter/features/checkin/data/data_sources/remote/queries/generated/CheckinAnswers.graphql.dart';
import 'package:flutter_bloc_starter/features/checkin/data/data_sources/remote/queries/generated/CheckinToday.graphql.dart';
import 'package:network/network.dart';

typedef CheckinAnswerRecord = ({String id, bool isMine, int question, String body});

typedef CheckinAnswerWriteRecord = ({String id, int question, String body});

/// The server's local day, the person's couple and the partner's display name.
typedef CheckinTodayRecord = ({
  DateTime localDate,
  String? partnerName,
  String? coupleId,
  bool isPaired,
});

class CheckinDataSource({required final GQLClient _client}) {
  Future<CheckinTodayRecord> getToday() async {
    final response = await _client.query(
      OptionsQueryCheckinToday(fetchPolicy: FetchPolicy.networkOnly),
    );
    final data = validateResponseData<QueryCheckinToday, QueryCheckinToday>(response);
    final localDate = data.today?.localDate;
    if (localDate == null || data.myProfile == null) throw const NoDataException();

    return (
      localDate: localDate,
      partnerName: data.today?.partnerName,
      coupleId: data.myCouple?.id,
      isPaired: data.today?.isPaired ?? false,
    );
  }

  Future<List<CheckinAnswerRecord>> getAnswers({
    required DateTime weekStart,
    required String coupleId,
  }) async {
    final response = await _client.query(
      OptionsQueryCheckinAnswers(
        variables: VariablesQueryCheckinAnswers(weekStart: weekStart, coupleId: coupleId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.checkinAnswersCollection.edges,
    );

    return [
      for (final edge in edges)
        (
          id: edge.node.id,
          isMine: edge.node.isMine ?? false,
          question: edge.node.question,
          body: edge.node.body,
        ),
    ];
  }

  Future<CheckinAnswerWriteRecord> saveAnswer({
    required String? id,
    required String coupleId,
    required DateTime weekStart,
    required int question,
    required String body,
  }) {
    if (id == null) {
      return _insert(coupleId: coupleId, weekStart: weekStart, question: question, body: body);
    }

    return _update(id: id, body: body);
  }

  Future<CheckinAnswerWriteRecord> _insert({
    required String coupleId,
    required DateTime weekStart,
    required int question,
    required String body,
  }) async {
    final response = await _client.mutate(
      OptionsMutationInsertCheckinAnswer(
        variables: VariablesMutationInsertCheckinAnswer(
          coupleId: coupleId,
          weekStart: weekStart,
          question: question,
          body: body,
        ),
      ),
    );
    final node = validateResponseData(
      response,
      getData: (data) => data.insertIntoCheckinAnswersCollection?.records.firstOrNull,
    );

    return (id: node.id, question: node.question, body: node.body);
  }

  Future<CheckinAnswerWriteRecord> _update({required String id, required String body}) async {
    final response = await _client.mutate(
      OptionsMutationUpdateCheckinAnswer(
        variables: VariablesMutationUpdateCheckinAnswer(id: id, body: body),
      ),
    );
    final node = validateResponseData(
      response,
      getData: (data) => data.updateCheckinAnswersCollection.records.firstOrNull,
    );

    return (id: node.id, question: node.question, body: node.body);
  }

  Future<void> deleteAnswer(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteCheckinAnswer(variables: VariablesMutationDeleteCheckinAnswer(id: id)),
    );

    validateResponse(response);
  }
}
