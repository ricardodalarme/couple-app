// dart format width=100
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentPostFragment {
  FragmentPostFragment({
    required this.id,
    required this.title,
    required this.content,
    this.author_image_url,
    this.$__typename = 'posts',
  });

  factory FragmentPostFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$content = json['content'];
    final l$author_image_url = json['author_image_url'];
    final l$$__typename = json['__typename'];
    return FragmentPostFragment(
      id: (l$id as String),
      title: (l$title as String),
      content: (l$content as String),
      author_image_url: (l$author_image_url as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String content;

  final String? author_image_url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$author_image_url = author_image_url;
    _resultData['author_image_url'] = l$author_image_url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$content = content;
    final l$author_image_url = author_image_url;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$title, l$content, l$author_image_url, l$$__typename]);
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
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$author_image_url = author_image_url;
    final lOther$author_image_url = other.author_image_url;
    if (l$author_image_url != lOther$author_image_url) {
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
    on: NamedTypeNode(name: NameNode(value: 'posts'), isNonNull: false),
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
        name: NameNode(value: 'title'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'content'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'author_image_url'),
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
const documentNodeFragmentPostFragment = DocumentNode(
  definitions: [fragmentDefinitionPostFragment],
);

extension ClientExtensionFragmentPostFragment on graphql.GraphQLClient {
  void writeFragmentPostFragment({
    required FragmentPostFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
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
