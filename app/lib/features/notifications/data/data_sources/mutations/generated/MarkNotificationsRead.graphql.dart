// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationMarkNotificationsRead {
  factory VariablesMutationMarkNotificationsRead({
    required List<String> ids,
    required DateTime readAt,
  }) => VariablesMutationMarkNotificationsRead._({r'ids': ids, r'readAt': readAt});

  VariablesMutationMarkNotificationsRead._(this._$data);

  factory VariablesMutationMarkNotificationsRead.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$ids = data['ids'];
    result$data['ids'] = (l$ids as List<dynamic>).map((e) => (e as String)).toList();
    final l$readAt = data['readAt'];
    result$data['readAt'] = DateTime.parse((l$readAt as String));
    return VariablesMutationMarkNotificationsRead._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String> get ids => (_$data['ids'] as List<String>);

  DateTime get readAt => (_$data['readAt'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ids = ids;
    result$data['ids'] = l$ids.map((e) => e).toList();
    final l$readAt = readAt;
    result$data['readAt'] = l$readAt.toIso8601String();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationMarkNotificationsRead || runtimeType != other.runtimeType) {
      return false;
    }
    final l$ids = ids;
    final lOther$ids = other.ids;
    if (l$ids.length != lOther$ids.length) {
      return false;
    }
    for (int i = 0; i < l$ids.length; i++) {
      final l$ids$entry = l$ids[i];
      final lOther$ids$entry = lOther$ids[i];
      if (l$ids$entry != lOther$ids$entry) {
        return false;
      }
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
    final l$ids = ids;
    final l$readAt = readAt;
    return Object.hashAll([Object.hashAll(l$ids.map((v) => v)), l$readAt]);
  }
}

class MutationMarkNotificationsRead {
  MutationMarkNotificationsRead({
    required this.updatenotificationsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationMarkNotificationsRead.fromJson(Map<String, dynamic> json) {
    final l$updatenotificationsCollection = json['updatenotificationsCollection'];
    final l$$__typename = json['__typename'];
    return MutationMarkNotificationsRead(
      updatenotificationsCollection:
          MutationMarkNotificationsReadupdatenotificationsCollection.fromJson(
            (l$updatenotificationsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationMarkNotificationsReadupdatenotificationsCollection updatenotificationsCollection;

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
    if (other is! MutationMarkNotificationsRead || runtimeType != other.runtimeType) {
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

const documentNodeMutationMarkNotificationsRead = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'MarkNotificationsRead'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'ids')),
          type: ListTypeNode(
            type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
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
                      name: NameNode(value: 'id'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'in'),
                            value: VariableNode(name: NameNode(value: 'ids')),
                          ),
                        ],
                      ),
                    ),
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
                value: IntValueNode(value: '50'),
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
MutationMarkNotificationsRead _parserFnMutationMarkNotificationsRead(Map<String, dynamic> data) =>
    MutationMarkNotificationsRead.fromJson(data);
typedef OnMutationCompletedMutationMarkNotificationsRead = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationMarkNotificationsRead?,
);

class OptionsMutationMarkNotificationsRead
    extends graphql.MutationOptions<MutationMarkNotificationsRead> {
  OptionsMutationMarkNotificationsRead({
    String? operationName,
    required VariablesMutationMarkNotificationsRead variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationMarkNotificationsRead? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationMarkNotificationsRead? onCompleted,
    graphql.OnMutationUpdate<MutationMarkNotificationsRead>? update,
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
                 data == null ? null : _parserFnMutationMarkNotificationsRead(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationMarkNotificationsRead,
         parserFn: _parserFnMutationMarkNotificationsRead,
       );

  final OnMutationCompletedMutationMarkNotificationsRead? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationMarkNotificationsRead
    extends graphql.WatchQueryOptions<MutationMarkNotificationsRead> {
  WatchOptionsMutationMarkNotificationsRead({
    String? operationName,
    required VariablesMutationMarkNotificationsRead variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationMarkNotificationsRead? typedOptimisticResult,
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
         document: documentNodeMutationMarkNotificationsRead,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationMarkNotificationsRead,
       );
}

extension ClientExtensionMutationMarkNotificationsRead on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationMarkNotificationsRead>> mutateMarkNotificationsRead(
    OptionsMutationMarkNotificationsRead options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationMarkNotificationsRead> watchMutationMarkNotificationsRead(
    WatchOptionsMutationMarkNotificationsRead options,
  ) => this.watchMutation(options);
}

class MutationMarkNotificationsReadupdatenotificationsCollection {
  MutationMarkNotificationsReadupdatenotificationsCollection({
    required this.affectedCount,
    this.$__typename = 'notificationsUpdateResponse',
  });

  factory MutationMarkNotificationsReadupdatenotificationsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationMarkNotificationsReadupdatenotificationsCollection(
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
    if (other is! MutationMarkNotificationsReadupdatenotificationsCollection ||
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
