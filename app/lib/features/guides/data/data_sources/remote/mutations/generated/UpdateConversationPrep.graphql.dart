// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpdateConversationPrep {
  factory VariablesMutationUpdateConversationPrep({
    required String id,
    required EnumConversationGuide guide,
    required String topic,
    String? notes,
    String? draft,
  }) => VariablesMutationUpdateConversationPrep._({
    r'id': id,
    r'guide': guide,
    r'topic': topic,
    if (notes != null) r'notes': notes,
    if (draft != null) r'draft': draft,
  });

  VariablesMutationUpdateConversationPrep._(this._$data);

  factory VariablesMutationUpdateConversationPrep.fromJson(Map<String, dynamic> data) {
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
    return VariablesMutationUpdateConversationPrep._(result$data);
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
    if (other is! VariablesMutationUpdateConversationPrep || runtimeType != other.runtimeType) {
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

class MutationUpdateConversationPrep {
  MutationUpdateConversationPrep({
    required this.updateConversationPrepsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpdateConversationPrep.fromJson(Map<String, dynamic> json) {
    final l$updateConversationPrepsCollection = json['updateConversationPrepsCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpdateConversationPrep(
      updateConversationPrepsCollection:
          MutationUpdateConversationPrepupdateConversationPrepsCollection.fromJson(
            (l$updateConversationPrepsCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpdateConversationPrepupdateConversationPrepsCollection
  updateConversationPrepsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateConversationPrepsCollection = updateConversationPrepsCollection;
    _resultData['updateConversationPrepsCollection'] = l$updateConversationPrepsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateConversationPrepsCollection = updateConversationPrepsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateConversationPrepsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateConversationPrep || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateConversationPrepsCollection = updateConversationPrepsCollection;
    final lOther$updateConversationPrepsCollection = other.updateConversationPrepsCollection;
    if (l$updateConversationPrepsCollection != lOther$updateConversationPrepsCollection) {
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

const documentNodeMutationUpdateConversationPrep = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateConversationPrep'),
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
            name: NameNode(value: 'updateConversationPrepsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
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
              ),
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'id'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'id')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'atMost'),
                value: IntValueNode(value: '1'),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'affectedCount'),
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
  ],
);
MutationUpdateConversationPrep _parserFnMutationUpdateConversationPrep(Map<String, dynamic> data) =>
    MutationUpdateConversationPrep.fromJson(data);
typedef OnMutationCompletedMutationUpdateConversationPrep = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpdateConversationPrep?,
);

class OptionsMutationUpdateConversationPrep
    extends graphql.MutationOptions<MutationUpdateConversationPrep> {
  OptionsMutationUpdateConversationPrep({
    String? operationName,
    required VariablesMutationUpdateConversationPrep variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateConversationPrep? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpdateConversationPrep? onCompleted,
    graphql.OnMutationUpdate<MutationUpdateConversationPrep>? update,
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
                 data == null ? null : _parserFnMutationUpdateConversationPrep(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateConversationPrep,
         parserFn: _parserFnMutationUpdateConversationPrep,
       );

  final OnMutationCompletedMutationUpdateConversationPrep? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpdateConversationPrep
    extends graphql.WatchQueryOptions<MutationUpdateConversationPrep> {
  WatchOptionsMutationUpdateConversationPrep({
    String? operationName,
    required VariablesMutationUpdateConversationPrep variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpdateConversationPrep? typedOptimisticResult,
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
         document: documentNodeMutationUpdateConversationPrep,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpdateConversationPrep,
       );
}

extension ClientExtensionMutationUpdateConversationPrep on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpdateConversationPrep>> mutateUpdateConversationPrep(
    OptionsMutationUpdateConversationPrep options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpdateConversationPrep> watchMutationUpdateConversationPrep(
    WatchOptionsMutationUpdateConversationPrep options,
  ) => this.watchMutation(options);
}

class MutationUpdateConversationPrepupdateConversationPrepsCollection {
  MutationUpdateConversationPrepupdateConversationPrepsCollection({
    required this.affectedCount,
    this.$__typename = 'ConversationPrepsUpdateResponse',
  });

  factory MutationUpdateConversationPrepupdateConversationPrepsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpdateConversationPrepupdateConversationPrepsCollection(
      affectedCount: (l$affectedCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int affectedCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affectedCount = affectedCount;
    _resultData['affectedCount'] = l$affectedCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affectedCount = affectedCount;
    final l$$__typename = $__typename;
    return Object.hashAll([l$affectedCount, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpdateConversationPrepupdateConversationPrepsCollection ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affectedCount = affectedCount;
    final lOther$affectedCount = other.affectedCount;
    if (l$affectedCount != lOther$affectedCount) {
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
