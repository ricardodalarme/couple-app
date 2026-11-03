// dart format width=100
import 'dart:convert';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class FragmentNotificationFragment {
  FragmentNotificationFragment({
    required this.id,
    required this.kind,
    required this.title,
    this.body,
    required this.data,
    this.read_at,
    required this.created_at,
    this.$__typename = 'notifications',
  });

  factory FragmentNotificationFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$kind = json['kind'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$data = json['data'];
    final l$read_at = json['read_at'];
    final l$created_at = json['created_at'];
    final l$$__typename = json['__typename'];
    return FragmentNotificationFragment(
      id: (l$id as String),
      kind: (l$kind as String),
      title: (l$title as String),
      body: (l$body as String?),
      data: jsonDecode(l$data),
      read_at: l$read_at == null ? null : DateTime.parse((l$read_at as String)),
      created_at: DateTime.parse((l$created_at as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String kind;

  final String title;

  final String? body;

  final dynamic data;

  final DateTime? read_at;

  final DateTime created_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$kind = kind;
    _resultData['kind'] = l$kind;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$data = data;
    _resultData['data'] = jsonEncode(l$data);
    final l$read_at = read_at;
    _resultData['read_at'] = l$read_at?.toIso8601String();
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$kind = kind;
    final l$title = title;
    final l$body = body;
    final l$data = data;
    final l$read_at = read_at;
    final l$created_at = created_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$kind,
      l$title,
      l$body,
      l$data,
      l$read_at,
      l$created_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! FragmentNotificationFragment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
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
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    final l$read_at = read_at;
    final lOther$read_at = other.read_at;
    if (l$read_at != lOther$read_at) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
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

const fragmentDefinitionNotificationFragment = FragmentDefinitionNode(
  name: NameNode(value: 'NotificationFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'notifications'), isNonNull: false),
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
        name: NameNode(value: 'kind'),
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
        name: NameNode(value: 'data'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'read_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
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
const documentNodeFragmentNotificationFragment = DocumentNode(
  definitions: [fragmentDefinitionNotificationFragment],
);

extension ClientExtensionFragmentNotificationFragment on graphql.GraphQLClient {
  void writeFragmentNotificationFragment({
    required FragmentNotificationFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'NotificationFragment',
        document: documentNodeFragmentNotificationFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  FragmentNotificationFragment? readFragmentNotificationFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'NotificationFragment',
          document: documentNodeFragmentNotificationFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : FragmentNotificationFragment.fromJson(result);
  }
}
