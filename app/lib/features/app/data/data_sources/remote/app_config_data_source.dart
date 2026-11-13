import 'package:flutter_bloc_starter/features/app/data/data_sources/remote/queries/generated/MinAppVersion.graphql.dart';
import 'package:network/network.dart';

class AppConfigDataSource({required final GQLClient _client}) {
  /// The minimum supported version, readable without an account.
  Future<String?> getMinAppVersion() async {
    final response = await _client.query(
      OptionsQueryMinAppVersion(fetchPolicy: FetchPolicy.networkOnly),
    );
    final config = validateResponseData(response, getData: (data) => data.appConfigByPk);

    return config.value;
  }
}
