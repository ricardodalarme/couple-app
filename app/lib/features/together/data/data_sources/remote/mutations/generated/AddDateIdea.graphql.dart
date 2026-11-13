// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAddDateIdea {
  factory VariablesMutationAddDateIdea({
    required String id,
    required String title,
    String? slug,
    String? coupleId,
  }) => VariablesMutationAddDateIdea._({
    r'id': id,
    r'title': title,
    if (slug != null) r'slug': slug,
    if (coupleId != null) r'coupleId': coupleId,
  });

  VariablesMutationAddDateIdea._(this._$data);

  factory VariablesMutationAddDateIdea.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    if (data.containsKey('slug')) {
      final l$slug = data['slug'];
      result$data['slug'] = (l$slug as String?);
    }
    if (data.containsKey('coupleId')) {
      final l$coupleId = data['coupleId'];
      result$data['coupleId'] = (l$coupleId as String?);
    }
    return VariablesMutationAddDateIdea._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get title => (_$data['title'] as String);

  String? get slug => (_$data['slug'] as String?);

  String? get coupleId => (_$data['coupleId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$title = title;
    result$data['title'] = l$title;
    if (_$data.containsKey('slug')) {
      final l$slug = slug;
      result$data['slug'] = l$slug;
    }
    if (_$data.containsKey('coupleId')) {
      final l$coupleId = coupleId;
      result$data['coupleId'] = l$coupleId;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAddDateIdea || runtimeType != other.runtimeType) {
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
    final l$slug = slug;
    final lOther$slug = other.slug;
    if (_$data.containsKey('slug') != other._$data.containsKey('slug')) {
      return false;
    }
    if (l$slug != lOther$slug) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (_$data.containsKey('coupleId') != other._$data.containsKey('coupleId')) {
      return false;
    }
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$slug = slug;
    final l$coupleId = coupleId;
    return Object.hashAll([
      l$id,
      l$title,
      _$data.containsKey('slug') ? l$slug : const {},
      _$data.containsKey('coupleId') ? l$coupleId : const {},
    ]);
  }
}

class MutationAddDateIdea {
  MutationAddDateIdea({this.insertIntoSavedDateIdeasCollection, this.$__typename = 'Mutation'});

  factory MutationAddDateIdea.fromJson(Map<String, dynamic> json) {
    final l$insertIntoSavedDateIdeasCollection = json['insertIntoSavedDateIdeasCollection'];
    final l$$__typename = json['__typename'];
    return MutationAddDateIdea(
      insertIntoSavedDateIdeasCollection: l$insertIntoSavedDateIdeasCollection == null
          ? null
          : MutationAddDateIdeainsertIntoSavedDateIdeasCollection.fromJson(
              (l$insertIntoSavedDateIdeasCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAddDateIdeainsertIntoSavedDateIdeasCollection? insertIntoSavedDateIdeasCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoSavedDateIdeasCollection = insertIntoSavedDateIdeasCollection;
    _resultData['insertIntoSavedDateIdeasCollection'] = l$insertIntoSavedDateIdeasCollection
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoSavedDateIdeasCollection = insertIntoSavedDateIdeasCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoSavedDateIdeasCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddDateIdea || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoSavedDateIdeasCollection = insertIntoSavedDateIdeasCollection;
    final lOther$insertIntoSavedDateIdeasCollection = other.insertIntoSavedDateIdeasCollection;
    if (l$insertIntoSavedDateIdeasCollection != lOther$insertIntoSavedDateIdeasCollection) {
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

const documentNodeMutationAddDateIdea = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddDateIdea'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'title')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'slug')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'coupleId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoSavedDateIdeasCollection'),
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
                          name: NameNode(value: 'title'),
                          value: VariableNode(name: NameNode(value: 'title')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'contentSlug'),
                          value: VariableNode(name: NameNode(value: 'slug')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'coupleId'),
                          value: VariableNode(name: NameNode(value: 'coupleId')),
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
MutationAddDateIdea _parserFnMutationAddDateIdea(Map<String, dynamic> data) =>
    MutationAddDateIdea.fromJson(data);
typedef OnMutationCompletedMutationAddDateIdea = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAddDateIdea?,
);

class OptionsMutationAddDateIdea extends graphql.MutationOptions<MutationAddDateIdea> {
  OptionsMutationAddDateIdea({
    String? operationName,
    required VariablesMutationAddDateIdea variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddDateIdea? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAddDateIdea? onCompleted,
    graphql.OnMutationUpdate<MutationAddDateIdea>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationAddDateIdea(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAddDateIdea,
         parserFn: _parserFnMutationAddDateIdea,
       );

  final OnMutationCompletedMutationAddDateIdea? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAddDateIdea extends graphql.WatchQueryOptions<MutationAddDateIdea> {
  WatchOptionsMutationAddDateIdea({
    String? operationName,
    required VariablesMutationAddDateIdea variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddDateIdea? typedOptimisticResult,
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
         document: documentNodeMutationAddDateIdea,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAddDateIdea,
       );
}

extension ClientExtensionMutationAddDateIdea on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAddDateIdea>> mutateAddDateIdea(
    OptionsMutationAddDateIdea options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAddDateIdea> watchMutationAddDateIdea(
    WatchOptionsMutationAddDateIdea options,
  ) => this.watchMutation(options);
}

class MutationAddDateIdeainsertIntoSavedDateIdeasCollection {
  MutationAddDateIdeainsertIntoSavedDateIdeasCollection({
    required this.affectedCount,
    this.$__typename = 'SavedDateIdeasInsertResponse',
  });

  factory MutationAddDateIdeainsertIntoSavedDateIdeasCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationAddDateIdeainsertIntoSavedDateIdeasCollection(
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
    if (other is! MutationAddDateIdeainsertIntoSavedDateIdeasCollection ||
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
