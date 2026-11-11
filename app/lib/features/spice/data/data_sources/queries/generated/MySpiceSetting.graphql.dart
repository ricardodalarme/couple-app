// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryMySpiceSetting {
  factory VariablesQueryMySpiceSetting({required String profileId}) =>
      VariablesQueryMySpiceSetting._({r'profileId': profileId});

  VariablesQueryMySpiceSetting._(this._$data);

  factory VariablesQueryMySpiceSetting.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profileId = data['profileId'];
    result$data['profileId'] = (l$profileId as String);
    return VariablesQueryMySpiceSetting._(result$data);
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
    if (other is! VariablesQueryMySpiceSetting || runtimeType != other.runtimeType) {
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

class QueryMySpiceSetting {
  QueryMySpiceSetting({required this.profileSettingsCollection, this.$__typename = 'Query'});

  factory QueryMySpiceSetting.fromJson(Map<String, dynamic> json) {
    final l$profileSettingsCollection = json['profileSettingsCollection'];
    final l$$__typename = json['__typename'];
    return QueryMySpiceSetting(
      profileSettingsCollection: QueryMySpiceSettingprofileSettingsCollection.fromJson(
        (l$profileSettingsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMySpiceSettingprofileSettingsCollection profileSettingsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$profileSettingsCollection = profileSettingsCollection;
    _resultData['profileSettingsCollection'] = l$profileSettingsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$profileSettingsCollection = profileSettingsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$profileSettingsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMySpiceSetting || runtimeType != other.runtimeType) {
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

const documentNodeQueryMySpiceSetting = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MySpiceSetting'),
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
                              name: NameNode(value: 'spiceEnabled'),
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
QueryMySpiceSetting _parserFnQueryMySpiceSetting(Map<String, dynamic> data) =>
    QueryMySpiceSetting.fromJson(data);
typedef OnQueryCompleteQueryMySpiceSetting = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMySpiceSetting?,
);

class OptionsQueryMySpiceSetting extends graphql.QueryOptions<QueryMySpiceSetting> {
  OptionsQueryMySpiceSetting({
    String? operationName,
    required VariablesQueryMySpiceSetting variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMySpiceSetting? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMySpiceSetting? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMySpiceSetting(data)),
         onError: onError,
         document: documentNodeQueryMySpiceSetting,
         parserFn: _parserFnQueryMySpiceSetting,
       );

  final OnQueryCompleteQueryMySpiceSetting? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMySpiceSetting extends graphql.WatchQueryOptions<QueryMySpiceSetting> {
  WatchOptionsQueryMySpiceSetting({
    String? operationName,
    required VariablesQueryMySpiceSetting variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMySpiceSetting? typedOptimisticResult,
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
         document: documentNodeQueryMySpiceSetting,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMySpiceSetting,
       );
}

class FetchMoreOptionsQueryMySpiceSetting extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMySpiceSetting({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryMySpiceSetting variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryMySpiceSetting,
       );
}

extension ClientExtensionQueryMySpiceSetting on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMySpiceSetting>> queryMySpiceSetting(
    OptionsQueryMySpiceSetting options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryMySpiceSetting> watchQueryMySpiceSetting(
    WatchOptionsQueryMySpiceSetting options,
  ) => this.watchQuery(options);

  void writeQueryMySpiceSetting({
    required QueryMySpiceSetting data,
    required VariablesQueryMySpiceSetting variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMySpiceSetting),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryMySpiceSetting? readQueryMySpiceSetting({
    required VariablesQueryMySpiceSetting variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMySpiceSetting),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMySpiceSetting.fromJson(result);
  }
}

class QueryMySpiceSettingprofileSettingsCollection {
  QueryMySpiceSettingprofileSettingsCollection({
    required this.edges,
    this.$__typename = 'ProfileSettingsConnection',
  });

  factory QueryMySpiceSettingprofileSettingsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryMySpiceSettingprofileSettingsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryMySpiceSettingprofileSettingsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryMySpiceSettingprofileSettingsCollectionedges> edges;

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
    if (other is! QueryMySpiceSettingprofileSettingsCollection ||
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

class QueryMySpiceSettingprofileSettingsCollectionedges {
  QueryMySpiceSettingprofileSettingsCollectionedges({
    required this.node,
    this.$__typename = 'ProfileSettingsEdge',
  });

  factory QueryMySpiceSettingprofileSettingsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryMySpiceSettingprofileSettingsCollectionedges(
      node: QueryMySpiceSettingprofileSettingsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMySpiceSettingprofileSettingsCollectionedgesnode node;

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
    if (other is! QueryMySpiceSettingprofileSettingsCollectionedges ||
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

class QueryMySpiceSettingprofileSettingsCollectionedgesnode {
  QueryMySpiceSettingprofileSettingsCollectionedgesnode({
    required this.profileId,
    required this.spiceEnabled,
    this.$__typename = 'ProfileSettings',
  });

  factory QueryMySpiceSettingprofileSettingsCollectionedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$profileId = json['profileId'];
    final l$spiceEnabled = json['spiceEnabled'];
    final l$$__typename = json['__typename'];
    return QueryMySpiceSettingprofileSettingsCollectionedgesnode(
      profileId: (l$profileId as String),
      spiceEnabled: (l$spiceEnabled as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String profileId;

  final bool spiceEnabled;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$profileId = profileId;
    _resultData['profileId'] = l$profileId;
    final l$spiceEnabled = spiceEnabled;
    _resultData['spiceEnabled'] = l$spiceEnabled;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$spiceEnabled = spiceEnabled;
    final l$$__typename = $__typename;
    return Object.hashAll([l$profileId, l$spiceEnabled, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMySpiceSettingprofileSettingsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$spiceEnabled = spiceEnabled;
    final lOther$spiceEnabled = other.spiceEnabled;
    if (l$spiceEnabled != lOther$spiceEnabled) {
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
