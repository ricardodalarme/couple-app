import 'package:flutter_bloc_starter/features/devices/data/data_sources/mutations/generated/RevokeDevice.graphql.dart';
import 'package:flutter_bloc_starter/features/devices/data/data_sources/queries/generated/MyDevices.graphql.dart';
import 'package:network/network.dart';

class DevicesDataSource({required final GQLClient _client}) {
  /// Reads the devices that receive notifications, most recently registered first.
  Future<List<QueryMyDevicesdevicesCollectionedgesnode>> getDevices() async {
    final response = await _client.query(
      OptionsQueryMyDevices(fetchPolicy: FetchPolicy.networkOnly),
    );
    final collection = validateResponseData(response, getData: (data) => data.devicesCollection);

    return [for (final edge in collection.edges) edge.node];
  }

  /// Deletes one device row; false means there was nothing left to delete.
  Future<bool> revokeDevice(String deviceId) async {
    final response = await _client.mutate(
      OptionsMutationRevokeDevice(variables: VariablesMutationRevokeDevice(deviceId: deviceId)),
    );

    return validateResponseData(response, getData: (data) => data.revokeDevice);
  }
}
