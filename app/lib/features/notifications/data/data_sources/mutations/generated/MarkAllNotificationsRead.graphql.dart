// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationMarkAllNotificationsRead {
  factory VariablesMutationMarkAllNotificationsRead({required DateTime readAt}) =>
      VariablesMutationMarkAllNotificationsRead._({r'readAt': readAt});

  VariablesMutationMarkAllNotificationsRead._(this._$data);

  factory VariablesMutationMarkAllNotificationsRead.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$readAt = data['readAt'];
    result$data['readAt'] = DateTime.parse((l$readAt as String));
    return VariablesMutationMarkAllNotificationsRead._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime get readAt => (_$data['readAt'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$readAt = readAt;
    result$data['readAt'] = l$readAt.toIso8601String();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationMarkAllNotificationsRead || runtimeType != other.runtimeType) {
      return false;
    }
    final l$readAt = readAt;
    final lOther$readAt = other.readAt;
    if (l$readAt != lOther$readAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$readAt = readAt;
    return Object.hashAll([l$readAt]);
  }
}

class MutationMarkAllNotificationsRead {
  MutationMarkAllNotificationsRead({
    required this.updatenotificationsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationMarkAllNotificationsRead.fromJson(Map<String, dynamic> json) {
    final l$updatenotificationsCollection = json['updatenotificationsCollection'];
    final l$$__typename = json['__typename'];
    return MutationMarkAllNotificationsRead(
      updatenotificationsCollection:
          MutationMarkAllNotificationsReadupdatenotificationsCollection.fromJson(
            (l$updatenotificationsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationMarkAllNotificationsReadupdatenotificationsCollection updatenotificationsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updatenotificationsCollection = updatenotificationsCollection;
    _resultData['updatenotificationsCollection'] = l$updatenotificationsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updatenotificationsCollection = updatenotificationsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updatenotificationsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationMarkAllNotificationsRead || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updatenotificationsCollection = updatenotificationsCollection;
    final lOther$updatenotificationsCollection = other.updatenotificationsCollection;
    if (l$updatenotificationsCollection != lOther$updatenotificationsCollection) {
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

const documentNodeMutationMarkAllNotificationsRead = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'MarkAllNotificationsRead'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'readAt')),
          type: NamedTypeNode(name: NameNode(value: 'Datetime'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updatenotificationsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'read_at'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'is'),
                            value: EnumValueNode(name: NameNode(value: 'NULL')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'read_at'),
                      value: VariableNode(name: NameNode(value: 'readAt')),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'atMost'),
                value: IntValueNode(value: '1000'),
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
MutationMarkAllNotificationsRead _parserFnMutationMarkAllNotificationsRead(
  Map<String, dynamic> data,
) => MutationMarkAllNotificationsRead.fromJson(data);
typedef OnMutationCompletedMutationMarkAllNotificationsRead = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationMarkAllNotificationsRead?,
);

class OptionsMutationMarkAllNotificationsRead
    extends graphql.MutationOptions<MutationMarkAllNotificationsRead> {
  OptionsMutationMarkAllNotificationsRead({
    String? operationName,
    required VariablesMutationMarkAllNotificationsRead variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationMarkAllNotificationsRead? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationMarkAllNotificationsRead? onCompleted,
    graphql.OnMutationUpdate<MutationMarkAllNotificationsRead>? update,
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
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationMarkAllNotificationsRead(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationMarkAllNotificationsRead,
         parserFn: _parserFnMutationMarkAllNotificationsRead,
       );

  final OnMutationCompletedMutationMarkAllNotificationsRead? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationMarkAllNotificationsRead
    extends graphql.WatchQueryOptions<MutationMarkAllNotificationsRead> {
  WatchOptionsMutationMarkAllNotificationsRead({
    String? operationName,
    required VariablesMutationMarkAllNotificationsRead variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationMarkAllNotificationsRead? typedOptimisticResult,
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
         document: documentNodeMutationMarkAllNotificationsRead,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationMarkAllNotificationsRead,
       );
}

extension ClientExtensionMutationMarkAllNotificationsRead on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationMarkAllNotificationsRead>> mutateMarkAllNotificationsRead(
    OptionsMutationMarkAllNotificationsRead options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationMarkAllNotificationsRead> watchMutationMarkAllNotificationsRead(
    WatchOptionsMutationMarkAllNotificationsRead options,
  ) => this.watchMutation(options);
}

class MutationMarkAllNotificationsReadupdatenotificationsCollection {
  MutationMarkAllNotificationsReadupdatenotificationsCollection({
    required this.affectedCount,
    this.$__typename = 'notificationsUpdateResponse',
  });

  factory MutationMarkAllNotificationsReadupdatenotificationsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationMarkAllNotificationsReadupdatenotificationsCollection(
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
    if (other is! MutationMarkAllNotificationsReadupdatenotificationsCollection ||
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
