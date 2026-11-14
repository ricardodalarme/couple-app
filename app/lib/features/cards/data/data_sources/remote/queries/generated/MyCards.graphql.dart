// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/fragments/generated/PageInfoFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryMyCards {
  factory VariablesQueryMyCards({int? first, String? after}) => VariablesQueryMyCards._({
    if (first != null) r'first': first,
    if (after != null) r'after': after,
  });

  VariablesQueryMyCards._(this._$data);

  factory VariablesQueryMyCards.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return VariablesQueryMyCards._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryMyCards || runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
    ]);
  }
}

class QueryMyCards {
  QueryMyCards({required this.cardsCollection, this.$__typename = 'Query'});

  factory QueryMyCards.fromJson(Map<String, dynamic> json) {
    final l$cardsCollection = json['cardsCollection'];
    final l$$__typename = json['__typename'];
    return QueryMyCards(
      cardsCollection: QueryMyCardscardsCollection.fromJson(
        (l$cardsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyCardscardsCollection cardsCollection;

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
    if (other is! QueryMyCards || runtimeType != other.runtimeType) {
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

const documentNodeQueryMyCards = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyCards'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'first')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'after')),
          type: NamedTypeNode(name: NameNode(value: 'Cursor'), isNonNull: false),
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
                value: VariableNode(name: NameNode(value: 'first')),
              ),
              ArgumentNode(
                name: NameNode(value: 'after'),
                value: VariableNode(name: NameNode(value: 'after')),
              ),
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'status'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: EnumValueNode(name: NameNode(value: 'sent')),
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
                          name: NameNode(value: 'sentAt'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
                        ),
                      ],
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
                              name: NameNode(value: 'id'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'isMine'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'sentAt'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'weekStart'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'items'),
                              alias: null,
                              arguments: [],
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
                                                name: NameNode(value: 'slipId'),
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
                              name: NameNode(value: 'open'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(
                                selections: [
                                  FieldNode(
                                    name: NameNode(value: 'openedAt'),
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
                  name: NameNode(value: 'pageInfo'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'PageInfoFragment'),
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
    fragmentDefinitionPageInfoFragment,
  ],
);
QueryMyCards _parserFnQueryMyCards(Map<String, dynamic> data) => QueryMyCards.fromJson(data);
typedef OnQueryCompleteQueryMyCards = FutureOr<void> Function(Map<String, dynamic>?, QueryMyCards?);

class OptionsQueryMyCards extends graphql.QueryOptions<QueryMyCards> {
  OptionsQueryMyCards({
    String? operationName,
    VariablesQueryMyCards? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyCards? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMyCards? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMyCards(data)),
         onError: onError,
         document: documentNodeQueryMyCards,
         parserFn: _parserFnQueryMyCards,
       );

  final OnQueryCompleteQueryMyCards? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMyCards extends graphql.WatchQueryOptions<QueryMyCards> {
  WatchOptionsQueryMyCards({
    String? operationName,
    VariablesQueryMyCards? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyCards? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryMyCards,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMyCards,
       );
}

class FetchMoreOptionsQueryMyCards extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMyCards({
    required graphql.UpdateQuery updateQuery,
    VariablesQueryMyCards? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryMyCards,
       );
}

extension ClientExtensionQueryMyCards on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMyCards>> queryMyCards([OptionsQueryMyCards? options]) async =>
      await this.query(options ?? OptionsQueryMyCards());

  graphql.ObservableQuery<QueryMyCards> watchQueryMyCards([WatchOptionsQueryMyCards? options]) =>
      this.watchQuery(options ?? WatchOptionsQueryMyCards());

  void writeQueryMyCards({
    required QueryMyCards data,
    VariablesQueryMyCards? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryMyCards),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryMyCards? readQueryMyCards({VariablesQueryMyCards? variables, bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMyCards),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMyCards.fromJson(result);
  }
}

class QueryMyCardscardsCollection {
  QueryMyCardscardsCollection({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'CardsConnection',
  });

  factory QueryMyCardscardsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return QueryMyCardscardsCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryMyCardscardsCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      pageInfo: FragmentPageInfoFragment.fromJson((l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryMyCardscardsCollectionedges> edges;

  final FragmentPageInfoFragment pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$pageInfo, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyCardscardsCollection || runtimeType != other.runtimeType) {
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
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

class QueryMyCardscardsCollectionedges {
  QueryMyCardscardsCollectionedges({required this.node, this.$__typename = 'CardsEdge'});

  factory QueryMyCardscardsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryMyCardscardsCollectionedges(
      node: QueryMyCardscardsCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyCardscardsCollectionedgesnode node;

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
    if (other is! QueryMyCardscardsCollectionedges || runtimeType != other.runtimeType) {
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

class QueryMyCardscardsCollectionedgesnode {
  QueryMyCardscardsCollectionedgesnode({
    required this.id,
    this.isMine,
    this.sentAt,
    required this.weekStart,
    this.items,
    this.reaction,
    this.open,
    this.$__typename = 'Cards',
  });

  factory QueryMyCardscardsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$isMine = json['isMine'];
    final l$sentAt = json['sentAt'];
    final l$weekStart = json['weekStart'];
    final l$items = json['items'];
    final l$reaction = json['reaction'];
    final l$open = json['open'];
    final l$$__typename = json['__typename'];
    return QueryMyCardscardsCollectionedgesnode(
      id: (l$id as String),
      isMine: (l$isMine as bool?),
      sentAt: l$sentAt == null ? null : DateTime.parse((l$sentAt as String)),
      weekStart: DateTime.parse((l$weekStart as String)),
      items: l$items == null
          ? null
          : QueryMyCardscardsCollectionedgesnodeitems.fromJson((l$items as Map<String, dynamic>)),
      reaction: l$reaction == null
          ? null
          : QueryMyCardscardsCollectionedgesnodereaction.fromJson(
              (l$reaction as Map<String, dynamic>),
            ),
      open: l$open == null
          ? null
          : QueryMyCardscardsCollectionedgesnodeopen.fromJson((l$open as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final bool? isMine;

  final DateTime? sentAt;

  final DateTime weekStart;

  final QueryMyCardscardsCollectionedgesnodeitems? items;

  final QueryMyCardscardsCollectionedgesnodereaction? reaction;

  final QueryMyCardscardsCollectionedgesnodeopen? open;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$isMine = isMine;
    _resultData['isMine'] = l$isMine;
    final l$sentAt = sentAt;
    _resultData['sentAt'] = l$sentAt == null
        ? null
        : ((v) => v.toUtc().toIso8601String())(l$sentAt);
    final l$weekStart = weekStart;
    _resultData['weekStart'] = ((v) => v.toIso8601String().substring(0, 10))(l$weekStart);
    final l$items = items;
    _resultData['items'] = l$items?.toJson();
    final l$reaction = reaction;
    _resultData['reaction'] = l$reaction?.toJson();
    final l$open = open;
    _resultData['open'] = l$open?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$isMine = isMine;
    final l$sentAt = sentAt;
    final l$weekStart = weekStart;
    final l$items = items;
    final l$reaction = reaction;
    final l$open = open;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$isMine,
      l$sentAt,
      l$weekStart,
      l$items,
      l$reaction,
      l$open,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyCardscardsCollectionedgesnode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$isMine = isMine;
    final lOther$isMine = other.isMine;
    if (l$isMine != lOther$isMine) {
      return false;
    }
    final l$sentAt = sentAt;
    final lOther$sentAt = other.sentAt;
    if (l$sentAt != lOther$sentAt) {
      return false;
    }
    final l$weekStart = weekStart;
    final lOther$weekStart = other.weekStart;
    if (l$weekStart != lOther$weekStart) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
      return false;
    }
    final l$reaction = reaction;
    final lOther$reaction = other.reaction;
    if (l$reaction != lOther$reaction) {
      return false;
    }
    final l$open = open;
    final lOther$open = other.open;
    if (l$open != lOther$open) {
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

class QueryMyCardscardsCollectionedgesnodeitems {
  QueryMyCardscardsCollectionedgesnodeitems({
    required this.edges,
    this.$__typename = 'CardItemsConnection',
  });

  factory QueryMyCardscardsCollectionedgesnodeitems.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryMyCardscardsCollectionedgesnodeitems(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryMyCardscardsCollectionedgesnodeitemsedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryMyCardscardsCollectionedgesnodeitemsedges> edges;

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
    if (other is! QueryMyCardscardsCollectionedgesnodeitems || runtimeType != other.runtimeType) {
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

class QueryMyCardscardsCollectionedgesnodeitemsedges {
  QueryMyCardscardsCollectionedgesnodeitemsedges({
    required this.node,
    this.$__typename = 'CardItemsEdge',
  });

  factory QueryMyCardscardsCollectionedgesnodeitemsedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryMyCardscardsCollectionedgesnodeitemsedges(
      node: QueryMyCardscardsCollectionedgesnodeitemsedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyCardscardsCollectionedgesnodeitemsedgesnode node;

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
    if (other is! QueryMyCardscardsCollectionedgesnodeitemsedges ||
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

class QueryMyCardscardsCollectionedgesnodeitemsedgesnode {
  QueryMyCardscardsCollectionedgesnodeitemsedgesnode({this.slipId, this.$__typename = 'CardItems'});

  factory QueryMyCardscardsCollectionedgesnodeitemsedgesnode.fromJson(Map<String, dynamic> json) {
    final l$slipId = json['slipId'];
    final l$$__typename = json['__typename'];
    return QueryMyCardscardsCollectionedgesnodeitemsedgesnode(
      slipId: (l$slipId as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? slipId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$slipId = slipId;
    _resultData['slipId'] = l$slipId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$slipId = slipId;
    final l$$__typename = $__typename;
    return Object.hashAll([l$slipId, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyCardscardsCollectionedgesnodeitemsedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$slipId = slipId;
    final lOther$slipId = other.slipId;
    if (l$slipId != lOther$slipId) {
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

class QueryMyCardscardsCollectionedgesnodereaction {
  QueryMyCardscardsCollectionedgesnodereaction({
    this.reaction,
    this.reply,
    this.$__typename = 'CardReactions',
  });

  factory QueryMyCardscardsCollectionedgesnodereaction.fromJson(Map<String, dynamic> json) {
    final l$reaction = json['reaction'];
    final l$reply = json['reply'];
    final l$$__typename = json['__typename'];
    return QueryMyCardscardsCollectionedgesnodereaction(
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
    if (other is! QueryMyCardscardsCollectionedgesnodereaction ||
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

class QueryMyCardscardsCollectionedgesnodeopen {
  QueryMyCardscardsCollectionedgesnodeopen({
    required this.openedAt,
    this.$__typename = 'CardOpens',
  });

  factory QueryMyCardscardsCollectionedgesnodeopen.fromJson(Map<String, dynamic> json) {
    final l$openedAt = json['openedAt'];
    final l$$__typename = json['__typename'];
    return QueryMyCardscardsCollectionedgesnodeopen(
      openedAt: DateTime.parse((l$openedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final DateTime openedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$openedAt = openedAt;
    _resultData['openedAt'] = ((v) => v.toUtc().toIso8601String())(l$openedAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$openedAt = openedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$openedAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyCardscardsCollectionedgesnodeopen || runtimeType != other.runtimeType) {
      return false;
    }
    final l$openedAt = openedAt;
    final lOther$openedAt = other.openedAt;
    if (l$openedAt != lOther$openedAt) {
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
