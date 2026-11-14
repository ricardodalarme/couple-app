// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentListItemFragment {
  FragmentListItemFragment({
    required this.id,
    required this.listId,
    required this.title,
    required this.status,
    required this.position,
    this.$__typename = 'ListItems',
  });

  factory FragmentListItemFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$listId = json['listId'];
    final l$title = json['title'];
    final l$status = json['status'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return FragmentListItemFragment(
      id: (l$id as String),
      listId: (l$listId as String),
      title: (l$title as String),
      status: fromJsonEnumListItemStatus((l$status as String)),
      position: (l$position as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String listId;

  final String title;

  final EnumListItemStatus status;

  final int position;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$listId = listId;
    _resultData['listId'] = l$listId;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$status = status;
    _resultData['status'] = toJsonEnumListItemStatus(l$status);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$listId = listId;
    final l$title = title;
    final l$status = status;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$listId, l$title, l$status, l$position, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentListItemFragment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$listId = listId;
    final lOther$listId = other.listId;
    if (l$listId != lOther$listId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
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

const fragmentDefinitionListItemFragment = FragmentDefinitionNode(
  name: NameNode(value: 'ListItemFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'ListItems'), isNonNull: false),
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
        name: NameNode(value: 'listId'),
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
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'position'),
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
const documentNodeFragmentListItemFragment = DocumentNode(
  definitions: [fragmentDefinitionListItemFragment],
);

extension ClientExtensionFragmentListItemFragment on graphql.GraphQLClient {
  void writeFragmentListItemFragment({
    required FragmentListItemFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'ListItemFragment',
        document: documentNodeFragmentListItemFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  FragmentListItemFragment? readFragmentListItemFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ListItemFragment',
          document: documentNodeFragmentListItemFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : FragmentListItemFragment.fromJson(result);
  }
}
