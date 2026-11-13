// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQuerySentPartnerMessages {
  factory VariablesQuerySentPartnerMessages({required String senderId}) =>
      VariablesQuerySentPartnerMessages._({r'senderId': senderId});

  VariablesQuerySentPartnerMessages._(this._$data);

  factory VariablesQuerySentPartnerMessages.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$senderId = data['senderId'];
    result$data['senderId'] = (l$senderId as String);
    return VariablesQuerySentPartnerMessages._(result$data);
  }

  Map<String, dynamic> _$data;

  String get senderId => (_$data['senderId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$senderId = senderId;
    result$data['senderId'] = l$senderId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQuerySentPartnerMessages || runtimeType != other.runtimeType) {
      return false;
    }
    final l$senderId = senderId;
    final lOther$senderId = other.senderId;
    if (l$senderId != lOther$senderId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$senderId = senderId;
    return Object.hashAll([l$senderId]);
  }
}

class QuerySentPartnerMessages {
  QuerySentPartnerMessages({required this.partnerMessagesCollection, this.$__typename = 'Query'});

  factory QuerySentPartnerMessages.fromJson(Map<String, dynamic> json) {
    final l$partnerMessagesCollection = json['partnerMessagesCollection'];
    final l$$__typename = json['__typename'];
    return QuerySentPartnerMessages(
      partnerMessagesCollection: QuerySentPartnerMessagespartnerMessagesCollection.fromJson(
        (l$partnerMessagesCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QuerySentPartnerMessagespartnerMessagesCollection partnerMessagesCollection;

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
    if (other is! QuerySentPartnerMessages || runtimeType != other.runtimeType) {
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

const documentNodeQuerySentPartnerMessages = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'SentPartnerMessages'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'senderId')),
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
                      name: NameNode(value: 'senderId'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'senderId')),
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
                value: IntValueNode(value: '30'),
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
                              name: NameNode(value: 'body'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'mediaPath'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'forWidget'),
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
QuerySentPartnerMessages _parserFnQuerySentPartnerMessages(Map<String, dynamic> data) =>
    QuerySentPartnerMessages.fromJson(data);
typedef OnQueryCompleteQuerySentPartnerMessages = FutureOr<void> Function(
  Map<String, dynamic>?,
  QuerySentPartnerMessages?,
);

class OptionsQuerySentPartnerMessages extends graphql.QueryOptions<QuerySentPartnerMessages> {
  OptionsQuerySentPartnerMessages({
    String? operationName,
    required VariablesQuerySentPartnerMessages variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QuerySentPartnerMessages? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQuerySentPartnerMessages? onComplete,
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
                   onComplete(data, data == null ? null : _parserFnQuerySentPartnerMessages(data)),
         onError: onError,
         document: documentNodeQuerySentPartnerMessages,
         parserFn: _parserFnQuerySentPartnerMessages,
       );

  final OnQueryCompleteQuerySentPartnerMessages? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQuerySentPartnerMessages
    extends graphql.WatchQueryOptions<QuerySentPartnerMessages> {
  WatchOptionsQuerySentPartnerMessages({
    String? operationName,
    required VariablesQuerySentPartnerMessages variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QuerySentPartnerMessages? typedOptimisticResult,
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
         document: documentNodeQuerySentPartnerMessages,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQuerySentPartnerMessages,
       );
}

class FetchMoreOptionsQuerySentPartnerMessages extends graphql.FetchMoreOptions {
  FetchMoreOptionsQuerySentPartnerMessages({
    required graphql.UpdateQuery updateQuery,
    required VariablesQuerySentPartnerMessages variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQuerySentPartnerMessages,
       );
}

extension ClientExtensionQuerySentPartnerMessages on graphql.GraphQLClient {
  Future<graphql.QueryResult<QuerySentPartnerMessages>> querySentPartnerMessages(
    OptionsQuerySentPartnerMessages options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QuerySentPartnerMessages> watchQuerySentPartnerMessages(
    WatchOptionsQuerySentPartnerMessages options,
  ) => this.watchQuery(options);

  void writeQuerySentPartnerMessages({
    required QuerySentPartnerMessages data,
    required VariablesQuerySentPartnerMessages variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQuerySentPartnerMessages),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QuerySentPartnerMessages? readQuerySentPartnerMessages({
    required VariablesQuerySentPartnerMessages variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerySentPartnerMessages),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QuerySentPartnerMessages.fromJson(result);
  }
}

class QuerySentPartnerMessagespartnerMessagesCollection {
  QuerySentPartnerMessagespartnerMessagesCollection({
    required this.edges,
    this.$__typename = 'PartnerMessagesConnection',
  });

  factory QuerySentPartnerMessagespartnerMessagesCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QuerySentPartnerMessagespartnerMessagesCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QuerySentPartnerMessagespartnerMessagesCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QuerySentPartnerMessagespartnerMessagesCollectionedges> edges;

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
    if (other is! QuerySentPartnerMessagespartnerMessagesCollection ||
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

class QuerySentPartnerMessagespartnerMessagesCollectionedges {
  QuerySentPartnerMessagespartnerMessagesCollectionedges({
    required this.node,
    this.$__typename = 'PartnerMessagesEdge',
  });

  factory QuerySentPartnerMessagespartnerMessagesCollectionedges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QuerySentPartnerMessagespartnerMessagesCollectionedges(
      node: QuerySentPartnerMessagespartnerMessagesCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QuerySentPartnerMessagespartnerMessagesCollectionedgesnode node;

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
    if (other is! QuerySentPartnerMessagespartnerMessagesCollectionedges ||
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

class QuerySentPartnerMessagespartnerMessagesCollectionedgesnode {
  QuerySentPartnerMessagespartnerMessagesCollectionedgesnode({
    required this.id,
    required this.kind,
    this.body,
    this.mediaPath,
    required this.forWidget,
    required this.createdAt,
    this.$__typename = 'PartnerMessages',
  });

  factory QuerySentPartnerMessagespartnerMessagesCollectionedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$kind = json['kind'];
    final l$body = json['body'];
    final l$mediaPath = json['mediaPath'];
    final l$forWidget = json['forWidget'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return QuerySentPartnerMessagespartnerMessagesCollectionedgesnode(
      id: (l$id as String),
      kind: (l$kind as String),
      body: (l$body as String?),
      mediaPath: (l$mediaPath as String?),
      forWidget: (l$forWidget as bool),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String kind;

  final String? body;

  final String? mediaPath;

  final bool forWidget;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$kind = kind;
    _resultData['kind'] = l$kind;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$mediaPath = mediaPath;
    _resultData['mediaPath'] = l$mediaPath;
    final l$forWidget = forWidget;
    _resultData['forWidget'] = l$forWidget;
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
    final l$body = body;
    final l$mediaPath = mediaPath;
    final l$forWidget = forWidget;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$kind,
      l$body,
      l$mediaPath,
      l$forWidget,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QuerySentPartnerMessagespartnerMessagesCollectionedgesnode ||
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
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$mediaPath = mediaPath;
    final lOther$mediaPath = other.mediaPath;
    if (l$mediaPath != lOther$mediaPath) {
      return false;
    }
    final l$forWidget = forWidget;
    final lOther$forWidget = other.forWidget;
    if (l$forWidget != lOther$forWidget) {
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
