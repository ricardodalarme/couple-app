// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryCouplePhoto {
  QueryCouplePhoto({
    this.myCouple,
    required this.couplePhotosCollection,
    this.$__typename = 'Query',
  });

  factory QueryCouplePhoto.fromJson(Map<String, dynamic> json) {
    final l$myCouple = json['myCouple'];
    final l$couplePhotosCollection = json['couplePhotosCollection'];
    final l$$__typename = json['__typename'];
    return QueryCouplePhoto(
      myCouple: l$myCouple == null
          ? null
          : QueryCouplePhotomyCouple.fromJson((l$myCouple as Map<String, dynamic>)),
      couplePhotosCollection: QueryCouplePhotocouplePhotosCollection.fromJson(
        (l$couplePhotosCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCouplePhotomyCouple? myCouple;

  final QueryCouplePhotocouplePhotosCollection couplePhotosCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myCouple = myCouple;
    _resultData['myCouple'] = l$myCouple?.toJson();
    final l$couplePhotosCollection = couplePhotosCollection;
    _resultData['couplePhotosCollection'] = l$couplePhotosCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myCouple = myCouple;
    final l$couplePhotosCollection = couplePhotosCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$myCouple, l$couplePhotosCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCouplePhoto || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myCouple = myCouple;
    final lOther$myCouple = other.myCouple;
    if (l$myCouple != lOther$myCouple) {
      return false;
    }
    final l$couplePhotosCollection = couplePhotosCollection;
    final lOther$couplePhotosCollection = other.couplePhotosCollection;
    if (l$couplePhotosCollection != lOther$couplePhotosCollection) {
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

const documentNodeQueryCouplePhoto = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'CouplePhoto'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myCouple'),
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
            name: NameNode(value: 'couplePhotosCollection'),
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
                              name: NameNode(value: 'coupleId'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'storagePath'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'uploadedBy'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'updatedAt'),
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
QueryCouplePhoto _parserFnQueryCouplePhoto(Map<String, dynamic> data) =>
    QueryCouplePhoto.fromJson(data);
typedef OnQueryCompleteQueryCouplePhoto = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryCouplePhoto?,
);

class OptionsQueryCouplePhoto extends graphql.QueryOptions<QueryCouplePhoto> {
  OptionsQueryCouplePhoto({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCouplePhoto? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryCouplePhoto? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'CouplePhoto',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryCouplePhoto(data)),
         onError: onError,
         document: documentNodeQueryCouplePhoto,
         parserFn: _parserFnQueryCouplePhoto,
       );

  final OnQueryCompleteQueryCouplePhoto? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryCouplePhoto extends graphql.WatchQueryOptions<QueryCouplePhoto> {
  WatchOptionsQueryCouplePhoto({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryCouplePhoto? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'CouplePhoto',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryCouplePhoto,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryCouplePhoto,
       );
}

class FetchMoreOptionsQueryCouplePhoto extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryCouplePhoto({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryCouplePhoto);
}

extension ClientExtensionQueryCouplePhoto on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryCouplePhoto>> queryCouplePhoto([
    OptionsQueryCouplePhoto? options,
  ]) async => await this.query(options ?? OptionsQueryCouplePhoto());

  graphql.ObservableQuery<QueryCouplePhoto> watchQueryCouplePhoto([
    WatchOptionsQueryCouplePhoto? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryCouplePhoto());

  void writeQueryCouplePhoto({required QueryCouplePhoto data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryCouplePhoto)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryCouplePhoto? readQueryCouplePhoto({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryCouplePhoto)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryCouplePhoto.fromJson(result);
  }
}

class QueryCouplePhotomyCouple {
  QueryCouplePhotomyCouple({required this.id, this.$__typename = 'Couples'});

  factory QueryCouplePhotomyCouple.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return QueryCouplePhotomyCouple(id: (l$id as String), $__typename: (l$$__typename as String));
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
    if (other is! QueryCouplePhotomyCouple || runtimeType != other.runtimeType) {
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

class QueryCouplePhotocouplePhotosCollection {
  QueryCouplePhotocouplePhotosCollection({
    required this.edges,
    this.$__typename = 'CouplePhotosConnection',
  });

  factory QueryCouplePhotocouplePhotosCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryCouplePhotocouplePhotosCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) =>
                QueryCouplePhotocouplePhotosCollectionedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryCouplePhotocouplePhotosCollectionedges> edges;

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
    if (other is! QueryCouplePhotocouplePhotosCollection || runtimeType != other.runtimeType) {
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

class QueryCouplePhotocouplePhotosCollectionedges {
  QueryCouplePhotocouplePhotosCollectionedges({
    required this.node,
    this.$__typename = 'CouplePhotosEdge',
  });

  factory QueryCouplePhotocouplePhotosCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryCouplePhotocouplePhotosCollectionedges(
      node: QueryCouplePhotocouplePhotosCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryCouplePhotocouplePhotosCollectionedgesnode node;

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
    if (other is! QueryCouplePhotocouplePhotosCollectionedges || runtimeType != other.runtimeType) {
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

class QueryCouplePhotocouplePhotosCollectionedgesnode {
  QueryCouplePhotocouplePhotosCollectionedgesnode({
    required this.coupleId,
    required this.storagePath,
    required this.uploadedBy,
    required this.updatedAt,
    this.$__typename = 'CouplePhotos',
  });

  factory QueryCouplePhotocouplePhotosCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$coupleId = json['coupleId'];
    final l$storagePath = json['storagePath'];
    final l$uploadedBy = json['uploadedBy'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return QueryCouplePhotocouplePhotosCollectionedgesnode(
      coupleId: (l$coupleId as String),
      storagePath: (l$storagePath as String),
      uploadedBy: (l$uploadedBy as String),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String coupleId;

  final String storagePath;

  final String uploadedBy;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$coupleId = coupleId;
    _resultData['coupleId'] = l$coupleId;
    final l$storagePath = storagePath;
    _resultData['storagePath'] = l$storagePath;
    final l$uploadedBy = uploadedBy;
    _resultData['uploadedBy'] = l$uploadedBy;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = ((v) => v.toUtc().toIso8601String())(l$updatedAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$coupleId = coupleId;
    final l$storagePath = storagePath;
    final l$uploadedBy = uploadedBy;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$coupleId, l$storagePath, l$uploadedBy, l$updatedAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryCouplePhotocouplePhotosCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    final l$storagePath = storagePath;
    final lOther$storagePath = other.storagePath;
    if (l$storagePath != lOther$storagePath) {
      return false;
    }
    final l$uploadedBy = uploadedBy;
    final lOther$uploadedBy = other.uploadedBy;
    if (l$uploadedBy != lOther$uploadedBy) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
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
