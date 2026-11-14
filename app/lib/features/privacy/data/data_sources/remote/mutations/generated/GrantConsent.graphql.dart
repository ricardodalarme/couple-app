// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationGrantConsent {
  factory VariablesMutationGrantConsent({
    required EnumConsentKind kind,
    required bool granted,
    required String version,
  }) => VariablesMutationGrantConsent._({r'kind': kind, r'granted': granted, r'version': version});

  VariablesMutationGrantConsent._(this._$data);

  factory VariablesMutationGrantConsent.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$kind = data['kind'];
    result$data['kind'] = fromJsonEnumConsentKind((l$kind as String));
    final l$granted = data['granted'];
    result$data['granted'] = (l$granted as bool);
    final l$version = data['version'];
    result$data['version'] = (l$version as String);
    return VariablesMutationGrantConsent._(result$data);
  }

  Map<String, dynamic> _$data;

  EnumConsentKind get kind => (_$data['kind'] as EnumConsentKind);

  bool get granted => (_$data['granted'] as bool);

  String get version => (_$data['version'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$kind = kind;
    result$data['kind'] = toJsonEnumConsentKind(l$kind);
    final l$granted = granted;
    result$data['granted'] = l$granted;
    final l$version = version;
    result$data['version'] = l$version;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationGrantConsent || runtimeType != other.runtimeType) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$granted = granted;
    final lOther$granted = other.granted;
    if (l$granted != lOther$granted) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (l$version != lOther$version) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$kind = kind;
    final l$granted = granted;
    final l$version = version;
    return Object.hashAll([l$kind, l$granted, l$version]);
  }
}

class MutationGrantConsent {
  MutationGrantConsent({this.insertIntoConsentsCollection, this.$__typename = 'Mutation'});

  factory MutationGrantConsent.fromJson(Map<String, dynamic> json) {
    final l$insertIntoConsentsCollection = json['insertIntoConsentsCollection'];
    final l$$__typename = json['__typename'];
    return MutationGrantConsent(
      insertIntoConsentsCollection: l$insertIntoConsentsCollection == null
          ? null
          : MutationGrantConsentinsertIntoConsentsCollection.fromJson(
              (l$insertIntoConsentsCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationGrantConsentinsertIntoConsentsCollection? insertIntoConsentsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoConsentsCollection = insertIntoConsentsCollection;
    _resultData['insertIntoConsentsCollection'] = l$insertIntoConsentsCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoConsentsCollection = insertIntoConsentsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoConsentsCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationGrantConsent || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoConsentsCollection = insertIntoConsentsCollection;
    final lOther$insertIntoConsentsCollection = other.insertIntoConsentsCollection;
    if (l$insertIntoConsentsCollection != lOther$insertIntoConsentsCollection) {
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

const documentNodeMutationGrantConsent = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'GrantConsent'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'kind')),
          type: NamedTypeNode(name: NameNode(value: 'ConsentKind'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'granted')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'version')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insertIntoConsentsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'kind'),
                          value: VariableNode(name: NameNode(value: 'kind')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'granted'),
                          value: VariableNode(name: NameNode(value: 'granted')),
                        ),
                        ObjectFieldNode(
                          name: NameNode(value: 'version'),
                          value: VariableNode(name: NameNode(value: 'version')),
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
MutationGrantConsent _parserFnMutationGrantConsent(Map<String, dynamic> data) =>
    MutationGrantConsent.fromJson(data);
typedef OnMutationCompletedMutationGrantConsent = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationGrantConsent?,
);

class OptionsMutationGrantConsent extends graphql.MutationOptions<MutationGrantConsent> {
  OptionsMutationGrantConsent({
    String? operationName,
    required VariablesMutationGrantConsent variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationGrantConsent? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationGrantConsent? onCompleted,
    graphql.OnMutationUpdate<MutationGrantConsent>? update,
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
                   onCompleted(data, data == null ? null : _parserFnMutationGrantConsent(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationGrantConsent,
         parserFn: _parserFnMutationGrantConsent,
       );

  final OnMutationCompletedMutationGrantConsent? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationGrantConsent extends graphql.WatchQueryOptions<MutationGrantConsent> {
  WatchOptionsMutationGrantConsent({
    String? operationName,
    required VariablesMutationGrantConsent variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationGrantConsent? typedOptimisticResult,
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
         document: documentNodeMutationGrantConsent,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationGrantConsent,
       );
}

extension ClientExtensionMutationGrantConsent on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationGrantConsent>> mutateGrantConsent(
    OptionsMutationGrantConsent options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationGrantConsent> watchMutationGrantConsent(
    WatchOptionsMutationGrantConsent options,
  ) => this.watchMutation(options);
}

class MutationGrantConsentinsertIntoConsentsCollection {
  MutationGrantConsentinsertIntoConsentsCollection({
    required this.affectedCount,
    this.$__typename = 'ConsentsInsertResponse',
  });

  factory MutationGrantConsentinsertIntoConsentsCollection.fromJson(Map<String, dynamic> json) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationGrantConsentinsertIntoConsentsCollection(
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
    if (other is! MutationGrantConsentinsertIntoConsentsCollection ||
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
