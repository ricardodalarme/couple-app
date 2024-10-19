import '../../../../../_shared/data/data_sources/generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationResetPassword {
  factory VariablesMutationResetPassword(
          {required InputResetPasswordInput input}) =>
      VariablesMutationResetPassword._({
        r'input': input,
      });

  VariablesMutationResetPassword._(this._$data);

  factory VariablesMutationResetPassword.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        InputResetPasswordInput.fromJson((l$input as Map<String, dynamic>));
    return VariablesMutationResetPassword._(result$data);
  }

  Map<String, dynamic> _$data;

  InputResetPasswordInput get input =>
      (_$data['input'] as InputResetPasswordInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWithVariablesMutationResetPassword<VariablesMutationResetPassword>
      get copyWith => CopyWithVariablesMutationResetPassword(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is VariablesMutationResetPassword) ||
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

abstract class CopyWithVariablesMutationResetPassword<TRes> {
  factory CopyWithVariablesMutationResetPassword(
    VariablesMutationResetPassword instance,
    TRes Function(VariablesMutationResetPassword) then,
  ) = _CopyWithImplVariablesMutationResetPassword;

  factory CopyWithVariablesMutationResetPassword.stub(TRes res) =
      _CopyWithStubImplVariablesMutationResetPassword;

  TRes call({InputResetPasswordInput? input});
}

class _CopyWithImplVariablesMutationResetPassword<TRes>
    implements CopyWithVariablesMutationResetPassword<TRes> {
  _CopyWithImplVariablesMutationResetPassword(
    this._instance,
    this._then,
  );

  final VariablesMutationResetPassword _instance;

  final TRes Function(VariablesMutationResetPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(VariablesMutationResetPassword._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as InputResetPasswordInput),
      }));
}

class _CopyWithStubImplVariablesMutationResetPassword<TRes>
    implements CopyWithVariablesMutationResetPassword<TRes> {
  _CopyWithStubImplVariablesMutationResetPassword(this._res);

  TRes _res;

  call({InputResetPasswordInput? input}) => _res;
}

class MutationResetPassword {
  MutationResetPassword({
    this.resetPassword,
    this.$__typename = 'Mutation',
  });

  factory MutationResetPassword.fromJson(Map<String, dynamic> json) {
    final l$resetPassword = json['resetPassword'];
    final l$$__typename = json['__typename'];
    return MutationResetPassword(
      resetPassword: l$resetPassword == null
          ? null
          : MutationResetPasswordresetPassword.fromJson(
              (l$resetPassword as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationResetPasswordresetPassword? resetPassword;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$resetPassword = resetPassword;
    _resultData['resetPassword'] = l$resetPassword?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$resetPassword = resetPassword;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$resetPassword,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is MutationResetPassword) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$resetPassword = resetPassword;
    final lOther$resetPassword = other.resetPassword;
    if (l$resetPassword != lOther$resetPassword) {
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

extension UtilityExtensionMutationResetPassword on MutationResetPassword {
  CopyWithMutationResetPassword<MutationResetPassword> get copyWith =>
      CopyWithMutationResetPassword(
        this,
        (i) => i,
      );
}

abstract class CopyWithMutationResetPassword<TRes> {
  factory CopyWithMutationResetPassword(
    MutationResetPassword instance,
    TRes Function(MutationResetPassword) then,
  ) = _CopyWithImplMutationResetPassword;

  factory CopyWithMutationResetPassword.stub(TRes res) =
      _CopyWithStubImplMutationResetPassword;

  TRes call({
    MutationResetPasswordresetPassword? resetPassword,
    String? $__typename,
  });
  CopyWithMutationResetPasswordresetPassword<TRes> get resetPassword;
}

class _CopyWithImplMutationResetPassword<TRes>
    implements CopyWithMutationResetPassword<TRes> {
  _CopyWithImplMutationResetPassword(
    this._instance,
    this._then,
  );

  final MutationResetPassword _instance;

  final TRes Function(MutationResetPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? resetPassword = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(MutationResetPassword(
        resetPassword: resetPassword == _undefined
            ? _instance.resetPassword
            : (resetPassword as MutationResetPasswordresetPassword?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWithMutationResetPasswordresetPassword<TRes> get resetPassword {
    final local$resetPassword = _instance.resetPassword;
    return local$resetPassword == null
        ? CopyWithMutationResetPasswordresetPassword.stub(_then(_instance))
        : CopyWithMutationResetPasswordresetPassword(
            local$resetPassword, (e) => call(resetPassword: e));
  }
}

class _CopyWithStubImplMutationResetPassword<TRes>
    implements CopyWithMutationResetPassword<TRes> {
  _CopyWithStubImplMutationResetPassword(this._res);

  TRes _res;

  call({
    MutationResetPasswordresetPassword? resetPassword,
    String? $__typename,
  }) =>
      _res;

  CopyWithMutationResetPasswordresetPassword<TRes> get resetPassword =>
      CopyWithMutationResetPasswordresetPassword.stub(_res);
}

const documentNodeMutationResetPassword = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ResetPassword'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ResetPasswordInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'resetPassword'),
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
MutationResetPassword _parserFnMutationResetPassword(
        Map<String, dynamic> data) =>
    MutationResetPassword.fromJson(data);
typedef OnMutationCompletedMutationResetPassword = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationResetPassword?,
);

class OptionsMutationResetPassword
    extends graphql.MutationOptions<MutationResetPassword> {
  OptionsMutationResetPassword({
    String? operationName,
    required VariablesMutationResetPassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationResetPassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationResetPassword? onCompleted,
    graphql.OnMutationUpdate<MutationResetPassword>? update,
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
                    data == null ? null : _parserFnMutationResetPassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationResetPassword,
          parserFn: _parserFnMutationResetPassword,
        );

  final OnMutationCompletedMutationResetPassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptionsMutationResetPassword
    extends graphql.WatchQueryOptions<MutationResetPassword> {
  WatchOptionsMutationResetPassword({
    String? operationName,
    required VariablesMutationResetPassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationResetPassword? typedOptimisticResult,
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
          document: documentNodeMutationResetPassword,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFnMutationResetPassword,
        );
}

extension ClientExtensionMutationResetPassword on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationResetPassword>> mutateResetPassword(
          OptionsMutationResetPassword options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<MutationResetPassword> watchMutationResetPassword(
          WatchOptionsMutationResetPassword options) =>
      this.watchMutation(options);
}

class MutationResetPasswordresetPassword {
  MutationResetPasswordresetPassword(
      {this.$__typename = 'ResetPasswordPayload'});

  factory MutationResetPasswordresetPassword.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return MutationResetPasswordresetPassword(
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
    if (!(other is MutationResetPasswordresetPassword) ||
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

extension UtilityExtensionMutationResetPasswordresetPassword
    on MutationResetPasswordresetPassword {
  CopyWithMutationResetPasswordresetPassword<MutationResetPasswordresetPassword>
      get copyWith => CopyWithMutationResetPasswordresetPassword(
            this,
            (i) => i,
          );
}

abstract class CopyWithMutationResetPasswordresetPassword<TRes> {
  factory CopyWithMutationResetPasswordresetPassword(
    MutationResetPasswordresetPassword instance,
    TRes Function(MutationResetPasswordresetPassword) then,
  ) = _CopyWithImplMutationResetPasswordresetPassword;

  factory CopyWithMutationResetPasswordresetPassword.stub(TRes res) =
      _CopyWithStubImplMutationResetPasswordresetPassword;

  TRes call({String? $__typename});
}

class _CopyWithImplMutationResetPasswordresetPassword<TRes>
    implements CopyWithMutationResetPasswordresetPassword<TRes> {
  _CopyWithImplMutationResetPasswordresetPassword(
    this._instance,
    this._then,
  );

  final MutationResetPasswordresetPassword _instance;

  final TRes Function(MutationResetPasswordresetPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(MutationResetPasswordresetPassword(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImplMutationResetPasswordresetPassword<TRes>
    implements CopyWithMutationResetPasswordresetPassword<TRes> {
  _CopyWithStubImplMutationResetPasswordresetPassword(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}
