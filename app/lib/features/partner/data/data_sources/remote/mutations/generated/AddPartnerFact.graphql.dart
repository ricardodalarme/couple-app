// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationAddPartnerFact {
  factory VariablesMutationAddPartnerFact({
    required String id,
    required String label,
    required String value,
    String? category,
  }) => VariablesMutationAddPartnerFact._({
    r'id': id,
    r'label': label,
    r'value': value,
    if (category != null) r'category': category,
  });

  VariablesMutationAddPartnerFact._(this._$data);

  factory VariablesMutationAddPartnerFact.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$label = data['label'];
    result$data['label'] = (l$label as String);
    final l$value = data['value'];
    result$data['value'] = (l$value as String);
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = (l$category as String?);
    }
    return VariablesMutationAddPartnerFact._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get label => (_$data['label'] as String);

  String get value => (_$data['value'] as String);

  String? get category => (_$data['category'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$label = label;
    result$data['label'] = l$label;
    final l$value = value;
    result$data['value'] = l$value;
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationAddPartnerFact || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$label = label;
    final lOther$label = other.label;
    if (l$label != lOther$label) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') != other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$label = label;
    final l$value = value;
    final l$category = category;
    return Object.hashAll([
      l$id,
      l$label,
      l$value,
      _$data.containsKey('category') ? l$category : const {},
    ]);
  }
}

class MutationAddPartnerFact {
  MutationAddPartnerFact({this.insertIntoPartnerFactsCollection, this.$__typename = 'Mutation'});

  factory MutationAddPartnerFact.fromJson(Map<String, dynamic> json) {
    final l$insertIntoPartnerFactsCollection = json['insertIntoPartnerFactsCollection'];
    final l$$__typename = json['__typename'];
    return MutationAddPartnerFact(
      insertIntoPartnerFactsCollection: l$insertIntoPartnerFactsCollection == null
          ? null
          : MutationAddPartnerFactinsertIntoPartnerFactsCollection.fromJson(
              (l$insertIntoPartnerFactsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationAddPartnerFactinsertIntoPartnerFactsCollection? insertIntoPartnerFactsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoPartnerFactsCollection = insertIntoPartnerFactsCollection;
    _resultData['insertIntoPartnerFactsCollection'] = l$insertIntoPartnerFactsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoPartnerFactsCollection = insertIntoPartnerFactsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoPartnerFactsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationAddPartnerFact || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoPartnerFactsCollection = insertIntoPartnerFactsCollection;
    final lOther$insertIntoPartnerFactsCollection = other.insertIntoPartnerFactsCollection;
    if (l$insertIntoPartnerFactsCollection != lOther$insertIntoPartnerFactsCollection) {
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

const documentNodeMutationAddPartnerFact = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddPartnerFact'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'label')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'value')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'category')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoPartnerFactsCollection'),
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
                          name: NameNode(value: 'label'),
                          value: VariableNode(name: NameNode(value: 'label')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value: VariableNode(name: NameNode(value: 'value')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'category'),
                          value: VariableNode(name: NameNode(value: 'category')),
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
MutationAddPartnerFact _parserFnMutationAddPartnerFact(Map<String, dynamic> data) =>
    MutationAddPartnerFact.fromJson(data);
typedef OnMutationCompletedMutationAddPartnerFact = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationAddPartnerFact?,
);

class OptionsMutationAddPartnerFact extends graphql.MutationOptions<MutationAddPartnerFact> {
  OptionsMutationAddPartnerFact({
    String? operationName,
    required VariablesMutationAddPartnerFact variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddPartnerFact? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationAddPartnerFact? onCompleted,
    graphql.OnMutationUpdate<MutationAddPartnerFact>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationAddPartnerFact(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationAddPartnerFact,
         parserFn: _parserFnMutationAddPartnerFact,
       );

  final OnMutationCompletedMutationAddPartnerFact? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationAddPartnerFact extends graphql.WatchQueryOptions<MutationAddPartnerFact> {
  WatchOptionsMutationAddPartnerFact({
    String? operationName,
    required VariablesMutationAddPartnerFact variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationAddPartnerFact? typedOptimisticResult,
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
         document: documentNodeMutationAddPartnerFact,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationAddPartnerFact,
       );
}

extension ClientExtensionMutationAddPartnerFact on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationAddPartnerFact>> mutateAddPartnerFact(
    OptionsMutationAddPartnerFact options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationAddPartnerFact> watchMutationAddPartnerFact(
    WatchOptionsMutationAddPartnerFact options,
  ) => this.watchMutation(options);
}

class MutationAddPartnerFactinsertIntoPartnerFactsCollection {
  MutationAddPartnerFactinsertIntoPartnerFactsCollection({
    required this.affectedCount,
    this.$__typename = 'PartnerFactsInsertResponse',
  });

  factory MutationAddPartnerFactinsertIntoPartnerFactsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationAddPartnerFactinsertIntoPartnerFactsCollection(
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
    if (other is! MutationAddPartnerFactinsertIntoPartnerFactsCollection ||
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
