import '../../../../../_shared/data/data_sources/generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationCreateUser {
  factory VariablesMutationCreateUser({required InputCreateUserInput input}) =>
      VariablesMutationCreateUser._({
        r'input': input,
      });

  VariablesMutationCreateUser._(this._$data);

  factory VariablesMutationCreateUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        InputCreateUserInput.fromJson((l$input as Map<String, dynamic>));
    return VariablesMutationCreateUser._(result$data);
  }

  Map<String, dynamic> _$data;

  InputCreateUserInput get input => (_$data['input'] as InputCreateUserInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWithVariablesMutationCreateUser<VariablesMutationCreateUser>
      get copyWith => CopyWithVariablesMutationCreateUser(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is VariablesMutationCreateUser) ||
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

abstract class CopyWithVariablesMutationCreateUser<TRes> {
  factory CopyWithVariablesMutationCreateUser(
    VariablesMutationCreateUser instance,
    TRes Function(VariablesMutationCreateUser) then,
  ) = _CopyWithImplVariablesMutationCreateUser;

  factory CopyWithVariablesMutationCreateUser.stub(TRes res) =
      _CopyWithStubImplVariablesMutationCreateUser;

  TRes call({InputCreateUserInput? input});
}

class _CopyWithImplVariablesMutationCreateUser<TRes>
    implements CopyWithVariablesMutationCreateUser<TRes> {
  _CopyWithImplVariablesMutationCreateUser(
    this._instance,
    this._then,
  );

  final VariablesMutationCreateUser _instance;

  final TRes Function(VariablesMutationCreateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(VariablesMutationCreateUser._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as InputCreateUserInput),
      }));
}

class _CopyWithStubImplVariablesMutationCreateUser<TRes>
    implements CopyWithVariablesMutationCreateUser<TRes> {
  _CopyWithStubImplVariablesMutationCreateUser(this._res);

  TRes _res;

  call({InputCreateUserInput? input}) => _res;
}

class MutationCreateUser {
  MutationCreateUser({
    this.createUser,
    this.$__typename = 'Mutation',
  });

  factory MutationCreateUser.fromJson(Map<String, dynamic> json) {
    final l$createUser = json['createUser'];
    final l$$__typename = json['__typename'];
    return MutationCreateUser(
      createUser: l$createUser == null
          ? null
          : MutationCreateUsercreateUser.fromJson(
              (l$createUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationCreateUsercreateUser? createUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createUser = createUser;
    _resultData['createUser'] = l$createUser?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createUser = createUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is MutationCreateUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createUser = createUser;
    final lOther$createUser = other.createUser;
    if (l$createUser != lOther$createUser) {
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

extension UtilityExtensionMutationCreateUser on MutationCreateUser {
  CopyWithMutationCreateUser<MutationCreateUser> get copyWith =>
      CopyWithMutationCreateUser(
        this,
        (i) => i,
      );
}

abstract class CopyWithMutationCreateUser<TRes> {
  factory CopyWithMutationCreateUser(
    MutationCreateUser instance,
    TRes Function(MutationCreateUser) then,
  ) = _CopyWithImplMutationCreateUser;

  factory CopyWithMutationCreateUser.stub(TRes res) =
      _CopyWithStubImplMutationCreateUser;

  TRes call({
    MutationCreateUsercreateUser? createUser,
    String? $__typename,
  });
  CopyWithMutationCreateUsercreateUser<TRes> get createUser;
}

class _CopyWithImplMutationCreateUser<TRes>
    implements CopyWithMutationCreateUser<TRes> {
  _CopyWithImplMutationCreateUser(
    this._instance,
    this._then,
  );

  final MutationCreateUser _instance;

  final TRes Function(MutationCreateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(MutationCreateUser(
        createUser: createUser == _undefined
            ? _instance.createUser
            : (createUser as MutationCreateUsercreateUser?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWithMutationCreateUsercreateUser<TRes> get createUser {
    final local$createUser = _instance.createUser;
    return local$createUser == null
        ? CopyWithMutationCreateUsercreateUser.stub(_then(_instance))
        : CopyWithMutationCreateUsercreateUser(
            local$createUser, (e) => call(createUser: e));
  }
}

class _CopyWithStubImplMutationCreateUser<TRes>
    implements CopyWithMutationCreateUser<TRes> {
  _CopyWithStubImplMutationCreateUser(this._res);

  TRes _res;

  call({
    MutationCreateUsercreateUser? createUser,
    String? $__typename,
  }) =>
      _res;

  CopyWithMutationCreateUsercreateUser<TRes> get createUser =>
      CopyWithMutationCreateUsercreateUser.stub(_res);
}

const documentNodeMutationCreateUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreateUserInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createUser'),
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
MutationCreateUser _parserFnMutationCreateUser(Map<String, dynamic> data) =>
    MutationCreateUser.fromJson(data);
typedef OnMutationCompletedMutationCreateUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationCreateUser?,
);

class OptionsMutationCreateUser
    extends graphql.MutationOptions<MutationCreateUser> {
  OptionsMutationCreateUser({
    String? operationName,
    required VariablesMutationCreateUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCreateUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationCreateUser? onCompleted,
    graphql.OnMutationUpdate<MutationCreateUser>? update,
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
                    data == null ? null : _parserFnMutationCreateUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateUser,
          parserFn: _parserFnMutationCreateUser,
        );

  final OnMutationCompletedMutationCreateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptionsMutationCreateUser
    extends graphql.WatchQueryOptions<MutationCreateUser> {
  WatchOptionsMutationCreateUser({
    String? operationName,
    required VariablesMutationCreateUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationCreateUser? typedOptimisticResult,
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
          document: documentNodeMutationCreateUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFnMutationCreateUser,
        );
}

extension ClientExtensionMutationCreateUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationCreateUser>> mutateCreateUser(
          OptionsMutationCreateUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<MutationCreateUser> watchMutationCreateUser(
          WatchOptionsMutationCreateUser options) =>
      this.watchMutation(options);
}

class MutationCreateUsercreateUser {
  MutationCreateUsercreateUser({this.$__typename = 'CreateUserPayload'});

  factory MutationCreateUsercreateUser.fromJson(Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    return MutationCreateUsercreateUser($__typename: (l$$__typename as String));
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
    if (!(other is MutationCreateUsercreateUser) ||
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

extension UtilityExtensionMutationCreateUsercreateUser
    on MutationCreateUsercreateUser {
  CopyWithMutationCreateUsercreateUser<MutationCreateUsercreateUser>
      get copyWith => CopyWithMutationCreateUsercreateUser(
            this,
            (i) => i,
          );
}

abstract class CopyWithMutationCreateUsercreateUser<TRes> {
  factory CopyWithMutationCreateUsercreateUser(
    MutationCreateUsercreateUser instance,
    TRes Function(MutationCreateUsercreateUser) then,
  ) = _CopyWithImplMutationCreateUsercreateUser;

  factory CopyWithMutationCreateUsercreateUser.stub(TRes res) =
      _CopyWithStubImplMutationCreateUsercreateUser;

  TRes call({String? $__typename});
}

class _CopyWithImplMutationCreateUsercreateUser<TRes>
    implements CopyWithMutationCreateUsercreateUser<TRes> {
  _CopyWithImplMutationCreateUsercreateUser(
    this._instance,
    this._then,
  );

  final MutationCreateUsercreateUser _instance;

  final TRes Function(MutationCreateUsercreateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) =>
      _then(MutationCreateUsercreateUser(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImplMutationCreateUsercreateUser<TRes>
    implements CopyWithMutationCreateUsercreateUser<TRes> {
  _CopyWithStubImplMutationCreateUsercreateUser(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}
