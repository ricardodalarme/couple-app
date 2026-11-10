// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMyCouple {
  QueryMyCouple({this.myCouple, this.$__typename = 'Query'});

  factory QueryMyCouple.fromJson(Map<String, dynamic> json) {
    final l$myCouple = json['myCouple'];
    final l$$__typename = json['__typename'];
    return QueryMyCouple(
      myCouple: l$myCouple == null
          ? null
          : QueryMyCouplemyCouple.fromJson((l$myCouple as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyCouplemyCouple? myCouple;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myCouple = myCouple;
    _resultData['myCouple'] = l$myCouple?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myCouple = myCouple;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myCouple, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyCouple || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myCouple = myCouple;
    final lOther$myCouple = other.myCouple;
    if (l$myCouple != lOther$myCouple) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

const documentNodeQueryMyCouple = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyCouple'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myCouple'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
QueryMyCouple _parserFnQueryMyCouple(Map<String, dynamic> data) => QueryMyCouple.fromJson(data);
typedef OnQueryCompleteQueryMyCouple = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMyCouple?,
);

class OptionsQueryMyCouple extends graphql.QueryOptions<QueryMyCouple> {
  OptionsQueryMyCouple({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyCouple? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMyCouple? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMyCouple(data)),
         onError: onError,
         document: documentNodeQueryMyCouple,
         parserFn: _parserFnQueryMyCouple,
       );

  final OnQueryCompleteQueryMyCouple? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMyCouple extends graphql.WatchQueryOptions<QueryMyCouple> {
  WatchOptionsQueryMyCouple({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyCouple? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryMyCouple,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMyCouple,
       );
}

class FetchMoreOptionsQueryMyCouple extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMyCouple({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMyCouple);
}

extension ClientExtensionQueryMyCouple on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMyCouple>> queryMyCouple([OptionsQueryMyCouple? options]) async =>
      await this.query(options ?? OptionsQueryMyCouple());

  graphql.ObservableQuery<QueryMyCouple> watchQueryMyCouple([WatchOptionsQueryMyCouple? options]) =>
      this.watchQuery(options ?? WatchOptionsQueryMyCouple());

  void writeQueryMyCouple({required QueryMyCouple data, bool broadcast = true}) => this.writeQuery(
    graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyCouple)),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryMyCouple? readQueryMyCouple({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyCouple)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMyCouple.fromJson(result);
  }
}

class QueryMyCouplemyCouple {
  QueryMyCouplemyCouple({required this.id, this.$__typename = 'Couples'});

  factory QueryMyCouplemyCouple.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return QueryMyCouplemyCouple(id: (l$id as String), $__typename: (l$$__typename as String));
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyCouplemyCouple || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}
