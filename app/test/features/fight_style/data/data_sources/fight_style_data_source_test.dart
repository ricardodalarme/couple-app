import 'package:flutter_bloc_starter/features/fight_style/data/data_sources/fight_style_data_source.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/data_sources/mutations/generated/UpdateFightStyleResult.graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockGQLClient() extends Mock implements GQLClient;

void main() {
  late GQLClient client;
  late FightStyleDataSource dataSource;

  const ranked = ['pursue', 'withdraw', 'repair', 'avoid'];

  setUpAll(() {
    registerFallbackValue(
      OptionsMutationUpdateFightStyleResult(
        variables: VariablesMutationUpdateFightStyleResult(id: 'q1', ranked: const []),
      ),
    );
  });

  setUp(() {
    client = _MockGQLClient();
    dataSource = FightStyleDataSource(client: client);
  });

  QueryResult<MutationUpdateFightStyleResult> response(int affectedCount) {
    final options = OptionsMutationUpdateFightStyleResult(
      variables: VariablesMutationUpdateFightStyleResult(id: 'q1', ranked: ranked),
    );

    return QueryResult<MutationUpdateFightStyleResult>(
      options: options,
      source: QueryResultSource.network,
      data: {
        'updateQuizResultsCollection': {
          '__typename': 'QuizResultsUpdateResponse',
          'affectedCount': affectedCount,
        },
        '__typename': 'Mutation',
      },
    );
  }

  test('an update the server matched no row for is a failure', () async {
    when(() => client.mutate<MutationUpdateFightStyleResult>(any()))
        .thenAnswer((_) async => response(0));

    await expectLater(
      dataSource.updateResult(id: 'q1', ranked: ranked),
      throwsA(isA<NoDataException>()),
    );
  });

  test('an update that touched the saved row succeeds', () async {
    when(() => client.mutate<MutationUpdateFightStyleResult>(any()))
        .thenAnswer((_) async => response(1));

    await dataSource.updateResult(id: 'q1', ranked: ranked);
  });

  test('the update leaves the timestamp to the database trigger', () {
    final variables = VariablesMutationUpdateFightStyleResult(id: 'q1', ranked: ranked);

    expect(variables.toJson().containsKey('updatedAt'), isFalse);
  });
}
