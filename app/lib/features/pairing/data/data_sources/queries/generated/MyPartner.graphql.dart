// dart format width=100
import '../../../../../profile/data/data_sources/fragments/generated/ProfileFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMyPartner {
  QueryMyPartner({this.myPartner, this.$__typename = 'Query'});

  factory QueryMyPartner.fromJson(Map<String, dynamic> json) {
    final l$myPartner = json['myPartner'];
    final l$$__typename = json['__typename'];
    return QueryMyPartner(
      myPartner: l$myPartner == null
          ? null
          : FragmentProfileFragment.fromJson((l$myPartner as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentProfileFragment? myPartner;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myPartner = myPartner;
    _resultData['myPartner'] = l$myPartner?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myPartner = myPartner;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myPartner, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyPartner || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myPartner = myPartner;
    final lOther$myPartner = other.myPartner;
    if (l$myPartner != lOther$myPartner) {
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

const documentNodeQueryMyPartner = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyPartner'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myPartner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'ProfileFragment'),
                  directives: [],
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
    fragmentDefinitionProfileFragment,
  ],
);
QueryMyPartner _parserFnQueryMyPartner(Map<String, dynamic> data) => QueryMyPartner.fromJson(data);
typedef OnQueryCompleteQueryMyPartner = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMyPartner?,
);

class OptionsQueryMyPartner extends graphql.QueryOptions<QueryMyPartner> {
  OptionsQueryMyPartner({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyPartner? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMyPartner? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMyPartner(data)),
         onError: onError,
         document: documentNodeQueryMyPartner,
         parserFn: _parserFnQueryMyPartner,
       );

  final OnQueryCompleteQueryMyPartner? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMyPartner extends graphql.WatchQueryOptions<QueryMyPartner> {
  WatchOptionsQueryMyPartner({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyPartner? typedOptimisticResult,
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
         document: documentNodeQueryMyPartner,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMyPartner,
       );
}

class FetchMoreOptionsQueryMyPartner extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMyPartner({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMyPartner);
}

extension ClientExtensionQueryMyPartner on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMyPartner>> queryMyPartner([
    OptionsQueryMyPartner? options,
  ]) async => await this.query(options ?? OptionsQueryMyPartner());

  graphql.ObservableQuery<QueryMyPartner> watchQueryMyPartner([
    WatchOptionsQueryMyPartner? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryMyPartner());

  void writeQueryMyPartner({required QueryMyPartner data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyPartner)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryMyPartner? readQueryMyPartner({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyPartner)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMyPartner.fromJson(result);
  }
}
