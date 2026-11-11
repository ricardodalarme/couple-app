// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryCoupleTouchSetting {
  QueryCoupleTouchSetting({required this.couplesCollection, this.$__typename = 'Query'});

  factory QueryCoupleTouchSetting.fromJson(Map<String, dynamic> json) {
    final l$couplesCollection = json['couplesCollection'];
    final l$$__typename = json['__typename'];
    return QueryCoupleTouchSetting(
      couplesCollection: QueryCoupleTouchSettingcouplesCollection.fromJson(
        (l$couplesCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCoupleTouchSettingcouplesCollection couplesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$couplesCollection = couplesCollection;
    _resultData['couplesCollection'] = l$couplesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$couplesCollection = couplesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$couplesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCoupleTouchSetting || runtimeType != other.runtimeType) {
      return false;
    }
    final l$couplesCollection = couplesCollection;
    final lOther$couplesCollection = other.couplesCollection;
    if (l$couplesCollection != lOther$couplesCollection) {
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
            name: NameNode(value: 'couplesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '1'),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'node'),
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

class QueryCoupleTouchSettingcouplesCollection {
  QueryCoupleTouchSettingcouplesCollection({
    required this.edges,
    this.$__typename = 'CouplesConnection',
  });

  factory QueryCoupleTouchSettingcouplesCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryCoupleTouchSettingcouplesCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) =>
                QueryCoupleTouchSettingcouplesCollectionedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryCoupleTouchSettingcouplesCollectionedges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCoupleTouchSettingcouplesCollection || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

class QueryCoupleTouchSettingcouplesCollectionedges {
  QueryCoupleTouchSettingcouplesCollectionedges({
    required this.node,
    this.$__typename = 'CouplesEdge',
  });

  factory QueryCoupleTouchSettingcouplesCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryCoupleTouchSettingcouplesCollectionedges(
      node: QueryCoupleTouchSettingcouplesCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCoupleTouchSettingcouplesCollectionedgesnode node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCoupleTouchSettingcouplesCollectionedges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
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

class QueryCoupleTouchSettingcouplesCollectionedgesnode {
  QueryCoupleTouchSettingcouplesCollectionedgesnode({
    required this.id,
    required this.touchTopicsEnabled,
    this.$__typename = 'Couples',
  });

  factory QueryCoupleTouchSettingcouplesCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$touchTopicsEnabled = json['touchTopicsEnabled'];
    final l$$__typename = json['__typename'];
    return QueryCoupleTouchSettingcouplesCollectionedgesnode(
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
    if (other is! QueryCoupleTouchSettingcouplesCollectionedgesnode ||
        runtimeType != other.runtimeType) {
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
