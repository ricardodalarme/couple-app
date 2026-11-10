// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryReceivedSignals {
  factory VariablesQueryReceivedSignals({required String recipientId}) =>
      VariablesQueryReceivedSignals._({r'recipientId': recipientId});

  VariablesQueryReceivedSignals._(this._$data);

  factory VariablesQueryReceivedSignals.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$recipientId = data['recipientId'];
    result$data['recipientId'] = (l$recipientId as String);
    return VariablesQueryReceivedSignals._(result$data);
  }

  Map<String, dynamic> _$data;

  String get recipientId => (_$data['recipientId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$recipientId = recipientId;
    result$data['recipientId'] = l$recipientId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryReceivedSignals || runtimeType != other.runtimeType) {
      return false;
    }
    final l$recipientId = recipientId;
    final lOther$recipientId = other.recipientId;
    if (l$recipientId != lOther$recipientId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$recipientId = recipientId;
    return Object.hashAll([l$recipientId]);
  }
}

class QueryReceivedSignals {
  QueryReceivedSignals({required this.signalsCollection, this.$__typename = 'Query'});

  factory QueryReceivedSignals.fromJson(Map<String, dynamic> json) {
    final l$signalsCollection = json['signalsCollection'];
    final l$$__typename = json['__typename'];
    return QueryReceivedSignals(
      signalsCollection: QueryReceivedSignalssignalsCollection.fromJson(
        (l$signalsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryReceivedSignalssignalsCollection signalsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$signalsCollection = signalsCollection;
    _resultData['signalsCollection'] = l$signalsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$signalsCollection = signalsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$signalsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryReceivedSignals || runtimeType != other.runtimeType) {
      return false;
    }
    final l$signalsCollection = signalsCollection;
    final lOther$signalsCollection = other.signalsCollection;
    if (l$signalsCollection != lOther$signalsCollection) {
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

const documentNodeQueryReceivedSignals = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ReceivedSignals'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'recipientId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'signalsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'recipientId'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'recipientId')),
                          ),
                        ],
                      ),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'seenAt'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'is'),
                            value: EnumValueNode(name: NameNode(value: 'NULL')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'createdAt'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '20'),
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
                              name: NameNode(value: 'kind'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'value'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'body'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'createdAt'),
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
QueryReceivedSignals _parserFnQueryReceivedSignals(Map<String, dynamic> data) =>
    QueryReceivedSignals.fromJson(data);
typedef OnQueryCompleteQueryReceivedSignals = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryReceivedSignals?,
);

class OptionsQueryReceivedSignals extends graphql.QueryOptions<QueryReceivedSignals> {
  OptionsQueryReceivedSignals({
    String? operationName,
    required VariablesQueryReceivedSignals variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryReceivedSignals? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryReceivedSignals? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
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
                   onComplete(data, data == null ? null : _parserFnQueryReceivedSignals(data)),
         onError: onError,
         document: documentNodeQueryReceivedSignals,
         parserFn: _parserFnQueryReceivedSignals,
       );

  final OnQueryCompleteQueryReceivedSignals? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryReceivedSignals extends graphql.WatchQueryOptions<QueryReceivedSignals> {
  WatchOptionsQueryReceivedSignals({
    String? operationName,
    required VariablesQueryReceivedSignals variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryReceivedSignals? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryReceivedSignals,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryReceivedSignals,
       );
}

class FetchMoreOptionsQueryReceivedSignals extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryReceivedSignals({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryReceivedSignals variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryReceivedSignals,
       );
}

extension ClientExtensionQueryReceivedSignals on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryReceivedSignals>> queryReceivedSignals(
    OptionsQueryReceivedSignals options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryReceivedSignals> watchQueryReceivedSignals(
    WatchOptionsQueryReceivedSignals options,
  ) => this.watchQuery(options);

  void writeQueryReceivedSignals({
    required QueryReceivedSignals data,
    required VariablesQueryReceivedSignals variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryReceivedSignals),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryReceivedSignals? readQueryReceivedSignals({
    required VariablesQueryReceivedSignals variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryReceivedSignals),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryReceivedSignals.fromJson(result);
  }
}

class QueryReceivedSignalssignalsCollection {
  QueryReceivedSignalssignalsCollection({
    required this.edges,
    this.$__typename = 'SignalsConnection',
  });

  factory QueryReceivedSignalssignalsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryReceivedSignalssignalsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryReceivedSignalssignalsCollectionedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryReceivedSignalssignalsCollectionedges> edges;

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
    if (other is! QueryReceivedSignalssignalsCollection || runtimeType != other.runtimeType) {
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

class QueryReceivedSignalssignalsCollectionedges {
  QueryReceivedSignalssignalsCollectionedges({
    required this.node,
    this.$__typename = 'SignalsEdge',
  });

  factory QueryReceivedSignalssignalsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryReceivedSignalssignalsCollectionedges(
      node: QueryReceivedSignalssignalsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryReceivedSignalssignalsCollectionedgesnode node;

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
    if (other is! QueryReceivedSignalssignalsCollectionedges || runtimeType != other.runtimeType) {
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

class QueryReceivedSignalssignalsCollectionedgesnode {
  QueryReceivedSignalssignalsCollectionedgesnode({
    required this.id,
    required this.kind,
    this.value,
    this.body,
    required this.createdAt,
    this.$__typename = 'Signals',
  });

  factory QueryReceivedSignalssignalsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$kind = json['kind'];
    final l$value = json['value'];
    final l$body = json['body'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return QueryReceivedSignalssignalsCollectionedgesnode(
      id: (l$id as String),
      kind: (l$kind as String),
      value: (l$value as String?),
      body: (l$body as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String kind;

  final String? value;

  final String? body;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$kind = kind;
    _resultData['kind'] = l$kind;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = ((v) => v.toUtc().toIso8601String())(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$kind = kind;
    final l$value = value;
    final l$body = body;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$kind, l$value, l$body, l$createdAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryReceivedSignalssignalsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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
