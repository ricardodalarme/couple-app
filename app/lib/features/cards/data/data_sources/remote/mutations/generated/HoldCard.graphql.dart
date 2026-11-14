// dart format width=100
import '../../fragments/generated/CardFragment.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationHoldCard {
  factory VariablesMutationHoldCard({required String cardId}) =>
      VariablesMutationHoldCard._({r'cardId': cardId});

  VariablesMutationHoldCard._(this._$data);

  factory VariablesMutationHoldCard.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$cardId = data['cardId'];
    result$data['cardId'] = (l$cardId as String);
    return VariablesMutationHoldCard._(result$data);
  }

  Map<String, dynamic> _$data;

  String get cardId => (_$data['cardId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$cardId = cardId;
    result$data['cardId'] = l$cardId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationHoldCard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$cardId = cardId;
    final lOther$cardId = other.cardId;
    if (l$cardId != lOther$cardId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$cardId = cardId;
    return Object.hashAll([l$cardId]);
  }
}

class MutationHoldCard {
  MutationHoldCard({this.holdCard, this.$__typename = 'Mutation'});

  factory MutationHoldCard.fromJson(Map<String, dynamic> json) {
    final l$holdCard = json['holdCard'];
    final l$$__typename = json['__typename'];
    return MutationHoldCard(
      holdCard: l$holdCard == null
          ? null
          : FragmentCardFragment.fromJson((l$holdCard as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentCardFragment? holdCard;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$holdCard = holdCard;
    _resultData['holdCard'] = l$holdCard?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$holdCard = holdCard;
    final l$$__typename = $__typename;
    return Object.hashAll([l$holdCard, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationHoldCard || runtimeType != other.runtimeType) {
      return false;
    }
    final l$holdCard = holdCard;
    final lOther$holdCard = other.holdCard;
    if (l$holdCard != lOther$holdCard) {
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

const documentNodeMutationHoldCard = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'HoldCard'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'cardId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'holdCard'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'cardId'),
                value: VariableNode(name: NameNode(value: 'cardId')),
              ),
            ],
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
MutationHoldCard _parserFnMutationHoldCard(Map<String, dynamic> data) =>
    MutationHoldCard.fromJson(data);
typedef OnMutationCompletedMutationHoldCard = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationHoldCard?,
);

class OptionsMutationHoldCard extends graphql.MutationOptions<MutationHoldCard> {
  OptionsMutationHoldCard({
    String? operationName,
    required VariablesMutationHoldCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationHoldCard? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationHoldCard? onCompleted,
    graphql.OnMutationUpdate<MutationHoldCard>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'HoldCard',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationHoldCard(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationHoldCard,
         parserFn: _parserFnMutationHoldCard,
       );

  final OnMutationCompletedMutationHoldCard? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationHoldCard extends graphql.WatchQueryOptions<MutationHoldCard> {
  WatchOptionsMutationHoldCard({
    String? operationName,
    required VariablesMutationHoldCard variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationHoldCard? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'HoldCard',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationHoldCard,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationHoldCard,
       );
}

extension ClientExtensionMutationHoldCard on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationHoldCard>> mutateHoldCard(
    OptionsMutationHoldCard options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationHoldCard> watchMutationHoldCard(
    WatchOptionsMutationHoldCard options,
  ) => this.watchMutation(options);
}
