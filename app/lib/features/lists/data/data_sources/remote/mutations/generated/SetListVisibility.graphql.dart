// dart format width=100
import '../../fragments/generated/ListFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetListVisibility {
  factory VariablesMutationSetListVisibility({required String id, String? coupleId}) =>
      VariablesMutationSetListVisibility._({
        r'id': id,
        if (coupleId != null) r'coupleId': coupleId,
      });

  VariablesMutationSetListVisibility._(this._$data);

  factory VariablesMutationSetListVisibility.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    return VariablesMutationSetListVisibility._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get coupleId => (_$data['coupleId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
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
    if (other is! VariablesMutationSetListVisibility || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$coupleId = coupleId;
    return Object.hashAll([l$id, _$data.containsKey('coupleId') ? l$coupleId : const {}]);
  }
}

class MutationSetListVisibility {
  MutationSetListVisibility({required this.updateListsCollection, this.$__typename = 'Mutation'});

  factory MutationSetListVisibility.fromJson(Map<String, dynamic> json) {
    final l$updateListsCollection = json['updateListsCollection'];
    final l$$__typename = json['__typename'];
    return MutationSetListVisibility(
      updateListsCollection: MutationSetListVisibilityupdateListsCollection.fromJson(
        (l$updateListsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetListVisibilityupdateListsCollection updateListsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateListsCollection = updateListsCollection;
    _resultData['updateListsCollection'] = l$updateListsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateListsCollection = updateListsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateListsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetListVisibility || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateListsCollection = updateListsCollection;
    final lOther$updateListsCollection = other.updateListsCollection;
    if (l$updateListsCollection != lOther$updateListsCollection) {
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

const documentNodeMutationSetListVisibility = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetListVisibility'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
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
            name: NameNode(value: 'updateListsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'coupleId'),
                      value: VariableNode(name: NameNode(value: 'coupleId')),
                    ),
                  ],
                ),
              ),
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
                  name: NameNode(value: 'records'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'ListFragment'),
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
    fragmentDefinitionListFragment,
  ],
);
MutationSetListVisibility _parserFnMutationSetListVisibility(Map<String, dynamic> data) =>
    MutationSetListVisibility.fromJson(data);
typedef OnMutationCompletedMutationSetListVisibility = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetListVisibility?,
);

class OptionsMutationSetListVisibility extends graphql.MutationOptions<MutationSetListVisibility> {
  OptionsMutationSetListVisibility({
    String? operationName,
    required VariablesMutationSetListVisibility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetListVisibility? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetListVisibility? onCompleted,
    graphql.OnMutationUpdate<MutationSetListVisibility>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetListVisibility',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationSetListVisibility(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSetListVisibility,
         parserFn: _parserFnMutationSetListVisibility,
       );

  final OnMutationCompletedMutationSetListVisibility? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetListVisibility
    extends graphql.WatchQueryOptions<MutationSetListVisibility> {
  WatchOptionsMutationSetListVisibility({
    String? operationName,
    required VariablesMutationSetListVisibility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetListVisibility? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetListVisibility',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationSetListVisibility,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetListVisibility,
       );
}

extension ClientExtensionMutationSetListVisibility on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetListVisibility>> mutateSetListVisibility(
    OptionsMutationSetListVisibility options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetListVisibility> watchMutationSetListVisibility(
    WatchOptionsMutationSetListVisibility options,
  ) => this.watchMutation(options);
}

class MutationSetListVisibilityupdateListsCollection {
  MutationSetListVisibilityupdateListsCollection({
    required this.records,
    this.$__typename = 'ListsUpdateResponse',
  });

  factory MutationSetListVisibilityupdateListsCollection.fromJson(Map<String, dynamic> json) {
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationSetListVisibilityupdateListsCollection(
      records: (l$records as List<dynamic>)
          .map((e) => FragmentListFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<FragmentListFragment> records;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$records = records;
    _resultData['records'] = l$records.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$records = records;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$records.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetListVisibilityupdateListsCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$records = records;
    final lOther$records = other.records;
    if (l$records.length != lOther$records.length) {
      return false;
    }
    for (int i = 0; i < l$records.length; i++) {
      final l$records$entry = l$records[i];
      final lOther$records$entry = lOther$records[i];
      if (l$records$entry != lOther$records$entry) {
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
