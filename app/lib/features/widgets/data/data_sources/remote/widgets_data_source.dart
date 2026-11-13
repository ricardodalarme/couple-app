import 'package:flutter_bloc_starter/features/widgets/data/data_sources/remote/mutations/generated/UpdateWidgetPreferences.graphql.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/remote/queries/generated/WidgetOverview.graphql.dart';
import 'package:network/network.dart';

class WidgetsDataSource({required final GQLClient _client}) {
  Future<QueryWidgetOverview> getOverview() async {
    final response = await _client.query(
      OptionsQueryWidgetOverview(fetchPolicy: FetchPolicy.networkOnly),
    );

    return validateResponseData(response);
  }

  Future<int> updatePreferences(VariablesMutationUpdateWidgetPreferences variables) async {
    final response = await _client.mutate(
      OptionsMutationUpdateWidgetPreferences(variables: variables),
    );

    return validateResponseData(
      response,
      getData: (data) => data.updateProfileSettingsCollection.affectedCount,
    );
  }
}
