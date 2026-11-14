// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteImportantDate {
  factory VariablesMutationDeleteImportantDate({required String id}) =>
      VariablesMutationDeleteImportantDate._({r'id': id});

  VariablesMutationDeleteImportantDate._(this._$data);

  factory VariablesMutationDeleteImportantDate.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteImportantDate._(result$data);
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
    if (other is! VariablesMutationDeleteImportantDate || runtimeType != other.runtimeType) {
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

class MutationDeleteImportantDate {
  MutationDeleteImportantDate({
    required this.deleteFromImportantDatesCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteImportantDate.fromJson(Map<String, dynamic> json) {
    final l$deleteFromImportantDatesCollection = json['deleteFromImportantDatesCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteImportantDate(
      deleteFromImportantDatesCollection:
          MutationDeleteImportantDatedeleteFromImportantDatesCollection.fromJson(
            (l$deleteFromImportantDatesCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteImportantDatedeleteFromImportantDatesCollection
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
    if (other is! MutationDeleteImportantDate || runtimeType != other.runtimeType) {
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

const documentNodeMutationDeleteImportantDate = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteImportantDate'),
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
MutationDeleteImportantDate _parserFnMutationDeleteImportantDate(Map<String, dynamic> data) =>
    MutationDeleteImportantDate.fromJson(data);
typedef OnMutationCompletedMutationDeleteImportantDate = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteImportantDate?,
);

class OptionsMutationDeleteImportantDate
    extends graphql.MutationOptions<MutationDeleteImportantDate> {
  OptionsMutationDeleteImportantDate({
    String? operationName,
    required VariablesMutationDeleteImportantDate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteImportantDate? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteImportantDate? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteImportantDate>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteImportantDate',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationDeleteImportantDate(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteImportantDate,
         parserFn: _parserFnMutationDeleteImportantDate,
       );

  final OnMutationCompletedMutationDeleteImportantDate? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteImportantDate
    extends graphql.WatchQueryOptions<MutationDeleteImportantDate> {
  WatchOptionsMutationDeleteImportantDate({
    String? operationName,
    required VariablesMutationDeleteImportantDate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteImportantDate? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeleteImportantDate',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeleteImportantDate,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteImportantDate,
       );
}

extension ClientExtensionMutationDeleteImportantDate on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteImportantDate>> mutateDeleteImportantDate(
    OptionsMutationDeleteImportantDate options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteImportantDate> watchMutationDeleteImportantDate(
    WatchOptionsMutationDeleteImportantDate options,
  ) => this.watchMutation(options);
}

class MutationDeleteImportantDatedeleteFromImportantDatesCollection {
  MutationDeleteImportantDatedeleteFromImportantDatesCollection({
    required this.affectedCount,
    this.$__typename = 'ImportantDatesDeleteResponse',
  });

  factory MutationDeleteImportantDatedeleteFromImportantDatesCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteImportantDatedeleteFromImportantDatesCollection(
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
    if (other is! MutationDeleteImportantDatedeleteFromImportantDatesCollection ||
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
