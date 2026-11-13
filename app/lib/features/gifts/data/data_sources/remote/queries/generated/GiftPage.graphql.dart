// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryGiftPage {
  QueryGiftPage({required this.giftIdeasCollection, this.$__typename = 'Query'});

  factory QueryGiftPage.fromJson(Map<String, dynamic> json) {
    final l$giftIdeasCollection = json['giftIdeasCollection'];
    final l$$__typename = json['__typename'];
    return QueryGiftPage(
      giftIdeasCollection: QueryGiftPagegiftIdeasCollection.fromJson(
        (l$giftIdeasCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryGiftPagegiftIdeasCollection giftIdeasCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$giftIdeasCollection = giftIdeasCollection;
    _resultData['giftIdeasCollection'] = l$giftIdeasCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$giftIdeasCollection = giftIdeasCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$giftIdeasCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryGiftPage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$giftIdeasCollection = giftIdeasCollection;
    final lOther$giftIdeasCollection = other.giftIdeasCollection;
    if (l$giftIdeasCollection != lOther$giftIdeasCollection) {
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

const documentNodeQueryGiftPage = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GiftPage'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'giftIdeasCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'kind'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: StringValueNode(value: 'wish', isBlock: false),
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
                value: IntValueNode(value: '200'),
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
                              name: NameNode(value: 'authorId'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'coupleId'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'title'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'note'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'budget'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'status'),
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
QueryGiftPage _parserFnQueryGiftPage(Map<String, dynamic> data) => QueryGiftPage.fromJson(data);
typedef OnQueryCompleteQueryGiftPage = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryGiftPage?,
);

class OptionsQueryGiftPage extends graphql.QueryOptions<QueryGiftPage> {
  OptionsQueryGiftPage({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryGiftPage? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryGiftPage? onComplete,
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
             : (data) => onComplete(data, data == null ? null : _parserFnQueryGiftPage(data)),
         onError: onError,
         document: documentNodeQueryGiftPage,
         parserFn: _parserFnQueryGiftPage,
       );

  final OnQueryCompleteQueryGiftPage? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryGiftPage extends graphql.WatchQueryOptions<QueryGiftPage> {
  WatchOptionsQueryGiftPage({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryGiftPage? typedOptimisticResult,
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
         document: documentNodeQueryGiftPage,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryGiftPage,
       );
}

class FetchMoreOptionsQueryGiftPage extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryGiftPage({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryGiftPage);
}

extension ClientExtensionQueryGiftPage on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryGiftPage>> queryGiftPage([OptionsQueryGiftPage? options]) async =>
      await this.query(options ?? OptionsQueryGiftPage());

  graphql.ObservableQuery<QueryGiftPage> watchQueryGiftPage([WatchOptionsQueryGiftPage? options]) =>
      this.watchQuery(options ?? WatchOptionsQueryGiftPage());

  void writeQueryGiftPage({required QueryGiftPage data, bool broadcast = true}) => this.writeQuery(
    graphql.Request(operation: graphql.Operation(document: documentNodeQueryGiftPage)),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryGiftPage? readQueryGiftPage({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryGiftPage)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryGiftPage.fromJson(result);
  }
}

class QueryGiftPagegiftIdeasCollection {
  QueryGiftPagegiftIdeasCollection({required this.edges, this.$__typename = 'GiftIdeasConnection'});

  factory QueryGiftPagegiftIdeasCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryGiftPagegiftIdeasCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryGiftPagegiftIdeasCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryGiftPagegiftIdeasCollectionedges> edges;

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
    if (other is! QueryGiftPagegiftIdeasCollection || runtimeType != other.runtimeType) {
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

class QueryGiftPagegiftIdeasCollectionedges {
  QueryGiftPagegiftIdeasCollectionedges({required this.node, this.$__typename = 'GiftIdeasEdge'});

  factory QueryGiftPagegiftIdeasCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryGiftPagegiftIdeasCollectionedges(
      node: QueryGiftPagegiftIdeasCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryGiftPagegiftIdeasCollectionedgesnode node;

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
    if (other is! QueryGiftPagegiftIdeasCollectionedges || runtimeType != other.runtimeType) {
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

class QueryGiftPagegiftIdeasCollectionedgesnode {
  QueryGiftPagegiftIdeasCollectionedgesnode({
    required this.id,
    required this.authorId,
    this.coupleId,
    required this.title,
    this.note,
    this.budget,
    required this.status,
    this.$__typename = 'GiftIdeas',
  });

  factory QueryGiftPagegiftIdeasCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$authorId = json['authorId'];
    final l$coupleId = json['coupleId'];
    final l$title = json['title'];
    final l$note = json['note'];
    final l$budget = json['budget'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return QueryGiftPagegiftIdeasCollectionedgesnode(
      id: (l$id as String),
      authorId: (l$authorId as String),
      coupleId: (l$coupleId as String?),
      title: (l$title as String),
      note: (l$note as String?),
      budget: (l$budget as String?),
      status: (l$status as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String authorId;

  final String? coupleId;

  final String title;

  final String? note;

  final String? budget;

  final String status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$authorId = authorId;
    _resultData['authorId'] = l$authorId;
    final l$coupleId = coupleId;
    _resultData['coupleId'] = l$coupleId;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$note = note;
    _resultData['note'] = l$note;
    final l$budget = budget;
    _resultData['budget'] = l$budget;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$authorId = authorId;
    final l$coupleId = coupleId;
    final l$title = title;
    final l$note = note;
    final l$budget = budget;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$authorId,
      l$coupleId,
      l$title,
      l$note,
      l$budget,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryGiftPagegiftIdeasCollectionedgesnode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$authorId = authorId;
    final lOther$authorId = other.authorId;
    if (l$authorId != lOther$authorId) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$budget = budget;
    final lOther$budget = other.budget;
    if (l$budget != lOther$budget) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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
