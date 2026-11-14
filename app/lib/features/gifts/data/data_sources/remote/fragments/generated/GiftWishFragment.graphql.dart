// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentGiftWishFragment {
  FragmentGiftWishFragment({
    required this.id,
    required this.title,
    this.note,
    this.budget,
    required this.status,
    this.isMine,
    this.isShared,
    this.$__typename = 'GiftIdeas',
  });

  factory FragmentGiftWishFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$note = json['note'];
    final l$budget = json['budget'];
    final l$status = json['status'];
    final l$isMine = json['isMine'];
    final l$isShared = json['isShared'];
    final l$$__typename = json['__typename'];
    return FragmentGiftWishFragment(
      id: (l$id as String),
      title: (l$title as String),
      note: (l$note as String?),
      budget: l$budget == null ? null : fromJsonEnumGiftBudget((l$budget as String)),
      status: fromJsonEnumGiftIdeaStatus((l$status as String)),
      isMine: (l$isMine as bool?),
      isShared: (l$isShared as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? note;

  final EnumGiftBudget? budget;

  final EnumGiftIdeaStatus status;

  final bool? isMine;

  final bool? isShared;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$note = note;
    _resultData['note'] = l$note;
    final l$budget = budget;
    _resultData['budget'] = l$budget == null ? null : toJsonEnumGiftBudget(l$budget);
    final l$status = status;
    _resultData['status'] = toJsonEnumGiftIdeaStatus(l$status);
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
    final l$note = note;
    final l$budget = budget;
    final l$status = status;
    final l$isMine = isMine;
    final l$isShared = isShared;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$note,
      l$budget,
      l$status,
      l$isMine,
      l$isShared,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentGiftWishFragment || runtimeType != other.runtimeType) {
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
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$budget = budget;
    final lOther$budget = other.budget;
    if (l$budget != lOther$budget) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

const fragmentDefinitionGiftWishFragment = FragmentDefinitionNode(
  name: NameNode(value: 'GiftWishFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'GiftIdeas'), isNonNull: false),
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
        name: NameNode(value: 'note'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'budget'),
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
const documentNodeFragmentGiftWishFragment = DocumentNode(
  definitions: [fragmentDefinitionGiftWishFragment],
);

extension ClientExtensionFragmentGiftWishFragment on graphql.GraphQLClient {
  void writeFragmentGiftWishFragment({
    required FragmentGiftWishFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'GiftWishFragment',
        document: documentNodeFragmentGiftWishFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  FragmentGiftWishFragment? readFragmentGiftWishFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'GiftWishFragment',
          document: documentNodeFragmentGiftWishFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : FragmentGiftWishFragment.fromJson(result);
  }
}
