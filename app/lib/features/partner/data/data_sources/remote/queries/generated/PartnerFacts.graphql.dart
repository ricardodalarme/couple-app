// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryPartnerFacts {
  QueryPartnerFacts({required this.partnerFactsCollection, this.$__typename = 'Query'});

  factory QueryPartnerFacts.fromJson(Map<String, dynamic> json) {
    final l$partnerFactsCollection = json['partnerFactsCollection'];
    final l$$__typename = json['__typename'];
    return QueryPartnerFacts(
      partnerFactsCollection: QueryPartnerFactspartnerFactsCollection.fromJson(
        (l$partnerFactsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryPartnerFactspartnerFactsCollection partnerFactsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$partnerFactsCollection = partnerFactsCollection;
    _resultData['partnerFactsCollection'] = l$partnerFactsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$partnerFactsCollection = partnerFactsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$partnerFactsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryPartnerFacts || runtimeType != other.runtimeType) {
      return false;
    }
    final l$partnerFactsCollection = partnerFactsCollection;
    final lOther$partnerFactsCollection = other.partnerFactsCollection;
    if (l$partnerFactsCollection != lOther$partnerFactsCollection) {
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

const documentNodeQueryPartnerFacts = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'PartnerFacts'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'partnerFactsCollection'),
            alias: null,
            arguments: [
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
                              name: NameNode(value: 'label'),
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
                              name: NameNode(value: 'category'),
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
QueryPartnerFacts _parserFnQueryPartnerFacts(Map<String, dynamic> data) =>
    QueryPartnerFacts.fromJson(data);
typedef OnQueryCompleteQueryPartnerFacts = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryPartnerFacts?,
);

class OptionsQueryPartnerFacts extends graphql.QueryOptions<QueryPartnerFacts> {
  OptionsQueryPartnerFacts({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryPartnerFacts? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryPartnerFacts? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'PartnerFacts',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryPartnerFacts(data)),
         onError: onError,
         document: documentNodeQueryPartnerFacts,
         parserFn: _parserFnQueryPartnerFacts,
       );

  final OnQueryCompleteQueryPartnerFacts? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryPartnerFacts extends graphql.WatchQueryOptions<QueryPartnerFacts> {
  WatchOptionsQueryPartnerFacts({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryPartnerFacts? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'PartnerFacts',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryPartnerFacts,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryPartnerFacts,
       );
}

class FetchMoreOptionsQueryPartnerFacts extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryPartnerFacts({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryPartnerFacts);
}

extension ClientExtensionQueryPartnerFacts on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryPartnerFacts>> queryPartnerFacts([
    OptionsQueryPartnerFacts? options,
  ]) async => await this.query(options ?? OptionsQueryPartnerFacts());

  graphql.ObservableQuery<QueryPartnerFacts> watchQueryPartnerFacts([
    WatchOptionsQueryPartnerFacts? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryPartnerFacts());

  void writeQueryPartnerFacts({required QueryPartnerFacts data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryPartnerFacts)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryPartnerFacts? readQueryPartnerFacts({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryPartnerFacts)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryPartnerFacts.fromJson(result);
  }
}

class QueryPartnerFactspartnerFactsCollection {
  QueryPartnerFactspartnerFactsCollection({
    required this.edges,
    this.$__typename = 'PartnerFactsConnection',
  });

  factory QueryPartnerFactspartnerFactsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryPartnerFactspartnerFactsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) =>
                QueryPartnerFactspartnerFactsCollectionedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryPartnerFactspartnerFactsCollectionedges> edges;

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
    if (other is! QueryPartnerFactspartnerFactsCollection || runtimeType != other.runtimeType) {
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

class QueryPartnerFactspartnerFactsCollectionedges {
  QueryPartnerFactspartnerFactsCollectionedges({
    required this.node,
    this.$__typename = 'PartnerFactsEdge',
  });

  factory QueryPartnerFactspartnerFactsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryPartnerFactspartnerFactsCollectionedges(
      node: QueryPartnerFactspartnerFactsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryPartnerFactspartnerFactsCollectionedgesnode node;

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
    if (other is! QueryPartnerFactspartnerFactsCollectionedges ||
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

class QueryPartnerFactspartnerFactsCollectionedgesnode {
  QueryPartnerFactspartnerFactsCollectionedgesnode({
    required this.id,
    required this.label,
    required this.value,
    this.category,
    this.$__typename = 'PartnerFacts',
  });

  factory QueryPartnerFactspartnerFactsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$label = json['label'];
    final l$value = json['value'];
    final l$category = json['category'];
    final l$$__typename = json['__typename'];
    return QueryPartnerFactspartnerFactsCollectionedgesnode(
      id: (l$id as String),
      label: (l$label as String),
      value: (l$value as String),
      category: l$category == null ? null : fromJsonEnumPartnerFactCategory((l$category as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String label;

  final String value;

  final EnumPartnerFactCategory? category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$label = label;
    _resultData['label'] = l$label;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$category = category;
    _resultData['category'] = l$category == null ? null : toJsonEnumPartnerFactCategory(l$category);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$label = label;
    final l$value = value;
    final l$category = category;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$label, l$value, l$category, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryPartnerFactspartnerFactsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$label = label;
    final lOther$label = other.label;
    if (l$label != lOther$label) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
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
