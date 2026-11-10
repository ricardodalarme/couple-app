import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/help/data/data_sources/mutations/generated/CreateSupportRequest.graphql.dart';
import 'package:network/network.dart';

class SupportDataSource({required final GQLClient _client}) {
  /// Creates a request; the server answers false when it could not be stored.
  Future<void> createSupportRequest({
    required String topic,
    required String message,
    String? replyEmail,
    String? appVersion,
  }) async {
    final response = await _client.mutate(
      OptionsMutationCreateSupportRequest(
        variables: VariablesMutationCreateSupportRequest(
          topic: topic,
          message: message,
          replyEmail: replyEmail,
          appVersion: appVersion,
        ),
      ),
    );
    final created = validateResponseData(response, getData: (data) => data.createSupportRequest);
    if (!created) throw const LocalizedException(l10nKey: 'SUPPORT_NOT_SENT');
  }
}
