// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationUpsertCouplePhoto {
  factory VariablesMutationUpsertCouplePhoto({
    required String coupleId,
    required String storagePath,
    required String uploadedBy,
  }) => VariablesMutationUpsertCouplePhoto._({
    r'coupleId': coupleId,
    r'storagePath': storagePath,
    r'uploadedBy': uploadedBy,
  });

  VariablesMutationUpsertCouplePhoto._(this._$data);

  factory VariablesMutationUpsertCouplePhoto.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$coupleId = data['coupleId'];
    result$data['coupleId'] = (l$coupleId as String);
    final l$storagePath = data['storagePath'];
    result$data['storagePath'] = (l$storagePath as String);
    final l$uploadedBy = data['uploadedBy'];
    result$data['uploadedBy'] = (l$uploadedBy as String);
    return VariablesMutationUpsertCouplePhoto._(result$data);
  }

  Map<String, dynamic> _$data;

  String get coupleId => (_$data['coupleId'] as String);

  String get storagePath => (_$data['storagePath'] as String);

  String get uploadedBy => (_$data['uploadedBy'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$coupleId = coupleId;
    result$data['coupleId'] = l$coupleId;
    final l$storagePath = storagePath;
    result$data['storagePath'] = l$storagePath;
    final l$uploadedBy = uploadedBy;
    result$data['uploadedBy'] = l$uploadedBy;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesMutationUpsertCouplePhoto || runtimeType != other.runtimeType) {
      return false;
    }
    final l$coupleId = coupleId;
    final lOther$coupleId = other.coupleId;
    if (l$coupleId != lOther$coupleId) {
      return false;
    }
    final l$storagePath = storagePath;
    final lOther$storagePath = other.storagePath;
    if (l$storagePath != lOther$storagePath) {
      return false;
    }
    final l$uploadedBy = uploadedBy;
    final lOther$uploadedBy = other.uploadedBy;
    if (l$uploadedBy != lOther$uploadedBy) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$coupleId = coupleId;
    final l$storagePath = storagePath;
    final l$uploadedBy = uploadedBy;
    return Object.hashAll([l$coupleId, l$storagePath, l$uploadedBy]);
  }
}

class MutationUpsertCouplePhoto {
  MutationUpsertCouplePhoto({
    required this.updateCouplePhotosCollection,
    this.$__typename = 'Mutation',
  });

  factory MutationUpsertCouplePhoto.fromJson(Map<String, dynamic> json) {
    final l$updateCouplePhotosCollection = json['updateCouplePhotosCollection'];
    final l$$__typename = json['__typename'];
    return MutationUpsertCouplePhoto(
      updateCouplePhotosCollection: MutationUpsertCouplePhotoupdateCouplePhotosCollection.fromJson(
        (l$updateCouplePhotosCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationUpsertCouplePhotoupdateCouplePhotosCollection updateCouplePhotosCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateCouplePhotosCollection = updateCouplePhotosCollection;
    _resultData['updateCouplePhotosCollection'] = l$updateCouplePhotosCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateCouplePhotosCollection = updateCouplePhotosCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateCouplePhotosCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationUpsertCouplePhoto || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateCouplePhotosCollection = updateCouplePhotosCollection;
    final lOther$updateCouplePhotosCollection = other.updateCouplePhotosCollection;
    if (l$updateCouplePhotosCollection != lOther$updateCouplePhotosCollection) {
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

const documentNodeMutationUpsertCouplePhoto = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpsertCouplePhoto'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'coupleId')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'storagePath')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'uploadedBy')),
          type: NamedTypeNode(name: NameNode(value: 'UUID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateCouplePhotosCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'storagePath'),
                      value: VariableNode(name: NameNode(value: 'storagePath')),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'uploadedBy'),
                      value: VariableNode(name: NameNode(value: 'uploadedBy')),
                    ),
                  ],
                ),
              ),
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
MutationUpsertCouplePhoto _parserFnMutationUpsertCouplePhoto(Map<String, dynamic> data) =>
    MutationUpsertCouplePhoto.fromJson(data);
typedef OnMutationCompletedMutationUpsertCouplePhoto = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationUpsertCouplePhoto?,
);

class OptionsMutationUpsertCouplePhoto extends graphql.MutationOptions<MutationUpsertCouplePhoto> {
  OptionsMutationUpsertCouplePhoto({
    String? operationName,
    required VariablesMutationUpsertCouplePhoto variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpsertCouplePhoto? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationUpsertCouplePhoto? onCompleted,
    graphql.OnMutationUpdate<MutationUpsertCouplePhoto>? update,
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
                 data == null ? null : _parserFnMutationUpsertCouplePhoto(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpsertCouplePhoto,
         parserFn: _parserFnMutationUpsertCouplePhoto,
       );

  final OnMutationCompletedMutationUpsertCouplePhoto? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationUpsertCouplePhoto
    extends graphql.WatchQueryOptions<MutationUpsertCouplePhoto> {
  WatchOptionsMutationUpsertCouplePhoto({
    String? operationName,
    required VariablesMutationUpsertCouplePhoto variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationUpsertCouplePhoto? typedOptimisticResult,
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
         document: documentNodeMutationUpsertCouplePhoto,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationUpsertCouplePhoto,
       );
}

extension ClientExtensionMutationUpsertCouplePhoto on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationUpsertCouplePhoto>> mutateUpsertCouplePhoto(
    OptionsMutationUpsertCouplePhoto options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationUpsertCouplePhoto> watchMutationUpsertCouplePhoto(
    WatchOptionsMutationUpsertCouplePhoto options,
  ) => this.watchMutation(options);
}

class MutationUpsertCouplePhotoupdateCouplePhotosCollection {
  MutationUpsertCouplePhotoupdateCouplePhotosCollection({
    required this.affectedCount,
    this.$__typename = 'CouplePhotosUpdateResponse',
  });

  factory MutationUpsertCouplePhotoupdateCouplePhotosCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationUpsertCouplePhotoupdateCouplePhotosCollection(
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
    if (other is! MutationUpsertCouplePhotoupdateCouplePhotosCollection ||
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
