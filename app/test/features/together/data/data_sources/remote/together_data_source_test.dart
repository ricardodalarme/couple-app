import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/queries/generated/MyCouple.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/together_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockGQLClient() extends Mock implements GQLClient;

void main() {
  late GQLClient client;
  late TogetherDataSource dataSource;

  setUpAll(() => registerFallbackValue(OptionsQueryMyCouple()));

  setUp(() {
    client = _MockGQLClient();
    dataSource = TogetherDataSource(client: client);
  });

  QueryResult<QueryMyCouple> response(Map<String, dynamic> data) => QueryResult<QueryMyCouple>(
    options: OptionsQueryMyCouple(),
    source: QueryResultSource.network,
    data: data,
  );

  test('a person without a couple gets no id', () async {
    when(() => client.query<QueryMyCouple>(any()))
        .thenAnswer((_) async => response({'myCouple': null, '__typename': 'Query'}));

    expect(await dataSource.getCoupleId(), isNull);
  });

  test('a paired person gets the couple id', () async {
    when(() => client.query<QueryMyCouple>(any())).thenAnswer(
      (_) async => response({
        'myCouple': {'id': 'couple-1', '__typename': 'Couples'},
        '__typename': 'Query',
      }),
    );

    expect(await dataSource.getCoupleId(), 'couple-1');
  });
}
