// dart format width=100
import '../../../../../_shared/data/data_sources/generated/schema.graphql.dart';
import '../../fragments/generated/CardFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryCardDetail {
  factory VariablesQueryCardDetail({required String id}) => VariablesQueryCardDetail._({r'id': id});

  VariablesQueryCardDetail._(this._$data);

  factory VariablesQueryCardDetail.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesQueryCardDetail._(result$data);
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
    if (other is! VariablesQueryCardDetail || runtimeType != other.runtimeType) {
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

class QueryCardDetail {
  QueryCardDetail({required this.cardsCollection, this.$__typename = 'Query'});

  factory QueryCardDetail.fromJson(Map<String, dynamic> json) {
    final l$cardsCollection = json['cardsCollection'];
    final l$$__typename = json['__typename'];
    return QueryCardDetail(
      cardsCollection: QueryCardDetailcardsCollection.fromJson(
        (l$cardsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCardDetailcardsCollection cardsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cardsCollection = cardsCollection;
    _resultData['cardsCollection'] = l$cardsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cardsCollection = cardsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$cardsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCardDetail || runtimeType != other.runtimeType) {
      return false;
    }
    final l$cardsCollection = cardsCollection;
    final lOther$cardsCollection = other.cardsCollection;
    if (l$cardsCollection != lOther$cardsCollection) {
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

const documentNodeQueryCardDetail = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'CardDetail'),
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
            name: NameNode(value: 'cardsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '1'),
              ),
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
                              name: NameNode(value: 'CardFragment'),
                              directives: [],
                            ),
                            FieldNode(
                              name: NameNode(value: 'authorId'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'author'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(
                                selections: [
                                  FieldNode(
                                    name: NameNode(value: 'displayName'),
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
                              name: NameNode(value: 'recipient'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(
                                selections: [
                                  FieldNode(
                                    name: NameNode(value: 'displayName'),
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
                              name: NameNode(value: 'reaction'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(
                                selections: [
                                  FieldNode(
                                    name: NameNode(value: 'reaction'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'reply'),
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
    fragmentDefinitionCardFragment,
  ],
);
QueryCardDetail _parserFnQueryCardDetail(Map<String, dynamic> data) =>
    QueryCardDetail.fromJson(data);
typedef OnQueryCompleteQueryCardDetail = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryCardDetail?,
);

class OptionsQueryCardDetail extends graphql.QueryOptions<QueryCardDetail> {
  OptionsQueryCardDetail({
    String? operationName,
    required VariablesQueryCardDetail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCardDetail? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryCardDetail? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryCardDetail(data)),
         onError: onError,
         document: documentNodeQueryCardDetail,
         parserFn: _parserFnQueryCardDetail,
       );

  final OnQueryCompleteQueryCardDetail? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryCardDetail extends graphql.WatchQueryOptions<QueryCardDetail> {
  WatchOptionsQueryCardDetail({
    String? operationName,
    required VariablesQueryCardDetail variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCardDetail? typedOptimisticResult,
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
         document: documentNodeQueryCardDetail,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryCardDetail,
       );
}

class FetchMoreOptionsQueryCardDetail extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryCardDetail({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryCardDetail variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryCardDetail,
       );
}

extension ClientExtensionQueryCardDetail on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryCardDetail>> queryCardDetail(
    OptionsQueryCardDetail options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryCardDetail> watchQueryCardDetail(
    WatchOptionsQueryCardDetail options,
  ) => this.watchQuery(options);

  void writeQueryCardDetail({
    required QueryCardDetail data,
    required VariablesQueryCardDetail variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryCardDetail),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryCardDetail? readQueryCardDetail({
    required VariablesQueryCardDetail variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryCardDetail),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryCardDetail.fromJson(result);
  }
}

class QueryCardDetailcardsCollection {
  QueryCardDetailcardsCollection({required this.edges, this.$__typename = 'CardsConnection'});

  factory QueryCardDetailcardsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryCardDetailcardsCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryCardDetailcardsCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryCardDetailcardsCollectionedges> edges;

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
    if (other is! QueryCardDetailcardsCollection || runtimeType != other.runtimeType) {
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

class QueryCardDetailcardsCollectionedges {
  QueryCardDetailcardsCollectionedges({required this.node, this.$__typename = 'CardsEdge'});

  factory QueryCardDetailcardsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryCardDetailcardsCollectionedges(
      node: QueryCardDetailcardsCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCardDetailcardsCollectionedgesnode node;

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
    if (other is! QueryCardDetailcardsCollectionedges || runtimeType != other.runtimeType) {
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

class QueryCardDetailcardsCollectionedgesnode implements FragmentCardFragment {
  QueryCardDetailcardsCollectionedgesnode({
    required this.id,
    required this.status,
    this.note,
    required this.weekStart,
    this.sentAt,
    this.items,
    this.$__typename = 'Cards',
    required this.authorId,
    this.author,
    this.recipient,
    this.reaction,
  });

  factory QueryCardDetailcardsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$note = json['note'];
    final l$weekStart = json['weekStart'];
    final l$sentAt = json['sentAt'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    final l$authorId = json['authorId'];
    final l$author = json['author'];
    final l$recipient = json['recipient'];
    final l$reaction = json['reaction'];
    return QueryCardDetailcardsCollectionedgesnode(
      id: (l$id as String),
      status: fromJsonEnumCardStatus((l$status as String)),
      note: (l$note as String?),
      weekStart: DateTime.parse((l$weekStart as String)),
      sentAt: l$sentAt == null ? null : DateTime.parse((l$sentAt as String)),
      items: l$items == null
          ? null
          : QueryCardDetailcardsCollectionedgesnodeitems.fromJson(
              (l$items as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
      authorId: (l$authorId as String),
      author: l$author == null
          ? null
          : QueryCardDetailcardsCollectionedgesnodeauthor.fromJson(
              (l$author as Map<String, dynamic>),
            ),
      recipient: l$recipient == null
          ? null
          : QueryCardDetailcardsCollectionedgesnoderecipient.fromJson(
              (l$recipient as Map<String, dynamic>),
            ),
      reaction: l$reaction == null
          ? null
          : QueryCardDetailcardsCollectionedgesnodereaction.fromJson(
              (l$reaction as Map<String, dynamic>),
            ),
    );
  }

  final String id;

  final EnumCardStatus status;

  final String? note;

  final DateTime weekStart;

  final DateTime? sentAt;

  final QueryCardDetailcardsCollectionedgesnodeitems? items;

  final String $__typename;

  final String authorId;

  final QueryCardDetailcardsCollectionedgesnodeauthor? author;

  final QueryCardDetailcardsCollectionedgesnoderecipient? recipient;

  final QueryCardDetailcardsCollectionedgesnodereaction? reaction;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJsonEnumCardStatus(l$status);
    final l$note = note;
    _resultData['note'] = l$note;
    final l$weekStart = weekStart;
    _resultData['weekStart'] = ((v) => v.toIso8601String().substring(0, 10))(l$weekStart);
    final l$sentAt = sentAt;
    _resultData['sentAt'] = l$sentAt == null
        ? null
        : ((v) => v.toUtc().toIso8601String())(l$sentAt);
    final l$items = items;
    _resultData['items'] = l$items?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$authorId = authorId;
    _resultData['authorId'] = l$authorId;
    final l$author = author;
    _resultData['author'] = l$author?.toJson();
    final l$recipient = recipient;
    _resultData['recipient'] = l$recipient?.toJson();
    final l$reaction = reaction;
    _resultData['reaction'] = l$reaction?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$note = note;
    final l$weekStart = weekStart;
    final l$sentAt = sentAt;
    final l$items = items;
    final l$$__typename = $__typename;
    final l$authorId = authorId;
    final l$author = author;
    final l$recipient = recipient;
    final l$reaction = reaction;
    return Object.hashAll([
      l$id,
      l$status,
      l$note,
      l$weekStart,
      l$sentAt,
      l$items,
      l$$__typename,
      l$authorId,
      l$author,
      l$recipient,
      l$reaction,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCardDetailcardsCollectionedgesnode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$weekStart = weekStart;
    final lOther$weekStart = other.weekStart;
    if (l$weekStart != lOther$weekStart) {
      return false;
    }
    final l$sentAt = sentAt;
    final lOther$sentAt = other.sentAt;
    if (l$sentAt != lOther$sentAt) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$authorId = authorId;
    final lOther$authorId = other.authorId;
    if (l$authorId != lOther$authorId) {
      return false;
    }
    final l$author = author;
    final lOther$author = other.author;
    if (l$author != lOther$author) {
      return false;
    }
    final l$recipient = recipient;
    final lOther$recipient = other.recipient;
    if (l$recipient != lOther$recipient) {
      return false;
    }
    final l$reaction = reaction;
    final lOther$reaction = other.reaction;
    if (l$reaction != lOther$reaction) {
      return false;
    }
    return true;
  }
}

class QueryCardDetailcardsCollectionedgesnodeitems implements FragmentCardFragmentitems {
  QueryCardDetailcardsCollectionedgesnodeitems({
    required this.edges,
    this.$__typename = 'CardItemsConnection',
  });

  factory QueryCardDetailcardsCollectionedgesnodeitems.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryCardDetailcardsCollectionedgesnodeitems(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryCardDetailcardsCollectionedgesnodeitemsedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryCardDetailcardsCollectionedgesnodeitemsedges> edges;

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
    if (other is! QueryCardDetailcardsCollectionedgesnodeitems ||
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

class QueryCardDetailcardsCollectionedgesnodeitemsedges implements FragmentCardFragmentitemsedges {
  QueryCardDetailcardsCollectionedgesnodeitemsedges({
    required this.node,
    this.$__typename = 'CardItemsEdge',
  });

  factory QueryCardDetailcardsCollectionedgesnodeitemsedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryCardDetailcardsCollectionedgesnodeitemsedges(
      node: QueryCardDetailcardsCollectionedgesnodeitemsedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCardDetailcardsCollectionedgesnodeitemsedgesnode node;

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
    if (other is! QueryCardDetailcardsCollectionedgesnodeitemsedges ||
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

class QueryCardDetailcardsCollectionedgesnodeitemsedgesnode
    implements FragmentCardFragmentitemsedgesnode {
  QueryCardDetailcardsCollectionedgesnodeitemsedgesnode({
    this.slipId,
    required this.body,
    required this.position,
    this.slip,
    this.$__typename = 'CardItems',
  });

  factory QueryCardDetailcardsCollectionedgesnodeitemsedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$slipId = json['slipId'];
    final l$body = json['body'];
    final l$position = json['position'];
    final l$slip = json['slip'];
    final l$$__typename = json['__typename'];
    return QueryCardDetailcardsCollectionedgesnodeitemsedgesnode(
      slipId: (l$slipId as String?),
      body: (l$body as String),
      position: (l$position as int),
      slip: l$slip == null
          ? null
          : QueryCardDetailcardsCollectionedgesnodeitemsedgesnodeslip.fromJson(
              (l$slip as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String? slipId;

  final String body;

  final int position;

  final QueryCardDetailcardsCollectionedgesnodeitemsedgesnodeslip? slip;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$slipId = slipId;
    _resultData['slipId'] = l$slipId;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$slip = slip;
    _resultData['slip'] = l$slip?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$slipId = slipId;
    final l$body = body;
    final l$position = position;
    final l$slip = slip;
    final l$$__typename = $__typename;
    return Object.hashAll([l$slipId, l$body, l$position, l$slip, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCardDetailcardsCollectionedgesnodeitemsedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$slipId = slipId;
    final lOther$slipId = other.slipId;
    if (l$slipId != lOther$slipId) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$slip = slip;
    final lOther$slip = other.slip;
    if (l$slip != lOther$slip) {
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

class QueryCardDetailcardsCollectionedgesnodeitemsedgesnodeslip
    implements FragmentCardFragmentitemsedgesnodeslip {
  QueryCardDetailcardsCollectionedgesnodeitemsedgesnodeslip({
    this.category,
    required this.createdAt,
    this.$__typename = 'Slips',
  });

  factory QueryCardDetailcardsCollectionedgesnodeitemsedgesnodeslip.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$category = json['category'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return QueryCardDetailcardsCollectionedgesnodeitemsedgesnodeslip(
      category: (l$category as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String? category;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$category = category;
    _resultData['category'] = l$category;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = ((v) => v.toUtc().toIso8601String())(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$category = category;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$category, l$createdAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCardDetailcardsCollectionedgesnodeitemsedgesnodeslip ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
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

class QueryCardDetailcardsCollectionedgesnodeauthor {
  QueryCardDetailcardsCollectionedgesnodeauthor({this.displayName, this.$__typename = 'Profiles'});

  factory QueryCardDetailcardsCollectionedgesnodeauthor.fromJson(Map<String, dynamic> json) {
    final l$displayName = json['displayName'];
    final l$$__typename = json['__typename'];
    return QueryCardDetailcardsCollectionedgesnodeauthor(
      displayName: (l$displayName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? displayName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$displayName = displayName;
    _resultData['displayName'] = l$displayName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$displayName = displayName;
    final l$$__typename = $__typename;
    return Object.hashAll([l$displayName, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCardDetailcardsCollectionedgesnodeauthor ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
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

class QueryCardDetailcardsCollectionedgesnoderecipient {
  QueryCardDetailcardsCollectionedgesnoderecipient({
    this.displayName,
    this.$__typename = 'Profiles',
  });

  factory QueryCardDetailcardsCollectionedgesnoderecipient.fromJson(Map<String, dynamic> json) {
    final l$displayName = json['displayName'];
    final l$$__typename = json['__typename'];
    return QueryCardDetailcardsCollectionedgesnoderecipient(
      displayName: (l$displayName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? displayName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$displayName = displayName;
    _resultData['displayName'] = l$displayName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$displayName = displayName;
    final l$$__typename = $__typename;
    return Object.hashAll([l$displayName, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCardDetailcardsCollectionedgesnoderecipient ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
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

class QueryCardDetailcardsCollectionedgesnodereaction {
  QueryCardDetailcardsCollectionedgesnodereaction({
    this.reaction,
    this.reply,
    this.$__typename = 'CardReactions',
  });

  factory QueryCardDetailcardsCollectionedgesnodereaction.fromJson(Map<String, dynamic> json) {
    final l$reaction = json['reaction'];
    final l$reply = json['reply'];
    final l$$__typename = json['__typename'];
    return QueryCardDetailcardsCollectionedgesnodereaction(
      reaction: (l$reaction as String?),
      reply: (l$reply as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? reaction;

  final String? reply;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reaction = reaction;
    _resultData['reaction'] = l$reaction;
    final l$reply = reply;
    _resultData['reply'] = l$reply;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reaction = reaction;
    final l$reply = reply;
    final l$$__typename = $__typename;
    return Object.hashAll([l$reaction, l$reply, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCardDetailcardsCollectionedgesnodereaction ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reaction = reaction;
    final lOther$reaction = other.reaction;
    if (l$reaction != lOther$reaction) {
      return false;
    }
    final l$reply = reply;
    final lOther$reply = other.reply;
    if (l$reply != lOther$reply) {
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
