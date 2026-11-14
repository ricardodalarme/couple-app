// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetSlipCategory {
  factory VariablesMutationSetSlipCategory({required String id, String? category}) =>
      VariablesMutationSetSlipCategory._({r'id': id, if (category != null) r'category': category});

  VariablesMutationSetSlipCategory._(this._$data);

  factory VariablesMutationSetSlipCategory.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = (l$category as String?);
    }
    return VariablesMutationSetSlipCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get category => (_$data['category'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetSlipCategory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') != other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$category = category;
    return Object.hashAll([l$id, _$data.containsKey('category') ? l$category : const {}]);
  }
}

class MutationSetSlipCategory {
  MutationSetSlipCategory({this.setSlipDetails, this.$__typename = 'Mutation'});

  factory MutationSetSlipCategory.fromJson(Map<String, dynamic> json) {
    final l$setSlipDetails = json['setSlipDetails'];
    final l$$__typename = json['__typename'];
    return MutationSetSlipCategory(
      setSlipDetails: l$setSlipDetails == null
          ? null
          : MutationSetSlipCategorysetSlipDetails.fromJson(
              (l$setSlipDetails as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetSlipCategorysetSlipDetails? setSlipDetails;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$setSlipDetails = setSlipDetails;
    _resultData['setSlipDetails'] = l$setSlipDetails?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$setSlipDetails = setSlipDetails;
    final l$$__typename = $__typename;
    return Object.hashAll([l$setSlipDetails, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetSlipCategory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$setSlipDetails = setSlipDetails;
    final lOther$setSlipDetails = other.setSlipDetails;
    if (l$setSlipDetails != lOther$setSlipDetails) {
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

const documentNodeMutationSetSlipCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetSlipCategory'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'category')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'setSlipDetails'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'category'),
                value: VariableNode(name: NameNode(value: 'category')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
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
MutationSetSlipCategory _parserFnMutationSetSlipCategory(Map<String, dynamic> data) =>
    MutationSetSlipCategory.fromJson(data);
typedef OnMutationCompletedMutationSetSlipCategory = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetSlipCategory?,
);

class OptionsMutationSetSlipCategory extends graphql.MutationOptions<MutationSetSlipCategory> {
  OptionsMutationSetSlipCategory({
    String? operationName,
    required VariablesMutationSetSlipCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetSlipCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetSlipCategory? onCompleted,
    graphql.OnMutationUpdate<MutationSetSlipCategory>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetSlipCategory',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationSetSlipCategory(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSetSlipCategory,
         parserFn: _parserFnMutationSetSlipCategory,
       );

  final OnMutationCompletedMutationSetSlipCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetSlipCategory
    extends graphql.WatchQueryOptions<MutationSetSlipCategory> {
  WatchOptionsMutationSetSlipCategory({
    String? operationName,
    required VariablesMutationSetSlipCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetSlipCategory? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetSlipCategory',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationSetSlipCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetSlipCategory,
       );
}

extension ClientExtensionMutationSetSlipCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetSlipCategory>> mutateSetSlipCategory(
    OptionsMutationSetSlipCategory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetSlipCategory> watchMutationSetSlipCategory(
    WatchOptionsMutationSetSlipCategory options,
  ) => this.watchMutation(options);
}

class MutationSetSlipCategorysetSlipDetails {
  MutationSetSlipCategorysetSlipDetails({required this.id, this.$__typename = 'Slips'});

  factory MutationSetSlipCategorysetSlipDetails.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationSetSlipCategorysetSlipDetails(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetSlipCategorysetSlipDetails || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
