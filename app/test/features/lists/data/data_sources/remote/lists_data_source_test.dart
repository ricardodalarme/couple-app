import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/lists_data_source.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/DeleteListItem.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/ReorderListItems.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/SetListItemStatus.graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

class const _StubGQLClient(final QueryResult<Object?> _result) implements GQLClient {
  @override
  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options) async => _result as QueryResult<T>;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class const _CapturingGQLClient(final void Function(MutationOptions<Object?>) _onMutate)
    implements GQLClient {
  @override
  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options) async {
    _onMutate(options);

    return _result(options, {
      'updateListsCollection': {
        'records': [_list],
        '__typename': 'ListsUpdateResponse',
      },
      '__typename': 'Mutation',
    });
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const Map<String, dynamic> _list = {
  'id': 'l1',
  'title': 'Viagens',
  'kind': 'travel',
  'isMine': true,
  'isShared': false,
  '__typename': 'Lists',
};

Map<String, dynamic> _item(String id, int position, {String status = 'done'}) => {
  'id': id,
  'listId': 'l1',
  'title': 'Lisboa',
  'status': status,
  'position': position,
  '__typename': 'ListItems',
};

QueryResult<T> _result<T>(MutationOptions<T> options, Map<String, dynamic> data) =>
    QueryResult.loading(options: options, data: data);

void main() {
  final statusOptions = OptionsMutationSetListItemStatus(
    variables: VariablesMutationSetListItemStatus(id: 'i1', status: EnumListItemStatus.done),
  );

  test('a status change that matches no row fails', () {
    final dataSource = ListsDataSource(
      client: _StubGQLClient(
        _result(statusOptions, {
          'updateListItemsCollection': {
            'records': <Map<String, dynamic>>[],
            '__typename': 'ListItemsUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(
      dataSource.setItemStatus(id: 'i1', status: EnumListItemStatus.done),
      throwsA(isA<NoDataException>()),
    );
  });

  test('a status change returns the row as the server stored it', () async {
    final dataSource = ListsDataSource(
      client: _StubGQLClient(
        _result(statusOptions, {
          'updateListItemsCollection': {
            'records': [_item('i1', 3)],
            '__typename': 'ListItemsUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    final saved = await dataSource.setItemStatus(id: 'i1', status: EnumListItemStatus.done);

    expect(saved.id, 'i1');
    expect(saved.position, 3);
    expect(saved.status, EnumListItemStatus.done);
  });

  test('reordering returns the whole list in the order the server stored it', () async {
    final options = OptionsMutationReorderListItems(
      variables: VariablesMutationReorderListItems(listId: 'l1', itemIds: ['i2', 'i1']),
    );
    final dataSource = ListsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'reorderListItems': {
            'edges': [
              {'node': _item('i2', 0, status: 'dream'), '__typename': 'ListItemsEdge'},
              {'node': _item('i1', 1), '__typename': 'ListItemsEdge'},
            ],
            '__typename': 'ListItemsConnection',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    final items = await dataSource.reorderItems(listId: 'l1', itemIds: ['i2', 'i1']);

    expect([for (final item in items) item.id], ['i2', 'i1']);
    expect([for (final item in items) item.position], [0, 1]);
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

  test('making a list private sends coupleId as null instead of dropping it', () async {
    MutationOptions<Object?>? captured;
    final dataSource = ListsDataSource(
      client: _CapturingGQLClient((options) {
        captured = options;
      }),
    );

    final saved = await dataSource.setListVisibility(id: 'l1');

    final variables = captured!.variables;
    expect(variables.containsKey('coupleId'), isTrue);
    expect(variables['coupleId'], isNull);
    expect(saved.isShared, isFalse);
  });
}
