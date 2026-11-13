import 'package:flutter_bloc_starter/features/connect/data/data_sources/remote/mutations/generated/SendMissUs.graphql.dart';
import 'package:flutter_bloc_starter/features/connect/data/data_sources/remote/mutations/generated/SetTouchTopics.graphql.dart';
import 'package:flutter_bloc_starter/features/connect/data/data_sources/remote/queries/generated/CoupleTouchSetting.graphql.dart';
import 'package:network/network.dart';

class ConnectDataSource({required final GQLClient _client}) {
  /// Whether touch topics are on for the couple; null when the person is not in a couple.
  Future<bool?> getTouchTopicsEnabled() async {
    final response = await _client.query(
      OptionsQueryCoupleTouchSetting(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(response, getData: (data) => data.couplesCollection.edges);

    return edges.isEmpty ? null : edges.first.node.touchTopicsEnabled;
  }

  Future<void> setTouchTopics({required bool enabled}) async {
    final response = await _client.mutate(
      OptionsMutationSetTouchTopics(variables: VariablesMutationSetTouchTopics(enabled: enabled)),
    );

    validateResponse(response);
  }

  Future<void> sendMissUs() async {
    final response = await _client.mutate(OptionsMutationSendMissUs());

    validateResponse(response);
  }
}
