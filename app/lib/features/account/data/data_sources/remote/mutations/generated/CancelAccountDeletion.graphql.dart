// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class MutationCancelAccountDeletion {
  MutationCancelAccountDeletion({this.cancelAccountDeletion, this.$__typename = 'Mutation'});

  factory MutationCancelAccountDeletion.fromJson(Map<String, dynamic> json) {
    final l$cancelAccountDeletion = json['cancelAccountDeletion'];
    final l$$__typename = json['__typename'];
    return MutationCancelAccountDeletion(
      cancelAccountDeletion: (l$cancelAccountDeletion as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? cancelAccountDeletion;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cancelAccountDeletion = cancelAccountDeletion;
    _resultData['cancelAccountDeletion'] = l$cancelAccountDeletion;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cancelAccountDeletion = cancelAccountDeletion;
    final l$$__typename = $__typename;
    return Object.hashAll([l$cancelAccountDeletion, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationCancelAccountDeletion || runtimeType != other.runtimeType) {
      return false;
    }
    final l$cancelAccountDeletion = cancelAccountDeletion;
    final lOther$cancelAccountDeletion = other.cancelAccountDeletion;
    if (l$cancelAccountDeletion != lOther$cancelAccountDeletion) {
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

const documentNodeMutationCancelAccountDeletion = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CancelAccountDeletion'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'cancelAccountDeletion'),
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
MutationCancelAccountDeletion _parserFnMutationCancelAccountDeletion(Map<String, dynamic> data) =>
    MutationCancelAccountDeletion.fromJson(data);
typedef OnMutationCompletedMutationCancelAccountDeletion = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationCancelAccountDeletion?,
);

class OptionsMutationCancelAccountDeletion
    extends graphql.MutationOptions<MutationCancelAccountDeletion> {
  OptionsMutationCancelAccountDeletion({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCancelAccountDeletion? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationCancelAccountDeletion? onCompleted,
    graphql.OnMutationUpdate<MutationCancelAccountDeletion>? update,
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
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationCancelAccountDeletion(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCancelAccountDeletion,
         parserFn: _parserFnMutationCancelAccountDeletion,
       );

  final OnMutationCompletedMutationCancelAccountDeletion? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationCancelAccountDeletion
    extends graphql.WatchQueryOptions<MutationCancelAccountDeletion> {
  WatchOptionsMutationCancelAccountDeletion({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCancelAccountDeletion? typedOptimisticResult,
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
         document: documentNodeMutationCancelAccountDeletion,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationCancelAccountDeletion,
       );
}

extension ClientExtensionMutationCancelAccountDeletion on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationCancelAccountDeletion>> mutateCancelAccountDeletion([
    OptionsMutationCancelAccountDeletion? options,
  ]) async => await this.mutate(options ?? OptionsMutationCancelAccountDeletion());

  graphql.ObservableQuery<MutationCancelAccountDeletion> watchMutationCancelAccountDeletion([
    WatchOptionsMutationCancelAccountDeletion? options,
  ]) => this.watchMutation(options ?? WatchOptionsMutationCancelAccountDeletion());
}
