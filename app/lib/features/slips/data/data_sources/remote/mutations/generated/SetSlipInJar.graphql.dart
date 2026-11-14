// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationSetSlipInJar {
  factory VariablesMutationSetSlipInJar({required String id, required bool inJar}) =>
      VariablesMutationSetSlipInJar._({r'id': id, r'inJar': inJar});

  VariablesMutationSetSlipInJar._(this._$data);

  factory VariablesMutationSetSlipInJar.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$inJar = data['inJar'];
    result$data['inJar'] = (l$inJar as bool);
    return VariablesMutationSetSlipInJar._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  bool get inJar => (_$data['inJar'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$inJar = inJar;
    result$data['inJar'] = l$inJar;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationSetSlipInJar || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$inJar = inJar;
    final lOther$inJar = other.inJar;
    if (l$inJar != lOther$inJar) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$inJar = inJar;
    return Object.hashAll([l$id, l$inJar]);
  }
}

class MutationSetSlipInJar {
  MutationSetSlipInJar({this.setSlipDetails, this.$__typename = 'Mutation'});

  factory MutationSetSlipInJar.fromJson(Map<String, dynamic> json) {
    final l$setSlipDetails = json['setSlipDetails'];
    final l$$__typename = json['__typename'];
    return MutationSetSlipInJar(
      setSlipDetails: l$setSlipDetails == null
          ? null
          : MutationSetSlipInJarsetSlipDetails.fromJson((l$setSlipDetails as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationSetSlipInJarsetSlipDetails? setSlipDetails;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$setSlipDetails = setSlipDetails;
    _resultData['setSlipDetails'] = l$setSlipDetails?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$setSlipDetails = setSlipDetails;
    final l$$__typename = $__typename;
    return Object.hashAll([l$setSlipDetails, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationSetSlipInJar || runtimeType != other.runtimeType) {
      return false;
    }
    final l$setSlipDetails = setSlipDetails;
    final lOther$setSlipDetails = other.setSlipDetails;
    if (l$setSlipDetails != lOther$setSlipDetails) {
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

const documentNodeMutationSetSlipInJar = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SetSlipInJar'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'inJar')),
          type: NamedTypeNode(name: NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'setSlipDetails'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'inJar'),
                value: VariableNode(name: NameNode(value: 'inJar')),
              ),
            ],
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
  ],
);
MutationSetSlipInJar _parserFnMutationSetSlipInJar(Map<String, dynamic> data) =>
    MutationSetSlipInJar.fromJson(data);
typedef OnMutationCompletedMutationSetSlipInJar = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationSetSlipInJar?,
);

class OptionsMutationSetSlipInJar extends graphql.MutationOptions<MutationSetSlipInJar> {
  OptionsMutationSetSlipInJar({
    String? operationName,
    required VariablesMutationSetSlipInJar variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetSlipInJar? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationSetSlipInJar? onCompleted,
    graphql.OnMutationUpdate<MutationSetSlipInJar>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetSlipInJar',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) =>
                   onCompleted(data, data == null ? null : _parserFnMutationSetSlipInJar(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationSetSlipInJar,
         parserFn: _parserFnMutationSetSlipInJar,
       );

  final OnMutationCompletedMutationSetSlipInJar? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationSetSlipInJar extends graphql.WatchQueryOptions<MutationSetSlipInJar> {
  WatchOptionsMutationSetSlipInJar({
    String? operationName,
    required VariablesMutationSetSlipInJar variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationSetSlipInJar? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'SetSlipInJar',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationSetSlipInJar,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationSetSlipInJar,
       );
}

extension ClientExtensionMutationSetSlipInJar on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationSetSlipInJar>> mutateSetSlipInJar(
    OptionsMutationSetSlipInJar options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationSetSlipInJar> watchMutationSetSlipInJar(
    WatchOptionsMutationSetSlipInJar options,
  ) => this.watchMutation(options);
}

class MutationSetSlipInJarsetSlipDetails {
  MutationSetSlipInJarsetSlipDetails({required this.id, this.$__typename = 'Slips'});

  factory MutationSetSlipInJarsetSlipDetails.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return MutationSetSlipInJarsetSlipDetails(
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
    if (other is! MutationSetSlipInJarsetSlipDetails || runtimeType != other.runtimeType) {
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
