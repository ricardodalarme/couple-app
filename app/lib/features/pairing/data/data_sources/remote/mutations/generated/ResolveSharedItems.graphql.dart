// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationResolveSharedItems {
  factory VariablesMutationResolveSharedItems({required bool keep}) =>
      VariablesMutationResolveSharedItems._({r'keep': keep});

  VariablesMutationResolveSharedItems._(this._$data);

  factory VariablesMutationResolveSharedItems.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$keep = data['keep'];
    result$data['keep'] = (l$keep as bool);
    return VariablesMutationResolveSharedItems._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get keep => (_$data['keep'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$keep = keep;
    result$data['keep'] = l$keep;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationResolveSharedItems || runtimeType != other.runtimeType) {
      return false;
    }
    final l$keep = keep;
    final lOther$keep = other.keep;
    if (l$keep != lOther$keep) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$keep = keep;
    return Object.hashAll([l$keep]);
  }
}

class MutationResolveSharedItems {
  MutationResolveSharedItems({this.resolveSharedItems, this.$__typename = 'Mutation'});

  factory MutationResolveSharedItems.fromJson(Map<String, dynamic> json) {
    final l$resolveSharedItems = json['resolveSharedItems'];
    final l$$__typename = json['__typename'];
    return MutationResolveSharedItems(
      resolveSharedItems: (l$resolveSharedItems as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? resolveSharedItems;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$resolveSharedItems = resolveSharedItems;
    _resultData['resolveSharedItems'] = l$resolveSharedItems;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$resolveSharedItems = resolveSharedItems;
    final l$$__typename = $__typename;
    return Object.hashAll([l$resolveSharedItems, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationResolveSharedItems || runtimeType != other.runtimeType) {
      return false;
    }
    final l$resolveSharedItems = resolveSharedItems;
    final lOther$resolveSharedItems = other.resolveSharedItems;
    if (l$resolveSharedItems != lOther$resolveSharedItems) {
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

const documentNodeMutationResolveSharedItems = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ResolveSharedItems'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'keep')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'resolveSharedItems'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'keep'),
                value: VariableNode(name: NameNode(value: 'keep')),
              ),
            ],
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
  ],
);
MutationResolveSharedItems _parserFnMutationResolveSharedItems(Map<String, dynamic> data) =>
    MutationResolveSharedItems.fromJson(data);
typedef OnMutationCompletedMutationResolveSharedItems = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationResolveSharedItems?,
);

class OptionsMutationResolveSharedItems
    extends graphql.MutationOptions<MutationResolveSharedItems> {
  OptionsMutationResolveSharedItems({
    String? operationName,
    required VariablesMutationResolveSharedItems variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationResolveSharedItems? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationResolveSharedItems? onCompleted,
    graphql.OnMutationUpdate<MutationResolveSharedItems>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'ResolveSharedItems',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationResolveSharedItems(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationResolveSharedItems,
         parserFn: _parserFnMutationResolveSharedItems,
       );

  final OnMutationCompletedMutationResolveSharedItems? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationResolveSharedItems
    extends graphql.WatchQueryOptions<MutationResolveSharedItems> {
  WatchOptionsMutationResolveSharedItems({
    String? operationName,
    required VariablesMutationResolveSharedItems variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationResolveSharedItems? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'ResolveSharedItems',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationResolveSharedItems,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationResolveSharedItems,
       );
}

extension ClientExtensionMutationResolveSharedItems on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationResolveSharedItems>> mutateResolveSharedItems(
    OptionsMutationResolveSharedItems options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationResolveSharedItems> watchMutationResolveSharedItems(
    WatchOptionsMutationResolveSharedItems options,
  ) => this.watchMutation(options);
}
