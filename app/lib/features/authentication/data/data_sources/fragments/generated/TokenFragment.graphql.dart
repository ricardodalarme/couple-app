import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentTokenFragment {
  FragmentTokenFragment({
    required this.expires,
    required this.token,
    this.$__typename = 'Token',
  });

  factory FragmentTokenFragment.fromJson(Map<String, dynamic> json) {
    final l$expires = json['expires'];
    final l$token = json['token'];
    final l$$__typename = json['__typename'];
    return FragmentTokenFragment(
      expires: DateTime.parse((l$expires as String)),
      token: (l$token as String),
      $__typename: (l$$__typename as String),
    );
  }

  final DateTime expires;

  final String token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$expires = expires;
    _resultData['expires'] = l$expires.toIso8601String();
    final l$token = token;
    _resultData['token'] = l$token;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$expires = expires;
    final l$token = token;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$expires,
      l$token,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is FragmentTokenFragment) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$expires = expires;
    final lOther$expires = other.expires;
    if (l$expires != lOther$expires) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
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

extension UtilityExtensionFragmentTokenFragment on FragmentTokenFragment {
  CopyWithFragmentTokenFragment<FragmentTokenFragment> get copyWith =>
      CopyWithFragmentTokenFragment(
        this,
        (i) => i,
      );
}

abstract class CopyWithFragmentTokenFragment<TRes> {
  factory CopyWithFragmentTokenFragment(
    FragmentTokenFragment instance,
    TRes Function(FragmentTokenFragment) then,
  ) = _CopyWithImplFragmentTokenFragment;

  factory CopyWithFragmentTokenFragment.stub(TRes res) =
      _CopyWithStubImplFragmentTokenFragment;

  TRes call({
    DateTime? expires,
    String? token,
    String? $__typename,
  });
}

class _CopyWithImplFragmentTokenFragment<TRes>
    implements CopyWithFragmentTokenFragment<TRes> {
  _CopyWithImplFragmentTokenFragment(
    this._instance,
    this._then,
  );

  final FragmentTokenFragment _instance;

  final TRes Function(FragmentTokenFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? expires = _undefined,
    Object? token = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(FragmentTokenFragment(
        expires: expires == _undefined || expires == null
            ? _instance.expires
            : (expires as DateTime),
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImplFragmentTokenFragment<TRes>
    implements CopyWithFragmentTokenFragment<TRes> {
  _CopyWithStubImplFragmentTokenFragment(this._res);

  TRes _res;

  call({
    DateTime? expires,
    String? token,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionTokenFragment = FragmentDefinitionNode(
  name: NameNode(value: 'TokenFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Token'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'expires'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'token'),
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
  ]),
);
const documentNodeFragmentTokenFragment = DocumentNode(definitions: [
  fragmentDefinitionTokenFragment,
]);

extension ClientExtensionFragmentTokenFragment on graphql.GraphQLClient {
  void writeFragmentTokenFragment({
    required FragmentTokenFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'TokenFragment',
            document: documentNodeFragmentTokenFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  FragmentTokenFragment? readFragmentTokenFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'TokenFragment',
          document: documentNodeFragmentTokenFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : FragmentTokenFragment.fromJson(result);
  }
}
