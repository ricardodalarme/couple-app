// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationDeleteCouplePhoto {
  factory VariablesMutationDeleteCouplePhoto({required String coupleId}) =>
      VariablesMutationDeleteCouplePhoto._({r'coupleId': coupleId});

  VariablesMutationDeleteCouplePhoto._(this._$data);

  factory VariablesMutationDeleteCouplePhoto.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$coupleId = data['coupleId'];
    result$data['coupleId'] = (l$coupleId as String);
    return VariablesMutationDeleteCouplePhoto._(result$data);
  }

  Map<String, dynamic> _$data;

  String get coupleId => (_$data['coupleId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$coupleId = coupleId;
    result$data['coupleId'] = l$coupleId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationDeleteCouplePhoto || runtimeType != other.runtimeType) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$coupleId = coupleId;
    return Object.hashAll([l$coupleId]);
  }
}

class MutationDeleteCouplePhoto {
  MutationDeleteCouplePhoto({
    required this.deleteFromCouplePhotosCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationDeleteCouplePhoto.fromJson(Map<String, dynamic> json) {
    final l$deleteFromCouplePhotosCollection = json['deleteFromCouplePhotosCollection'];
    final l$$__typename = json['__typename'];
    return MutationDeleteCouplePhoto(
      deleteFromCouplePhotosCollection:
          MutationDeleteCouplePhotodeleteFromCouplePhotosCollection.fromJson(
            (l$deleteFromCouplePhotosCollection as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationDeleteCouplePhotodeleteFromCouplePhotosCollection deleteFromCouplePhotosCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFromCouplePhotosCollection = deleteFromCouplePhotosCollection;
    _resultData['deleteFromCouplePhotosCollection'] = l$deleteFromCouplePhotosCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFromCouplePhotosCollection = deleteFromCouplePhotosCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFromCouplePhotosCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationDeleteCouplePhoto || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFromCouplePhotosCollection = deleteFromCouplePhotosCollection;
    final lOther$deleteFromCouplePhotosCollection = other.deleteFromCouplePhotosCollection;
    if (l$deleteFromCouplePhotosCollection != lOther$deleteFromCouplePhotosCollection) {
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

const documentNodeMutationDeleteCouplePhoto = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteCouplePhoto'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'coupleId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteFromCouplePhotosCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'coupleId'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'eq'),
                            value: VariableNode(name: NameNode(value: 'coupleId')),
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
MutationDeleteCouplePhoto _parserFnMutationDeleteCouplePhoto(Map<String, dynamic> data) =>
    MutationDeleteCouplePhoto.fromJson(data);
typedef OnMutationCompletedMutationDeleteCouplePhoto = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationDeleteCouplePhoto?,
);

class OptionsMutationDeleteCouplePhoto extends graphql.MutationOptions<MutationDeleteCouplePhoto> {
  OptionsMutationDeleteCouplePhoto({
    String? operationName,
    required VariablesMutationDeleteCouplePhoto variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteCouplePhoto? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationDeleteCouplePhoto? onCompleted,
    graphql.OnMutationUpdate<MutationDeleteCouplePhoto>? update,
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
                 data == null ? null : _parserFnMutationDeleteCouplePhoto(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteCouplePhoto,
         parserFn: _parserFnMutationDeleteCouplePhoto,
       );

  final OnMutationCompletedMutationDeleteCouplePhoto? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationDeleteCouplePhoto
    extends graphql.WatchQueryOptions<MutationDeleteCouplePhoto> {
  WatchOptionsMutationDeleteCouplePhoto({
    String? operationName,
    required VariablesMutationDeleteCouplePhoto variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationDeleteCouplePhoto? typedOptimisticResult,
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
         document: documentNodeMutationDeleteCouplePhoto,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationDeleteCouplePhoto,
       );
}

extension ClientExtensionMutationDeleteCouplePhoto on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationDeleteCouplePhoto>> mutateDeleteCouplePhoto(
    OptionsMutationDeleteCouplePhoto options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationDeleteCouplePhoto> watchMutationDeleteCouplePhoto(
    WatchOptionsMutationDeleteCouplePhoto options,
  ) => this.watchMutation(options);
}

class MutationDeleteCouplePhotodeleteFromCouplePhotosCollection {
  MutationDeleteCouplePhotodeleteFromCouplePhotosCollection({
    required this.affectedCount,
    this.$__typename = 'CouplePhotosDeleteResponse',
  });

  factory MutationDeleteCouplePhotodeleteFromCouplePhotosCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationDeleteCouplePhotodeleteFromCouplePhotosCollection(
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
    if (other is! MutationDeleteCouplePhotodeleteFromCouplePhotosCollection ||
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
