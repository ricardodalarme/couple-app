import 'package:flutter_bloc_starter/features/questions/data/data_sources/remote/mutations/generated/DeleteQuestionAnswer.graphql.dart';
import 'package:flutter_bloc_starter/features/questions/data/data_sources/remote/mutations/generated/InsertQuestionAnswer.graphql.dart';
import 'package:flutter_bloc_starter/features/questions/data/data_sources/remote/queries/generated/QuestionAnswers.graphql.dart';
import 'package:flutter_bloc_starter/features/questions/data/data_sources/remote/queries/generated/QuestionOfTheWeek.graphql.dart';
import 'package:network/network.dart';

typedef QuestionPromptRecord = ({
  String slug,
  String title,
  String? body,
  List<String> tags,
  bool isPaired,
  String? partnerName,
  String? coupleId,
  String selfId,
});

typedef QuestionAnswerRecord = ({String id, bool isMine, String? coupleId, String body});

typedef QuestionAnswerWriteRecord = ({String id, String? coupleId, String body});

/// The visible answer rows for one question and whether the partner answered.
typedef QuestionAnswersRecord = ({List<QuestionAnswerRecord> rows, bool partnerAnswered});

class QuestionsDataSource({required final GQLClient _client}) {
  Future<QuestionPromptRecord> getPrompt() async {
    final response = await _client.query(
      OptionsQueryQuestionOfTheWeek(fetchPolicy: FetchPolicy.networkOnly),
    );
    final data = validateResponseData<QueryQuestionOfTheWeek, QueryQuestionOfTheWeek>(response);
    final question = data.question;
    final selfId = data.myProfile?.id;
    if (question == null || selfId == null) throw const NoDataException();

    return (
      slug: question.slug,
      title: question.title,
      body: question.body,
      tags: question.tags.whereType<String>().toList(),
      isPaired: data.today?.isPaired ?? false,
      partnerName: data.today?.partnerName,
      coupleId: data.myCouple?.id,
      selfId: selfId,
    );
  }

  Future<QuestionAnswersRecord> getAnswers(String questionSlug) async {
    final response = await _client.query(
      OptionsQueryQuestionAnswers(
        variables: VariablesQueryQuestionAnswers(questionSlug: questionSlug),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final data = validateResponseData<QueryQuestionAnswers, QueryQuestionAnswers>(response);
    final edges = data.questionAnswersCollection.edges;

    return (
      rows: [
        for (final edge in edges)
          (
            id: edge.node.id,
            isMine: edge.node.isMine ?? false,
            coupleId: edge.node.coupleId,
            body: edge.node.body,
          ),
      ],
      partnerAnswered: data.partnerAnswered ?? false,
    );
  }

  Future<QuestionAnswerWriteRecord> insertAnswer({
    required String questionSlug,
    required String body,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationInsertQuestionAnswer(
        variables: VariablesMutationInsertQuestionAnswer(
          questionSlug: questionSlug,
          body: body,
          coupleId: coupleId,
        ),
      ),
    );
    final node = validateResponseData(
      response,
      getData: (data) => data.insertIntoQuestionAnswersCollection?.records.firstOrNull,
    );

    return (id: node.id, coupleId: node.coupleId, body: node.body);
  }

  Future<void> deleteAnswer(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteQuestionAnswer(variables: VariablesMutationDeleteQuestionAnswer(id: id)),
    );

    validateResponse(response);
  }
}
