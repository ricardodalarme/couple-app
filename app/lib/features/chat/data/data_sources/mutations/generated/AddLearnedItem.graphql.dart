// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAddLearnedItem {
  factory VariablesMutationAddLearnedItem({
    required String target,
    required String text,
    String? excerpt,
  }) => VariablesMutationAddLearnedItem._({
    r'target': target,
    r'text': text,
    if (excerpt != null) r'excerpt': excerpt,
  });

  VariablesMutationAddLearnedItem._(this._$data);

  factory VariablesMutationAddLearnedItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$target = data['target'];
    result$data['target'] = (l$target as String);
    final l$text = data['text'];
    result$data['text'] = (l$text as String);
    if (data.containsKey('excerpt')) {
      final l$excerpt = data['excerpt'];
      result$data['excerpt'] = (l$excerpt as String?);
    }
    return VariablesMutationAddLearnedItem._(result$data);
  }

  Map<String, dynamic> _$data;

  String get target => (_$data['target'] as String);

  String get text => (_$data['text'] as String);

  String? get excerpt => (_$data['excerpt'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$target = target;
    result$data['target'] = l$target;
    final l$text = text;
    result$data['text'] = l$text;
    if (_$data.containsKey('excerpt')) {
      final l$excerpt = excerpt;
      result$data['excerpt'] = l$excerpt;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAddLearnedItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$target = target;
    final lOther$target = other.target;
    if (l$target != lOther$target) {
      return false;
    }
    final l$text = text;
    final lOther$text = other.text;
    if (l$text != lOther$text) {
      return false;
    }
    final l$excerpt = excerpt;
    final lOther$excerpt = other.excerpt;
    if (_$data.containsKey('excerpt') != other._$data.containsKey('excerpt')) {
      return false;
    }
    if (l$excerpt != lOther$excerpt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$target = target;
    final l$text = text;
    final l$excerpt = excerpt;
    return Object.hashAll([l$target, l$text, _$data.containsKey('excerpt') ? l$excerpt : const {}]);
  }
}

class MutationAddLearnedItem {
  MutationAddLearnedItem({this.insertIntoLearnedItemsCollection, this.$__typename = 'Mutation'});

  factory MutationAddLearnedItem.fromJson(Map<String, dynamic> json) {
    final l$insertIntoLearnedItemsCollection = json['insertIntoLearnedItemsCollection'];
    final l$$__typename = json['__typename'];
    return MutationAddLearnedItem(
      insertIntoLearnedItemsCollection: l$insertIntoLearnedItemsCollection == null
          ? null
          : MutationAddLearnedIteminsertIntoLearnedItemsCollection.fromJson(
              (l$insertIntoLearnedItemsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAddLearnedIteminsertIntoLearnedItemsCollection? insertIntoLearnedItemsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoLearnedItemsCollection = insertIntoLearnedItemsCollection;
    _resultData['insertIntoLearnedItemsCollection'] = l$insertIntoLearnedItemsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoLearnedItemsCollection = insertIntoLearnedItemsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoLearnedItemsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddLearnedItem || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoLearnedItemsCollection = insertIntoLearnedItemsCollection;
    final lOther$insertIntoLearnedItemsCollection = other.insertIntoLearnedItemsCollection;
    if (l$insertIntoLearnedItemsCollection != lOther$insertIntoLearnedItemsCollection) {
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

const documentNodeMutationAddLearnedItem = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddLearnedItem'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'target')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'text')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'excerpt')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoLearnedItemsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'target'),
                          value: VariableNode(name: NameNode(value: 'target')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'text'),
                          value: VariableNode(name: NameNode(value: 'text')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'excerpt'),
                          value: VariableNode(name: NameNode(value: 'excerpt')),
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
                  name: NameNode(value: 'records'),
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
  ],
);
MutationAddLearnedItem _parserFnMutationAddLearnedItem(Map<String, dynamic> data) =>
    MutationAddLearnedItem.fromJson(data);
typedef OnMutationCompletedMutationAddLearnedItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAddLearnedItem?,
);

class OptionsMutationAddLearnedItem extends graphql.MutationOptions<MutationAddLearnedItem> {
  OptionsMutationAddLearnedItem({
    String? operationName,
    required VariablesMutationAddLearnedItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddLearnedItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAddLearnedItem? onCompleted,
    graphql.OnMutationUpdate<MutationAddLearnedItem>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationAddLearnedItem(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAddLearnedItem,
         parserFn: _parserFnMutationAddLearnedItem,
       );

  final OnMutationCompletedMutationAddLearnedItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAddLearnedItem extends graphql.WatchQueryOptions<MutationAddLearnedItem> {
  WatchOptionsMutationAddLearnedItem({
    String? operationName,
    required VariablesMutationAddLearnedItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddLearnedItem? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationAddLearnedItem,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAddLearnedItem,
       );
}

extension ClientExtensionMutationAddLearnedItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAddLearnedItem>> mutateAddLearnedItem(
    OptionsMutationAddLearnedItem options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAddLearnedItem> watchMutationAddLearnedItem(
    WatchOptionsMutationAddLearnedItem options,
  ) => this.watchMutation(options);
}

class MutationAddLearnedIteminsertIntoLearnedItemsCollection {
  MutationAddLearnedIteminsertIntoLearnedItemsCollection({
    required this.records,
    this.$__typename = 'LearnedItemsInsertResponse',
  });

  factory MutationAddLearnedIteminsertIntoLearnedItemsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationAddLearnedIteminsertIntoLearnedItemsCollection(
      records: (l$records as List<dynamic>)
          .map(
            (e) => MutationAddLearnedIteminsertIntoLearnedItemsCollectionrecords.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<MutationAddLearnedIteminsertIntoLearnedItemsCollectionrecords> records;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$records = records;
    _resultData['records'] = l$records.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$records = records;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$records.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddLearnedIteminsertIntoLearnedItemsCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$records = records;
    final lOther$records = other.records;
    if (l$records.length != lOther$records.length) {
      return false;
    }
    for (int i = 0; i < l$records.length; i++) {
      final l$records$entry = l$records[i];
      final lOther$records$entry = lOther$records[i];
      if (l$records$entry != lOther$records$entry) {
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

class MutationAddLearnedIteminsertIntoLearnedItemsCollectionrecords {
  MutationAddLearnedIteminsertIntoLearnedItemsCollectionrecords({
    required this.id,
    required this.createdAt,
    this.$__typename = 'LearnedItems',
  });

  factory MutationAddLearnedIteminsertIntoLearnedItemsCollectionrecords.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return MutationAddLearnedIteminsertIntoLearnedItemsCollectionrecords(
      id: (l$id as String),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = ((v) => v.toUtc().toIso8601String())(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$createdAt, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddLearnedIteminsertIntoLearnedItemsCollectionrecords ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
