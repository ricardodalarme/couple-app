import 'package:flutter_bloc_starter/features/today/data/data_sources/mutations/generated/EndPause.graphql.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/queries/generated/TodayHome.graphql.dart';
import 'package:network/network.dart';

class TodayDataSource({required final GQLClient _client}) {
  /// Ends the person's own pause; harmless when there is none.
  Future<void> endPause() async {
    final response = await _client.mutate(OptionsMutationEndPause());

    validateResponse(response);
  }

  Future<QueryTodayHome> getHome() async {
    final response = await _client.query(
      OptionsQueryTodayHome(fetchPolicy: FetchPolicy.networkOnly),
    );

    return validateResponseData(response);
  }
}
