import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/CompleteRepairSession.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/DeleteLearning.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/RecordTemperature.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/SaveLearning.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/SaveRepairProgress.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/SendRepairSignal.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/StartRepairSession.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/queries/generated/MyLearnings.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/queries/generated/OpenGuidedSession.graphql.dart';
import 'package:network/network.dart';

class RepairDataSource({required final GQLClient _client}) {
  Future<void> recordTemperature(String level) async {
    final response = await _client.mutate(
      OptionsMutationRecordTemperature(variables: VariablesMutationRecordTemperature(level: level)),
    );

    validateResponse(response);
  }

  /// Sends the partner a repair message; fails with `NOT_PAIRED` when there is none.
  Future<void> sendRepair({required String body, String? value}) async {
    final response = await _client.mutate(
      OptionsMutationSendRepairSignal(
        variables: VariablesMutationSendRepairSignal(value: value, body: body),
      ),
    );

    validateResponse(response);
  }

  Future<QueryOpenGuidedSessionrepairSessionsCollectionedgesnode?> openGuidedSession() async {
    final response = await _client.query(
      OptionsQueryOpenGuidedSession(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.repairSessionsCollection.edges,
    );

    return edges.isEmpty ? null : edges.first.node;
  }

  Future<void> saveProgress({required String id, required int step, String? draft}) async {
    final response = await _client.mutate(
      OptionsMutationSaveRepairProgress(
        variables: VariablesMutationSaveRepairProgress(id: id, step: step, draft: draft),
      ),
    );

    validateResponse(response);
  }

  Future<void> completeSession({
    required String id,
    required DateTime completedAt,
    String? feeling,
  }) async {
    final response = await _client.mutate(
      OptionsMutationCompleteRepairSession(
        variables: VariablesMutationCompleteRepairSession(
          id: id,
          feeling: feeling,
          completedAt: completedAt,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<List<QueryMyLearningsrepairLearningsCollectionedgesnode>> getLearnings() async {
    final response = await _client.query(
      OptionsQueryMyLearnings(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.repairLearningsCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }

  Future<void> saveLearning({
    required String id,
    required String kind,
    required String note,
    String? sessionId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationSaveLearning(
        variables: VariablesMutationSaveLearning(
          id: id,
          sessionId: sessionId,
          kind: kind,
          note: note,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> deleteLearning(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteLearning(variables: VariablesMutationDeleteLearning(id: id)),
    );

    validateResponse(response);
  }

  Future<void> startSession({required String id, required String path, int? intensity}) async {
    final response = await _client.mutate(
      OptionsMutationStartRepairSession(
        variables: VariablesMutationStartRepairSession(id: id, intensity: intensity, path: path),
      ),
    );

    validateResponse(response);
  }
}
