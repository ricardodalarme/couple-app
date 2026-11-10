import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/RecordTemperature.graphql.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/mutations/generated/StartRepairSession.graphql.dart';
import 'package:network/network.dart';

class RepairDataSource({required final GQLClient _client}) {
  Future<void> recordTemperature(String level) async {
    final response = await _client.mutate(
      OptionsMutationRecordTemperature(variables: VariablesMutationRecordTemperature(level: level)),
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
