import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/learned_items_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/mutations/generated/AddLearnedItem.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/mutations/generated/DeleteLearnedItem.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/mutations/generated/SetLearnedItemStatus.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/mutations/generated/UpdateLearnedItem.graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

class const _StubGQLClient(final QueryResult<Object?> _result) implements GQLClient {
  @override
  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options) async =>
      QueryResult.loading(options: options, data: _result.data);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

QueryResult<T> _result<T>(MutationOptions<T> options, Map<String, dynamic> data) =>
    QueryResult.loading(options: options, data: data);

void main() {
  test('adding a learning that the server does not return fails', () {
    final options = OptionsMutationAddLearnedItem(
      variables: VariablesMutationAddLearnedItem(target: 'date', text: 'Jantar'),
    );
    final dataSource = LearnedItemsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'insertIntoLearnedItemsCollection': {
            'records': <Object?>[],
            '__typename': 'LearnedItemsInsertResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.add(target: 'date', text: 'Jantar'), throwsA(isA<NoDataException>()));
  });

  test('editing a learning that matches no row fails', () {
    final options = OptionsMutationUpdateLearnedItem(
      variables: VariablesMutationUpdateLearnedItem(id: 'l1', text: 'Jantar'),
    );
    final dataSource = LearnedItemsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'updateLearnedItemsCollection': {
            'affectedCount': 0,
            '__typename': 'LearnedItemsUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.updateText(id: 'l1', text: 'Jantar'), throwsA(isA<NoDataException>()));
  });

  test('changing the status of a missing learning fails', () {
    final options = OptionsMutationSetLearnedItemStatus(
      variables: VariablesMutationSetLearnedItemStatus(id: 'l1', status: 'confirmed'),
    );
    final dataSource = LearnedItemsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'updateLearnedItemsCollection': {
            'affectedCount': 0,
            '__typename': 'LearnedItemsUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.setStatus(id: 'l1', status: 'confirmed'), throwsA(isA<NoDataException>()));
  });

  test('deleting a learning that is already gone fails', () {
    final options = OptionsMutationDeleteLearnedItem(
      variables: VariablesMutationDeleteLearnedItem(id: 'l1'),
    );
    final dataSource = LearnedItemsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'deleteFromLearnedItemsCollection': {
            'affectedCount': 0,
            '__typename': 'LearnedItemsDeleteResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.delete('l1'), throwsA(isA<NoDataException>()));
  });

  test('a mutation that touches one row succeeds', () async {
    final options = OptionsMutationUpdateLearnedItem(
      variables: VariablesMutationUpdateLearnedItem(id: 'l1', text: 'Jantar'),
    );
    final dataSource = LearnedItemsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'updateLearnedItemsCollection': {
            'affectedCount': 1,
            '__typename': 'LearnedItemsUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    await dataSource.updateText(id: 'l1', text: 'Jantar');
  });
}
