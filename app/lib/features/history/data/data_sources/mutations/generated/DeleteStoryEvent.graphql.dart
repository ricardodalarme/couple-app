// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteStoryEvent {
  factory VariablesMutationDeleteStoryEvent({required String id}) =>
      VariablesMutationDeleteStoryEvent._({r'id': id});

  VariablesMutationDeleteStoryEvent._(this._$data);

  factory VariablesMutationDeleteStoryEvent.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteStoryEvent._(result$data);
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
    if (other is! VariablesMutationDeleteStoryEvent || runtimeType != other.runtimeType) {
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

class MutationDeleteStoryEvent {
  MutationDeleteStoryEvent({
    required this.deleteFromStoryEventsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteStoryEvent.fromJson(Map<String, dynamic> json) {
    final l$deleteFromStoryEventsCollection = json['deleteFromStoryEventsCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteStoryEvent(
      deleteFromStoryEventsCollection:
          MutationDeleteStoryEventdeleteFromStoryEventsCollection.fromJson(
            (l$deleteFromStoryEventsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteStoryEventdeleteFromStoryEventsCollection deleteFromStoryEventsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromStoryEventsCollection = deleteFromStoryEventsCollection;
    _resultData['deleteFromStoryEventsCollection'] = l$deleteFromStoryEventsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromStoryEventsCollection = deleteFromStoryEventsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromStoryEventsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteStoryEvent || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromStoryEventsCollection = deleteFromStoryEventsCollection;
    final lOther$deleteFromStoryEventsCollection = other.deleteFromStoryEventsCollection;
    if (l$deleteFromStoryEventsCollection != lOther$deleteFromStoryEventsCollection) {
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

const documentNodeMutationDeleteStoryEvent = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteStoryEvent'),
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
            name: NameNode(value: 'deleteFromStoryEventsCollection'),
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
MutationDeleteStoryEvent _parserFnMutationDeleteStoryEvent(Map<String, dynamic> data) =>
    MutationDeleteStoryEvent.fromJson(data);
typedef OnMutationCompletedMutationDeleteStoryEvent = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteStoryEvent?,
);

class OptionsMutationDeleteStoryEvent extends graphql.MutationOptions<MutationDeleteStoryEvent> {
  OptionsMutationDeleteStoryEvent({
    String? operationName,
    required VariablesMutationDeleteStoryEvent variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteStoryEvent? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteStoryEvent? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteStoryEvent>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationDeleteStoryEvent(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteStoryEvent,
         parserFn: _parserFnMutationDeleteStoryEvent,
       );

  final OnMutationCompletedMutationDeleteStoryEvent? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteStoryEvent
    extends graphql.WatchQueryOptions<MutationDeleteStoryEvent> {
  WatchOptionsMutationDeleteStoryEvent({
    String? operationName,
    required VariablesMutationDeleteStoryEvent variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteStoryEvent? typedOptimisticResult,
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
         document: documentNodeMutationDeleteStoryEvent,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteStoryEvent,
       );
}

extension ClientExtensionMutationDeleteStoryEvent on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteStoryEvent>> mutateDeleteStoryEvent(
    OptionsMutationDeleteStoryEvent options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteStoryEvent> watchMutationDeleteStoryEvent(
    WatchOptionsMutationDeleteStoryEvent options,
  ) => this.watchMutation(options);
}

class MutationDeleteStoryEventdeleteFromStoryEventsCollection {
  MutationDeleteStoryEventdeleteFromStoryEventsCollection({
    required this.affectedCount,
    this.$__typename = 'StoryEventsDeleteResponse',
  });

  factory MutationDeleteStoryEventdeleteFromStoryEventsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteStoryEventdeleteFromStoryEventsCollection(
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
    if (other is! MutationDeleteStoryEventdeleteFromStoryEventsCollection ||
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
