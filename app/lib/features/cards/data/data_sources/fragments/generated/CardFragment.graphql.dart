// dart format width=100
import '../../../../../_shared/data/data_sources/generated/schema.graphql.dart';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentCardFragment {
  FragmentCardFragment({
    required this.id,
    required this.status,
    this.note,
    required this.weekStart,
    this.sentAt,
    this.items,
    this.$__typename = 'Cards',
  });

  factory FragmentCardFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$note = json['note'];
    final l$weekStart = json['weekStart'];
    final l$sentAt = json['sentAt'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return FragmentCardFragment(
      id: (l$id as String),
      status: fromJsonEnumCardStatus((l$status as String)),
      note: (l$note as String?),
      weekStart: DateTime.parse((l$weekStart as String)),
      sentAt: l$sentAt == null ? null : DateTime.parse((l$sentAt as String)),
      items: l$items == null
          ? null
          : FragmentCardFragmentitems.fromJson((l$items as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final EnumCardStatus status;

  final String? note;

  final DateTime weekStart;

  final DateTime? sentAt;

  final FragmentCardFragmentitems? items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJsonEnumCardStatus(l$status);
    final l$note = note;
    _resultData['note'] = l$note;
    final l$weekStart = weekStart;
    _resultData['weekStart'] = ((v) => v.toIso8601String().substring(0, 10))(l$weekStart);
    final l$sentAt = sentAt;
    _resultData['sentAt'] = l$sentAt?.toIso8601String();
    final l$items = items;
    _resultData['items'] = l$items?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$note = note;
    final l$weekStart = weekStart;
    final l$sentAt = sentAt;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$status, l$note, l$weekStart, l$sentAt, l$items, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentCardFragment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$weekStart = weekStart;
    final lOther$weekStart = other.weekStart;
    if (l$weekStart != lOther$weekStart) {
      return false;
    }
    final l$sentAt = sentAt;
    final lOther$sentAt = other.sentAt;
    if (l$sentAt != lOther$sentAt) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != lOther$items) {
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

const fragmentDefinitionCardFragment = FragmentDefinitionNode(
  name: NameNode(value: 'CardFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'Cards'), isNonNull: false),
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
        name: NameNode(value: 'status'),
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
        name: NameNode(value: 'weekStart'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'sentAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'items'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'orderBy'),
            value: ListValueNode(
              values: [
                ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'position'),
                      value: EnumValueNode(name: NameNode(value: 'AscNullsLast')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(
          selections: [
            FieldNode(
              name: NameNode(value: 'edges'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(
                selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(
                      selections: [
                        FieldNode(
                          name: NameNode(value: 'slipId'),
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
                          name: NameNode(value: 'position'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        FieldNode(
                          name: NameNode(value: 'slip'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(
                            selections: [
                              FieldNode(
                                name: NameNode(value: 'category'),
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
const documentNodeFragmentCardFragment = DocumentNode(
  definitions: [fragmentDefinitionCardFragment],
);

extension ClientExtensionFragmentCardFragment on graphql.GraphQLClient {
  void writeFragmentCardFragment({
    required FragmentCardFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'CardFragment',
        document: documentNodeFragmentCardFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  FragmentCardFragment? readFragmentCardFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'CardFragment',
          document: documentNodeFragmentCardFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : FragmentCardFragment.fromJson(result);
  }
}

class FragmentCardFragmentitems {
  FragmentCardFragmentitems({required this.edges, this.$__typename = 'CardItemsConnection'});

  factory FragmentCardFragmentitems.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return FragmentCardFragmentitems(
      edges: (l$edges as List<dynamic>)
          .map((e) => FragmentCardFragmentitemsedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<FragmentCardFragmentitemsedges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentCardFragmentitems || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

class FragmentCardFragmentitemsedges {
  FragmentCardFragmentitemsedges({required this.node, this.$__typename = 'CardItemsEdge'});

  factory FragmentCardFragmentitemsedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return FragmentCardFragmentitemsedges(
      node: FragmentCardFragmentitemsedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final FragmentCardFragmentitemsedgesnode node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentCardFragmentitemsedges || runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
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

class FragmentCardFragmentitemsedgesnode {
  FragmentCardFragmentitemsedgesnode({
    this.slipId,
    required this.body,
    required this.position,
    this.slip,
    this.$__typename = 'CardItems',
  });

  factory FragmentCardFragmentitemsedgesnode.fromJson(Map<String, dynamic> json) {
    final l$slipId = json['slipId'];
    final l$body = json['body'];
    final l$position = json['position'];
    final l$slip = json['slip'];
    final l$$__typename = json['__typename'];
    return FragmentCardFragmentitemsedgesnode(
      slipId: (l$slipId as String?),
      body: (l$body as String),
      position: (l$position as int),
      slip: l$slip == null
          ? null
          : FragmentCardFragmentitemsedgesnodeslip.fromJson((l$slip as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String? slipId;

  final String body;

  final int position;

  final FragmentCardFragmentitemsedgesnodeslip? slip;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$slipId = slipId;
    _resultData['slipId'] = l$slipId;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$slip = slip;
    _resultData['slip'] = l$slip?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$slipId = slipId;
    final l$body = body;
    final l$position = position;
    final l$slip = slip;
    final l$$__typename = $__typename;
    return Object.hashAll([l$slipId, l$body, l$position, l$slip, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentCardFragmentitemsedgesnode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$slipId = slipId;
    final lOther$slipId = other.slipId;
    if (l$slipId != lOther$slipId) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$slip = slip;
    final lOther$slip = other.slip;
    if (l$slip != lOther$slip) {
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

class FragmentCardFragmentitemsedgesnodeslip {
  FragmentCardFragmentitemsedgesnodeslip({
    this.category,
    required this.createdAt,
    this.$__typename = 'Slips',
  });

  factory FragmentCardFragmentitemsedgesnodeslip.fromJson(Map<String, dynamic> json) {
    final l$category = json['category'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return FragmentCardFragmentitemsedgesnodeslip(
      category: (l$category as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String? category;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$category = category;
    _resultData['category'] = l$category;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$category = category;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$category, l$createdAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentCardFragmentitemsedgesnodeslip || runtimeType != other.runtimeType) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
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
