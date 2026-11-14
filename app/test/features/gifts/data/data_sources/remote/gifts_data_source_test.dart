import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/gifts_data_source.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/AddGiftWish.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/DeleteGiftWish.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/SetGiftWishVisibility.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/UpdateGiftWish.graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

class const _StubGQLClient(final QueryResult<Object?> _result) implements GQLClient {
  @override
  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options) async =>
      QueryResult.loading(options: options, data: _result.data);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _CapturingGQLClient() implements GQLClient {
  final List<MutationOptions<dynamic>> mutations = [];
  final List<QueryOptions<dynamic>> queries = [];

  @override
  Future<QueryResult<T>> mutate<T>(MutationOptions<T> options) async {
    mutations.add(options);

    return QueryResult.loading(options: options, data: _mutationData);
  }

  @override
  Future<QueryResult<T>> query<T>(QueryOptions<T> options) async {
    queries.add(options);

    return QueryResult.loading(options: options, data: _queryData);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const Map<String, dynamic> _mutationData = {
  'insertIntoGiftIdeasCollection': {'affectedCount': 1, '__typename': 'GiftIdeasInsertResponse'},
  'updateGiftIdeasCollection': {'affectedCount': 1, '__typename': 'GiftIdeasUpdateResponse'},
  'deleteFromGiftIdeasCollection': {'affectedCount': 1, '__typename': 'GiftIdeasDeleteResponse'},
  '__typename': 'Mutation',
};

const Map<String, dynamic> _queryData = {
  'giftIdeasCollection': {'edges': <Object?>[], '__typename': 'GiftIdeasConnection'},
  '__typename': 'Query',
};

QueryResult<T> _result<T>(MutationOptions<T> options, Map<String, dynamic> data) =>
    QueryResult.loading(options: options, data: data);

void main() {
  test('adding a wish that matches no row fails', () {
    final options = OptionsMutationAddGiftWish(
      variables: VariablesMutationAddGiftWish(id: 'g1', title: 'Livro'),
    );
    final dataSource = GiftsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'insertIntoGiftIdeasCollection': {
            'affectedCount': 0,
            '__typename': 'GiftIdeasInsertResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.addGiftWish(id: 'g1', title: 'Livro'), throwsA(isA<NoDataException>()));
  });

  test('updating a wish that matches no row fails', () {
    final options = OptionsMutationUpdateGiftWish(
      variables: VariablesMutationUpdateGiftWish(id: 'g1', title: 'Livro'),
    );
    final dataSource = GiftsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'updateGiftIdeasCollection': {
            'affectedCount': 0,
            '__typename': 'GiftIdeasUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.updateGiftWish(id: 'g1', title: 'Livro'), throwsA(isA<NoDataException>()));
  });

  test('deleting a wish that is already gone fails', () {
    final options = OptionsMutationDeleteGiftWish(
      variables: VariablesMutationDeleteGiftWish(id: 'g1'),
    );
    final dataSource = GiftsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'deleteFromGiftIdeasCollection': {
            'affectedCount': 0,
            '__typename': 'GiftIdeasDeleteResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.deleteGiftWish('g1'), throwsA(isA<NoDataException>()));
  });

  test('changing visibility on a missing wish fails', () {
    final options = OptionsMutationSetGiftWishVisibility(
      variables: VariablesMutationSetGiftWishVisibility(id: 'g1'),
    );
    final dataSource = GiftsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'updateGiftIdeasCollection': {
            'affectedCount': 0,
            '__typename': 'GiftIdeasUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    expect(dataSource.setGiftWishVisibility(id: 'g1'), throwsA(isA<NoDataException>()));
  });

  test('a mutation that touches one row succeeds', () async {
    final options = OptionsMutationUpdateGiftWish(
      variables: VariablesMutationUpdateGiftWish(id: 'g1', title: 'Livro'),
    );
    final dataSource = GiftsDataSource(
      client: _StubGQLClient(
        _result(options, {
          'updateGiftIdeasCollection': {
            'affectedCount': 1,
            '__typename': 'GiftIdeasUpdateResponse',
          },
          '__typename': 'Mutation',
        }),
      ),
    );

    await dataSource.updateGiftWish(id: 'g1', title: 'Livro');
  });

  test('unsharing a wish sends the clear-visibility mutation', () async {
    final client = _CapturingGQLClient();
    final dataSource = GiftsDataSource(client: client);

    await dataSource.setGiftWishVisibility(id: 'g1');

    final operation = client.mutations.single;
    expect(printNode(operation.document), contains('mutation ClearGiftWishVisibility'));
    expect(printNode(operation.document), contains('coupleId: null'));
    expect(operation.variables, {'id': 'g1'});
  });

  test('sharing a wish sends the couple id variable', () async {
    final client = _CapturingGQLClient();
    final dataSource = GiftsDataSource(client: client);

    await dataSource.setGiftWishVisibility(id: 'g1', coupleId: 'couple-1');

    final operation = client.mutations.single;
    expect(printNode(operation.document), contains('mutation SetGiftWishVisibility'));
    expect(operation.variables, {'id': 'g1', 'coupleId': 'couple-1'});
  });

  test('clearing a note and budget sends dedicated null mutations', () async {
    final client = _CapturingGQLClient();
    final dataSource = GiftsDataSource(client: client);

    await dataSource.updateGiftWish(id: 'g1', title: 'Livro');

    expect(client.mutations, hasLength(3));
    expect(printNode(client.mutations[0].document), contains('mutation UpdateGiftWish'));
    expect(client.mutations[0].variables, {'id': 'g1', 'title': 'Livro'});
    expect(printNode(client.mutations[1].document), contains('mutation ClearGiftWishNote'));
    expect(printNode(client.mutations[1].document), contains('note: null'));
    expect(client.mutations[1].variables, {'id': 'g1'});
    expect(printNode(client.mutations[2].document), contains('mutation ClearGiftWishBudget'));
    expect(printNode(client.mutations[2].document), contains('budget: null'));
    expect(client.mutations[2].variables, {'id': 'g1'});
  });

  test('a new wish is inserted as a wish, not a date idea', () async {
    final client = _CapturingGQLClient();
    final dataSource = GiftsDataSource(client: client);

    await dataSource.addGiftWish(id: 'g1', title: 'Livro');

    final operation = client.mutations.single;
    expect(printNode(operation.document), contains('kind: wish'));
  });

  test('the gift page reads only wishes', () async {
    final client = _CapturingGQLClient();
    final dataSource = GiftsDataSource(client: client);

    await dataSource.getGiftIdeas();

    final operation = client.queries.single;
    expect(printNode(operation.document), contains('kind: {eq: wish}'));
  });
}
