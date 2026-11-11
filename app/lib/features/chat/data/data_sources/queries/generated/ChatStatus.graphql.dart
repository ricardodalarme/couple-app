// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryChatStatus {
  factory VariablesQueryChatStatus({required String profileId}) =>
      VariablesQueryChatStatus._({r'profileId': profileId});

  VariablesQueryChatStatus._(this._$data);

  factory VariablesQueryChatStatus.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profileId = data['profileId'];
    result$data['profileId'] = (l$profileId as String);
    return VariablesQueryChatStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  String get profileId => (_$data['profileId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$profileId = profileId;
    result$data['profileId'] = l$profileId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryChatStatus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    return Object.hashAll([l$profileId]);
  }
}

class QueryChatStatus {
  QueryChatStatus({
    this.chatMessagesLeft,
    required this.appConfigCollection,
    required this.profileSettingsCollection,
    this.$__typename = 'Query',
  });

  factory QueryChatStatus.fromJson(Map<String, dynamic> json) {
    final l$chatMessagesLeft = json['chatMessagesLeft'];
    final l$appConfigCollection = json['appConfigCollection'];
    final l$profileSettingsCollection = json['profileSettingsCollection'];
    final l$$__typename = json['__typename'];
    return QueryChatStatus(
      chatMessagesLeft: (l$chatMessagesLeft as int?),
      appConfigCollection: QueryChatStatusappConfigCollection.fromJson(
        (l$appConfigCollection as Map<String, dynamic>),
      ),
      profileSettingsCollection: QueryChatStatusprofileSettingsCollection.fromJson(
        (l$profileSettingsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final int? chatMessagesLeft;

  final QueryChatStatusappConfigCollection appConfigCollection;

  final QueryChatStatusprofileSettingsCollection profileSettingsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$chatMessagesLeft = chatMessagesLeft;
    _resultData['chatMessagesLeft'] = l$chatMessagesLeft;
    final l$appConfigCollection = appConfigCollection;
    _resultData['appConfigCollection'] = l$appConfigCollection.toJson();
    final l$profileSettingsCollection = profileSettingsCollection;
    _resultData['profileSettingsCollection'] = l$profileSettingsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$chatMessagesLeft = chatMessagesLeft;
    final l$appConfigCollection = appConfigCollection;
    final l$profileSettingsCollection = profileSettingsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$chatMessagesLeft,
      l$appConfigCollection,
      l$profileSettingsCollection,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryChatStatus || runtimeType != other.runtimeType) {
      return false;
    }
    final l$chatMessagesLeft = chatMessagesLeft;
    final lOther$chatMessagesLeft = other.chatMessagesLeft;
    if (l$chatMessagesLeft != lOther$chatMessagesLeft) {
      return false;
    }
    final l$appConfigCollection = appConfigCollection;
    final lOther$appConfigCollection = other.appConfigCollection;
    if (l$appConfigCollection != lOther$appConfigCollection) {
      return false;
    }
    final l$profileSettingsCollection = profileSettingsCollection;
    final lOther$profileSettingsCollection = other.profileSettingsCollection;
    if (l$profileSettingsCollection != lOther$profileSettingsCollection) {
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

const documentNodeQueryChatStatus = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ChatStatus'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'profileId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'chatMessagesLeft'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'appConfigCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'key'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'in'),
                            value: ListValueNode(
                              values: [
                                StringValueNode(
                                  value: 'chat_messages_per_day_plus',
                                  isBlock: false,
                                ),
                                StringValueNode(
                                  value: 'chat_messages_per_day_free',
                                  isBlock: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                              name: NameNode(value: 'key'),
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
            name: NameNode(value: 'profileSettingsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'profileId'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'profileId')),
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
                              name: NameNode(value: 'profileId'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'chatEnabled'),
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
QueryChatStatus _parserFnQueryChatStatus(Map<String, dynamic> data) =>
    QueryChatStatus.fromJson(data);
typedef OnQueryCompleteQueryChatStatus = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryChatStatus?,
);

class OptionsQueryChatStatus extends graphql.QueryOptions<QueryChatStatus> {
  OptionsQueryChatStatus({
    String? operationName,
    required VariablesQueryChatStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryChatStatus? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryChatStatus? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryChatStatus(data)),
         onError: onError,
         document: documentNodeQueryChatStatus,
         parserFn: _parserFnQueryChatStatus,
       );

  final OnQueryCompleteQueryChatStatus? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryChatStatus extends graphql.WatchQueryOptions<QueryChatStatus> {
  WatchOptionsQueryChatStatus({
    String? operationName,
    required VariablesQueryChatStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryChatStatus? typedOptimisticResult,
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
         document: documentNodeQueryChatStatus,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryChatStatus,
       );
}

class FetchMoreOptionsQueryChatStatus extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryChatStatus({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryChatStatus variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryChatStatus,
       );
}

extension ClientExtensionQueryChatStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryChatStatus>> queryChatStatus(
    OptionsQueryChatStatus options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryChatStatus> watchQueryChatStatus(
    WatchOptionsQueryChatStatus options,
  ) => this.watchQuery(options);

  void writeQueryChatStatus({
    required QueryChatStatus data,
    required VariablesQueryChatStatus variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryChatStatus),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryChatStatus? readQueryChatStatus({
    required VariablesQueryChatStatus variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryChatStatus),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryChatStatus.fromJson(result);
  }
}

class QueryChatStatusappConfigCollection {
  QueryChatStatusappConfigCollection({
    required this.edges,
    this.$__typename = 'AppConfigConnection',
  });

  factory QueryChatStatusappConfigCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryChatStatusappConfigCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryChatStatusappConfigCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryChatStatusappConfigCollectionedges> edges;

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
    if (other is! QueryChatStatusappConfigCollection || runtimeType != other.runtimeType) {
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

class QueryChatStatusappConfigCollectionedges {
  QueryChatStatusappConfigCollectionedges({required this.node, this.$__typename = 'AppConfigEdge'});

  factory QueryChatStatusappConfigCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryChatStatusappConfigCollectionedges(
      node: QueryChatStatusappConfigCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryChatStatusappConfigCollectionedgesnode node;

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
    if (other is! QueryChatStatusappConfigCollectionedges || runtimeType != other.runtimeType) {
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

class QueryChatStatusappConfigCollectionedgesnode {
  QueryChatStatusappConfigCollectionedgesnode({
    required this.key,
    required this.value,
    this.$__typename = 'AppConfig',
  });

  factory QueryChatStatusappConfigCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$key = json['key'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return QueryChatStatusappConfigCollectionedgesnode(
      key: (l$key as String),
      value: (l$value as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String key;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$key = key;
    _resultData['key'] = l$key;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$key = key;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([l$key, l$value, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryChatStatusappConfigCollectionedgesnode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$key = key;
    final lOther$key = other.key;
    if (l$key != lOther$key) {
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

class QueryChatStatusprofileSettingsCollection {
  QueryChatStatusprofileSettingsCollection({
    required this.edges,
    this.$__typename = 'ProfileSettingsConnection',
  });

  factory QueryChatStatusprofileSettingsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryChatStatusprofileSettingsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) =>
                QueryChatStatusprofileSettingsCollectionedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryChatStatusprofileSettingsCollectionedges> edges;

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
    if (other is! QueryChatStatusprofileSettingsCollection || runtimeType != other.runtimeType) {
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

class QueryChatStatusprofileSettingsCollectionedges {
  QueryChatStatusprofileSettingsCollectionedges({
    required this.node,
    this.$__typename = 'ProfileSettingsEdge',
  });

  factory QueryChatStatusprofileSettingsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryChatStatusprofileSettingsCollectionedges(
      node: QueryChatStatusprofileSettingsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryChatStatusprofileSettingsCollectionedgesnode node;

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
    if (other is! QueryChatStatusprofileSettingsCollectionedges ||
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

class QueryChatStatusprofileSettingsCollectionedgesnode {
  QueryChatStatusprofileSettingsCollectionedgesnode({
    required this.profileId,
    required this.chatEnabled,
    this.$__typename = 'ProfileSettings',
  });

  factory QueryChatStatusprofileSettingsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$profileId = json['profileId'];
    final l$chatEnabled = json['chatEnabled'];
    final l$$__typename = json['__typename'];
    return QueryChatStatusprofileSettingsCollectionedgesnode(
      profileId: (l$profileId as String),
      chatEnabled: (l$chatEnabled as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String profileId;

  final bool chatEnabled;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$profileId = profileId;
    _resultData['profileId'] = l$profileId;
    final l$chatEnabled = chatEnabled;
    _resultData['chatEnabled'] = l$chatEnabled;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$chatEnabled = chatEnabled;
    final l$$__typename = $__typename;
    return Object.hashAll([l$profileId, l$chatEnabled, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryChatStatusprofileSettingsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$chatEnabled = chatEnabled;
    final lOther$chatEnabled = other.chatEnabled;
    if (l$chatEnabled != lOther$chatEnabled) {
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
