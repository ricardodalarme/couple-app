import 'package:flutter_bloc_starter/features/plus/data/data_sources/queries/generated/MyPlus.graphql.dart';
import 'package:network/network.dart';

class PlusDataSource({required final GQLClient _client}) {
  Future<QueryMyPlusmyPlus> getPlus() async {
    final response = await _client.query(OptionsQueryMyPlus(fetchPolicy: FetchPolicy.networkOnly));

    return validateResponseData(response, getData: (data) => data.myPlus);
  }
}
