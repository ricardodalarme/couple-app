// dart format width=100
import '../../fragments/generated/CardFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class MutationPrepareCard {
  MutationPrepareCard({this.prepareCard, this.$__typename = 'Mutation'});

  factory MutationPrepareCard.fromJson(Map<String, dynamic> json) {
    final l$prepareCard = json['prepareCard'];
    final l$$__typename = json['__typename'];
    return MutationPrepareCard(
      prepareCard: l$prepareCard == null
          ? null
          : FragmentCardFragment.fromJson((l$prepareCard as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentCardFragment? prepareCard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$prepareCard = prepareCard;
    _resultData['prepareCard'] = l$prepareCard?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$prepareCard = prepareCard;
    final l$$__typename = $__typename;
    return Object.hashAll([l$prepareCard, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationPrepareCard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$prepareCard = prepareCard;
    final lOther$prepareCard = other.prepareCard;
    if (l$prepareCard != lOther$prepareCard) {
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

const documentNodeMutationPrepareCard = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'PrepareCard'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'prepareCard'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'CardFragment'),
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
    fragmentDefinitionCardFragment,
  ],
);
MutationPrepareCard _parserFnMutationPrepareCard(Map<String, dynamic> data) =>
    MutationPrepareCard.fromJson(data);
typedef OnMutationCompletedMutationPrepareCard = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationPrepareCard?,
);

class OptionsMutationPrepareCard extends graphql.MutationOptions<MutationPrepareCard> {
  OptionsMutationPrepareCard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationPrepareCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationPrepareCard? onCompleted,
    graphql.OnMutationUpdate<MutationPrepareCard>? update,
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
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationPrepareCard(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationPrepareCard,
         parserFn: _parserFnMutationPrepareCard,
       );

  final OnMutationCompletedMutationPrepareCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationPrepareCard extends graphql.WatchQueryOptions<MutationPrepareCard> {
  WatchOptionsMutationPrepareCard({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationPrepareCard? typedOptimisticResult,
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
         document: documentNodeMutationPrepareCard,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationPrepareCard,
       );
}

extension ClientExtensionMutationPrepareCard on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationPrepareCard>> mutatePrepareCard([
    OptionsMutationPrepareCard? options,
  ]) async => await this.mutate(options ?? OptionsMutationPrepareCard());

  graphql.ObservableQuery<MutationPrepareCard> watchMutationPrepareCard([
    WatchOptionsMutationPrepareCard? options,
  ]) => this.watchMutation(options ?? WatchOptionsMutationPrepareCard());
}
