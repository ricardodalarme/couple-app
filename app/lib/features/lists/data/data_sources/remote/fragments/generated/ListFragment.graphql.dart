// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentListFragment {
  FragmentListFragment({
    required this.id,
    required this.title,
    required this.kind,
    this.isMine,
    this.isShared,
    this.$__typename = 'Lists',
  });

  factory FragmentListFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$kind = json['kind'];
    final l$isMine = json['isMine'];
    final l$isShared = json['isShared'];
    final l$$__typename = json['__typename'];
    return FragmentListFragment(
      id: (l$id as String),
      title: (l$title as String),
      kind: fromJsonEnumListKind((l$kind as String)),
      isMine: (l$isMine as bool?),
      isShared: (l$isShared as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final EnumListKind kind;

  final bool? isMine;

  final bool? isShared;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$kind = kind;
    _resultData['kind'] = toJsonEnumListKind(l$kind);
    final l$isMine = isMine;
    _resultData['isMine'] = l$isMine;
    final l$isShared = isShared;
    _resultData['isShared'] = l$isShared;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$kind = kind;
    final l$isMine = isMine;
    final l$isShared = isShared;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$title, l$kind, l$isMine, l$isShared, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentListFragment || runtimeType != other.runtimeType) {
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
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$isMine = isMine;
    final lOther$isMine = other.isMine;
    if (l$isMine != lOther$isMine) {
      return false;
    }
    final l$isShared = isShared;
    final lOther$isShared = other.isShared;
    if (l$isShared != lOther$isShared) {
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

const fragmentDefinitionListFragment = FragmentDefinitionNode(
  name: NameNode(value: 'ListFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'Lists'), isNonNull: false),
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
        name: NameNode(value: 'kind'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'isMine'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'isShared'),
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
const documentNodeFragmentListFragment = DocumentNode(
  definitions: [fragmentDefinitionListFragment],
);

extension ClientExtensionFragmentListFragment on graphql.GraphQLClient {
  void writeFragmentListFragment({
    required FragmentListFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'ListFragment',
        document: documentNodeFragmentListFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  FragmentListFragment? readFragmentListFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ListFragment',
          document: documentNodeFragmentListFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : FragmentListFragment.fromJson(result);
  }
}
