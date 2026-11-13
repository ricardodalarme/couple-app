// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteDateIdea {
  factory VariablesMutationDeleteDateIdea({required String id}) =>
      VariablesMutationDeleteDateIdea._({r'id': id});

  VariablesMutationDeleteDateIdea._(this._$data);

  factory VariablesMutationDeleteDateIdea.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteDateIdea._(result$data);
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
    if (other is! VariablesMutationDeleteDateIdea || runtimeType != other.runtimeType) {
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

class MutationDeleteDateIdea {
  MutationDeleteDateIdea({
    required this.deleteFromSavedDateIdeasCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteDateIdea.fromJson(Map<String, dynamic> json) {
    final l$deleteFromSavedDateIdeasCollection = json['deleteFromSavedDateIdeasCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteDateIdea(
      deleteFromSavedDateIdeasCollection:
          MutationDeleteDateIdeadeleteFromSavedDateIdeasCollection.fromJson(
            (l$deleteFromSavedDateIdeasCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteDateIdeadeleteFromSavedDateIdeasCollection deleteFromSavedDateIdeasCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromSavedDateIdeasCollection = deleteFromSavedDateIdeasCollection;
    _resultData['deleteFromSavedDateIdeasCollection'] = l$deleteFromSavedDateIdeasCollection
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromSavedDateIdeasCollection = deleteFromSavedDateIdeasCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromSavedDateIdeasCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteDateIdea || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromSavedDateIdeasCollection = deleteFromSavedDateIdeasCollection;
    final lOther$deleteFromSavedDateIdeasCollection = other.deleteFromSavedDateIdeasCollection;
    if (l$deleteFromSavedDateIdeasCollection != lOther$deleteFromSavedDateIdeasCollection) {
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

const documentNodeMutationDeleteDateIdea = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteDateIdea'),
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
            name: NameNode(value: 'deleteFromSavedDateIdeasCollection'),
            alias: null,
            arguments: [
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
              ArgumentNode(
                name: NameNode(value: 'atMost'),
                value: IntValueNode(value: '1'),
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
MutationDeleteDateIdea _parserFnMutationDeleteDateIdea(Map<String, dynamic> data) =>
    MutationDeleteDateIdea.fromJson(data);
typedef OnMutationCompletedMutationDeleteDateIdea = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteDateIdea?,
);

class OptionsMutationDeleteDateIdea extends graphql.MutationOptions<MutationDeleteDateIdea> {
  OptionsMutationDeleteDateIdea({
    String? operationName,
    required VariablesMutationDeleteDateIdea variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteDateIdea? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteDateIdea? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteDateIdea>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationDeleteDateIdea(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteDateIdea,
         parserFn: _parserFnMutationDeleteDateIdea,
       );

  final OnMutationCompletedMutationDeleteDateIdea? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteDateIdea extends graphql.WatchQueryOptions<MutationDeleteDateIdea> {
  WatchOptionsMutationDeleteDateIdea({
    String? operationName,
    required VariablesMutationDeleteDateIdea variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteDateIdea? typedOptimisticResult,
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
         document: documentNodeMutationDeleteDateIdea,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteDateIdea,
       );
}

extension ClientExtensionMutationDeleteDateIdea on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteDateIdea>> mutateDeleteDateIdea(
    OptionsMutationDeleteDateIdea options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteDateIdea> watchMutationDeleteDateIdea(
    WatchOptionsMutationDeleteDateIdea options,
  ) => this.watchMutation(options);
}

class MutationDeleteDateIdeadeleteFromSavedDateIdeasCollection {
  MutationDeleteDateIdeadeleteFromSavedDateIdeasCollection({
    required this.affectedCount,
    this.$__typename = 'SavedDateIdeasDeleteResponse',
  });

  factory MutationDeleteDateIdeadeleteFromSavedDateIdeasCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteDateIdeadeleteFromSavedDateIdeasCollection(
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
    if (other is! MutationDeleteDateIdeadeleteFromSavedDateIdeasCollection ||
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
