// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class MutationEndPause {
  MutationEndPause({this.endPause, this.$__typename = 'Mutation'});

  factory MutationEndPause.fromJson(Map<String, dynamic> json) {
    final l$endPause = json['endPause'];
    final l$$__typename = json['__typename'];
    return MutationEndPause(
      endPause: (l$endPause as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? endPause;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$endPause = endPause;
    _resultData['endPause'] = l$endPause;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$endPause = endPause;
    final l$$__typename = $__typename;
    return Object.hashAll([l$endPause, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationEndPause || runtimeType != other.runtimeType) {
      return false;
    }
    final l$endPause = endPause;
    final lOther$endPause = other.endPause;
    if (l$endPause != lOther$endPause) {
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

const documentNodeMutationEndPause = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'EndPause'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'endPause'),
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
  ],
);
MutationEndPause _parserFnMutationEndPause(Map<String, dynamic> data) =>
    MutationEndPause.fromJson(data);
typedef OnMutationCompletedMutationEndPause = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationEndPause?,
);

class OptionsMutationEndPause extends graphql.MutationOptions<MutationEndPause> {
  OptionsMutationEndPause({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationEndPause? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationEndPause? onCompleted,
    graphql.OnMutationUpdate<MutationEndPause>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName ?? 'EndPause',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationEndPause(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationEndPause,
         parserFn: _parserFnMutationEndPause,
       );

  final OnMutationCompletedMutationEndPause? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationEndPause extends graphql.WatchQueryOptions<MutationEndPause> {
  WatchOptionsMutationEndPause({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationEndPause? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'EndPause',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationEndPause,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationEndPause,
       );
}

extension ClientExtensionMutationEndPause on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationEndPause>> mutateEndPause([
    OptionsMutationEndPause? options,
  ]) async => await this.mutate(options ?? OptionsMutationEndPause());

  graphql.ObservableQuery<MutationEndPause> watchMutationEndPause([
    WatchOptionsMutationEndPause? options,
  ]) => this.watchMutation(options ?? WatchOptionsMutationEndPause());
}
