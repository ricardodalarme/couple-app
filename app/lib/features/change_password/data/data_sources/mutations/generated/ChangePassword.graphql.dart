import '../../../../../_shared/data/data_sources/generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationChangePassword {
  factory VariablesMutationChangePassword(
          {required InputChangePasswordInput input}) =>
      VariablesMutationChangePassword._({
        r'input': input,
      });

  VariablesMutationChangePassword._(this._$data);

  factory VariablesMutationChangePassword.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        InputChangePasswordInput.fromJson((l$input as Map<String, dynamic>));
    return VariablesMutationChangePassword._(result$data);
  }

  Map<String, dynamic> _$data;

  InputChangePasswordInput get input =>
      (_$data['input'] as InputChangePasswordInput);

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
    if (other is! VariablesMutationChangePassword ||
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

class MutationChangePassword {
  MutationChangePassword({
    this.changePassword,
    this.$__typename = 'Mutation',
  });

  factory MutationChangePassword.fromJson(Map<String, dynamic> json) {
    final l$changePassword = json['changePassword'];
    final l$$__typename = json['__typename'];
    return MutationChangePassword(
      changePassword: l$changePassword == null
          ? null
          : MutationChangePasswordchangePassword.fromJson(
              (l$changePassword as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationChangePasswordchangePassword? changePassword;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$changePassword = changePassword;
    _resultData['changePassword'] = l$changePassword?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$changePassword = changePassword;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$changePassword,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationChangePassword || runtimeType != other.runtimeType) {
      return false;
    }
    final l$changePassword = changePassword;
    final lOther$changePassword = other.changePassword;
    if (l$changePassword != lOther$changePassword) {
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

const documentNodeMutationChangePassword = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ChangePassword'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ChangePasswordInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'changePassword'),
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
MutationChangePassword _parserFnMutationChangePassword(
        Map<String, dynamic> data) =>
    MutationChangePassword.fromJson(data);
typedef OnMutationCompletedMutationChangePassword = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationChangePassword?,
);

class OptionsMutationChangePassword
    extends graphql.MutationOptions<MutationChangePassword> {
  OptionsMutationChangePassword({
    String? operationName,
    required VariablesMutationChangePassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationChangePassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationChangePassword? onCompleted,
    graphql.OnMutationUpdate<MutationChangePassword>? update,
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
                    data == null ? null : _parserFnMutationChangePassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationChangePassword,
          parserFn: _parserFnMutationChangePassword,
        );

  final OnMutationCompletedMutationChangePassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptionsMutationChangePassword
    extends graphql.WatchQueryOptions<MutationChangePassword> {
  WatchOptionsMutationChangePassword({
    String? operationName,
    required VariablesMutationChangePassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationChangePassword? typedOptimisticResult,
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
          document: documentNodeMutationChangePassword,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFnMutationChangePassword,
        );
}

extension ClientExtensionMutationChangePassword on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationChangePassword>> mutateChangePassword(
          OptionsMutationChangePassword options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<MutationChangePassword> watchMutationChangePassword(
          WatchOptionsMutationChangePassword options) =>
      this.watchMutation(options);
}

class MutationChangePasswordchangePassword {
  MutationChangePasswordchangePassword(
      {this.$__typename = 'ChangePasswordPayload'});

  factory MutationChangePasswordchangePassword.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return MutationChangePasswordchangePassword(
        $__typename: (l$$__typename as String));
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
    if (other is! MutationChangePasswordchangePassword ||
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
