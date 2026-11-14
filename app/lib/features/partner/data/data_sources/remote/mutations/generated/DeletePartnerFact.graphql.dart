// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeletePartnerFact {
  factory VariablesMutationDeletePartnerFact({required String id}) =>
      VariablesMutationDeletePartnerFact._({r'id': id});

  VariablesMutationDeletePartnerFact._(this._$data);

  factory VariablesMutationDeletePartnerFact.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeletePartnerFact._(result$data);
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
    if (other is! VariablesMutationDeletePartnerFact || runtimeType != other.runtimeType) {
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

class MutationDeletePartnerFact {
  MutationDeletePartnerFact({
    required this.deleteFromPartnerFactsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeletePartnerFact.fromJson(Map<String, dynamic> json) {
    final l$deleteFromPartnerFactsCollection = json['deleteFromPartnerFactsCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeletePartnerFact(
      deleteFromPartnerFactsCollection:
          MutationDeletePartnerFactdeleteFromPartnerFactsCollection.fromJson(
            (l$deleteFromPartnerFactsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeletePartnerFactdeleteFromPartnerFactsCollection deleteFromPartnerFactsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromPartnerFactsCollection = deleteFromPartnerFactsCollection;
    _resultData['deleteFromPartnerFactsCollection'] = l$deleteFromPartnerFactsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromPartnerFactsCollection = deleteFromPartnerFactsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromPartnerFactsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeletePartnerFact || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromPartnerFactsCollection = deleteFromPartnerFactsCollection;
    final lOther$deleteFromPartnerFactsCollection = other.deleteFromPartnerFactsCollection;
    if (l$deleteFromPartnerFactsCollection != lOther$deleteFromPartnerFactsCollection) {
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

const documentNodeMutationDeletePartnerFact = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeletePartnerFact'),
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
            name: NameNode(value: 'deleteFromPartnerFactsCollection'),
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
MutationDeletePartnerFact _parserFnMutationDeletePartnerFact(Map<String, dynamic> data) =>
    MutationDeletePartnerFact.fromJson(data);
typedef OnMutationCompletedMutationDeletePartnerFact = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeletePartnerFact?,
);

class OptionsMutationDeletePartnerFact extends graphql.MutationOptions<MutationDeletePartnerFact> {
  OptionsMutationDeletePartnerFact({
    String? operationName,
    required VariablesMutationDeletePartnerFact variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeletePartnerFact? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeletePartnerFact? onCompleted,
    graphql.OnMutationUpdate<MutationDeletePartnerFact>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeletePartnerFact',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationDeletePartnerFact(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeletePartnerFact,
         parserFn: _parserFnMutationDeletePartnerFact,
       );

  final OnMutationCompletedMutationDeletePartnerFact? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeletePartnerFact
    extends graphql.WatchQueryOptions<MutationDeletePartnerFact> {
  WatchOptionsMutationDeletePartnerFact({
    String? operationName,
    required VariablesMutationDeletePartnerFact variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeletePartnerFact? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'DeletePartnerFact',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeletePartnerFact,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeletePartnerFact,
       );
}

extension ClientExtensionMutationDeletePartnerFact on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeletePartnerFact>> mutateDeletePartnerFact(
    OptionsMutationDeletePartnerFact options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeletePartnerFact> watchMutationDeletePartnerFact(
    WatchOptionsMutationDeletePartnerFact options,
  ) => this.watchMutation(options);
}

class MutationDeletePartnerFactdeleteFromPartnerFactsCollection {
  MutationDeletePartnerFactdeleteFromPartnerFactsCollection({
    required this.affectedCount,
    this.$__typename = 'PartnerFactsDeleteResponse',
  });

  factory MutationDeletePartnerFactdeleteFromPartnerFactsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeletePartnerFactdeleteFromPartnerFactsCollection(
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
    if (other is! MutationDeletePartnerFactdeleteFromPartnerFactsCollection ||
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
