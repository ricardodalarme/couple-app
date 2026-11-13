// dart format width=100
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentProfileFragment {
  FragmentProfileFragment({
    required this.id,
    this.displayName,
    this.avatarPath,
    required this.avatarKind,
    this.city,
    this.pronouns,
    this.$__typename = 'Profiles',
  });

  factory FragmentProfileFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$displayName = json['displayName'];
    final l$avatarPath = json['avatarPath'];
    final l$avatarKind = json['avatarKind'];
    final l$city = json['city'];
    final l$pronouns = json['pronouns'];
    final l$$__typename = json['__typename'];
    return FragmentProfileFragment(
      id: (l$id as String),
      displayName: (l$displayName as String?),
      avatarPath: (l$avatarPath as String?),
      avatarKind: (l$avatarKind as String),
      city: (l$city as String?),
      pronouns: (l$pronouns as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? displayName;

  final String? avatarPath;

  final String avatarKind;

  final String? city;

  final String? pronouns;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$displayName = displayName;
    _resultData['displayName'] = l$displayName;
    final l$avatarPath = avatarPath;
    _resultData['avatarPath'] = l$avatarPath;
    final l$avatarKind = avatarKind;
    _resultData['avatarKind'] = l$avatarKind;
    final l$city = city;
    _resultData['city'] = l$city;
    final l$pronouns = pronouns;
    _resultData['pronouns'] = l$pronouns;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$displayName = displayName;
    final l$avatarPath = avatarPath;
    final l$avatarKind = avatarKind;
    final l$city = city;
    final l$pronouns = pronouns;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$displayName,
      l$avatarPath,
      l$avatarKind,
      l$city,
      l$pronouns,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentProfileFragment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
      return false;
    }
    final l$avatarPath = avatarPath;
    final lOther$avatarPath = other.avatarPath;
    if (l$avatarPath != lOther$avatarPath) {
      return false;
    }
    final l$avatarKind = avatarKind;
    final lOther$avatarKind = other.avatarKind;
    if (l$avatarKind != lOther$avatarKind) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (l$city != lOther$city) {
      return false;
    }
    final l$pronouns = pronouns;
    final lOther$pronouns = other.pronouns;
    if (l$pronouns != lOther$pronouns) {
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

const fragmentDefinitionProfileFragment = FragmentDefinitionNode(
  name: NameNode(value: 'ProfileFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'Profiles'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'displayName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'avatarPath'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'avatarKind'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'city'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'pronouns'),
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
    ],
  ),
);
const documentNodeFragmentProfileFragment = DocumentNode(
  definitions: [fragmentDefinitionProfileFragment],
);

extension ClientExtensionFragmentProfileFragment on graphql.GraphQLClient {
  void writeFragmentProfileFragment({
    required FragmentProfileFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'ProfileFragment',
        document: documentNodeFragmentProfileFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  FragmentProfileFragment? readFragmentProfileFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ProfileFragment',
          document: documentNodeFragmentProfileFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : FragmentProfileFragment.fromJson(result);
  }
}
