// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryLoveStyleSharedMessage {
  factory VariablesQueryLoveStyleSharedMessage({required String id}) =>
      VariablesQueryLoveStyleSharedMessage._({r'id': id});

  VariablesQueryLoveStyleSharedMessage._(this._$data);

  factory VariablesQueryLoveStyleSharedMessage.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesQueryLoveStyleSharedMessage._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryLoveStyleSharedMessage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

class QueryLoveStyleSharedMessage {
  QueryLoveStyleSharedMessage({
    required this.partnerMessagesCollection,
    this.$__typename = 'Query',
  });

  factory QueryLoveStyleSharedMessage.fromJson(Map<String, dynamic> json) {
    final l$partnerMessagesCollection = json['partnerMessagesCollection'];
    final l$$__typename = json['__typename'];
    return QueryLoveStyleSharedMessage(
      partnerMessagesCollection: QueryLoveStyleSharedMessagepartnerMessagesCollection.fromJson(
        (l$partnerMessagesCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryLoveStyleSharedMessagepartnerMessagesCollection partnerMessagesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$partnerMessagesCollection = partnerMessagesCollection;
    _resultData['partnerMessagesCollection'] = l$partnerMessagesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$partnerMessagesCollection = partnerMessagesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$partnerMessagesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryLoveStyleSharedMessage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$partnerMessagesCollection = partnerMessagesCollection;
    final lOther$partnerMessagesCollection = other.partnerMessagesCollection;
    if (l$partnerMessagesCollection != lOther$partnerMessagesCollection) {
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

const documentNodeQueryLoveStyleSharedMessage = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'LoveStyleSharedMessage'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'partnerMessagesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'id'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'id')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
QueryLoveStyleSharedMessage _parserFnQueryLoveStyleSharedMessage(Map<String, dynamic> data) =>
    QueryLoveStyleSharedMessage.fromJson(data);
typedef OnQueryCompleteQueryLoveStyleSharedMessage = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryLoveStyleSharedMessage?,
);

class OptionsQueryLoveStyleSharedMessage extends graphql.QueryOptions<QueryLoveStyleSharedMessage> {
  OptionsQueryLoveStyleSharedMessage({
    String? operationName,
    required VariablesQueryLoveStyleSharedMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryLoveStyleSharedMessage? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryLoveStyleSharedMessage? onComplete,
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
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFnQueryLoveStyleSharedMessage(data),
               ),
         onError: onError,
         document: documentNodeQueryLoveStyleSharedMessage,
         parserFn: _parserFnQueryLoveStyleSharedMessage,
       );

  final OnQueryCompleteQueryLoveStyleSharedMessage? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryLoveStyleSharedMessage
    extends graphql.WatchQueryOptions<QueryLoveStyleSharedMessage> {
  WatchOptionsQueryLoveStyleSharedMessage({
    String? operationName,
    required VariablesQueryLoveStyleSharedMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryLoveStyleSharedMessage? typedOptimisticResult,
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
         document: documentNodeQueryLoveStyleSharedMessage,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryLoveStyleSharedMessage,
       );
}

class FetchMoreOptionsQueryLoveStyleSharedMessage extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryLoveStyleSharedMessage({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryLoveStyleSharedMessage variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryLoveStyleSharedMessage,
       );
}

extension ClientExtensionQueryLoveStyleSharedMessage on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryLoveStyleSharedMessage>> queryLoveStyleSharedMessage(
    OptionsQueryLoveStyleSharedMessage options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryLoveStyleSharedMessage> watchQueryLoveStyleSharedMessage(
    WatchOptionsQueryLoveStyleSharedMessage options,
  ) => this.watchQuery(options);

  void writeQueryLoveStyleSharedMessage({
    required QueryLoveStyleSharedMessage data,
    required VariablesQueryLoveStyleSharedMessage variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryLoveStyleSharedMessage),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryLoveStyleSharedMessage? readQueryLoveStyleSharedMessage({
    required VariablesQueryLoveStyleSharedMessage variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryLoveStyleSharedMessage),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryLoveStyleSharedMessage.fromJson(result);
  }
}

class QueryLoveStyleSharedMessagepartnerMessagesCollection {
  QueryLoveStyleSharedMessagepartnerMessagesCollection({
    required this.edges,
    this.$__typename = 'PartnerMessagesConnection',
  });

  factory QueryLoveStyleSharedMessagepartnerMessagesCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryLoveStyleSharedMessagepartnerMessagesCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryLoveStyleSharedMessagepartnerMessagesCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryLoveStyleSharedMessagepartnerMessagesCollectionedges> edges;

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
    if (other is! QueryLoveStyleSharedMessagepartnerMessagesCollection ||
        runtimeType != other.runtimeType) {
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

class QueryLoveStyleSharedMessagepartnerMessagesCollectionedges {
  QueryLoveStyleSharedMessagepartnerMessagesCollectionedges({
    required this.node,
    this.$__typename = 'PartnerMessagesEdge',
  });

  factory QueryLoveStyleSharedMessagepartnerMessagesCollectionedges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryLoveStyleSharedMessagepartnerMessagesCollectionedges(
      node: QueryLoveStyleSharedMessagepartnerMessagesCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryLoveStyleSharedMessagepartnerMessagesCollectionedgesnode node;

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
    if (other is! QueryLoveStyleSharedMessagepartnerMessagesCollectionedges ||
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

class QueryLoveStyleSharedMessagepartnerMessagesCollectionedgesnode {
  QueryLoveStyleSharedMessagepartnerMessagesCollectionedgesnode({
    required this.id,
    this.$__typename = 'PartnerMessages',
  });

  factory QueryLoveStyleSharedMessagepartnerMessagesCollectionedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return QueryLoveStyleSharedMessagepartnerMessagesCollectionedgesnode(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
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
    if (other is! QueryLoveStyleSharedMessagepartnerMessagesCollectionedgesnode ||
        runtimeType != other.runtimeType) {
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
