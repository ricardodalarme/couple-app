import 'package:flutter_bloc_starter/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/mutations/generated/RegisterDevice.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/mutations/generated/UnregisterDevice.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/mutations/generated/UpdateNotificationSettings.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/queries/generated/MyNotificationSettings.graphql.dart';
import 'package:network/network.dart';

class NotificationsDataSource({required final GQLClient _client}) {
  Future<QueryMyNotificationSettingsmyNotificationSettings> getSettings() async {
    final response = await _client.query(
      OptionsQueryMyNotificationSettings(fetchPolicy: FetchPolicy.networkOnly),
    );

    return validateResponseData(response, getData: (data) => data.myNotificationSettings);
  }

  Future<void> updateSettings({
    required bool enabled,
    required bool discreet,
    required List<String> mutedTypes,
    required String quietStart,
    required String quietEnd,
    required int cardDay,
    required int cardHour,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateNotificationSettings(
        variables: VariablesMutationUpdateNotificationSettings(
          $set: InputNotificationSettingsUpdateInput(
            enabled: enabled,
            discreet: discreet,
            mutedTypes: mutedTypes,
            quietStart: quietStart,
            quietEnd: quietEnd,
            cardDay: cardDay,
            cardHour: cardHour,
          ),
        ),
      ),
    );

    validateResponse(response);
  }

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
