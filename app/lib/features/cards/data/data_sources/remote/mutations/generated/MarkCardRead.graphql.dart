// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationMarkCardRead {
  factory VariablesMutationMarkCardRead({required String cardId}) =>
      VariablesMutationMarkCardRead._({r'cardId': cardId});

  VariablesMutationMarkCardRead._(this._$data);

  factory VariablesMutationMarkCardRead.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$cardId = data['cardId'];
    result$data['cardId'] = (l$cardId as String);
    return VariablesMutationMarkCardRead._(result$data);
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
    if (other is! VariablesMutationMarkCardRead || runtimeType != other.runtimeType) {
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

class MutationMarkCardRead {
  MutationMarkCardRead({this.markCardRead, this.$__typename = 'Mutation'});

  factory MutationMarkCardRead.fromJson(Map<String, dynamic> json) {
    final l$markCardRead = json['markCardRead'];
    final l$$__typename = json['__typename'];
    return MutationMarkCardRead(
      markCardRead: (l$markCardRead as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? markCardRead;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$markCardRead = markCardRead;
    _resultData['markCardRead'] = l$markCardRead;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$markCardRead = markCardRead;
    final l$$__typename = $__typename;
    return Object.hashAll([l$markCardRead, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationMarkCardRead || runtimeType != other.runtimeType) {
      return false;
    }
    final l$markCardRead = markCardRead;
    final lOther$markCardRead = other.markCardRead;
    if (l$markCardRead != lOther$markCardRead) {
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

const documentNodeMutationMarkCardRead = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'MarkCardRead'),
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
            name: NameNode(value: 'markCardRead'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'cardId'),
                value: VariableNode(name: NameNode(value: 'cardId')),
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
MutationMarkCardRead _parserFnMutationMarkCardRead(Map<String, dynamic> data) =>
    MutationMarkCardRead.fromJson(data);
typedef OnMutationCompletedMutationMarkCardRead = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationMarkCardRead?,
);

class OptionsMutationMarkCardRead extends graphql.MutationOptions<MutationMarkCardRead> {
  OptionsMutationMarkCardRead({
    String? operationName,
    required VariablesMutationMarkCardRead variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationMarkCardRead? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationMarkCardRead? onCompleted,
    graphql.OnMutationUpdate<MutationMarkCardRead>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationMarkCardRead(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationMarkCardRead,
         parserFn: _parserFnMutationMarkCardRead,
       );

  final OnMutationCompletedMutationMarkCardRead? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationMarkCardRead extends graphql.WatchQueryOptions<MutationMarkCardRead> {
  WatchOptionsMutationMarkCardRead({
    String? operationName,
    required VariablesMutationMarkCardRead variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationMarkCardRead? typedOptimisticResult,
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
         document: documentNodeMutationMarkCardRead,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationMarkCardRead,
       );
}

extension ClientExtensionMutationMarkCardRead on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationMarkCardRead>> mutateMarkCardRead(
    OptionsMutationMarkCardRead options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationMarkCardRead> watchMutationMarkCardRead(
    WatchOptionsMutationMarkCardRead options,
  ) => this.watchMutation(options);
}
