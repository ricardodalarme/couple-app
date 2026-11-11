import 'package:flutter_bloc_starter/features/lists/data/data_sources/lists_data_source.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/DeleteListItem.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/SetListItemPosition.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/SetListItemStatus.graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

class const _StubGQLClient(final QueryResult<Object?> _result) implements GQLClient {
  @override
  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options) async => _result as QueryResult<T>;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

QueryResult<T> _result<T>(MutationOptions<T> options, Map<String, dynamic> data) =>
    QueryResult.loading(options: options, data: data);

void main() {
  test('a status change that matches no row fails', () {
    final options = OptionsMutationSetListItemStatus(
      variables: VariablesMutationSetListItemStatus(id: 'i1', status: 'done'),
    );
    final dataSource = ListsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'updateListItemsCollection': {
            'affectedCount': 0,
            '__typename': 'ListItemsUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.setItemStatus(id: 'i1', status: 'done'), throwsA(isA<NoDataException>()));
  });

  test('a position change that matches no row fails', () {
    final options = OptionsMutationSetListItemPosition(
      variables: VariablesMutationSetListItemPosition(id: 'i1', position: 2),
    );
    final dataSource = ListsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'updateListItemsCollection': {
            'affectedCount': 0,
            '__typename': 'ListItemsUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.setItemPosition(id: 'i1', position: 2), throwsA(isA<NoDataException>()));
  });

  test('deleting an item that is already gone fails', () {
    final options = OptionsMutationDeleteListItem(
      variables: VariablesMutationDeleteListItem(id: 'i1'),
    );
    final dataSource = ListsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'deleteFromListItemsCollection': {
            'affectedCount': 0,
            '__typename': 'ListItemsDeleteResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.deleteItem('i1'), throwsA(isA<NoDataException>()));
  });

  test('a mutation that touches one row succeeds', () async {
    final options = OptionsMutationSetListItemStatus(
      variables: VariablesMutationSetListItemStatus(id: 'i1', status: 'done'),
    );
    final dataSource = ListsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'updateListItemsCollection': {
            'affectedCount': 1,
            '__typename': 'ListItemsUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    await dataSource.setItemStatus(id: 'i1', status: 'done');
  });
}
