// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryCoupleTouchSetting {
  QueryCoupleTouchSetting({this.myCouple, this.$__typename = 'Query'});

  factory QueryCoupleTouchSetting.fromJson(Map<String, dynamic> json) {
    final l$myCouple = json['myCouple'];
    final l$$__typename = json['__typename'];
    return QueryCoupleTouchSetting(
      myCouple: l$myCouple == null
          ? null
          : QueryCoupleTouchSettingmyCouple.fromJson((l$myCouple as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCoupleTouchSettingmyCouple? myCouple;

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
    if (other is! QueryCoupleTouchSetting || runtimeType != other.runtimeType) {
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

const documentNodeQueryCoupleTouchSetting = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'CoupleTouchSetting'),
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
                  name: NameNode(value: 'touchTopicsEnabled'),
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
QueryCoupleTouchSetting _parserFnQueryCoupleTouchSetting(Map<String, dynamic> data) =>
    QueryCoupleTouchSetting.fromJson(data);
typedef OnQueryCompleteQueryCoupleTouchSetting = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryCoupleTouchSetting?,
);

class OptionsQueryCoupleTouchSetting extends graphql.QueryOptions<QueryCoupleTouchSetting> {
  OptionsQueryCoupleTouchSetting({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCoupleTouchSetting? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryCoupleTouchSetting? onComplete,
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
                   onComplete(data, data == null ? null : _parserFnQueryCoupleTouchSetting(data)),
         onError: onError,
         document: documentNodeQueryCoupleTouchSetting,
         parserFn: _parserFnQueryCoupleTouchSetting,
       );

  final OnQueryCompleteQueryCoupleTouchSetting? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryCoupleTouchSetting
    extends graphql.WatchQueryOptions<QueryCoupleTouchSetting> {
  WatchOptionsQueryCoupleTouchSetting({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCoupleTouchSetting? typedOptimisticResult,
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
         document: documentNodeQueryCoupleTouchSetting,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryCoupleTouchSetting,
       );
}

class FetchMoreOptionsQueryCoupleTouchSetting extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryCoupleTouchSetting({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryCoupleTouchSetting);
}

extension ClientExtensionQueryCoupleTouchSetting on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryCoupleTouchSetting>> queryCoupleTouchSetting([
    OptionsQueryCoupleTouchSetting? options,
  ]) async => await this.query(options ?? OptionsQueryCoupleTouchSetting());

  graphql.ObservableQuery<QueryCoupleTouchSetting> watchQueryCoupleTouchSetting([
    WatchOptionsQueryCoupleTouchSetting? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryCoupleTouchSetting());

  void writeQueryCoupleTouchSetting({
    required QueryCoupleTouchSetting data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(operation: graphql.Operation(document: documentNodeQueryCoupleTouchSetting)),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryCoupleTouchSetting? readQueryCoupleTouchSetting({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryCoupleTouchSetting)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryCoupleTouchSetting.fromJson(result);
  }
}

class QueryCoupleTouchSettingmyCouple {
  QueryCoupleTouchSettingmyCouple({
    required this.id,
    required this.touchTopicsEnabled,
    this.$__typename = 'Couples',
  });

  factory QueryCoupleTouchSettingmyCouple.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$touchTopicsEnabled = json['touchTopicsEnabled'];
    final l$$__typename = json['__typename'];
    return QueryCoupleTouchSettingmyCouple(
      id: (l$id as String),
      touchTopicsEnabled: (l$touchTopicsEnabled as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final bool touchTopicsEnabled;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$touchTopicsEnabled = touchTopicsEnabled;
    _resultData['touchTopicsEnabled'] = l$touchTopicsEnabled;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$touchTopicsEnabled = touchTopicsEnabled;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$touchTopicsEnabled, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCoupleTouchSettingmyCouple || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$touchTopicsEnabled = touchTopicsEnabled;
    final lOther$touchTopicsEnabled = other.touchTopicsEnabled;
    if (l$touchTopicsEnabled != lOther$touchTopicsEnabled) {
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
