// dart format width=100
import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesMutationInsertCouplePhoto {
  factory VariablesMutationInsertCouplePhoto({
    required String coupleId,
    required String storagePath,
    required String uploadedBy,
  }) => VariablesMutationInsertCouplePhoto._({
    r'coupleId': coupleId,
    r'storagePath': storagePath,
    r'uploadedBy': uploadedBy,
  });

  VariablesMutationInsertCouplePhoto._(this._$data);

  factory VariablesMutationInsertCouplePhoto.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$coupleId = data['coupleId'];
    result$data['coupleId'] = (l$coupleId as String);
    final l$storagePath = data['storagePath'];
    result$data['storagePath'] = (l$storagePath as String);
    final l$uploadedBy = data['uploadedBy'];
    result$data['uploadedBy'] = (l$uploadedBy as String);
    return VariablesMutationInsertCouplePhoto._(result$data);
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
    if (other is! VariablesMutationInsertCouplePhoto || runtimeType != other.runtimeType) {
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

class MutationInsertCouplePhoto {
  MutationInsertCouplePhoto({this.insertIntoCouplePhotosCollection, this.$__typename = 'Mutation'});

  factory MutationInsertCouplePhoto.fromJson(Map<String, dynamic> json) {
    final l$insertIntoCouplePhotosCollection = json['insertIntoCouplePhotosCollection'];
    final l$$__typename = json['__typename'];
    return MutationInsertCouplePhoto(
      insertIntoCouplePhotosCollection: l$insertIntoCouplePhotosCollection == null
          ? null
          : MutationInsertCouplePhotoinsertIntoCouplePhotosCollection.fromJson(
              (l$insertIntoCouplePhotosCollection as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final MutationInsertCouplePhotoinsertIntoCouplePhotosCollection? insertIntoCouplePhotosCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insertIntoCouplePhotosCollection = insertIntoCouplePhotosCollection;
    _resultData['insertIntoCouplePhotosCollection'] = l$insertIntoCouplePhotosCollection?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insertIntoCouplePhotosCollection = insertIntoCouplePhotosCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([l$insertIntoCouplePhotosCollection, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! MutationInsertCouplePhoto || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insertIntoCouplePhotosCollection = insertIntoCouplePhotosCollection;
    final lOther$insertIntoCouplePhotosCollection = other.insertIntoCouplePhotosCollection;
    if (l$insertIntoCouplePhotosCollection != lOther$insertIntoCouplePhotosCollection) {
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

const documentNodeMutationInsertCouplePhoto = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'InsertCouplePhoto'),
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
            name: NameNode(value: 'insertIntoCouplePhotosCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'coupleId'),
                          value: VariableNode(name: NameNode(value: 'coupleId')),
                        ),
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
MutationInsertCouplePhoto _parserFnMutationInsertCouplePhoto(Map<String, dynamic> data) =>
    MutationInsertCouplePhoto.fromJson(data);
typedef OnMutationCompletedMutationInsertCouplePhoto = FutureOr<void> Function(
  Map<String, dynamic>?,
  MutationInsertCouplePhoto?,
);

class OptionsMutationInsertCouplePhoto extends graphql.MutationOptions<MutationInsertCouplePhoto> {
  OptionsMutationInsertCouplePhoto({
    String? operationName,
    required VariablesMutationInsertCouplePhoto variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertCouplePhoto? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompletedMutationInsertCouplePhoto? onCompleted,
    graphql.OnMutationUpdate<MutationInsertCouplePhoto>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName ?? 'InsertCouplePhoto',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFnMutationInsertCouplePhoto(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationInsertCouplePhoto,
         parserFn: _parserFnMutationInsertCouplePhoto,
       );

  final OnMutationCompletedMutationInsertCouplePhoto? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptionsMutationInsertCouplePhoto
    extends graphql.WatchQueryOptions<MutationInsertCouplePhoto> {
  WatchOptionsMutationInsertCouplePhoto({
    String? operationName,
    required VariablesMutationInsertCouplePhoto variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    MutationInsertCouplePhoto? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName ?? 'InsertCouplePhoto',
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationInsertCouplePhoto,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnMutationInsertCouplePhoto,
       );
}

extension ClientExtensionMutationInsertCouplePhoto on graphql.GraphQLClient {
  Future<graphql.QueryResult<MutationInsertCouplePhoto>> mutateInsertCouplePhoto(
    OptionsMutationInsertCouplePhoto options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<MutationInsertCouplePhoto> watchMutationInsertCouplePhoto(
    WatchOptionsMutationInsertCouplePhoto options,
  ) => this.watchMutation(options);
}

class MutationInsertCouplePhotoinsertIntoCouplePhotosCollection {
  MutationInsertCouplePhotoinsertIntoCouplePhotosCollection({
    required this.affectedCount,
    this.$__typename = 'CouplePhotosInsertResponse',
  });

  factory MutationInsertCouplePhotoinsertIntoCouplePhotosCollection.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affectedCount = json['affectedCount'];
    final l$$__typename = json['__typename'];
    return MutationInsertCouplePhotoinsertIntoCouplePhotosCollection(
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
    if (other is! MutationInsertCouplePhotoinsertIntoCouplePhotosCollection ||
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
