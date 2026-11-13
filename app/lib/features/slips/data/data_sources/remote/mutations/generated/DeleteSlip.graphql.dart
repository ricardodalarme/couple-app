// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteSlip {
  factory VariablesMutationDeleteSlip({required String id}) =>
      VariablesMutationDeleteSlip._({r'id': id});

  VariablesMutationDeleteSlip._(this._$data);

  factory VariablesMutationDeleteSlip.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return VariablesMutationDeleteSlip._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationDeleteSlip || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

class MutationDeleteSlip {
  MutationDeleteSlip({this.deleteSlip, this.$__typename = 'Mutation'});

  factory MutationDeleteSlip.fromJson(Map<String, dynamic> json) {
    final l$deleteSlip = json['deleteSlip'];
    final l$$__typename = json['__typename'];
    return MutationDeleteSlip(
      deleteSlip: (l$deleteSlip as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deleteSlip;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteSlip = deleteSlip;
    _resultData['deleteSlip'] = l$deleteSlip;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteSlip = deleteSlip;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteSlip, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteSlip || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteSlip = deleteSlip;
    final lOther$deleteSlip = other.deleteSlip;
    if (l$deleteSlip != lOther$deleteSlip) {
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

const documentNodeMutationDeleteSlip = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteSlip'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteSlip'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
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
  ],
);
MutationDeleteSlip _parserFnMutationDeleteSlip(Map<String, dynamic> data) =>
    MutationDeleteSlip.fromJson(data);
typedef OnMutationCompletedMutationDeleteSlip = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteSlip?,
);

class OptionsMutationDeleteSlip extends graphql.MutationOptions<MutationDeleteSlip> {
  OptionsMutationDeleteSlip({
    String? operationName,
    required VariablesMutationDeleteSlip variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteSlip? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteSlip? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteSlip>? update,
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
             : (data) => onCompleted(data, data == null ? null : _parserFnMutationDeleteSlip(data)),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteSlip,
         parserFn: _parserFnMutationDeleteSlip,
       );

  final OnMutationCompletedMutationDeleteSlip? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteSlip extends graphql.WatchQueryOptions<MutationDeleteSlip> {
  WatchOptionsMutationDeleteSlip({
    String? operationName,
    required VariablesMutationDeleteSlip variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteSlip? typedOptimisticResult,
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
         document: documentNodeMutationDeleteSlip,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteSlip,
       );
}

extension ClientExtensionMutationDeleteSlip on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteSlip>> mutateDeleteSlip(
    OptionsMutationDeleteSlip options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteSlip> watchMutationDeleteSlip(
    WatchOptionsMutationDeleteSlip options,
  ) => this.watchMutation(options);
}
