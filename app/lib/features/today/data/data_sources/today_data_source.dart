import 'package:flutter_bloc_starter/features/today/data/data_sources/queries/generated/TodayHome.graphql.dart';
import 'package:network/network.dart';

class TodayDataSource({required final GQLClient _client}) {
  Future<QueryTodayHome> getHome() async {
    final response = await _client.query(
      OptionsQueryTodayHome(fetchPolicy: FetchPolicy.networkOnly),
    );

    return validateResponseData(response);
  }
}
