// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQuerySlipDetail {
  factory VariablesQuerySlipDetail({required String id}) => VariablesQuerySlipDetail._({r'id': id});

  VariablesQuerySlipDetail._(this._$data);

  factory VariablesQuerySlipDetail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesQuerySlipDetail._(result$data);
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
    if (other is! VariablesQuerySlipDetail || runtimeType != other.runtimeType) {
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

class QuerySlipDetail {
  QuerySlipDetail({this.slipsByPk, this.$__typename = 'Query'});

  factory QuerySlipDetail.fromJson(Map<String, dynamic> json) {
    final l$slipsByPk = json['slipsByPk'];
    final l$$__typename = json['__typename'];
    return QuerySlipDetail(
      slipsByPk: l$slipsByPk == null
          ? null
          : QuerySlipDetailslipsByPk.fromJson((l$slipsByPk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QuerySlipDetailslipsByPk? slipsByPk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$slipsByPk = slipsByPk;
    _resultData['slipsByPk'] = l$slipsByPk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$slipsByPk = slipsByPk;
    final l$$__typename = $__typename;
    return Object.hashAll([l$slipsByPk, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QuerySlipDetail || runtimeType != other.runtimeType) {
      return false;
    }
    final l$slipsByPk = slipsByPk;
    final lOther$slipsByPk = other.slipsByPk;
    if (l$slipsByPk != lOther$slipsByPk) {
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

const documentNodeQuerySlipDetail = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'SlipDetail'),
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
            name: NameNode(value: 'slipsByPk'),
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
                FieldNode(
                  name: NameNode(value: 'id'),
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
                  name: NameNode(value: 'kind'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'feeling'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'planNote'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'forCard'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'category'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'workArea'),
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
                  name: NameNode(value: 'archivedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'deletedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'inJar'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cardItemsCollection'),
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
  ],
);
QuerySlipDetail _parserFnQuerySlipDetail(Map<String, dynamic> data) =>
    QuerySlipDetail.fromJson(data);
typedef OnQueryCompleteQuerySlipDetail = FutureOr<void> Function(
  Map<String, dynamic>?,
  QuerySlipDetail?,
);

class OptionsQuerySlipDetail extends graphql.QueryOptions<QuerySlipDetail> {
  OptionsQuerySlipDetail({
    String? operationName,
    required VariablesQuerySlipDetail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QuerySlipDetail? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQuerySlipDetail? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQuerySlipDetail(data)),
         onError: onError,
         document: documentNodeQuerySlipDetail,
         parserFn: _parserFnQuerySlipDetail,
       );

  final OnQueryCompleteQuerySlipDetail? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQuerySlipDetail extends graphql.WatchQueryOptions<QuerySlipDetail> {
  WatchOptionsQuerySlipDetail({
    String? operationName,
    required VariablesQuerySlipDetail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QuerySlipDetail? typedOptimisticResult,
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
         document: documentNodeQuerySlipDetail,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQuerySlipDetail,
       );
}

class FetchMoreOptionsQuerySlipDetail extends graphql.FetchMoreOptions {
  FetchMoreOptionsQuerySlipDetail({
    required graphql.UpdateQuery updateQuery,
    required VariablesQuerySlipDetail variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQuerySlipDetail,
       );
}

extension ClientExtensionQuerySlipDetail on graphql.GraphQLClient {
  Future<graphql.QueryResult<QuerySlipDetail>> querySlipDetail(
    OptionsQuerySlipDetail options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QuerySlipDetail> watchQuerySlipDetail(
    WatchOptionsQuerySlipDetail options,
  ) => this.watchQuery(options);

  void writeQuerySlipDetail({
    required QuerySlipDetail data,
    required VariablesQuerySlipDetail variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQuerySlipDetail),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QuerySlipDetail? readQuerySlipDetail({
    required VariablesQuerySlipDetail variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerySlipDetail),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QuerySlipDetail.fromJson(result);
  }
}

class QuerySlipDetailslipsByPk {
  QuerySlipDetailslipsByPk({
    required this.id,
    required this.body,
    required this.kind,
    this.feeling,
    this.planNote,
    required this.forCard,
    this.category,
    this.workArea,
    required this.createdAt,
    this.archivedAt,
    this.deletedAt,
    required this.inJar,
    this.cardItemsCollection,
    this.$__typename = 'Slips',
  });

  factory QuerySlipDetailslipsByPk.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$body = json['body'];
    final l$kind = json['kind'];
    final l$feeling = json['feeling'];
    final l$planNote = json['planNote'];
    final l$forCard = json['forCard'];
    final l$category = json['category'];
    final l$workArea = json['workArea'];
    final l$createdAt = json['createdAt'];
    final l$archivedAt = json['archivedAt'];
    final l$deletedAt = json['deletedAt'];
    final l$inJar = json['inJar'];
    final l$cardItemsCollection = json['cardItemsCollection'];
    final l$$__typename = json['__typename'];
    return QuerySlipDetailslipsByPk(
      id: (l$id as String),
      body: (l$body as String),
      kind: fromJsonEnumSlipKind((l$kind as String)),
      feeling: (l$feeling as String?),
      planNote: (l$planNote as String?),
      forCard: (l$forCard as bool),
      category: l$category == null ? null : fromJsonEnumSlipCategory((l$category as String)),
      workArea: l$workArea == null ? null : fromJsonEnumWorkArea((l$workArea as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      archivedAt: l$archivedAt == null ? null : DateTime.parse((l$archivedAt as String)),
      deletedAt: l$deletedAt == null ? null : DateTime.parse((l$deletedAt as String)),
      inJar: (l$inJar as bool),
      cardItemsCollection: l$cardItemsCollection == null
          ? null
          : QuerySlipDetailslipsByPkcardItemsCollection.fromJson(
              (l$cardItemsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String body;

  final EnumSlipKind kind;

  final String? feeling;

  final String? planNote;

  final bool forCard;

  final EnumSlipCategory? category;

  final EnumWorkArea? workArea;

  final DateTime createdAt;

  final DateTime? archivedAt;

  final DateTime? deletedAt;

  final bool inJar;

  final QuerySlipDetailslipsByPkcardItemsCollection? cardItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$kind = kind;
    _resultData['kind'] = toJsonEnumSlipKind(l$kind);
    final l$feeling = feeling;
    _resultData['feeling'] = l$feeling;
    final l$planNote = planNote;
    _resultData['planNote'] = l$planNote;
    final l$forCard = forCard;
    _resultData['forCard'] = l$forCard;
    final l$category = category;
    _resultData['category'] = l$category == null ? null : toJsonEnumSlipCategory(l$category);
    final l$workArea = workArea;
    _resultData['workArea'] = l$workArea == null ? null : toJsonEnumWorkArea(l$workArea);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = ((v) => v.toUtc().toIso8601String())(l$createdAt);
    final l$archivedAt = archivedAt;
    _resultData['archivedAt'] = l$archivedAt == null
        ? null
        : ((v) => v.toUtc().toIso8601String())(l$archivedAt);
    final l$deletedAt = deletedAt;
    _resultData['deletedAt'] = l$deletedAt == null
        ? null
        : ((v) => v.toUtc().toIso8601String())(l$deletedAt);
    final l$inJar = inJar;
    _resultData['inJar'] = l$inJar;
    final l$cardItemsCollection = cardItemsCollection;
    _resultData['cardItemsCollection'] = l$cardItemsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$body = body;
    final l$kind = kind;
    final l$feeling = feeling;
    final l$planNote = planNote;
    final l$forCard = forCard;
    final l$category = category;
    final l$workArea = workArea;
    final l$createdAt = createdAt;
    final l$archivedAt = archivedAt;
    final l$deletedAt = deletedAt;
    final l$inJar = inJar;
    final l$cardItemsCollection = cardItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$body,
      l$kind,
      l$feeling,
      l$planNote,
      l$forCard,
      l$category,
      l$workArea,
      l$createdAt,
      l$archivedAt,
      l$deletedAt,
      l$inJar,
      l$cardItemsCollection,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QuerySlipDetailslipsByPk || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$feeling = feeling;
    final lOther$feeling = other.feeling;
    if (l$feeling != lOther$feeling) {
      return false;
    }
    final l$planNote = planNote;
    final lOther$planNote = other.planNote;
    if (l$planNote != lOther$planNote) {
      return false;
    }
    final l$forCard = forCard;
    final lOther$forCard = other.forCard;
    if (l$forCard != lOther$forCard) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$workArea = workArea;
    final lOther$workArea = other.workArea;
    if (l$workArea != lOther$workArea) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$archivedAt = archivedAt;
    final lOther$archivedAt = other.archivedAt;
    if (l$archivedAt != lOther$archivedAt) {
      return false;
    }
    final l$deletedAt = deletedAt;
    final lOther$deletedAt = other.deletedAt;
    if (l$deletedAt != lOther$deletedAt) {
      return false;
    }
    final l$inJar = inJar;
    final lOther$inJar = other.inJar;
    if (l$inJar != lOther$inJar) {
      return false;
    }
    final l$cardItemsCollection = cardItemsCollection;
    final lOther$cardItemsCollection = other.cardItemsCollection;
    if (l$cardItemsCollection != lOther$cardItemsCollection) {
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

class QuerySlipDetailslipsByPkcardItemsCollection {
  QuerySlipDetailslipsByPkcardItemsCollection({
    required this.edges,
    this.$__typename = 'CardItemsConnection',
  });

  factory QuerySlipDetailslipsByPkcardItemsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QuerySlipDetailslipsByPkcardItemsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QuerySlipDetailslipsByPkcardItemsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QuerySlipDetailslipsByPkcardItemsCollectionedges> edges;

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
    if (other is! QuerySlipDetailslipsByPkcardItemsCollection || runtimeType != other.runtimeType) {
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

class QuerySlipDetailslipsByPkcardItemsCollectionedges {
  QuerySlipDetailslipsByPkcardItemsCollectionedges({
    required this.node,
    this.$__typename = 'CardItemsEdge',
  });

  factory QuerySlipDetailslipsByPkcardItemsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QuerySlipDetailslipsByPkcardItemsCollectionedges(
      node: QuerySlipDetailslipsByPkcardItemsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QuerySlipDetailslipsByPkcardItemsCollectionedgesnode node;

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
    if (other is! QuerySlipDetailslipsByPkcardItemsCollectionedges ||
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

class QuerySlipDetailslipsByPkcardItemsCollectionedgesnode {
  QuerySlipDetailslipsByPkcardItemsCollectionedgesnode({
    required this.id,
    this.$__typename = 'CardItems',
  });

  factory QuerySlipDetailslipsByPkcardItemsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return QuerySlipDetailslipsByPkcardItemsCollectionedgesnode(
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
    if (other is! QuerySlipDetailslipsByPkcardItemsCollectionedgesnode ||
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
