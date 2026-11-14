// dart format width=100
import '../../fragments/generated/GiftWishFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetGiftWishVisibility {
  factory VariablesMutationSetGiftWishVisibility({required String id, String? coupleId}) =>
      VariablesMutationSetGiftWishVisibility._({
        r'id': id,
        if (coupleId != null) r'coupleId': coupleId,
      });

  VariablesMutationSetGiftWishVisibility._(this._$data);

  factory VariablesMutationSetGiftWishVisibility.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    return VariablesMutationSetGiftWishVisibility._(result$data);
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
    if (other is! VariablesMutationSetGiftWishVisibility || runtimeType != other.runtimeType) {
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

class MutationSetGiftWishVisibility {
  MutationSetGiftWishVisibility({
    required this.updateGiftIdeasCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationSetGiftWishVisibility.fromJson(Map<String, dynamic> json) {
    final l$updateGiftIdeasCollection = json['updateGiftIdeasCollection'];
    final l$$__typename = json['__typename'];
    return MutationSetGiftWishVisibility(
      updateGiftIdeasCollection: MutationSetGiftWishVisibilityupdateGiftIdeasCollection.fromJson(
        (l$updateGiftIdeasCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetGiftWishVisibilityupdateGiftIdeasCollection updateGiftIdeasCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateGiftIdeasCollection = updateGiftIdeasCollection;
    _resultData['updateGiftIdeasCollection'] = l$updateGiftIdeasCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateGiftIdeasCollection = updateGiftIdeasCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateGiftIdeasCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetGiftWishVisibility || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateGiftIdeasCollection = updateGiftIdeasCollection;
    final lOther$updateGiftIdeasCollection = other.updateGiftIdeasCollection;
    if (l$updateGiftIdeasCollection != lOther$updateGiftIdeasCollection) {
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

const documentNodeMutationSetGiftWishVisibility = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetGiftWishVisibility'),
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
            name: NameNode(value: 'updateGiftIdeasCollection'),
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
                        name: NameNode(value: 'GiftWishFragment'),
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
    fragmentDefinitionGiftWishFragment,
  ],
);
MutationSetGiftWishVisibility _parserFnMutationSetGiftWishVisibility(Map<String, dynamic> data) =>
    MutationSetGiftWishVisibility.fromJson(data);
typedef OnMutationCompletedMutationSetGiftWishVisibility = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetGiftWishVisibility?,
);

class OptionsMutationSetGiftWishVisibility
    extends graphql.MutationOptions<MutationSetGiftWishVisibility> {
  OptionsMutationSetGiftWishVisibility({
    String? operationName,
    required VariablesMutationSetGiftWishVisibility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetGiftWishVisibility? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetGiftWishVisibility? onCompleted,
    graphql.OnMutationUpdate<MutationSetGiftWishVisibility>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetGiftWishVisibility',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationSetGiftWishVisibility(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSetGiftWishVisibility,
         parserFn: _parserFnMutationSetGiftWishVisibility,
       );

  final OnMutationCompletedMutationSetGiftWishVisibility? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetGiftWishVisibility
    extends graphql.WatchQueryOptions<MutationSetGiftWishVisibility> {
  WatchOptionsMutationSetGiftWishVisibility({
    String? operationName,
    required VariablesMutationSetGiftWishVisibility variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetGiftWishVisibility? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetGiftWishVisibility',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationSetGiftWishVisibility,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetGiftWishVisibility,
       );
}

extension ClientExtensionMutationSetGiftWishVisibility on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetGiftWishVisibility>> mutateSetGiftWishVisibility(
    OptionsMutationSetGiftWishVisibility options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetGiftWishVisibility> watchMutationSetGiftWishVisibility(
    WatchOptionsMutationSetGiftWishVisibility options,
  ) => this.watchMutation(options);
}

class MutationSetGiftWishVisibilityupdateGiftIdeasCollection {
  MutationSetGiftWishVisibilityupdateGiftIdeasCollection({
    required this.records,
    this.$__typename = 'GiftIdeasUpdateResponse',
  });

  factory MutationSetGiftWishVisibilityupdateGiftIdeasCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationSetGiftWishVisibilityupdateGiftIdeasCollection(
      records: (l$records as List<dynamic>)
          .map((e) => FragmentGiftWishFragment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<FragmentGiftWishFragment> records;

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
    if (other is! MutationSetGiftWishVisibilityupdateGiftIdeasCollection ||
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
