// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryPartnerTimeZone {
  QueryPartnerTimeZone({this.partnerTimeZone, this.$__typename = 'Query'});

  factory QueryPartnerTimeZone.fromJson(Map<String, dynamic> json) {
    final l$partnerTimeZone = json['partnerTimeZone'];
    final l$$__typename = json['__typename'];
    return QueryPartnerTimeZone(
      partnerTimeZone: (l$partnerTimeZone as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? partnerTimeZone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$partnerTimeZone = partnerTimeZone;
    _resultData['partnerTimeZone'] = l$partnerTimeZone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$partnerTimeZone = partnerTimeZone;
    final l$$__typename = $__typename;
    return Object.hashAll([l$partnerTimeZone, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryPartnerTimeZone || runtimeType != other.runtimeType) {
      return false;
    }
    final l$partnerTimeZone = partnerTimeZone;
    final lOther$partnerTimeZone = other.partnerTimeZone;
    if (l$partnerTimeZone != lOther$partnerTimeZone) {
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

const documentNodeQueryPartnerTimeZone = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'PartnerTimeZone'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'partnerTimeZone'),
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
  ],
);
QueryPartnerTimeZone _parserFnQueryPartnerTimeZone(Map<String, dynamic> data) =>
    QueryPartnerTimeZone.fromJson(data);
typedef OnQueryCompleteQueryPartnerTimeZone = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryPartnerTimeZone?,
);

class OptionsQueryPartnerTimeZone extends graphql.QueryOptions<QueryPartnerTimeZone> {
  OptionsQueryPartnerTimeZone({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryPartnerTimeZone? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryPartnerTimeZone? onComplete,
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
             : (data) =>
                   onComplete(data, data == null ? null : _parserFnQueryPartnerTimeZone(data)),
         onError: onError,
         document: documentNodeQueryPartnerTimeZone,
         parserFn: _parserFnQueryPartnerTimeZone,
       );

  final OnQueryCompleteQueryPartnerTimeZone? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryPartnerTimeZone extends graphql.WatchQueryOptions<QueryPartnerTimeZone> {
  WatchOptionsQueryPartnerTimeZone({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryPartnerTimeZone? typedOptimisticResult,
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
         document: documentNodeQueryPartnerTimeZone,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryPartnerTimeZone,
       );
}

class FetchMoreOptionsQueryPartnerTimeZone extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryPartnerTimeZone({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryPartnerTimeZone);
}

extension ClientExtensionQueryPartnerTimeZone on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryPartnerTimeZone>> queryPartnerTimeZone([
    OptionsQueryPartnerTimeZone? options,
  ]) async => await this.query(options ?? OptionsQueryPartnerTimeZone());

  graphql.ObservableQuery<QueryPartnerTimeZone> watchQueryPartnerTimeZone([
    WatchOptionsQueryPartnerTimeZone? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryPartnerTimeZone());

  void writeQueryPartnerTimeZone({required QueryPartnerTimeZone data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryPartnerTimeZone)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryPartnerTimeZone? readQueryPartnerTimeZone({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryPartnerTimeZone)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryPartnerTimeZone.fromJson(result);
  }
}
