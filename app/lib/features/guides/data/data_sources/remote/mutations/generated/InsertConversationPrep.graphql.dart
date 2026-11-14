// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertConversationPrep {
  factory VariablesMutationInsertConversationPrep({
    required String id,
    required EnumConversationGuide guide,
    required String topic,
    String? notes,
    String? draft,
  }) => VariablesMutationInsertConversationPrep._({
    r'id': id,
    r'guide': guide,
    r'topic': topic,
    if (notes != null) r'notes': notes,
    if (draft != null) r'draft': draft,
  });

  VariablesMutationInsertConversationPrep._(this._$data);

  factory VariablesMutationInsertConversationPrep.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$guide = data['guide'];
    result$data['guide'] = fromJsonEnumConversationGuide((l$guide as String));
    final l$topic = data['topic'];
    result$data['topic'] = (l$topic as String);
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    if (data.containsKey('draft')) {
      final l$draft = data['draft'];
      result$data['draft'] = (l$draft as String?);
    }
    return VariablesMutationInsertConversationPrep._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  EnumConversationGuide get guide => (_$data['guide'] as EnumConversationGuide);

  String get topic => (_$data['topic'] as String);

  String? get notes => (_$data['notes'] as String?);

  String? get draft => (_$data['draft'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$guide = guide;
    result$data['guide'] = toJsonEnumConversationGuide(l$guide);
    final l$topic = topic;
    result$data['topic'] = l$topic;
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    if (_$data.containsKey('draft')) {
      final l$draft = draft;
      result$data['draft'] = l$draft;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationInsertConversationPrep || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$guide = guide;
    final lOther$guide = other.guide;
    if (l$guide != lOther$guide) {
      return false;
    }
    final l$topic = topic;
    final lOther$topic = other.topic;
    if (l$topic != lOther$topic) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$draft = draft;
    final lOther$draft = other.draft;
    if (_$data.containsKey('draft') != other._$data.containsKey('draft')) {
      return false;
    }
    if (l$draft != lOther$draft) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$guide = guide;
    final l$topic = topic;
    final l$notes = notes;
    final l$draft = draft;
    return Object.hashAll([
      l$id,
      l$guide,
      l$topic,
      _$data.containsKey('notes') ? l$notes : const {},
      _$data.containsKey('draft') ? l$draft : const {},
    ]);
  }
}

class MutationInsertConversationPrep {
  MutationInsertConversationPrep({
    this.insertIntoConversationPrepsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationInsertConversationPrep.fromJson(Map<String, dynamic> json) {
    final l$insertIntoConversationPrepsCollection = json['insertIntoConversationPrepsCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertConversationPrep(
      insertIntoConversationPrepsCollection: l$insertIntoConversationPrepsCollection == null
          ? null
          : MutationInsertConversationPrepinsertIntoConversationPrepsCollection.fromJson(
              (l$insertIntoConversationPrepsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertConversationPrepinsertIntoConversationPrepsCollection?
  insertIntoConversationPrepsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoConversationPrepsCollection = insertIntoConversationPrepsCollection;
    _resultData['insertIntoConversationPrepsCollection'] = l$insertIntoConversationPrepsCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoConversationPrepsCollection = insertIntoConversationPrepsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoConversationPrepsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertConversationPrep || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoConversationPrepsCollection = insertIntoConversationPrepsCollection;
    final lOther$insertIntoConversationPrepsCollection =
        other.insertIntoConversationPrepsCollection;
    if (l$insertIntoConversationPrepsCollection != lOther$insertIntoConversationPrepsCollection) {
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

const documentNodeMutationInsertConversationPrep = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertConversationPrep'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'guide')),
          type: NamedTypeNode(name: NameNode(value: 'ConversationGuide'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'topic')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'notes')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'draft')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoConversationPrepsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: VariableNode(name: NameNode(value: 'id')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'guide'),
                          value: VariableNode(name: NameNode(value: 'guide')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'topic'),
                          value: VariableNode(name: NameNode(value: 'topic')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'notes'),
                          value: VariableNode(name: NameNode(value: 'notes')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'draft'),
                          value: VariableNode(name: NameNode(value: 'draft')),
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
MutationInsertConversationPrep _parserFnMutationInsertConversationPrep(Map<String, dynamic> data) =>
    MutationInsertConversationPrep.fromJson(data);
typedef OnMutationCompletedMutationInsertConversationPrep = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertConversationPrep?,
);

class OptionsMutationInsertConversationPrep
    extends graphql.MutationOptions<MutationInsertConversationPrep> {
  OptionsMutationInsertConversationPrep({
    String? operationName,
    required VariablesMutationInsertConversationPrep variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertConversationPrep? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertConversationPrep? onCompleted,
    graphql.OnMutationUpdate<MutationInsertConversationPrep>? update,
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
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationInsertConversationPrep(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertConversationPrep,
         parserFn: _parserFnMutationInsertConversationPrep,
       );

  final OnMutationCompletedMutationInsertConversationPrep? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertConversationPrep
    extends graphql.WatchQueryOptions<MutationInsertConversationPrep> {
  WatchOptionsMutationInsertConversationPrep({
    String? operationName,
    required VariablesMutationInsertConversationPrep variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertConversationPrep? typedOptimisticResult,
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
         document: documentNodeMutationInsertConversationPrep,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertConversationPrep,
       );
}

extension ClientExtensionMutationInsertConversationPrep on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertConversationPrep>> mutateInsertConversationPrep(
    OptionsMutationInsertConversationPrep options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertConversationPrep> watchMutationInsertConversationPrep(
    WatchOptionsMutationInsertConversationPrep options,
  ) => this.watchMutation(options);
}

class MutationInsertConversationPrepinsertIntoConversationPrepsCollection {
  MutationInsertConversationPrepinsertIntoConversationPrepsCollection({
    required this.records,
    this.$__typename = 'ConversationPrepsInsertResponse',
  });

  factory MutationInsertConversationPrepinsertIntoConversationPrepsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationInsertConversationPrepinsertIntoConversationPrepsCollection(
      records: (l$records as List<dynamic>)
          .map(
            (e) =>
                MutationInsertConversationPrepinsertIntoConversationPrepsCollectionrecords.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<MutationInsertConversationPrepinsertIntoConversationPrepsCollectionrecords> records;

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
    if (other is! MutationInsertConversationPrepinsertIntoConversationPrepsCollection ||
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

class MutationInsertConversationPrepinsertIntoConversationPrepsCollectionrecords {
  MutationInsertConversationPrepinsertIntoConversationPrepsCollectionrecords({
    required this.id,
    this.$__typename = 'ConversationPreps',
  });

  factory MutationInsertConversationPrepinsertIntoConversationPrepsCollectionrecords.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationInsertConversationPrepinsertIntoConversationPrepsCollectionrecords(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertConversationPrepinsertIntoConversationPrepsCollectionrecords ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
