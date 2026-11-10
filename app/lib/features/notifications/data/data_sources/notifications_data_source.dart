import 'package:flutter_bloc_starter/features/notifications/data/data_sources/mutations/generated/RegisterDevice.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/mutations/generated/UnregisterDevice.graphql.dart';
import 'package:network/network.dart';

class NotificationsDataSource({required final GQLClient _client}) {
  Future<void> registerDevice({
    required String token,
    required String platform,
    String? label,
  }) async {
    final response = await _client.mutate(
      OptionsMutationRegisterDevice(
        variables: VariablesMutationRegisterDevice(token: token, platform: platform, label: label),
      ),
    );

    validateResponse(response);
  }

  Future<void> unregisterDevice(String token) async {
    final response = await _client.mutate(
      OptionsMutationUnregisterDevice(variables: VariablesMutationUnregisterDevice(token: token)),
    );

    validateResponse(response);
  }
}
