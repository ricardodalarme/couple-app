// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetTouchTopics {
  factory VariablesMutationSetTouchTopics({required bool enabled}) =>
      VariablesMutationSetTouchTopics._({r'enabled': enabled});

  VariablesMutationSetTouchTopics._(this._$data);

  factory VariablesMutationSetTouchTopics.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$enabled = data['enabled'];
    result$data['enabled'] = (l$enabled as bool);
    return VariablesMutationSetTouchTopics._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get enabled => (_$data['enabled'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$enabled = enabled;
    result$data['enabled'] = l$enabled;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetTouchTopics || runtimeType != other.runtimeType) {
      return false;
    }
    final l$enabled = enabled;
    final lOther$enabled = other.enabled;
    if (l$enabled != lOther$enabled) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$enabled = enabled;
    return Object.hashAll([l$enabled]);
  }
}

class MutationSetTouchTopics {
  MutationSetTouchTopics({this.setTouchTopics, this.$__typename = 'Mutation'});

  factory MutationSetTouchTopics.fromJson(Map<String, dynamic> json) {
    final l$setTouchTopics = json['setTouchTopics'];
    final l$$__typename = json['__typename'];
    return MutationSetTouchTopics(
      setTouchTopics: (l$setTouchTopics as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? setTouchTopics;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$setTouchTopics = setTouchTopics;
    _resultData['setTouchTopics'] = l$setTouchTopics;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$setTouchTopics = setTouchTopics;
    final l$$__typename = $__typename;
    return Object.hashAll([l$setTouchTopics, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetTouchTopics || runtimeType != other.runtimeType) {
      return false;
    }
    final l$setTouchTopics = setTouchTopics;
    final lOther$setTouchTopics = other.setTouchTopics;
    if (l$setTouchTopics != lOther$setTouchTopics) {
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

const documentNodeMutationSetTouchTopics = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetTouchTopics'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'enabled')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'setTouchTopics'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'enabled'),
                value: VariableNode(name: NameNode(value: 'enabled')),
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
MutationSetTouchTopics _parserFnMutationSetTouchTopics(Map<String, dynamic> data) =>
    MutationSetTouchTopics.fromJson(data);
typedef OnMutationCompletedMutationSetTouchTopics = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetTouchTopics?,
);

class OptionsMutationSetTouchTopics extends graphql.MutationOptions<MutationSetTouchTopics> {
  OptionsMutationSetTouchTopics({
    String? operationName,
    required VariablesMutationSetTouchTopics variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetTouchTopics? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetTouchTopics? onCompleted,
    graphql.OnMutationUpdate<MutationSetTouchTopics>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationSetTouchTopics(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSetTouchTopics,
         parserFn: _parserFnMutationSetTouchTopics,
       );

  final OnMutationCompletedMutationSetTouchTopics? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetTouchTopics extends graphql.WatchQueryOptions<MutationSetTouchTopics> {
  WatchOptionsMutationSetTouchTopics({
    String? operationName,
    required VariablesMutationSetTouchTopics variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetTouchTopics? typedOptimisticResult,
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
         document: documentNodeMutationSetTouchTopics,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetTouchTopics,
       );
}

extension ClientExtensionMutationSetTouchTopics on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetTouchTopics>> mutateSetTouchTopics(
    OptionsMutationSetTouchTopics options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetTouchTopics> watchMutationSetTouchTopics(
    WatchOptionsMutationSetTouchTopics options,
  ) => this.watchMutation(options);
}
