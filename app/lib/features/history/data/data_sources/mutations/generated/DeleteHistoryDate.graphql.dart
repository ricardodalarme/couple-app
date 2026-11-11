// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteHistoryDate {
  factory VariablesMutationDeleteHistoryDate({required String id}) =>
      VariablesMutationDeleteHistoryDate._({r'id': id});

  VariablesMutationDeleteHistoryDate._(this._$data);

  factory VariablesMutationDeleteHistoryDate.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteHistoryDate._(result$data);
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
    if (other is! VariablesMutationDeleteHistoryDate || runtimeType != other.runtimeType) {
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

class MutationDeleteHistoryDate {
  MutationDeleteHistoryDate({
    required this.deleteFromImportantDatesCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteHistoryDate.fromJson(Map<String, dynamic> json) {
    final l$deleteFromImportantDatesCollection = json['deleteFromImportantDatesCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteHistoryDate(
      deleteFromImportantDatesCollection:
          MutationDeleteHistoryDatedeleteFromImportantDatesCollection.fromJson(
            (l$deleteFromImportantDatesCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteHistoryDatedeleteFromImportantDatesCollection
  deleteFromImportantDatesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromImportantDatesCollection = deleteFromImportantDatesCollection;
    _resultData['deleteFromImportantDatesCollection'] = l$deleteFromImportantDatesCollection
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromImportantDatesCollection = deleteFromImportantDatesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromImportantDatesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteHistoryDate || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromImportantDatesCollection = deleteFromImportantDatesCollection;
    final lOther$deleteFromImportantDatesCollection = other.deleteFromImportantDatesCollection;
    if (l$deleteFromImportantDatesCollection != lOther$deleteFromImportantDatesCollection) {
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

const documentNodeMutationDeleteHistoryDate = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteHistoryDate'),
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
            name: NameNode(value: 'deleteFromImportantDatesCollection'),
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
MutationDeleteHistoryDate _parserFnMutationDeleteHistoryDate(Map<String, dynamic> data) =>
    MutationDeleteHistoryDate.fromJson(data);
typedef OnMutationCompletedMutationDeleteHistoryDate = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteHistoryDate?,
);

class OptionsMutationDeleteHistoryDate extends graphql.MutationOptions<MutationDeleteHistoryDate> {
  OptionsMutationDeleteHistoryDate({
    String? operationName,
    required VariablesMutationDeleteHistoryDate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteHistoryDate? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteHistoryDate? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteHistoryDate>? update,
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
                 data == null ? null : _parserFnMutationDeleteHistoryDate(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteHistoryDate,
         parserFn: _parserFnMutationDeleteHistoryDate,
       );

  final OnMutationCompletedMutationDeleteHistoryDate? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteHistoryDate
    extends graphql.WatchQueryOptions<MutationDeleteHistoryDate> {
  WatchOptionsMutationDeleteHistoryDate({
    String? operationName,
    required VariablesMutationDeleteHistoryDate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteHistoryDate? typedOptimisticResult,
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
         document: documentNodeMutationDeleteHistoryDate,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteHistoryDate,
       );
}

extension ClientExtensionMutationDeleteHistoryDate on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteHistoryDate>> mutateDeleteHistoryDate(
    OptionsMutationDeleteHistoryDate options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteHistoryDate> watchMutationDeleteHistoryDate(
    WatchOptionsMutationDeleteHistoryDate options,
  ) => this.watchMutation(options);
}

class MutationDeleteHistoryDatedeleteFromImportantDatesCollection {
  MutationDeleteHistoryDatedeleteFromImportantDatesCollection({
    required this.affectedCount,
    this.$__typename = 'ImportantDatesDeleteResponse',
  });

  factory MutationDeleteHistoryDatedeleteFromImportantDatesCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteHistoryDatedeleteFromImportantDatesCollection(
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
    if (other is! MutationDeleteHistoryDatedeleteFromImportantDatesCollection ||
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
