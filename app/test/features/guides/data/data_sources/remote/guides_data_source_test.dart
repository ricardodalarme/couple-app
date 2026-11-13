import 'package:flutter_bloc_starter/features/guides/data/data_sources/remote/guides_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/remote/mutations/generated/InsertConversationPrep.graphql.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/remote/mutations/generated/UpdateConversationPrep.graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockGQLClient() extends Mock implements GQLClient;

void main() {
  late GQLClient client;
  late GuidesDataSource dataSource;

  setUpAll(() {
    registerFallbackValue(
      OptionsMutationInsertConversationPrep(
        variables: VariablesMutationInsertConversationPrep(
          id: 'p1',
          guide: 'money',
          topic: 'Dinheiro',
        ),
      ),
    );
    registerFallbackValue(
      OptionsMutationUpdateConversationPrep(
        variables: VariablesMutationUpdateConversationPrep(
          id: 'p1',
          guide: 'money',
          topic: 'Dinheiro',
        ),
      ),
    );
  });

  setUp(() {
    client = _MockGQLClient();
    dataSource = GuidesDataSource(client: client);
  });

  test('an inserted preparation returns its row id', () async {
    when(() => client.mutate<MutationInsertConversationPrep>(any())).thenAnswer(
      (_) async => QueryResult<MutationInsertConversationPrep>.loading(
        options: OptionsMutationInsertConversationPrep(
          variables: VariablesMutationInsertConversationPrep(
            id: 'p1',
            guide: 'money',
            topic: 'Dinheiro',
          ),
        ),
        data: {
          'insertIntoConversationPrepsCollection': {
            'records': [
              {'id': 'p1', '__typename': 'ConversationPreps'},
            ],
            '__typename': 'ConversationPrepsInsertResponse',
          },
          '__typename': 'Mutation',
        },
      ),
    );

    final id = await dataSource.insertPrep(
      id: 'p1',
      guide: 'money',
      topic: 'Dinheiro',
      notes: 'Uma nota',
      draft: null,
    );

    expect(id, 'p1');
  });

  test('an update the server matched no row for is a failure', () async {
    when(() => client.mutate<MutationUpdateConversationPrep>(any())).thenAnswer(
      (_) async => QueryResult<MutationUpdateConversationPrep>.loading(
        options: OptionsMutationUpdateConversationPrep(
          variables: VariablesMutationUpdateConversationPrep(
            id: 'p1',
            guide: 'money',
            topic: 'Dinheiro',
          ),
        ),
        data: {
          'updateConversationPrepsCollection': {
            'affectedCount': 0,
            '__typename': 'ConversationPrepsUpdateResponse',
          },
          '__typename': 'Mutation',
        },
      ),
    );

    await expectLater(
      dataSource.updatePrep(
        id: 'p1',
        guide: 'money',
        topic: 'Dinheiro',
        notes: 'Uma nota',
        draft: null,
      ),
      throwsA(isA<NoDataException>()),
    );
  });
}
