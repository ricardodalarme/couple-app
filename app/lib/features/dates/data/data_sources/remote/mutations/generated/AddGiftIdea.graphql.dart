// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAddGiftIdea {
  factory VariablesMutationAddGiftIdea({required String id, required String title}) =>
      VariablesMutationAddGiftIdea._({r'id': id, r'title': title});

  VariablesMutationAddGiftIdea._(this._$data);

  factory VariablesMutationAddGiftIdea.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    return VariablesMutationAddGiftIdea._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get title => (_$data['title'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$title = title;
    result$data['title'] = l$title;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAddGiftIdea || runtimeType != other.runtimeType) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    return Object.hashAll([l$id, l$title]);
  }
}

class MutationAddGiftIdea {
  MutationAddGiftIdea({this.insertIntoGiftIdeasCollection, this.$__typename = 'Mutation'});

  factory MutationAddGiftIdea.fromJson(Map<String, dynamic> json) {
    final l$insertIntoGiftIdeasCollection = json['insertIntoGiftIdeasCollection'];
    final l$$__typename = json['__typename'];
    return MutationAddGiftIdea(
      insertIntoGiftIdeasCollection: l$insertIntoGiftIdeasCollection == null
          ? null
          : MutationAddGiftIdeainsertIntoGiftIdeasCollection.fromJson(
              (l$insertIntoGiftIdeasCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAddGiftIdeainsertIntoGiftIdeasCollection? insertIntoGiftIdeasCollection;

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
    if (other is! MutationAddGiftIdea || runtimeType != other.runtimeType) {
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

const documentNodeMutationAddGiftIdea = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddGiftIdea'),
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
                          name: NameNode(value: 'kind'),
                          value: EnumValueNode(name: NameNode(value: 'idea')),
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
MutationAddGiftIdea _parserFnMutationAddGiftIdea(Map<String, dynamic> data) =>
    MutationAddGiftIdea.fromJson(data);
typedef OnMutationCompletedMutationAddGiftIdea = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAddGiftIdea?,
);

class OptionsMutationAddGiftIdea extends graphql.MutationOptions<MutationAddGiftIdea> {
  OptionsMutationAddGiftIdea({
    String? operationName,
    required VariablesMutationAddGiftIdea variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddGiftIdea? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAddGiftIdea? onCompleted,
    graphql.OnMutationUpdate<MutationAddGiftIdea>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'AddGiftIdea',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationAddGiftIdea(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAddGiftIdea,
         parserFn: _parserFnMutationAddGiftIdea,
       );

  final OnMutationCompletedMutationAddGiftIdea? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAddGiftIdea extends graphql.WatchQueryOptions<MutationAddGiftIdea> {
  WatchOptionsMutationAddGiftIdea({
    String? operationName,
    required VariablesMutationAddGiftIdea variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddGiftIdea? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'AddGiftIdea',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationAddGiftIdea,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAddGiftIdea,
       );
}

extension ClientExtensionMutationAddGiftIdea on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAddGiftIdea>> mutateAddGiftIdea(
    OptionsMutationAddGiftIdea options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAddGiftIdea> watchMutationAddGiftIdea(
    WatchOptionsMutationAddGiftIdea options,
  ) => this.watchMutation(options);
}

class MutationAddGiftIdeainsertIntoGiftIdeasCollection {
  MutationAddGiftIdeainsertIntoGiftIdeasCollection({
    required this.affectedCount,
    this.$__typename = 'GiftIdeasInsertResponse',
  });

  factory MutationAddGiftIdeainsertIntoGiftIdeasCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationAddGiftIdeainsertIntoGiftIdeasCollection(
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
    if (other is! MutationAddGiftIdeainsertIntoGiftIdeasCollection ||
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
