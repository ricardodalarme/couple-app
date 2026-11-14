// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class QueryWidgetOverview {
  QueryWidgetOverview({
    this.widget,
    this.today,
    this.mySettings,
    this.idea,
    required this.ritualsCollection,
    required this.moodsCollection,
    this.$__typename = 'Query',
  });

  factory QueryWidgetOverview.fromJson(Map<String, dynamic> json) {
    final l$widget = json['widget'];
    final l$today = json['today'];
    final l$mySettings = json['mySettings'];
    final l$idea = json['idea'];
    final l$ritualsCollection = json['ritualsCollection'];
    final l$moodsCollection = json['moodsCollection'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverview(
      widget: l$widget == null
          ? null
          : QueryWidgetOverviewwidget.fromJson((l$widget as Map<String, dynamic>)),
      today: l$today == null
          ? null
          : QueryWidgetOverviewtoday.fromJson((l$today as Map<String, dynamic>)),
      mySettings: l$mySettings == null
          ? null
          : QueryWidgetOverviewmySettings.fromJson((l$mySettings as Map<String, dynamic>)),
      idea: l$idea == null
          ? null
          : QueryWidgetOverviewidea.fromJson((l$idea as Map<String, dynamic>)),
      ritualsCollection: QueryWidgetOverviewritualsCollection.fromJson(
        (l$ritualsCollection as Map<String, dynamic>),
      ),
      moodsCollection: QueryWidgetOverviewmoodsCollection.fromJson(
        (l$moodsCollection as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryWidgetOverviewwidget? widget;

  final QueryWidgetOverviewtoday? today;

  final QueryWidgetOverviewmySettings? mySettings;

  final QueryWidgetOverviewidea? idea;

  final QueryWidgetOverviewritualsCollection ritualsCollection;

  final QueryWidgetOverviewmoodsCollection moodsCollection;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$widget = widget;
    _resultData['widget'] = l$widget?.toJson();
    final l$today = today;
    _resultData['today'] = l$today?.toJson();
    final l$mySettings = mySettings;
    _resultData['mySettings'] = l$mySettings?.toJson();
    final l$idea = idea;
    _resultData['idea'] = l$idea?.toJson();
    final l$ritualsCollection = ritualsCollection;
    _resultData['ritualsCollection'] = l$ritualsCollection.toJson();
    final l$moodsCollection = moodsCollection;
    _resultData['moodsCollection'] = l$moodsCollection.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$widget = widget;
    final l$today = today;
    final l$mySettings = mySettings;
    final l$idea = idea;
    final l$ritualsCollection = ritualsCollection;
    final l$moodsCollection = moodsCollection;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$widget,
      l$today,
      l$mySettings,
      l$idea,
      l$ritualsCollection,
      l$moodsCollection,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverview || runtimeType != other.runtimeType) {
      return false;
    }
    final l$widget = widget;
    final lOther$widget = other.widget;
    if (l$widget != lOther$widget) {
      return false;
    }
    final l$today = today;
    final lOther$today = other.today;
    if (l$today != lOther$today) {
      return false;
    }
    final l$mySettings = mySettings;
    final lOther$mySettings = other.mySettings;
    if (l$mySettings != lOther$mySettings) {
      return false;
    }
    final l$idea = idea;
    final lOther$idea = other.idea;
    if (l$idea != lOther$idea) {
      return false;
    }
    final l$ritualsCollection = ritualsCollection;
    final lOther$ritualsCollection = other.ritualsCollection;
    if (l$ritualsCollection != lOther$ritualsCollection) {
      return false;
    }
    final l$moodsCollection = moodsCollection;
    final lOther$moodsCollection = other.moodsCollection;
    if (l$moodsCollection != lOther$moodsCollection) {
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

const documentNodeQueryWidgetOverview = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'WidgetOverview'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'widget'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'nodeId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'profileId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'discreet'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'isPaired'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'togetherSince'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'partnerName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'nextDateTitle'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'nextDateOn'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'unopenedCards'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'pauseReturnAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'partnerNote'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'partnerNoteMedia'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'partnerNoteAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'partnerMood'),
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
            name: NameNode(value: 'today'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'nodeId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'isPaired'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'localDate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cardId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cardStatus'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'unopenedCards'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'slipsThisWeek'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'slipsTotal'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'suggestionKey'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'togetherSince'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'hasPlus'),
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
            name: NameNode(value: 'mySettings'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'nodeId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'profileId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'phase'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'togetherSince'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'widgetAllowPartnerNotes'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'widgetOnLockScreen'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'widgetInDiscreet'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'widgetShowNames'),
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
            name: NameNode(value: 'dailyContent'),
            alias: NameNode(value: 'idea'),
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'kind'),
                value: StringValueNode(value: 'daily_idea', isBlock: false),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'slug'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'body'),
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
            name: NameNode(value: 'ritualsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'archivedAt'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'is'),
                            value: EnumValueNode(name: NameNode(value: 'NULL')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'createdAt'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '1'),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'node'),
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
                              name: NameNode(value: 'title'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'cadence'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'weekday'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'atTime'),
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
          FieldNode(
            name: NameNode(value: 'moodsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '1'),
              ),
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'day'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
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
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'node'),
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
                              name: NameNode(value: 'day'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'mood'),
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
QueryWidgetOverview _parserFnQueryWidgetOverview(Map<String, dynamic> data) =>
    QueryWidgetOverview.fromJson(data);
typedef OnQueryCompleteQueryWidgetOverview = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryWidgetOverview?,
);

class OptionsQueryWidgetOverview extends graphql.QueryOptions<QueryWidgetOverview> {
  OptionsQueryWidgetOverview({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryWidgetOverview? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryWidgetOverview? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(data, data == null ? null : _parserFnQueryWidgetOverview(data)),
         onError: onError,
         document: documentNodeQueryWidgetOverview,
         parserFn: _parserFnQueryWidgetOverview,
       );

  final OnQueryCompleteQueryWidgetOverview? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryWidgetOverview extends graphql.WatchQueryOptions<QueryWidgetOverview> {
  WatchOptionsQueryWidgetOverview({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryWidgetOverview? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryWidgetOverview,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryWidgetOverview,
       );
}

class FetchMoreOptionsQueryWidgetOverview extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryWidgetOverview({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryWidgetOverview);
}

extension ClientExtensionQueryWidgetOverview on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryWidgetOverview>> queryWidgetOverview([
    OptionsQueryWidgetOverview? options,
  ]) async => await this.query(options ?? OptionsQueryWidgetOverview());

  graphql.ObservableQuery<QueryWidgetOverview> watchQueryWidgetOverview([
    WatchOptionsQueryWidgetOverview? options,
  ]) => this.watchQuery(options ?? WatchOptionsQueryWidgetOverview());

  void writeQueryWidgetOverview({required QueryWidgetOverview data, bool broadcast = true}) =>
      this.writeQuery(
        graphql.Request(operation: graphql.Operation(document: documentNodeQueryWidgetOverview)),
        data: data.toJson(),
        broadcast: broadcast,
      );

  QueryWidgetOverview? readQueryWidgetOverview({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(operation: graphql.Operation(document: documentNodeQueryWidgetOverview)),
      optimistic: optimistic,
    );
    return result == null ? null : QueryWidgetOverview.fromJson(result);
  }
}

class QueryWidgetOverviewwidget {
  QueryWidgetOverviewwidget({
    required this.nodeId,
    this.profileId,
    this.discreet,
    this.isPaired,
    this.togetherSince,
    this.partnerName,
    this.nextDateTitle,
    this.nextDateOn,
    this.unopenedCards,
    this.pauseReturnAt,
    this.partnerNote,
    this.partnerNoteMedia,
    this.partnerNoteAt,
    this.partnerMood,
    this.$__typename = 'WidgetState',
  });

  factory QueryWidgetOverviewwidget.fromJson(Map<String, dynamic> json) {
    final l$nodeId = json['nodeId'];
    final l$profileId = json['profileId'];
    final l$discreet = json['discreet'];
    final l$isPaired = json['isPaired'];
    final l$togetherSince = json['togetherSince'];
    final l$partnerName = json['partnerName'];
    final l$nextDateTitle = json['nextDateTitle'];
    final l$nextDateOn = json['nextDateOn'];
    final l$unopenedCards = json['unopenedCards'];
    final l$pauseReturnAt = json['pauseReturnAt'];
    final l$partnerNote = json['partnerNote'];
    final l$partnerNoteMedia = json['partnerNoteMedia'];
    final l$partnerNoteAt = json['partnerNoteAt'];
    final l$partnerMood = json['partnerMood'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverviewwidget(
      nodeId: (l$nodeId as String),
      profileId: (l$profileId as String?),
      discreet: (l$discreet as bool?),
      isPaired: (l$isPaired as bool?),
      togetherSince: l$togetherSince == null ? null : DateTime.parse((l$togetherSince as String)),
      partnerName: (l$partnerName as String?),
      nextDateTitle: (l$nextDateTitle as String?),
      nextDateOn: l$nextDateOn == null ? null : DateTime.parse((l$nextDateOn as String)),
      unopenedCards: (l$unopenedCards as int?),
      pauseReturnAt: l$pauseReturnAt == null ? null : DateTime.parse((l$pauseReturnAt as String)),
      partnerNote: (l$partnerNote as String?),
      partnerNoteMedia: (l$partnerNoteMedia as String?),
      partnerNoteAt: l$partnerNoteAt == null ? null : DateTime.parse((l$partnerNoteAt as String)),
      partnerMood: (l$partnerMood as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String nodeId;

  final String? profileId;

  final bool? discreet;

  final bool? isPaired;

  final DateTime? togetherSince;

  final String? partnerName;

  final String? nextDateTitle;

  final DateTime? nextDateOn;

  final int? unopenedCards;

  final DateTime? pauseReturnAt;

  final String? partnerNote;

  final String? partnerNoteMedia;

  final DateTime? partnerNoteAt;

  final String? partnerMood;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$nodeId = nodeId;
    _resultData['nodeId'] = l$nodeId;
    final l$profileId = profileId;
    _resultData['profileId'] = l$profileId;
    final l$discreet = discreet;
    _resultData['discreet'] = l$discreet;
    final l$isPaired = isPaired;
    _resultData['isPaired'] = l$isPaired;
    final l$togetherSince = togetherSince;
    _resultData['togetherSince'] = l$togetherSince == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$togetherSince);
    final l$partnerName = partnerName;
    _resultData['partnerName'] = l$partnerName;
    final l$nextDateTitle = nextDateTitle;
    _resultData['nextDateTitle'] = l$nextDateTitle;
    final l$nextDateOn = nextDateOn;
    _resultData['nextDateOn'] = l$nextDateOn == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$nextDateOn);
    final l$unopenedCards = unopenedCards;
    _resultData['unopenedCards'] = l$unopenedCards;
    final l$pauseReturnAt = pauseReturnAt;
    _resultData['pauseReturnAt'] = l$pauseReturnAt == null
        ? null
        : ((v) => v.toUtc().toIso8601String())(l$pauseReturnAt);
    final l$partnerNote = partnerNote;
    _resultData['partnerNote'] = l$partnerNote;
    final l$partnerNoteMedia = partnerNoteMedia;
    _resultData['partnerNoteMedia'] = l$partnerNoteMedia;
    final l$partnerNoteAt = partnerNoteAt;
    _resultData['partnerNoteAt'] = l$partnerNoteAt == null
        ? null
        : ((v) => v.toUtc().toIso8601String())(l$partnerNoteAt);
    final l$partnerMood = partnerMood;
    _resultData['partnerMood'] = l$partnerMood;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$nodeId = nodeId;
    final l$profileId = profileId;
    final l$discreet = discreet;
    final l$isPaired = isPaired;
    final l$togetherSince = togetherSince;
    final l$partnerName = partnerName;
    final l$nextDateTitle = nextDateTitle;
    final l$nextDateOn = nextDateOn;
    final l$unopenedCards = unopenedCards;
    final l$pauseReturnAt = pauseReturnAt;
    final l$partnerNote = partnerNote;
    final l$partnerNoteMedia = partnerNoteMedia;
    final l$partnerNoteAt = partnerNoteAt;
    final l$partnerMood = partnerMood;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$nodeId,
      l$profileId,
      l$discreet,
      l$isPaired,
      l$togetherSince,
      l$partnerName,
      l$nextDateTitle,
      l$nextDateOn,
      l$unopenedCards,
      l$pauseReturnAt,
      l$partnerNote,
      l$partnerNoteMedia,
      l$partnerNoteAt,
      l$partnerMood,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverviewwidget || runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodeId = nodeId;
    final lOther$nodeId = other.nodeId;
    if (l$nodeId != lOther$nodeId) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$discreet = discreet;
    final lOther$discreet = other.discreet;
    if (l$discreet != lOther$discreet) {
      return false;
    }
    final l$isPaired = isPaired;
    final lOther$isPaired = other.isPaired;
    if (l$isPaired != lOther$isPaired) {
      return false;
    }
    final l$togetherSince = togetherSince;
    final lOther$togetherSince = other.togetherSince;
    if (l$togetherSince != lOther$togetherSince) {
      return false;
    }
    final l$partnerName = partnerName;
    final lOther$partnerName = other.partnerName;
    if (l$partnerName != lOther$partnerName) {
      return false;
    }
    final l$nextDateTitle = nextDateTitle;
    final lOther$nextDateTitle = other.nextDateTitle;
    if (l$nextDateTitle != lOther$nextDateTitle) {
      return false;
    }
    final l$nextDateOn = nextDateOn;
    final lOther$nextDateOn = other.nextDateOn;
    if (l$nextDateOn != lOther$nextDateOn) {
      return false;
    }
    final l$unopenedCards = unopenedCards;
    final lOther$unopenedCards = other.unopenedCards;
    if (l$unopenedCards != lOther$unopenedCards) {
      return false;
    }
    final l$pauseReturnAt = pauseReturnAt;
    final lOther$pauseReturnAt = other.pauseReturnAt;
    if (l$pauseReturnAt != lOther$pauseReturnAt) {
      return false;
    }
    final l$partnerNote = partnerNote;
    final lOther$partnerNote = other.partnerNote;
    if (l$partnerNote != lOther$partnerNote) {
      return false;
    }
    final l$partnerNoteMedia = partnerNoteMedia;
    final lOther$partnerNoteMedia = other.partnerNoteMedia;
    if (l$partnerNoteMedia != lOther$partnerNoteMedia) {
      return false;
    }
    final l$partnerNoteAt = partnerNoteAt;
    final lOther$partnerNoteAt = other.partnerNoteAt;
    if (l$partnerNoteAt != lOther$partnerNoteAt) {
      return false;
    }
    final l$partnerMood = partnerMood;
    final lOther$partnerMood = other.partnerMood;
    if (l$partnerMood != lOther$partnerMood) {
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

class QueryWidgetOverviewtoday {
  QueryWidgetOverviewtoday({
    required this.nodeId,
    this.isPaired,
    this.localDate,
    this.cardId,
    this.cardStatus,
    this.unopenedCards,
    this.slipsThisWeek,
    this.slipsTotal,
    this.suggestionKey,
    this.togetherSince,
    this.hasPlus,
    this.$__typename = 'TodayState',
  });

  factory QueryWidgetOverviewtoday.fromJson(Map<String, dynamic> json) {
    final l$nodeId = json['nodeId'];
    final l$isPaired = json['isPaired'];
    final l$localDate = json['localDate'];
    final l$cardId = json['cardId'];
    final l$cardStatus = json['cardStatus'];
    final l$unopenedCards = json['unopenedCards'];
    final l$slipsThisWeek = json['slipsThisWeek'];
    final l$slipsTotal = json['slipsTotal'];
    final l$suggestionKey = json['suggestionKey'];
    final l$togetherSince = json['togetherSince'];
    final l$hasPlus = json['hasPlus'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverviewtoday(
      nodeId: (l$nodeId as String),
      isPaired: (l$isPaired as bool?),
      localDate: l$localDate == null ? null : DateTime.parse((l$localDate as String)),
      cardId: (l$cardId as String?),
      cardStatus: (l$cardStatus as String?),
      unopenedCards: (l$unopenedCards as int?),
      slipsThisWeek: (l$slipsThisWeek as int?),
      slipsTotal: (l$slipsTotal as int?),
      suggestionKey: (l$suggestionKey as String?),
      togetherSince: l$togetherSince == null ? null : DateTime.parse((l$togetherSince as String)),
      hasPlus: (l$hasPlus as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String nodeId;

  final bool? isPaired;

  final DateTime? localDate;

  final String? cardId;

  final String? cardStatus;

  final int? unopenedCards;

  final int? slipsThisWeek;

  final int? slipsTotal;

  final String? suggestionKey;

  final DateTime? togetherSince;

  final bool? hasPlus;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$nodeId = nodeId;
    _resultData['nodeId'] = l$nodeId;
    final l$isPaired = isPaired;
    _resultData['isPaired'] = l$isPaired;
    final l$localDate = localDate;
    _resultData['localDate'] = l$localDate == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$localDate);
    final l$cardId = cardId;
    _resultData['cardId'] = l$cardId;
    final l$cardStatus = cardStatus;
    _resultData['cardStatus'] = l$cardStatus;
    final l$unopenedCards = unopenedCards;
    _resultData['unopenedCards'] = l$unopenedCards;
    final l$slipsThisWeek = slipsThisWeek;
    _resultData['slipsThisWeek'] = l$slipsThisWeek;
    final l$slipsTotal = slipsTotal;
    _resultData['slipsTotal'] = l$slipsTotal;
    final l$suggestionKey = suggestionKey;
    _resultData['suggestionKey'] = l$suggestionKey;
    final l$togetherSince = togetherSince;
    _resultData['togetherSince'] = l$togetherSince == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$togetherSince);
    final l$hasPlus = hasPlus;
    _resultData['hasPlus'] = l$hasPlus;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$nodeId = nodeId;
    final l$isPaired = isPaired;
    final l$localDate = localDate;
    final l$cardId = cardId;
    final l$cardStatus = cardStatus;
    final l$unopenedCards = unopenedCards;
    final l$slipsThisWeek = slipsThisWeek;
    final l$slipsTotal = slipsTotal;
    final l$suggestionKey = suggestionKey;
    final l$togetherSince = togetherSince;
    final l$hasPlus = hasPlus;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$nodeId,
      l$isPaired,
      l$localDate,
      l$cardId,
      l$cardStatus,
      l$unopenedCards,
      l$slipsThisWeek,
      l$slipsTotal,
      l$suggestionKey,
      l$togetherSince,
      l$hasPlus,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverviewtoday || runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodeId = nodeId;
    final lOther$nodeId = other.nodeId;
    if (l$nodeId != lOther$nodeId) {
      return false;
    }
    final l$isPaired = isPaired;
    final lOther$isPaired = other.isPaired;
    if (l$isPaired != lOther$isPaired) {
      return false;
    }
    final l$localDate = localDate;
    final lOther$localDate = other.localDate;
    if (l$localDate != lOther$localDate) {
      return false;
    }
    final l$cardId = cardId;
    final lOther$cardId = other.cardId;
    if (l$cardId != lOther$cardId) {
      return false;
    }
    final l$cardStatus = cardStatus;
    final lOther$cardStatus = other.cardStatus;
    if (l$cardStatus != lOther$cardStatus) {
      return false;
    }
    final l$unopenedCards = unopenedCards;
    final lOther$unopenedCards = other.unopenedCards;
    if (l$unopenedCards != lOther$unopenedCards) {
      return false;
    }
    final l$slipsThisWeek = slipsThisWeek;
    final lOther$slipsThisWeek = other.slipsThisWeek;
    if (l$slipsThisWeek != lOther$slipsThisWeek) {
      return false;
    }
    final l$slipsTotal = slipsTotal;
    final lOther$slipsTotal = other.slipsTotal;
    if (l$slipsTotal != lOther$slipsTotal) {
      return false;
    }
    final l$suggestionKey = suggestionKey;
    final lOther$suggestionKey = other.suggestionKey;
    if (l$suggestionKey != lOther$suggestionKey) {
      return false;
    }
    final l$togetherSince = togetherSince;
    final lOther$togetherSince = other.togetherSince;
    if (l$togetherSince != lOther$togetherSince) {
      return false;
    }
    final l$hasPlus = hasPlus;
    final lOther$hasPlus = other.hasPlus;
    if (l$hasPlus != lOther$hasPlus) {
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

class QueryWidgetOverviewmySettings {
  QueryWidgetOverviewmySettings({
    required this.nodeId,
    required this.profileId,
    this.phase,
    this.togetherSince,
    required this.widgetAllowPartnerNotes,
    required this.widgetOnLockScreen,
    required this.widgetInDiscreet,
    required this.widgetShowNames,
    this.$__typename = 'ProfileSettings',
  });

  factory QueryWidgetOverviewmySettings.fromJson(Map<String, dynamic> json) {
    final l$nodeId = json['nodeId'];
    final l$profileId = json['profileId'];
    final l$phase = json['phase'];
    final l$togetherSince = json['togetherSince'];
    final l$widgetAllowPartnerNotes = json['widgetAllowPartnerNotes'];
    final l$widgetOnLockScreen = json['widgetOnLockScreen'];
    final l$widgetInDiscreet = json['widgetInDiscreet'];
    final l$widgetShowNames = json['widgetShowNames'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverviewmySettings(
      nodeId: (l$nodeId as String),
      profileId: (l$profileId as String),
      phase: l$phase == null ? null : fromJsonEnumRelationshipPhase((l$phase as String)),
      togetherSince: l$togetherSince == null ? null : DateTime.parse((l$togetherSince as String)),
      widgetAllowPartnerNotes: (l$widgetAllowPartnerNotes as bool),
      widgetOnLockScreen: (l$widgetOnLockScreen as bool),
      widgetInDiscreet: (l$widgetInDiscreet as bool),
      widgetShowNames: (l$widgetShowNames as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String nodeId;

  final String profileId;

  final EnumRelationshipPhase? phase;

  final DateTime? togetherSince;

  final bool widgetAllowPartnerNotes;

  final bool widgetOnLockScreen;

  final bool widgetInDiscreet;

  final bool widgetShowNames;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$nodeId = nodeId;
    _resultData['nodeId'] = l$nodeId;
    final l$profileId = profileId;
    _resultData['profileId'] = l$profileId;
    final l$phase = phase;
    _resultData['phase'] = l$phase == null ? null : toJsonEnumRelationshipPhase(l$phase);
    final l$togetherSince = togetherSince;
    _resultData['togetherSince'] = l$togetherSince == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$togetherSince);
    final l$widgetAllowPartnerNotes = widgetAllowPartnerNotes;
    _resultData['widgetAllowPartnerNotes'] = l$widgetAllowPartnerNotes;
    final l$widgetOnLockScreen = widgetOnLockScreen;
    _resultData['widgetOnLockScreen'] = l$widgetOnLockScreen;
    final l$widgetInDiscreet = widgetInDiscreet;
    _resultData['widgetInDiscreet'] = l$widgetInDiscreet;
    final l$widgetShowNames = widgetShowNames;
    _resultData['widgetShowNames'] = l$widgetShowNames;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$nodeId = nodeId;
    final l$profileId = profileId;
    final l$phase = phase;
    final l$togetherSince = togetherSince;
    final l$widgetAllowPartnerNotes = widgetAllowPartnerNotes;
    final l$widgetOnLockScreen = widgetOnLockScreen;
    final l$widgetInDiscreet = widgetInDiscreet;
    final l$widgetShowNames = widgetShowNames;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$nodeId,
      l$profileId,
      l$phase,
      l$togetherSince,
      l$widgetAllowPartnerNotes,
      l$widgetOnLockScreen,
      l$widgetInDiscreet,
      l$widgetShowNames,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverviewmySettings || runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodeId = nodeId;
    final lOther$nodeId = other.nodeId;
    if (l$nodeId != lOther$nodeId) {
      return false;
    }
    final l$profileId = profileId;
    final lOther$profileId = other.profileId;
    if (l$profileId != lOther$profileId) {
      return false;
    }
    final l$phase = phase;
    final lOther$phase = other.phase;
    if (l$phase != lOther$phase) {
      return false;
    }
    final l$togetherSince = togetherSince;
    final lOther$togetherSince = other.togetherSince;
    if (l$togetherSince != lOther$togetherSince) {
      return false;
    }
    final l$widgetAllowPartnerNotes = widgetAllowPartnerNotes;
    final lOther$widgetAllowPartnerNotes = other.widgetAllowPartnerNotes;
    if (l$widgetAllowPartnerNotes != lOther$widgetAllowPartnerNotes) {
      return false;
    }
    final l$widgetOnLockScreen = widgetOnLockScreen;
    final lOther$widgetOnLockScreen = other.widgetOnLockScreen;
    if (l$widgetOnLockScreen != lOther$widgetOnLockScreen) {
      return false;
    }
    final l$widgetInDiscreet = widgetInDiscreet;
    final lOther$widgetInDiscreet = other.widgetInDiscreet;
    if (l$widgetInDiscreet != lOther$widgetInDiscreet) {
      return false;
    }
    final l$widgetShowNames = widgetShowNames;
    final lOther$widgetShowNames = other.widgetShowNames;
    if (l$widgetShowNames != lOther$widgetShowNames) {
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

class QueryWidgetOverviewidea {
  QueryWidgetOverviewidea({
    required this.slug,
    required this.title,
    this.body,
    this.$__typename = 'ContentItems',
  });

  factory QueryWidgetOverviewidea.fromJson(Map<String, dynamic> json) {
    final l$slug = json['slug'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverviewidea(
      slug: (l$slug as String),
      title: (l$title as String),
      body: (l$body as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String slug;

  final String title;

  final String? body;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$slug = slug;
    _resultData['slug'] = l$slug;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$slug = slug;
    final l$title = title;
    final l$body = body;
    final l$$__typename = $__typename;
    return Object.hashAll([l$slug, l$title, l$body, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverviewidea || runtimeType != other.runtimeType) {
      return false;
    }
    final l$slug = slug;
    final lOther$slug = other.slug;
    if (l$slug != lOther$slug) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
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

class QueryWidgetOverviewritualsCollection {
  QueryWidgetOverviewritualsCollection({
    required this.edges,
    this.$__typename = 'RitualsConnection',
  });

  factory QueryWidgetOverviewritualsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverviewritualsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryWidgetOverviewritualsCollectionedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryWidgetOverviewritualsCollectionedges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverviewritualsCollection || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
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

class QueryWidgetOverviewritualsCollectionedges {
  QueryWidgetOverviewritualsCollectionedges({required this.node, this.$__typename = 'RitualsEdge'});

  factory QueryWidgetOverviewritualsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverviewritualsCollectionedges(
      node: QueryWidgetOverviewritualsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryWidgetOverviewritualsCollectionedgesnode node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverviewritualsCollectionedges || runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
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

class QueryWidgetOverviewritualsCollectionedgesnode {
  QueryWidgetOverviewritualsCollectionedgesnode({
    required this.id,
    required this.title,
    required this.cadence,
    this.weekday,
    this.atTime,
    this.$__typename = 'Rituals',
  });

  factory QueryWidgetOverviewritualsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$cadence = json['cadence'];
    final l$weekday = json['weekday'];
    final l$atTime = json['atTime'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverviewritualsCollectionedgesnode(
      id: (l$id as String),
      title: (l$title as String),
      cadence: fromJsonEnumRitualCadence((l$cadence as String)),
      weekday: (l$weekday as int?),
      atTime: (l$atTime as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final EnumRitualCadence cadence;

  final int? weekday;

  final String? atTime;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$cadence = cadence;
    _resultData['cadence'] = toJsonEnumRitualCadence(l$cadence);
    final l$weekday = weekday;
    _resultData['weekday'] = l$weekday;
    final l$atTime = atTime;
    _resultData['atTime'] = l$atTime;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$cadence = cadence;
    final l$weekday = weekday;
    final l$atTime = atTime;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$title, l$cadence, l$weekday, l$atTime, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverviewritualsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
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
    final l$cadence = cadence;
    final lOther$cadence = other.cadence;
    if (l$cadence != lOther$cadence) {
      return false;
    }
    final l$weekday = weekday;
    final lOther$weekday = other.weekday;
    if (l$weekday != lOther$weekday) {
      return false;
    }
    final l$atTime = atTime;
    final lOther$atTime = other.atTime;
    if (l$atTime != lOther$atTime) {
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

class QueryWidgetOverviewmoodsCollection {
  QueryWidgetOverviewmoodsCollection({required this.edges, this.$__typename = 'MoodsConnection'});

  factory QueryWidgetOverviewmoodsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverviewmoodsCollection(
      edges: (l$edges as List<dynamic>)
          .map((e) => QueryWidgetOverviewmoodsCollectionedges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryWidgetOverviewmoodsCollectionedges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverviewmoodsCollection || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
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

class QueryWidgetOverviewmoodsCollectionedges {
  QueryWidgetOverviewmoodsCollectionedges({required this.node, this.$__typename = 'MoodsEdge'});

  factory QueryWidgetOverviewmoodsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverviewmoodsCollectionedges(
      node: QueryWidgetOverviewmoodsCollectionedgesnode.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryWidgetOverviewmoodsCollectionedgesnode node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverviewmoodsCollectionedges || runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
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

class QueryWidgetOverviewmoodsCollectionedgesnode {
  QueryWidgetOverviewmoodsCollectionedgesnode({
    required this.id,
    required this.day,
    required this.mood,
    this.$__typename = 'Moods',
  });

  factory QueryWidgetOverviewmoodsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$day = json['day'];
    final l$mood = json['mood'];
    final l$$__typename = json['__typename'];
    return QueryWidgetOverviewmoodsCollectionedgesnode(
      id: (l$id as String),
      day: DateTime.parse((l$day as String)),
      mood: fromJsonEnumMood((l$mood as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final DateTime day;

  final EnumMood mood;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$day = day;
    _resultData['day'] = ((v) => v.toIso8601String().substring(0, 10))(l$day);
    final l$mood = mood;
    _resultData['mood'] = toJsonEnumMood(l$mood);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$day = day;
    final l$mood = mood;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$day, l$mood, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryWidgetOverviewmoodsCollectionedgesnode || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) {
      return false;
    }
    final l$mood = mood;
    final lOther$mood = other.mood;
    if (l$mood != lOther$mood) {
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
