import 'package:flutter_bloc_starter/features/notifications/data/data_sources/mutations/generated/MarkAllNotificationsRead.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/mutations/generated/MarkNotificationsRead.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/mutations/generated/RegisterDeviceToken.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/mutations/generated/UnregisterDeviceToken.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/queries/generated/GetNotifications.graphql.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/queries/generated/GetUnreadNotifications.graphql.dart';
import 'package:network/network.dart';

class NotificationsDataSource({required GQLClient graphQLClient}) {
  final GQLClient _client = graphQLClient;

  Future<QueryGetNotificationsnotificationsCollection> getNotifications({
    required int first,
  }) async {
    final response = await _client.query(
      OptionsQueryGetNotifications(
        variables: VariablesQueryGetNotifications(first: first),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    return validateResponseData(response, getData: (data) => data?.notificationsCollection);
  }

  Future<QueryGetUnreadNotificationsnotificationsCollection> getUnreadNotifications() async {
    final response = await _client.query(
      OptionsQueryGetUnreadNotifications(fetchPolicy: FetchPolicy.networkOnly),
    );

    return validateResponseData(response, getData: (data) => data?.notificationsCollection);
  }

  Future<MutationMarkNotificationsReadupdatenotificationsCollection> markRead({
    required List<String> ids,
  }) async {
    final response = await _client.mutate(
      OptionsMutationMarkNotificationsRead(
        variables: VariablesMutationMarkNotificationsRead(ids: ids, readAt: DateTime.now().toUtc()),
      ),
    );

    return validateResponseData(response, getData: (data) => data?.updatenotificationsCollection);
  }

  Future<MutationMarkAllNotificationsReadupdatenotificationsCollection> markAllRead() async {
    final response = await _client.mutate(
      OptionsMutationMarkAllNotificationsRead(
        variables: VariablesMutationMarkAllNotificationsRead(readAt: DateTime.now().toUtc()),
      ),
    );

    return validateResponseData(response, getData: (data) => data?.updatenotificationsCollection);
  }

  Future<MutationRegisterDeviceTokenregister_device_token> registerDeviceToken({
    required String token,
    required String platform,
    String? appVersion,
  }) async {
    final response = await _client.mutate(
      OptionsMutationRegisterDeviceToken(
        variables: VariablesMutationRegisterDeviceToken(
          token: token,
          platform: platform,
          appVersion: appVersion,
        ),
      ),
    );

    return validateResponseData(response, getData: (data) => data?.register_device_token);
  }

  Future<MutationUnregisterDeviceTokenunregister_device_token?> unregisterDeviceToken({
    required String token,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUnregisterDeviceToken(
        variables: VariablesMutationUnregisterDeviceToken(token: token),
      ),
    );

    return validateResponseData(response, getData: (data) => data?.unregister_device_token);
  }
}
