// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class MutationUnpair {
  MutationUnpair({this.unpair, this.$__typename = 'Mutation'});

  factory MutationUnpair.fromJson(Map<String, dynamic> json) {
    final l$unpair = json['unpair'];
    final l$$__typename = json['__typename'];
    return MutationUnpair(unpair: (l$unpair as bool?), $__typename: (l$$__typename as String));
  }

  final bool? unpair;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unpair = unpair;
    _resultData['unpair'] = l$unpair;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unpair = unpair;
    final l$$__typename = $__typename;
    return Object.hashAll([l$unpair, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUnpair || runtimeType != other.runtimeType) {
      return false;
    }
    final l$unpair = unpair;
    final lOther$unpair = other.unpair;
    if (l$unpair != lOther$unpair) {
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

const documentNodeMutationUnpair = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Unpair'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'unpair'),
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
MutationUnpair _parserFnMutationUnpair(Map<String, dynamic> data) => MutationUnpair.fromJson(data);
typedef OnMutationCompletedMutationUnpair = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUnpair?,
);

class OptionsMutationUnpair extends graphql.MutationOptions<MutationUnpair> {
  OptionsMutationUnpair({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUnpair? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUnpair? onCompleted,
    graphql.OnMutationUpdate<MutationUnpair>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationUnpair(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationUnpair,
         parserFn: _parserFnMutationUnpair,
       );

  final OnMutationCompletedMutationUnpair? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUnpair extends graphql.WatchQueryOptions<MutationUnpair> {
  WatchOptionsMutationUnpair({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUnpair? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationUnpair,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUnpair,
       );
}

extension ClientExtensionMutationUnpair on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUnpair>> mutateUnpair([
    OptionsMutationUnpair? options,
  ]) async => await this.mutate(options ?? OptionsMutationUnpair());

  graphql.ObservableQuery<MutationUnpair> watchMutationUnpair([
    WatchOptionsMutationUnpair? options,
  ]) => this.watchMutation(options ?? WatchOptionsMutationUnpair());
}
