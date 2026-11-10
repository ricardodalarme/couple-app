import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/RecordTemperature.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/SendRepairSignal.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/StartRepairSession.graphql.dart';
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

  Future<void> startSession({required String id, required String path, int? intensity}) async {
    final response = await _client.mutate(
      OptionsMutationStartRepairSession(
        variables: VariablesMutationStartRepairSession(id: id, intensity: intensity, path: path),
      ),
    );

    validateResponse(response);
  }
}
