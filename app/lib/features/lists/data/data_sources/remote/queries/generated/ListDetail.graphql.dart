// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';
import '../../fragments/generated/ListFragment.graphql.dart';
import '../../fragments/generated/ListItemFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryListDetail {
  factory VariablesQueryListDetail({required String id}) => VariablesQueryListDetail._({r'id': id});

  VariablesQueryListDetail._(this._$data);

  factory VariablesQueryListDetail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesQueryListDetail._(result$data);
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
    if (other is! VariablesQueryListDetail || runtimeType != other.runtimeType) {
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

class QueryListDetail {
  QueryListDetail({this.listsByPk, this.$__typename = 'Query'});

  factory QueryListDetail.fromJson(Map<String, dynamic> json) {
    final l$listsByPk = json['listsByPk'];
    final l$$__typename = json['__typename'];
    return QueryListDetail(
      listsByPk: l$listsByPk == null
          ? null
          : QueryListDetaillistsByPk.fromJson((l$listsByPk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryListDetaillistsByPk? listsByPk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$listsByPk = listsByPk;
    _resultData['listsByPk'] = l$listsByPk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$listsByPk = listsByPk;
    final l$$__typename = $__typename;
    return Object.hashAll([l$listsByPk, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryListDetail || runtimeType != other.runtimeType) {
      return false;
    }
    final l$listsByPk = listsByPk;
    final lOther$listsByPk = other.listsByPk;
    if (l$listsByPk != lOther$listsByPk) {
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

const documentNodeQueryListDetail = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ListDetail'),
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
            name: NameNode(value: 'listsByPk'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'ListFragment'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: 'listItemsCollection'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                      name: NameNode(value: 'orderBy'),
                      value: ListValueNode(
                        values: [
                          ObjectValueNode(
                            fields: [
                              ObjectFieldNode(
                                name: NameNode(value: 'position'),
                                value: EnumValueNode(name: NameNode(value: 'AscNullsLast')),
                              ),
                            ],
                          ),
                          ObjectValueNode(
                            fields: [
                              ObjectFieldNode(
                                name: NameNode(value: 'createdAt'),
                                value: EnumValueNode(name: NameNode(value: 'AscNullsLast')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'first'),
                      value: IntValueNode(value: '500'),
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
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'ListItemFragment'),
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
    fragmentDefinitionListFragment,
    fragmentDefinitionListItemFragment,
  ],
);
QueryListDetail _parserFnQueryListDetail(Map<String, dynamic> data) =>
    QueryListDetail.fromJson(data);
typedef OnQueryCompleteQueryListDetail = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryListDetail?,
);

class OptionsQueryListDetail extends graphql.QueryOptions<QueryListDetail> {
  OptionsQueryListDetail({
    String? operationName,
    required VariablesQueryListDetail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryListDetail? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryListDetail? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryListDetail(data)),
         onError: onError,
         document: documentNodeQueryListDetail,
         parserFn: _parserFnQueryListDetail,
       );

  final OnQueryCompleteQueryListDetail? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryListDetail extends graphql.WatchQueryOptions<QueryListDetail> {
  WatchOptionsQueryListDetail({
    String? operationName,
    required VariablesQueryListDetail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryListDetail? typedOptimisticResult,
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
         document: documentNodeQueryListDetail,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryListDetail,
       );
}

class FetchMoreOptionsQueryListDetail extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryListDetail({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryListDetail variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryListDetail,
       );
}

extension ClientExtensionQueryListDetail on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryListDetail>> queryListDetail(
    OptionsQueryListDetail options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryListDetail> watchQueryListDetail(
    WatchOptionsQueryListDetail options,
  ) => this.watchQuery(options);

  void writeQueryListDetail({
    required QueryListDetail data,
    required VariablesQueryListDetail variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryListDetail),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryListDetail? readQueryListDetail({
    required VariablesQueryListDetail variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryListDetail),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryListDetail.fromJson(result);
  }
}

class QueryListDetaillistsByPk implements FragmentListFragment {
  QueryListDetaillistsByPk({
    required this.id,
    required this.title,
    required this.kind,
    this.isMine,
    this.isShared,
    this.$__typename = 'Lists',
    this.listItemsCollection,
  });

  factory QueryListDetaillistsByPk.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$kind = json['kind'];
    final l$isMine = json['isMine'];
    final l$isShared = json['isShared'];
    final l$$__typename = json['__typename'];
    final l$listItemsCollection = json['listItemsCollection'];
    return QueryListDetaillistsByPk(
      id: (l$id as String),
      title: (l$title as String),
      kind: fromJsonEnumListKind((l$kind as String)),
      isMine: (l$isMine as bool?),
      isShared: (l$isShared as bool?),
      $__typename: (l$$__typename as String),
      listItemsCollection: l$listItemsCollection == null
          ? null
          : QueryListDetaillistsByPklistItemsCollection.fromJson(
              (l$listItemsCollection as Map<String, dynamic>),
            ),
    );
  }

  final String id;

  final String title;

  final EnumListKind kind;

  final bool? isMine;

  final bool? isShared;

  final String $__typename;

  final QueryListDetaillistsByPklistItemsCollection? listItemsCollection;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$kind = kind;
    _resultData['kind'] = toJsonEnumListKind(l$kind);
    final l$isMine = isMine;
    _resultData['isMine'] = l$isMine;
    final l$isShared = isShared;
    _resultData['isShared'] = l$isShared;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$listItemsCollection = listItemsCollection;
    _resultData['listItemsCollection'] = l$listItemsCollection?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$kind = kind;
    final l$isMine = isMine;
    final l$isShared = isShared;
    final l$$__typename = $__typename;
    final l$listItemsCollection = listItemsCollection;
    return Object.hashAll([
      l$id,
      l$title,
      l$kind,
      l$isMine,
      l$isShared,
      l$$__typename,
      l$listItemsCollection,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryListDetaillistsByPk || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$isMine = isMine;
    final lOther$isMine = other.isMine;
    if (l$isMine != lOther$isMine) {
      return false;
    }
    final l$isShared = isShared;
    final lOther$isShared = other.isShared;
    if (l$isShared != lOther$isShared) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$listItemsCollection = listItemsCollection;
    final lOther$listItemsCollection = other.listItemsCollection;
    if (l$listItemsCollection != lOther$listItemsCollection) {
      return false;
    }
    return true;
  }
}

class QueryListDetaillistsByPklistItemsCollection {
  QueryListDetaillistsByPklistItemsCollection({
    required this.edges,
    this.$__typename = 'ListItemsConnection',
  });

  factory QueryListDetaillistsByPklistItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryListDetaillistsByPklistItemsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryListDetaillistsByPklistItemsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryListDetaillistsByPklistItemsCollectionedges> edges;

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
    if (other is! QueryListDetaillistsByPklistItemsCollection || runtimeType != other.runtimeType) {
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

class QueryListDetaillistsByPklistItemsCollectionedges {
  QueryListDetaillistsByPklistItemsCollectionedges({
    required this.node,
    this.$__typename = 'ListItemsEdge',
  });

  factory QueryListDetaillistsByPklistItemsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryListDetaillistsByPklistItemsCollectionedges(
      node: FragmentListItemFragment.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentListItemFragment node;

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
    if (other is! QueryListDetaillistsByPklistItemsCollectionedges ||
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
