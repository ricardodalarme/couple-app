import 'package:flutter_bloc_starter/features/spice/data/data_sources/remote/mutations/generated/SetSpiceEnabled.graphql.dart';
import 'package:flutter_bloc_starter/features/spice/data/data_sources/remote/queries/generated/MySpiceSetting.graphql.dart';
import 'package:flutter_bloc_starter/features/spice/data/data_sources/remote/queries/generated/SpiceCards.graphql.dart';
import 'package:flutter_bloc_starter/features/spice/data/data_sources/remote/spice_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockGQLClient() extends Mock implements GQLClient;

void main() {
  late GQLClient client;
  late SpiceDataSource dataSource;

  setUpAll(() {
    registerFallbackValue(
      OptionsQueryMySpiceSetting(variables: VariablesQueryMySpiceSetting(profileId: 'p1')),
    );
    registerFallbackValue(
      OptionsQuerySpiceCards(variables: VariablesQuerySpiceCards(locale: 'pt-BR')),
    );
    registerFallbackValue(
      OptionsMutationSetSpiceEnabled(
        variables: VariablesMutationSetSpiceEnabled(profileId: 'p1', enabled: true),
      ),
    );
  });

  setUp(() {
    client = _MockGQLClient();
    dataSource = SpiceDataSource(client: client);
  });

  QueryResult<QueryMySpiceSetting> settingsResponse(Map<String, dynamic>? row) {
    return QueryResult<QueryMySpiceSetting>(
      options: OptionsQueryMySpiceSetting(variables: VariablesQueryMySpiceSetting(profileId: 'p1')),
      source: QueryResultSource.network,
      data: {'profileSettingsByPk': row, '__typename': 'Query'},
    );
  }

  QueryResult<QuerySpiceCards> cardsResponse(List<Map<String, dynamic>> edges) {
    return QueryResult<QuerySpiceCards>(
      options: OptionsQuerySpiceCards(variables: VariablesQuerySpiceCards(locale: 'pt-BR')),
      source: QueryResultSource.network,
      data: {
        'contentItemsCollection': {'__typename': 'ContentItemsConnection', 'edges': edges},
        '__typename': 'Query',
      },
    );
  }

  QueryResult<MutationSetSpiceEnabled> mutationResponse(int affectedCount) {
    return QueryResult<MutationSetSpiceEnabled>(
      options: OptionsMutationSetSpiceEnabled(
        variables: VariablesMutationSetSpiceEnabled(profileId: 'p1', enabled: true),
      ),
      source: QueryResultSource.network,
      data: {
        'updateProfileSettingsCollection': {
          '__typename': 'ProfileSettingsUpdateResponse',
          'affectedCount': affectedCount,
        },
        '__typename': 'Mutation',
      },
    );
  }

  test('a missing settings row reads as off', () async {
    when(() => client.query<QueryMySpiceSetting>(any()))
        .thenAnswer((_) async => settingsResponse(null));

    expect(await dataSource.getEnabled('p1'), isFalse);
  });

  test('the settings row carries the saved switch', () async {
    when(() => client.query<QueryMySpiceSetting>(any())).thenAnswer(
      (_) async => settingsResponse({
        '__typename': 'ProfileSettings',
        'profileId': 'p1',
        'spiceEnabled': true,
      }),
    );

    expect(await dataSource.getEnabled('p1'), isTrue);
  });

  test('cards keep the server order', () async {
    when(() => client.query<QuerySpiceCards>(any())).thenAnswer(
      (_) async => cardsResponse([
        {
          '__typename': 'ContentItemsEdge',
          'node': {'__typename': 'ContentItems', 'slug': 'a', 'title': 'Primeira'},
        },
        {
          '__typename': 'ContentItemsEdge',
          'node': {'__typename': 'ContentItems', 'slug': 'b', 'title': 'Segunda'},
        },
      ]),
    );

    expect(await dataSource.getCards('pt-BR'), ['Primeira', 'Segunda']);
  });

  test('the mutation reports the row count it touched', () async {
    when(() => client.mutate<MutationSetSpiceEnabled>(any()))
        .thenAnswer((_) async => mutationResponse(1));

    expect(await dataSource.setEnabled(profileId: 'p1', enabled: true), 1);
  });

  test('the mutation reports zero when no row matched', () async {
    when(() => client.mutate<MutationSetSpiceEnabled>(any()))
        .thenAnswer((_) async => mutationResponse(0));

    expect(await dataSource.setEnabled(profileId: 'p1', enabled: true), 0);
  });
}
