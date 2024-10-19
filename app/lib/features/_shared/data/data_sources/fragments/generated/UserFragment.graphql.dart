import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentUserFragment {
  FragmentUserFragment({
    required this.id,
    this.name,
    required this.username,
    required this.email,
    this.profilePicture,
    this.$__typename = 'User',
  });

  factory FragmentUserFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$username = json['username'];
    final l$email = json['email'];
    final l$profilePicture = json['profilePicture'];
    final l$$__typename = json['__typename'];
    return FragmentUserFragment(
      id: (l$id as String),
      name: (l$name as String?),
      username: (l$username as String),
      email: (l$email as String),
      profilePicture: l$profilePicture == null
          ? null
          : FragmentUserFragmentprofilePicture.fromJson(
              (l$profilePicture as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? name;

  final String username;

  final String email;

  final FragmentUserFragmentprofilePicture? profilePicture;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$username = username;
    _resultData['username'] = l$username;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$profilePicture = profilePicture;
    _resultData['profilePicture'] = l$profilePicture?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$username = username;
    final l$email = email;
    final l$profilePicture = profilePicture;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$username,
      l$email,
      l$profilePicture,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is FragmentUserFragment) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$profilePicture = profilePicture;
    final lOther$profilePicture = other.profilePicture;
    if (l$profilePicture != lOther$profilePicture) {
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

extension UtilityExtensionFragmentUserFragment on FragmentUserFragment {
  CopyWithFragmentUserFragment<FragmentUserFragment> get copyWith =>
      CopyWithFragmentUserFragment(
        this,
        (i) => i,
      );
}

abstract class CopyWithFragmentUserFragment<TRes> {
  factory CopyWithFragmentUserFragment(
    FragmentUserFragment instance,
    TRes Function(FragmentUserFragment) then,
  ) = _CopyWithImplFragmentUserFragment;

  factory CopyWithFragmentUserFragment.stub(TRes res) =
      _CopyWithStubImplFragmentUserFragment;

  TRes call({
    String? id,
    String? name,
    String? username,
    String? email,
    FragmentUserFragmentprofilePicture? profilePicture,
    String? $__typename,
  });
  CopyWithFragmentUserFragmentprofilePicture<TRes> get profilePicture;
}

class _CopyWithImplFragmentUserFragment<TRes>
    implements CopyWithFragmentUserFragment<TRes> {
  _CopyWithImplFragmentUserFragment(
    this._instance,
    this._then,
  );

  final FragmentUserFragment _instance;

  final TRes Function(FragmentUserFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? username = _undefined,
    Object? email = _undefined,
    Object? profilePicture = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(FragmentUserFragment(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        username: username == _undefined || username == null
            ? _instance.username
            : (username as String),
        email: email == _undefined || email == null
            ? _instance.email
            : (email as String),
        profilePicture: profilePicture == _undefined
            ? _instance.profilePicture
            : (profilePicture as FragmentUserFragmentprofilePicture?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWithFragmentUserFragmentprofilePicture<TRes> get profilePicture {
    final local$profilePicture = _instance.profilePicture;
    return local$profilePicture == null
        ? CopyWithFragmentUserFragmentprofilePicture.stub(_then(_instance))
        : CopyWithFragmentUserFragmentprofilePicture(
            local$profilePicture, (e) => call(profilePicture: e));
  }
}

class _CopyWithStubImplFragmentUserFragment<TRes>
    implements CopyWithFragmentUserFragment<TRes> {
  _CopyWithStubImplFragmentUserFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? username,
    String? email,
    FragmentUserFragmentprofilePicture? profilePicture,
    String? $__typename,
  }) =>
      _res;

  CopyWithFragmentUserFragmentprofilePicture<TRes> get profilePicture =>
      CopyWithFragmentUserFragmentprofilePicture.stub(_res);
}

const fragmentDefinitionUserFragment = FragmentDefinitionNode(
  name: NameNode(value: 'UserFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'User'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'username'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'email'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'profilePicture'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
          name: NameNode(value: 'url'),
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
const documentNodeFragmentUserFragment = DocumentNode(definitions: [
  fragmentDefinitionUserFragment,
]);

extension ClientExtensionFragmentUserFragment on graphql.GraphQLClient {
  void writeFragmentUserFragment({
    required FragmentUserFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'UserFragment',
            document: documentNodeFragmentUserFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  FragmentUserFragment? readFragmentUserFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'UserFragment',
          document: documentNodeFragmentUserFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : FragmentUserFragment.fromJson(result);
  }
}

class FragmentUserFragmentprofilePicture {
  FragmentUserFragmentprofilePicture({
    required this.url,
    this.$__typename = 'Download',
  });

  factory FragmentUserFragmentprofilePicture.fromJson(
      Map<String, dynamic> json) {
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return FragmentUserFragmentprofilePicture(
      url: (l$url as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is FragmentUserFragmentprofilePicture) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
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

extension UtilityExtensionFragmentUserFragmentprofilePicture
    on FragmentUserFragmentprofilePicture {
  CopyWithFragmentUserFragmentprofilePicture<FragmentUserFragmentprofilePicture>
      get copyWith => CopyWithFragmentUserFragmentprofilePicture(
            this,
            (i) => i,
          );
}

abstract class CopyWithFragmentUserFragmentprofilePicture<TRes> {
  factory CopyWithFragmentUserFragmentprofilePicture(
    FragmentUserFragmentprofilePicture instance,
    TRes Function(FragmentUserFragmentprofilePicture) then,
  ) = _CopyWithImplFragmentUserFragmentprofilePicture;

  factory CopyWithFragmentUserFragmentprofilePicture.stub(TRes res) =
      _CopyWithStubImplFragmentUserFragmentprofilePicture;

  TRes call({
    String? url,
    String? $__typename,
  });
}

class _CopyWithImplFragmentUserFragmentprofilePicture<TRes>
    implements CopyWithFragmentUserFragmentprofilePicture<TRes> {
  _CopyWithImplFragmentUserFragmentprofilePicture(
    this._instance,
    this._then,
  );

  final FragmentUserFragmentprofilePicture _instance;

  final TRes Function(FragmentUserFragmentprofilePicture) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(FragmentUserFragmentprofilePicture(
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImplFragmentUserFragmentprofilePicture<TRes>
    implements CopyWithFragmentUserFragmentprofilePicture<TRes> {
  _CopyWithStubImplFragmentUserFragmentprofilePicture(this._res);

  TRes _res;

  call({
    String? url,
    String? $__typename,
  }) =>
      _res;
}
