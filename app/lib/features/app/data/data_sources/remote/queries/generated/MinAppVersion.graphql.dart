// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMinAppVersion {
  QueryMinAppVersion({this.appConfigByPk, this.$__typename = 'Query'});

  factory QueryMinAppVersion.fromJson(Map<String, dynamic> json) {
    final l$appConfigByPk = json['appConfigByPk'];
    final l$$__typename = json['__typename'];
    return QueryMinAppVersion(
      appConfigByPk: l$appConfigByPk == null
          ? null
          : QueryMinAppVersionappConfigByPk.fromJson((l$appConfigByPk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMinAppVersionappConfigByPk? appConfigByPk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$appConfigByPk = appConfigByPk;
    _resultData['appConfigByPk'] = l$appConfigByPk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$appConfigByPk = appConfigByPk;
    final l$$__typename = $__typename;
    return Object.hashAll([l$appConfigByPk, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMinAppVersion || runtimeType != other.runtimeType) {
      return false;
    }
    final l$appConfigByPk = appConfigByPk;
    final lOther$appConfigByPk = other.appConfigByPk;
    if (l$appConfigByPk != lOther$appConfigByPk) {
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

const documentNodeQueryMinAppVersion = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MinAppVersion'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'appConfigByPk'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'key'),
                value: StringValueNode(value: 'min_app_version', isBlock: false),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'value'),
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
QueryMinAppVersion _parserFnQueryMinAppVersion(Map<String, dynamic> data) =>
    QueryMinAppVersion.fromJson(data);
typedef OnQueryCompleteQueryMinAppVersion = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMinAppVersion?,
);

class OptionsQueryMinAppVersion extends graphql.QueryOptions<QueryMinAppVersion> {
  OptionsQueryMinAppVersion({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMinAppVersion? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMinAppVersion? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'MinAppVersion',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMinAppVersion(data)),
         onError: onError,
         document: documentNodeQueryMinAppVersion,
         parserFn: _parserFnQueryMinAppVersion,
       );

  final OnQueryCompleteQueryMinAppVersion? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMinAppVersion extends graphql.WatchQueryOptions<QueryMinAppVersion> {
  WatchOptionsQueryMinAppVersion({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMinAppVersion? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'MinAppVersion',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryMinAppVersion,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMinAppVersion,
       );
}

class FetchMoreOptionsQueryMinAppVersion extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMinAppVersion({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMinAppVersion);
}

extension ClientExtensionQueryMinAppVersion on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMinAppVersion>> queryMinAppVersion([
    OptionsQueryMinAppVersion? options,
  ]) async => await this.query(options ?? OptionsQueryMinAppVersion());

  graphql.ObservableQuery<QueryMinAppVersion> watchQueryMinAppVersion([
    WatchOptionsQueryMinAppVersion? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryMinAppVersion());

  void writeQueryMinAppVersion({required QueryMinAppVersion data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryMinAppVersion)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryMinAppVersion? readQueryMinAppVersion({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryMinAppVersion)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMinAppVersion.fromJson(result);
  }
}

class QueryMinAppVersionappConfigByPk {
  QueryMinAppVersionappConfigByPk({required this.value, this.$__typename = 'AppConfig'});

  factory QueryMinAppVersionappConfigByPk.fromJson(Map<String, dynamic> json) {
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return QueryMinAppVersionappConfigByPk(
      value: (l$value as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([l$value, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMinAppVersionappConfigByPk || runtimeType != other.runtimeType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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
