import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/SetLogisticItemAssignee.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/mutations/generated/SetLogisticItemDone.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/queries/generated/MyCouple.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/remote/together_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockGQLClient() extends Mock implements GQLClient;

void main() {
  late GQLClient client;
  late TogetherDataSource dataSource;

  setUpAll(() {
    registerFallbackValue(OptionsQueryMyCouple());
    registerFallbackValue(
      OptionsMutationSetLogisticItemDone(variables: VariablesMutationSetLogisticItemDone(id: 'x')),
    );
    registerFallbackValue(
      OptionsMutationSetLogisticItemAssignee(
        variables: VariablesMutationSetLogisticItemAssignee(id: 'x'),
      ),
    );
  });

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

  Map<String, dynamic> updated() => {
    'updateLogisticItemsCollection': {
      'affectedCount': 1,
      '__typename': 'LogisticItemsUpdateResponse',
    },
    '__typename': 'Mutation',
  };

  test('marking an item open again sends doneAt as null in the same mutation', () async {
    when(() => client.mutate<MutationSetLogisticItemDone>(any())).thenAnswer(
      (invocation) async => QueryResult<MutationSetLogisticItemDone>(
        options:
            invocation.positionalArguments.first as MutationOptions<MutationSetLogisticItemDone>,
        source: QueryResultSource.network,
        data: updated(),
      ),
    );

    await dataSource.setLogisticItemDone(id: 'i1', doneAt: null);

    final options =
        verify(() => client.mutate<MutationSetLogisticItemDone>(captureAny())).captured.single
            as MutationOptions<MutationSetLogisticItemDone>;
    expect(options.variables, {'id': 'i1', 'doneAt': null});
  });

  test('marking an item done sends the time in UTC', () async {
    when(() => client.mutate<MutationSetLogisticItemDone>(any())).thenAnswer(
      (invocation) async => QueryResult<MutationSetLogisticItemDone>(
        options:
            invocation.positionalArguments.first as MutationOptions<MutationSetLogisticItemDone>,
        source: QueryResultSource.network,
        data: updated(),
      ),
    );

    await dataSource.setLogisticItemDone(id: 'i1', doneAt: DateTime.utc(2026, 11, 14, 9));

    final options =
        verify(() => client.mutate<MutationSetLogisticItemDone>(captureAny())).captured.single
            as MutationOptions<MutationSetLogisticItemDone>;
    expect(options.variables, {'id': 'i1', 'doneAt': '2026-11-14T09:00:00.000Z'});
  });

  test('giving an item to both people sends assigneeId as null in the same mutation', () async {
    when(() => client.mutate<MutationSetLogisticItemAssignee>(any())).thenAnswer(
      (invocation) async => QueryResult<MutationSetLogisticItemAssignee>(
        options:
            invocation.positionalArguments.first
                as MutationOptions<MutationSetLogisticItemAssignee>,
        source: QueryResultSource.network,
        data: updated(),
      ),
    );

    await dataSource.setLogisticItemAssignee(id: 'i1');

    final options =
        verify(() => client.mutate<MutationSetLogisticItemAssignee>(captureAny())).captured.single
            as MutationOptions<MutationSetLogisticItemAssignee>;
    expect(options.variables, {'id': 'i1', 'assigneeId': null});
  });
}
