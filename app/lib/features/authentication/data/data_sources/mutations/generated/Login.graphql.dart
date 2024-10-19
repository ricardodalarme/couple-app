import '../../../../../_shared/data/data_sources/generated/schema.graphql.dart';
import '../../fragments/generated/TokenFragment.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationLogin {
  factory VariablesMutationLogin({required InputLoginInput credentials}) =>
      VariablesMutationLogin._({
        r'credentials': credentials,
      });

  VariablesMutationLogin._(this._$data);

  factory VariablesMutationLogin.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$credentials = data['credentials'];
    result$data['credentials'] =
        InputLoginInput.fromJson((l$credentials as Map<String, dynamic>));
    return VariablesMutationLogin._(result$data);
  }

  Map<String, dynamic> _$data;

  InputLoginInput get credentials => (_$data['credentials'] as InputLoginInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$credentials = credentials;
    result$data['credentials'] = l$credentials.toJson();
    return result$data;
  }

  CopyWithVariablesMutationLogin<VariablesMutationLogin> get copyWith =>
      CopyWithVariablesMutationLogin(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is VariablesMutationLogin) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$credentials = credentials;
    final lOther$credentials = other.credentials;
    if (l$credentials != lOther$credentials) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$credentials = credentials;
    return Object.hashAll([l$credentials]);
  }
}

abstract class CopyWithVariablesMutationLogin<TRes> {
  factory CopyWithVariablesMutationLogin(
    VariablesMutationLogin instance,
    TRes Function(VariablesMutationLogin) then,
  ) = _CopyWithImplVariablesMutationLogin;

  factory CopyWithVariablesMutationLogin.stub(TRes res) =
      _CopyWithStubImplVariablesMutationLogin;

  TRes call({InputLoginInput? credentials});
}

class _CopyWithImplVariablesMutationLogin<TRes>
    implements CopyWithVariablesMutationLogin<TRes> {
  _CopyWithImplVariablesMutationLogin(
    this._instance,
    this._then,
  );

  final VariablesMutationLogin _instance;

  final TRes Function(VariablesMutationLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? credentials = _undefined}) =>
      _then(VariablesMutationLogin._({
        ..._instance._$data,
        if (credentials != _undefined && credentials != null)
          'credentials': (credentials as InputLoginInput),
      }));
}

class _CopyWithStubImplVariablesMutationLogin<TRes>
    implements CopyWithVariablesMutationLogin<TRes> {
  _CopyWithStubImplVariablesMutationLogin(this._res);

  TRes _res;

  call({InputLoginInput? credentials}) => _res;
}

class MutationLogin {
  MutationLogin({
    this.login,
    this.$__typename = 'Mutation',
  });

  factory MutationLogin.fromJson(Map<String, dynamic> json) {
    final l$login = json['login'];
    final l$$__typename = json['__typename'];
    return MutationLogin(
      login: l$login == null
          ? null
          : MutationLoginlogin.fromJson((l$login as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationLoginlogin? login;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$login = login;
    _resultData['login'] = l$login?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$login = login;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$login,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is MutationLogin) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$login = login;
    final lOther$login = other.login;
    if (l$login != lOther$login) {
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

extension UtilityExtensionMutationLogin on MutationLogin {
  CopyWithMutationLogin<MutationLogin> get copyWith => CopyWithMutationLogin(
        this,
        (i) => i,
      );
}

abstract class CopyWithMutationLogin<TRes> {
  factory CopyWithMutationLogin(
    MutationLogin instance,
    TRes Function(MutationLogin) then,
  ) = _CopyWithImplMutationLogin;

  factory CopyWithMutationLogin.stub(TRes res) = _CopyWithStubImplMutationLogin;

  TRes call({
    MutationLoginlogin? login,
    String? $__typename,
  });
  CopyWithMutationLoginlogin<TRes> get login;
}

class _CopyWithImplMutationLogin<TRes> implements CopyWithMutationLogin<TRes> {
  _CopyWithImplMutationLogin(
    this._instance,
    this._then,
  );

  final MutationLogin _instance;

  final TRes Function(MutationLogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? login = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(MutationLogin(
        login: login == _undefined
            ? _instance.login
            : (login as MutationLoginlogin?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWithMutationLoginlogin<TRes> get login {
    final local$login = _instance.login;
    return local$login == null
        ? CopyWithMutationLoginlogin.stub(_then(_instance))
        : CopyWithMutationLoginlogin(local$login, (e) => call(login: e));
  }
}

class _CopyWithStubImplMutationLogin<TRes>
    implements CopyWithMutationLogin<TRes> {
  _CopyWithStubImplMutationLogin(this._res);

  TRes _res;

  call({
    MutationLoginlogin? login,
    String? $__typename,
  }) =>
      _res;

  CopyWithMutationLoginlogin<TRes> get login =>
      CopyWithMutationLoginlogin.stub(_res);
}

const documentNodeMutationLogin = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'Login'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'credentials')),
        type: NamedTypeNode(
          name: NameNode(value: 'LoginInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'credentials'),
            value: VariableNode(name: NameNode(value: 'credentials')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'accessToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'TokenFragment'),
                directives: [],
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
          FieldNode(
            name: NameNode(value: 'refreshToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'TokenFragment'),
                directives: [],
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
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
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
  fragmentDefinitionTokenFragment,
]);
MutationLogin _parserFnMutationLogin(Map<String, dynamic> data) =>
    MutationLogin.fromJson(data);
typedef OnMutationCompletedMutationLogin = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationLogin?,
);

class OptionsMutationLogin extends graphql.MutationOptions<MutationLogin> {
  OptionsMutationLogin({
    String? operationName,
    required VariablesMutationLogin variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationLogin? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationLogin? onCompleted,
    graphql.OnMutationUpdate<MutationLogin>? update,
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
                    data == null ? null : _parserFnMutationLogin(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLogin,
          parserFn: _parserFnMutationLogin,
        );

  final OnMutationCompletedMutationLogin? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptionsMutationLogin
    extends graphql.WatchQueryOptions<MutationLogin> {
  WatchOptionsMutationLogin({
    String? operationName,
    required VariablesMutationLogin variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationLogin? typedOptimisticResult,
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
          document: documentNodeMutationLogin,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFnMutationLogin,
        );
}

extension ClientExtensionMutationLogin on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationLogin>> mutateLogin(
          OptionsMutationLogin options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<MutationLogin> watchMutationLogin(
          WatchOptionsMutationLogin options) =>
      this.watchMutation(options);
}

class MutationLoginlogin {
  MutationLoginlogin({
    required this.accessToken,
    required this.refreshToken,
    this.$__typename = 'Login',
  });

  factory MutationLoginlogin.fromJson(Map<String, dynamic> json) {
    final l$accessToken = json['accessToken'];
    final l$refreshToken = json['refreshToken'];
    final l$$__typename = json['__typename'];
    return MutationLoginlogin(
      accessToken: FragmentTokenFragment.fromJson(
          (l$accessToken as Map<String, dynamic>)),
      refreshToken: FragmentTokenFragment.fromJson(
          (l$refreshToken as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentTokenFragment accessToken;

  final FragmentTokenFragment refreshToken;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accessToken = accessToken;
    _resultData['accessToken'] = l$accessToken.toJson();
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accessToken = accessToken;
    final l$refreshToken = refreshToken;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$accessToken,
      l$refreshToken,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is MutationLoginlogin) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$accessToken = accessToken;
    final lOther$accessToken = other.accessToken;
    if (l$accessToken != lOther$accessToken) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
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

extension UtilityExtensionMutationLoginlogin on MutationLoginlogin {
  CopyWithMutationLoginlogin<MutationLoginlogin> get copyWith =>
      CopyWithMutationLoginlogin(
        this,
        (i) => i,
      );
}

abstract class CopyWithMutationLoginlogin<TRes> {
  factory CopyWithMutationLoginlogin(
    MutationLoginlogin instance,
    TRes Function(MutationLoginlogin) then,
  ) = _CopyWithImplMutationLoginlogin;

  factory CopyWithMutationLoginlogin.stub(TRes res) =
      _CopyWithStubImplMutationLoginlogin;

  TRes call({
    FragmentTokenFragment? accessToken,
    FragmentTokenFragment? refreshToken,
    String? $__typename,
  });
  CopyWithFragmentTokenFragment<TRes> get accessToken;
  CopyWithFragmentTokenFragment<TRes> get refreshToken;
}

class _CopyWithImplMutationLoginlogin<TRes>
    implements CopyWithMutationLoginlogin<TRes> {
  _CopyWithImplMutationLoginlogin(
    this._instance,
    this._then,
  );

  final MutationLoginlogin _instance;

  final TRes Function(MutationLoginlogin) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accessToken = _undefined,
    Object? refreshToken = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(MutationLoginlogin(
        accessToken: accessToken == _undefined || accessToken == null
            ? _instance.accessToken
            : (accessToken as FragmentTokenFragment),
        refreshToken: refreshToken == _undefined || refreshToken == null
            ? _instance.refreshToken
            : (refreshToken as FragmentTokenFragment),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWithFragmentTokenFragment<TRes> get accessToken {
    final local$accessToken = _instance.accessToken;
    return CopyWithFragmentTokenFragment(
        local$accessToken, (e) => call(accessToken: e));
  }

  CopyWithFragmentTokenFragment<TRes> get refreshToken {
    final local$refreshToken = _instance.refreshToken;
    return CopyWithFragmentTokenFragment(
        local$refreshToken, (e) => call(refreshToken: e));
  }
}

class _CopyWithStubImplMutationLoginlogin<TRes>
    implements CopyWithMutationLoginlogin<TRes> {
  _CopyWithStubImplMutationLoginlogin(this._res);

  TRes _res;

  call({
    FragmentTokenFragment? accessToken,
    FragmentTokenFragment? refreshToken,
    String? $__typename,
  }) =>
      _res;

  CopyWithFragmentTokenFragment<TRes> get accessToken =>
      CopyWithFragmentTokenFragment.stub(_res);

  CopyWithFragmentTokenFragment<TRes> get refreshToken =>
      CopyWithFragmentTokenFragment.stub(_res);
}
