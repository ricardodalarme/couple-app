// dart format width=100
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentGameSessionFragment {
  FragmentGameSessionFragment({
    required this.id,
    required this.game,
    required this.status,
    required this.invitedBy,
    required this.itemSlugs,
    required this.createdAt,
    this.$__typename = 'GameSessions',
  });

  factory FragmentGameSessionFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$game = json['game'];
    final l$status = json['status'];
    final l$invitedBy = json['invitedBy'];
    final l$itemSlugs = json['itemSlugs'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return FragmentGameSessionFragment(
      id: (l$id as String),
      game: (l$game as String),
      status: (l$status as String),
      invitedBy: (l$invitedBy as String),
      itemSlugs: (l$itemSlugs as List<dynamic>).map((e) => (e as String?)).toList(),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String game;

  final String status;

  final String invitedBy;

  final List<String?> itemSlugs;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$game = game;
    _resultData['game'] = l$game;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$invitedBy = invitedBy;
    _resultData['invitedBy'] = l$invitedBy;
    final l$itemSlugs = itemSlugs;
    _resultData['itemSlugs'] = l$itemSlugs.map((e) => e).toList();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = ((v) => v.toUtc().toIso8601String())(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$game = game;
    final l$status = status;
    final l$invitedBy = invitedBy;
    final l$itemSlugs = itemSlugs;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$game,
      l$status,
      l$invitedBy,
      Object.hashAll(l$itemSlugs.map((v) => v)),
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentGameSessionFragment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$game = game;
    final lOther$game = other.game;
    if (l$game != lOther$game) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$invitedBy = invitedBy;
    final lOther$invitedBy = other.invitedBy;
    if (l$invitedBy != lOther$invitedBy) {
      return false;
    }
    final l$itemSlugs = itemSlugs;
    final lOther$itemSlugs = other.itemSlugs;
    if (l$itemSlugs.length != lOther$itemSlugs.length) {
      return false;
    }
    for (int i = 0; i < l$itemSlugs.length; i++) {
      final l$itemSlugs$entry = l$itemSlugs[i];
      final lOther$itemSlugs$entry = lOther$itemSlugs[i];
      if (l$itemSlugs$entry != lOther$itemSlugs$entry) {
        return false;
      }
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

const fragmentDefinitionGameSessionFragment = FragmentDefinitionNode(
  name: NameNode(value: 'GameSessionFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'GameSessions'), isNonNull: false),
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
        name: NameNode(value: 'game'),
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
        name: NameNode(value: 'invitedBy'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'itemSlugs'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
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
const documentNodeFragmentGameSessionFragment = DocumentNode(
  definitions: [fragmentDefinitionGameSessionFragment],
);

extension ClientExtensionFragmentGameSessionFragment on graphql.GraphQLClient {
  void writeFragmentGameSessionFragment({
    required FragmentGameSessionFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'GameSessionFragment',
        document: documentNodeFragmentGameSessionFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  FragmentGameSessionFragment? readFragmentGameSessionFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'GameSessionFragment',
          document: documentNodeFragmentGameSessionFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : FragmentGameSessionFragment.fromJson(result);
  }
}
