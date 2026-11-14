// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertLoveStyleResult {
  factory VariablesMutationInsertLoveStyleResult({required List<String?> ranked}) =>
      VariablesMutationInsertLoveStyleResult._({r'ranked': ranked});

  VariablesMutationInsertLoveStyleResult._(this._$data);

  factory VariablesMutationInsertLoveStyleResult.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$ranked = data['ranked'];
    result$data['ranked'] = (l$ranked as List<dynamic>).map((e) => (e as String?)).toList();
    return VariablesMutationInsertLoveStyleResult._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String?> get ranked => (_$data['ranked'] as List<String?>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ranked = ranked;
    result$data['ranked'] = l$ranked.map((e) => e).toList();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationInsertLoveStyleResult || runtimeType != other.runtimeType) {
      return false;
    }
    final l$ranked = ranked;
    final lOther$ranked = other.ranked;
    if (l$ranked.length != lOther$ranked.length) {
      return false;
    }
    for (int i = 0; i < l$ranked.length; i++) {
      final l$ranked$entry = l$ranked[i];
      final lOther$ranked$entry = lOther$ranked[i];
      if (l$ranked$entry != lOther$ranked$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ranked = ranked;
    return Object.hashAll([Object.hashAll(l$ranked.map((v) => v))]);
  }
}

class MutationInsertLoveStyleResult {
  MutationInsertLoveStyleResult({
    this.insertIntoQuizResultsCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationInsertLoveStyleResult.fromJson(Map<String, dynamic> json) {
    final l$insertIntoQuizResultsCollection = json['insertIntoQuizResultsCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertLoveStyleResult(
      insertIntoQuizResultsCollection: l$insertIntoQuizResultsCollection == null
          ? null
          : MutationInsertLoveStyleResultinsertIntoQuizResultsCollection.fromJson(
              (l$insertIntoQuizResultsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertLoveStyleResultinsertIntoQuizResultsCollection?
  insertIntoQuizResultsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoQuizResultsCollection = insertIntoQuizResultsCollection;
    _resultData['insertIntoQuizResultsCollection'] = l$insertIntoQuizResultsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoQuizResultsCollection = insertIntoQuizResultsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoQuizResultsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertLoveStyleResult || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoQuizResultsCollection = insertIntoQuizResultsCollection;
    final lOther$insertIntoQuizResultsCollection = other.insertIntoQuizResultsCollection;
    if (l$insertIntoQuizResultsCollection != lOther$insertIntoQuizResultsCollection) {
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

const documentNodeMutationInsertLoveStyleResult = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertLoveStyleResult'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'ranked')),
          type: ListTypeNode(
            type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: false),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoQuizResultsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'quizKey'),
                          value: EnumValueNode(name: NameNode(value: 'loved')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'ranked'),
                          value: VariableNode(name: NameNode(value: 'ranked')),
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
                        name: NameNode(value: 'ranked'),
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
MutationInsertLoveStyleResult _parserFnMutationInsertLoveStyleResult(Map<String, dynamic> data) =>
    MutationInsertLoveStyleResult.fromJson(data);
typedef OnMutationCompletedMutationInsertLoveStyleResult = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertLoveStyleResult?,
);

class OptionsMutationInsertLoveStyleResult
    extends graphql.MutationOptions<MutationInsertLoveStyleResult> {
  OptionsMutationInsertLoveStyleResult({
    String? operationName,
    required VariablesMutationInsertLoveStyleResult variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertLoveStyleResult? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertLoveStyleResult? onCompleted,
    graphql.OnMutationUpdate<MutationInsertLoveStyleResult>? update,
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
                 data == null ? null : _parserFnMutationInsertLoveStyleResult(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertLoveStyleResult,
         parserFn: _parserFnMutationInsertLoveStyleResult,
       );

  final OnMutationCompletedMutationInsertLoveStyleResult? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertLoveStyleResult
    extends graphql.WatchQueryOptions<MutationInsertLoveStyleResult> {
  WatchOptionsMutationInsertLoveStyleResult({
    String? operationName,
    required VariablesMutationInsertLoveStyleResult variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertLoveStyleResult? typedOptimisticResult,
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
         document: documentNodeMutationInsertLoveStyleResult,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertLoveStyleResult,
       );
}

extension ClientExtensionMutationInsertLoveStyleResult on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertLoveStyleResult>> mutateInsertLoveStyleResult(
    OptionsMutationInsertLoveStyleResult options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertLoveStyleResult> watchMutationInsertLoveStyleResult(
    WatchOptionsMutationInsertLoveStyleResult options,
  ) => this.watchMutation(options);
}

class MutationInsertLoveStyleResultinsertIntoQuizResultsCollection {
  MutationInsertLoveStyleResultinsertIntoQuizResultsCollection({
    required this.records,
    this.$__typename = 'QuizResultsInsertResponse',
  });

  factory MutationInsertLoveStyleResultinsertIntoQuizResultsCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$records = json['records'];
    final l$$__typename = json['__typename'];
    return MutationInsertLoveStyleResultinsertIntoQuizResultsCollection(
      records: (l$records as List<dynamic>)
          .map(
            (e) => MutationInsertLoveStyleResultinsertIntoQuizResultsCollectionrecords.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<MutationInsertLoveStyleResultinsertIntoQuizResultsCollectionrecords> records;

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
    if (other is! MutationInsertLoveStyleResultinsertIntoQuizResultsCollection ||
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

class MutationInsertLoveStyleResultinsertIntoQuizResultsCollectionrecords {
  MutationInsertLoveStyleResultinsertIntoQuizResultsCollectionrecords({
    required this.id,
    required this.ranked,
    this.$__typename = 'QuizResults',
  });

  factory MutationInsertLoveStyleResultinsertIntoQuizResultsCollectionrecords.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$ranked = json['ranked'];
    final l$$__typename = json['__typename'];
    return MutationInsertLoveStyleResultinsertIntoQuizResultsCollectionrecords(
      id: (l$id as String),
      ranked: (l$ranked as List<dynamic>).map((e) => (e as String?)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<String?> ranked;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$ranked = ranked;
    _resultData['ranked'] = l$ranked.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$ranked = ranked;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, Object.hashAll(l$ranked.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertLoveStyleResultinsertIntoQuizResultsCollectionrecords ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$ranked = ranked;
    final lOther$ranked = other.ranked;
    if (l$ranked.length != lOther$ranked.length) {
      return false;
    }
    for (int i = 0; i < l$ranked.length; i++) {
      final l$ranked$entry = l$ranked[i];
      final lOther$ranked$entry = lOther$ranked[i];
      if (l$ranked$entry != lOther$ranked$entry) {
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
