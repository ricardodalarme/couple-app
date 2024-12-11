import '../../../../../_shared/data/data_sources/fragments/generated/UserFragment.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentPostFragment {
  FragmentPostFragment({
    required this.id,
    required this.title,
    required this.body,
    required this.createdBy,
    this.$__typename = 'Post',
  });

  factory FragmentPostFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$createdBy = json['createdBy'];
    final l$$__typename = json['__typename'];
    return FragmentPostFragment(
      id: (l$id as String),
      title: (l$title as String),
      body: (l$body as String),
      createdBy:
          FragmentUserFragment.fromJson((l$createdBy as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String body;

  final FragmentUserFragment createdBy;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$createdBy = createdBy;
    _resultData['createdBy'] = l$createdBy.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$body = body;
    final l$createdBy = createdBy;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$body,
      l$createdBy,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentPostFragment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$createdBy = createdBy;
    final lOther$createdBy = other.createdBy;
    if (l$createdBy != lOther$createdBy) {
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

const fragmentDefinitionPostFragment = FragmentDefinitionNode(
  name: NameNode(value: 'PostFragment'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Post'),
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
      name: NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'body'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'createdBy'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FragmentSpreadNode(
          name: NameNode(value: 'UserFragment'),
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
);
const documentNodeFragmentPostFragment = DocumentNode(definitions: [
  fragmentDefinitionPostFragment,
  fragmentDefinitionUserFragment,
]);

extension ClientExtensionFragmentPostFragment on graphql.GraphQLClient {
  void writeFragmentPostFragment({
    required FragmentPostFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'PostFragment',
            document: documentNodeFragmentPostFragment,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  FragmentPostFragment? readFragmentPostFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'PostFragment',
          document: documentNodeFragmentPostFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : FragmentPostFragment.fromJson(result);
  }
}
