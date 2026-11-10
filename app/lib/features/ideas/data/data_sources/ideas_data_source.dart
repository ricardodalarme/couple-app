import 'package:flutter_bloc_starter/features/today/data/data_sources/queries/generated/DailyIdeas.graphql.dart';
import 'package:network/network.dart';

class IdeasDataSource({required final GQLClient _client}) {
  Future<QueryDailyIdeascontentItemsCollection> getIdeas(String locale) async {
    final response = await _client.query(
      OptionsQueryDailyIdeas(variables: VariablesQueryDailyIdeas(locale: locale)),
    );

    return validateResponseData(response, getData: (data) => data.contentItemsCollection);
  }
}
