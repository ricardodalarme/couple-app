// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryMyDevices {
  QueryMyDevices({required this.devicesCollection, this.$__typename = 'Query'});

  factory QueryMyDevices.fromJson(Map<String, dynamic> json) {
    final l$devicesCollection = json['devicesCollection'];
    final l$$__typename = json['__typename'];
    return QueryMyDevices(
      devicesCollection: QueryMyDevicesdevicesCollection.fromJson(
        (l$devicesCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyDevicesdevicesCollection devicesCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$devicesCollection = devicesCollection;
    _resultData['devicesCollection'] = l$devicesCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$devicesCollection = devicesCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$devicesCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyDevices || runtimeType != other.runtimeType) {
      return false;
    }
    final l$devicesCollection = devicesCollection;
    final lOther$devicesCollection = other.devicesCollection;
    if (l$devicesCollection != lOther$devicesCollection) {
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

const documentNodeQueryMyDevices = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'MyDevices'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'devicesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '50'),
              ),
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'lastSeenAt'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
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
                              name: NameNode(value: 'id'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'platform'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'label'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'lastSeenAt'),
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
  ],
);
QueryMyDevices _parserFnQueryMyDevices(Map<String, dynamic> data) => QueryMyDevices.fromJson(data);
typedef OnQueryCompleteQueryMyDevices = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryMyDevices?,
);

class OptionsQueryMyDevices extends graphql.QueryOptions<QueryMyDevices> {
  OptionsQueryMyDevices({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyDevices? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryMyDevices? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName ?? 'MyDevices',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryMyDevices(data)),
         onError: onError,
         document: documentNodeQueryMyDevices,
         parserFn: _parserFnQueryMyDevices,
       );

  final OnQueryCompleteQueryMyDevices? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryMyDevices extends graphql.WatchQueryOptions<QueryMyDevices> {
  WatchOptionsQueryMyDevices({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryMyDevices? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName ?? 'MyDevices',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryMyDevices,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryMyDevices,
       );
}

class FetchMoreOptionsQueryMyDevices extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryMyDevices({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryMyDevices);
}

extension ClientExtensionQueryMyDevices on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryMyDevices>> queryMyDevices([
    OptionsQueryMyDevices? options,
  ]) async => await this.query(options ?? OptionsQueryMyDevices());

  graphql.ObservableQuery<QueryMyDevices> watchQueryMyDevices([
    WatchOptionsQueryMyDevices? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryMyDevices());

  void writeQueryMyDevices({required QueryMyDevices data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyDevices)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryMyDevices? readQueryMyDevices({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryMyDevices)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryMyDevices.fromJson(result);
  }
}

class QueryMyDevicesdevicesCollection {
  QueryMyDevicesdevicesCollection({required this.edges, this.$__typename = 'DevicesConnection'});

  factory QueryMyDevicesdevicesCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryMyDevicesdevicesCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryMyDevicesdevicesCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryMyDevicesdevicesCollectionedges> edges;

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
    if (other is! QueryMyDevicesdevicesCollection || runtimeType != other.runtimeType) {
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

class QueryMyDevicesdevicesCollectionedges {
  QueryMyDevicesdevicesCollectionedges({required this.node, this.$__typename = 'DevicesEdge'});

  factory QueryMyDevicesdevicesCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryMyDevicesdevicesCollectionedges(
      node: QueryMyDevicesdevicesCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryMyDevicesdevicesCollectionedgesnode node;

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
    if (other is! QueryMyDevicesdevicesCollectionedges || runtimeType != other.runtimeType) {
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

class QueryMyDevicesdevicesCollectionedgesnode {
  QueryMyDevicesdevicesCollectionedgesnode({
    required this.id,
    required this.platform,
    this.label,
    required this.lastSeenAt,
    this.$__typename = 'Devices',
  });

  factory QueryMyDevicesdevicesCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$platform = json['platform'];
    final l$label = json['label'];
    final l$lastSeenAt = json['lastSeenAt'];
    final l$$__typename = json['__typename'];
    return QueryMyDevicesdevicesCollectionedgesnode(
      id: (l$id as String),
      platform: fromJsonEnumDevicePlatform((l$platform as String)),
      label: (l$label as String?),
      lastSeenAt: DateTime.parse((l$lastSeenAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final EnumDevicePlatform platform;

  final String? label;

  final DateTime lastSeenAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$platform = platform;
    _resultData['platform'] = toJsonEnumDevicePlatform(l$platform);
    final l$label = label;
    _resultData['label'] = l$label;
    final l$lastSeenAt = lastSeenAt;
    _resultData['lastSeenAt'] = ((v) => v.toUtc().toIso8601String())(l$lastSeenAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$platform = platform;
    final l$label = label;
    final l$lastSeenAt = lastSeenAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$platform, l$label, l$lastSeenAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryMyDevicesdevicesCollectionedgesnode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$platform = platform;
    final lOther$platform = other.platform;
    if (l$platform != lOther$platform) {
      return false;
    }
    final l$label = label;
    final lOther$label = other.label;
    if (l$label != lOther$label) {
      return false;
    }
    final l$lastSeenAt = lastSeenAt;
    final lOther$lastSeenAt = other.lastSeenAt;
    if (l$lastSeenAt != lOther$lastSeenAt) {
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
