// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAddGiftWish {
  factory VariablesMutationAddGiftWish({
    required String id,
    required String title,
    String? note,
    String? budget,
    String? coupleId,
  }) => VariablesMutationAddGiftWish._({
    r'id': id,
    r'title': title,
    if (note != null) r'note': note,
    if (budget != null) r'budget': budget,
    if (coupleId != null) r'coupleId': coupleId,
  });

  VariablesMutationAddGiftWish._(this._$data);

  factory VariablesMutationAddGiftWish.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    if (data.containsKey('note')) {
      final l$note = data['note'];
      result$data['note'] = (l$note as String?);
    }
    if (data.containsKey('budget')) {
      final l$budget = data['budget'];
      result$data['budget'] = (l$budget as String?);
    }
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    return VariablesMutationAddGiftWish._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get title => (_$data['title'] as String);

  String? get note => (_$data['note'] as String?);

  String? get budget => (_$data['budget'] as String?);

  String? get coupleId => (_$data['coupleId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$title = title;
    result$data['title'] = l$title;
    if (_$data.containsKey('note')) {
      final l$note = note;
      result$data['note'] = l$note;
    }
    if (_$data.containsKey('budget')) {
      final l$budget = budget;
      result$data['budget'] = l$budget;
    }
    if (_$data.containsKey('coupleId')) {
      final l$coupleId = coupleId;
      result$data['coupleId'] = l$coupleId;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAddGiftWish || runtimeType != other.runtimeType) {
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
    final l$note = note;
    final lOther$note = other.note;
    if (_$data.containsKey('note') != other._$data.containsKey('note')) {
      return false;
    }
    if (l$note != lOther$note) {
      return false;
    }
    final l$budget = budget;
    final lOther$budget = other.budget;
    if (_$data.containsKey('budget') != other._$data.containsKey('budget')) {
      return false;
    }
    if (l$budget != lOther$budget) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (_$data.containsKey('coupleId') != other._$data.containsKey('coupleId')) {
      return false;
    }
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$note = note;
    final l$budget = budget;
    final l$coupleId = coupleId;
    return Object.hashAll([
      l$id,
      l$title,
      _$data.containsKey('note') ? l$note : const {},
      _$data.containsKey('budget') ? l$budget : const {},
      _$data.containsKey('coupleId') ? l$coupleId : const {},
    ]);
  }
}

class MutationAddGiftWish {
  MutationAddGiftWish({this.insertIntoGiftIdeasCollection, this.$__typename = 'Mutation'});

  factory MutationAddGiftWish.fromJson(Map<String, dynamic> json) {
    final l$insertIntoGiftIdeasCollection = json['insertIntoGiftIdeasCollection'];
    final l$$__typename = json['__typename'];
    return MutationAddGiftWish(
      insertIntoGiftIdeasCollection: l$insertIntoGiftIdeasCollection == null
          ? null
          : MutationAddGiftWishinsertIntoGiftIdeasCollection.fromJson(
              (l$insertIntoGiftIdeasCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAddGiftWishinsertIntoGiftIdeasCollection? insertIntoGiftIdeasCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoGiftIdeasCollection = insertIntoGiftIdeasCollection;
    _resultData['insertIntoGiftIdeasCollection'] = l$insertIntoGiftIdeasCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoGiftIdeasCollection = insertIntoGiftIdeasCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoGiftIdeasCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddGiftWish || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoGiftIdeasCollection = insertIntoGiftIdeasCollection;
    final lOther$insertIntoGiftIdeasCollection = other.insertIntoGiftIdeasCollection;
    if (l$insertIntoGiftIdeasCollection != lOther$insertIntoGiftIdeasCollection) {
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

const documentNodeMutationAddGiftWish = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddGiftWish'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'title')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'note')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'budget')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'coupleId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoGiftIdeasCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: VariableNode(name: NameNode(value: 'id')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'title'),
                          value: VariableNode(name: NameNode(value: 'title')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'note'),
                          value: VariableNode(name: NameNode(value: 'note')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'budget'),
                          value: VariableNode(name: NameNode(value: 'budget')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'coupleId'),
                          value: VariableNode(name: NameNode(value: 'coupleId')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'kind'),
                          value: StringValueNode(value: 'wish', isBlock: false),
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
                  name: NameNode(value: 'affectedCount'),
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
  ],
);
MutationAddGiftWish _parserFnMutationAddGiftWish(Map<String, dynamic> data) =>
    MutationAddGiftWish.fromJson(data);
typedef OnMutationCompletedMutationAddGiftWish = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAddGiftWish?,
);

class OptionsMutationAddGiftWish extends graphql.MutationOptions<MutationAddGiftWish> {
  OptionsMutationAddGiftWish({
    String? operationName,
    required VariablesMutationAddGiftWish variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddGiftWish? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAddGiftWish? onCompleted,
    graphql.OnMutationUpdate<MutationAddGiftWish>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationAddGiftWish(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAddGiftWish,
         parserFn: _parserFnMutationAddGiftWish,
       );

  final OnMutationCompletedMutationAddGiftWish? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAddGiftWish extends graphql.WatchQueryOptions<MutationAddGiftWish> {
  WatchOptionsMutationAddGiftWish({
    String? operationName,
    required VariablesMutationAddGiftWish variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddGiftWish? typedOptimisticResult,
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
         document: documentNodeMutationAddGiftWish,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAddGiftWish,
       );
}

extension ClientExtensionMutationAddGiftWish on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAddGiftWish>> mutateAddGiftWish(
    OptionsMutationAddGiftWish options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAddGiftWish> watchMutationAddGiftWish(
    WatchOptionsMutationAddGiftWish options,
  ) => this.watchMutation(options);
}

class MutationAddGiftWishinsertIntoGiftIdeasCollection {
  MutationAddGiftWishinsertIntoGiftIdeasCollection({
    required this.affectedCount,
    this.$__typename = 'GiftIdeasInsertResponse',
  });

  factory MutationAddGiftWishinsertIntoGiftIdeasCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationAddGiftWishinsertIntoGiftIdeasCollection(
      affectedCount: (l$affectedCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int affectedCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affectedCount = affectedCount;
    _resultData['affectedCount'] = l$affectedCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affectedCount = affectedCount;
    final l$$__typename = $__typename;
    return Object.hashAll([l$affectedCount, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddGiftWishinsertIntoGiftIdeasCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affectedCount = affectedCount;
    final lOther$affectedCount = other.affectedCount;
    if (l$affectedCount != lOther$affectedCount) {
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
