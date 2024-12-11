import '../../../../../_shared/data/data_sources/generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateUser {
  factory VariablesMutationUpdateUser({required InputUpdateUserInput input}) =>
      VariablesMutationUpdateUser._({
        r'input': input,
      });

  VariablesMutationUpdateUser._(this._$data);

  factory VariablesMutationUpdateUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        InputUpdateUserInput.fromJson((l$input as Map<String, dynamic>));
    return VariablesMutationUpdateUser._(result$data);
  }

  Map<String, dynamic> _$data;

  InputUpdateUserInput get input => (_$data['input'] as InputUpdateUserInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpdateUser ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

class MutationUpdateUser {
  MutationUpdateUser({
    this.updateUser,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateUser.fromJson(Map<String, dynamic> json) {
    final l$updateUser = json['updateUser'];
    final l$$__typename = json['__typename'];
    return MutationUpdateUser(
      updateUser: l$updateUser == null
          ? null
          : MutationUpdateUserupdateUser.fromJson(
              (l$updateUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateUserupdateUser? updateUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateUser = updateUser;
    _resultData['updateUser'] = l$updateUser?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateUser = updateUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateUser || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateUser = updateUser;
    final lOther$updateUser = other.updateUser;
    if (l$updateUser != lOther$updateUser) {
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

const documentNodeMutationUpdateUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateUserInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
MutationUpdateUser _parserFnMutationUpdateUser(Map<String, dynamic> data) =>
    MutationUpdateUser.fromJson(data);
typedef OnMutationCompletedMutationUpdateUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateUser?,
);

class OptionsMutationUpdateUser
    extends graphql.MutationOptions<MutationUpdateUser> {
  OptionsMutationUpdateUser({
    String? operationName,
    required VariablesMutationUpdateUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateUser? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateUser>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
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
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFnMutationUpdateUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateUser,
          parserFn: _parserFnMutationUpdateUser,
        );

  final OnMutationCompletedMutationUpdateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptionsMutationUpdateUser
    extends graphql.WatchQueryOptions<MutationUpdateUser> {
  WatchOptionsMutationUpdateUser({
    String? operationName,
    required VariablesMutationUpdateUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateUser? typedOptimisticResult,
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
          document: documentNodeMutationUpdateUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFnMutationUpdateUser,
        );
}

extension ClientExtensionMutationUpdateUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateUser>> mutateUpdateUser(
          OptionsMutationUpdateUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<MutationUpdateUser> watchMutationUpdateUser(
          WatchOptionsMutationUpdateUser options) =>
      this.watchMutation(options);
}

class MutationUpdateUserupdateUser {
  MutationUpdateUserupdateUser({this.$__typename = 'UpdateUserPayload'});

  factory MutationUpdateUserupdateUser.fromJson(Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return MutationUpdateUserupdateUser($__typename: (l$$__typename as String));
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateUserupdateUser ||
        runtimeType != other.runtimeType) {
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
