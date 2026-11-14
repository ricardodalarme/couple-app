// dart format width=100
import '../../../../../../_shared/data/data_sources/remote/fragments/generated/PageInfoFragment.graphql.dart';
import '../../../../../../_shared/data/data_sources/remote/generated/schema.graphql.dart';

import 'dart:async';

import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class VariablesQueryHistoryOverview {
  factory VariablesQueryHistoryOverview({required int year}) =>
      VariablesQueryHistoryOverview._({r'year': year});

  VariablesQueryHistoryOverview._(this._$data);

  factory VariablesQueryHistoryOverview.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$year = data['year'];
    result$data['year'] = (l$year as int);
    return VariablesQueryHistoryOverview._(result$data);
  }

  Map<String, dynamic> _$data;

  int get year => (_$data['year'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$year = year;
    result$data['year'] = l$year;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! VariablesQueryHistoryOverview || runtimeType != other.runtimeType) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (l$year != lOther$year) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$year = year;
    return Object.hashAll([l$year]);
  }
}

class QueryHistoryOverview {
  QueryHistoryOverview({
    this.myProfile,
    this.myPartner,
    this.mySettings,
    this.myCouple,
    required this.storyEventsCollection,
    required this.memoriesCollection,
    required this.importantDatesCollection,
    this.myYear,
    this.$__typename = 'Query',
  });

  factory QueryHistoryOverview.fromJson(Map<String, dynamic> json) {
    final l$myProfile = json['myProfile'];
    final l$myPartner = json['myPartner'];
    final l$mySettings = json['mySettings'];
    final l$myCouple = json['myCouple'];
    final l$storyEventsCollection = json['storyEventsCollection'];
    final l$memoriesCollection = json['memoriesCollection'];
    final l$importantDatesCollection = json['importantDatesCollection'];
    final l$myYear = json['myYear'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverview(
      myProfile: l$myProfile == null
          ? null
          : QueryHistoryOverviewmyProfile.fromJson((l$myProfile as Map<String, dynamic>)),
      myPartner: l$myPartner == null
          ? null
          : QueryHistoryOverviewmyPartner.fromJson((l$myPartner as Map<String, dynamic>)),
      mySettings: l$mySettings == null
          ? null
          : QueryHistoryOverviewmySettings.fromJson((l$mySettings as Map<String, dynamic>)),
      myCouple: l$myCouple == null
          ? null
          : QueryHistoryOverviewmyCouple.fromJson((l$myCouple as Map<String, dynamic>)),
      storyEventsCollection: QueryHistoryOverviewstoryEventsCollection.fromJson(
        (l$storyEventsCollection as Map<String, dynamic>),
      ),
      memoriesCollection: QueryHistoryOverviewmemoriesCollection.fromJson(
        (l$memoriesCollection as Map<String, dynamic>),
      ),
      importantDatesCollection: QueryHistoryOverviewimportantDatesCollection.fromJson(
        (l$importantDatesCollection as Map<String, dynamic>),
      ),
      myYear: l$myYear == null
          ? null
          : QueryHistoryOverviewmyYear.fromJson((l$myYear as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryHistoryOverviewmyProfile? myProfile;

  final QueryHistoryOverviewmyPartner? myPartner;

  final QueryHistoryOverviewmySettings? mySettings;

  final QueryHistoryOverviewmyCouple? myCouple;

  final QueryHistoryOverviewstoryEventsCollection storyEventsCollection;

  final QueryHistoryOverviewmemoriesCollection memoriesCollection;

  final QueryHistoryOverviewimportantDatesCollection importantDatesCollection;

  final QueryHistoryOverviewmyYear? myYear;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myProfile = myProfile;
    _resultData['myProfile'] = l$myProfile?.toJson();
    final l$myPartner = myPartner;
    _resultData['myPartner'] = l$myPartner?.toJson();
    final l$mySettings = mySettings;
    _resultData['mySettings'] = l$mySettings?.toJson();
    final l$myCouple = myCouple;
    _resultData['myCouple'] = l$myCouple?.toJson();
    final l$storyEventsCollection = storyEventsCollection;
    _resultData['storyEventsCollection'] = l$storyEventsCollection.toJson();
    final l$memoriesCollection = memoriesCollection;
    _resultData['memoriesCollection'] = l$memoriesCollection.toJson();
    final l$importantDatesCollection = importantDatesCollection;
    _resultData['importantDatesCollection'] = l$importantDatesCollection.toJson();
    final l$myYear = myYear;
    _resultData['myYear'] = l$myYear?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myProfile = myProfile;
    final l$myPartner = myPartner;
    final l$mySettings = mySettings;
    final l$myCouple = myCouple;
    final l$storyEventsCollection = storyEventsCollection;
    final l$memoriesCollection = memoriesCollection;
    final l$importantDatesCollection = importantDatesCollection;
    final l$myYear = myYear;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$myProfile,
      l$myPartner,
      l$mySettings,
      l$myCouple,
      l$storyEventsCollection,
      l$memoriesCollection,
      l$importantDatesCollection,
      l$myYear,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverview || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myProfile = myProfile;
    final lOther$myProfile = other.myProfile;
    if (l$myProfile != lOther$myProfile) {
      return false;
    }
    final l$myPartner = myPartner;
    final lOther$myPartner = other.myPartner;
    if (l$myPartner != lOther$myPartner) {
      return false;
    }
    final l$mySettings = mySettings;
    final lOther$mySettings = other.mySettings;
    if (l$mySettings != lOther$mySettings) {
      return false;
    }
    final l$myCouple = myCouple;
    final lOther$myCouple = other.myCouple;
    if (l$myCouple != lOther$myCouple) {
      return false;
    }
    final l$storyEventsCollection = storyEventsCollection;
    final lOther$storyEventsCollection = other.storyEventsCollection;
    if (l$storyEventsCollection != lOther$storyEventsCollection) {
      return false;
    }
    final l$memoriesCollection = memoriesCollection;
    final lOther$memoriesCollection = other.memoriesCollection;
    if (l$memoriesCollection != lOther$memoriesCollection) {
      return false;
    }
    final l$importantDatesCollection = importantDatesCollection;
    final lOther$importantDatesCollection = other.importantDatesCollection;
    if (l$importantDatesCollection != lOther$importantDatesCollection) {
      return false;
    }
    final l$myYear = myYear;
    final lOther$myYear = other.myYear;
    if (l$myYear != lOther$myYear) {
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

const documentNodeQueryHistoryOverview = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'HistoryOverview'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'year')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myProfile'),
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
                  name: NameNode(value: 'displayName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'avatarPath'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'avatarKind'),
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
            name: NameNode(value: 'myPartner'),
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
                  name: NameNode(value: 'displayName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'avatarPath'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'avatarKind'),
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
                  name: NameNode(value: 'partnerName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'relationshipStatus'),
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
            name: NameNode(value: 'myCouple'),
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
            name: NameNode(value: 'storyEventsCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'happenedOn'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '50'),
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
                              name: NameNode(value: 'isMine'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'isShared'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'kind'),
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
                              name: NameNode(value: 'happenedOn'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'datePrecision'),
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
                  name: NameNode(value: 'pageInfo'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'PageInfoFragment'),
                        directives: [],
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
            name: NameNode(value: 'memoriesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'happenedOn'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '50'),
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
                              name: NameNode(value: 'isMine'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'isShared'),
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
                              name: NameNode(value: 'happenedOn'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'datePrecision'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'place'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'photoPath'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'origin'),
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
                  name: NameNode(value: 'pageInfo'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'PageInfoFragment'),
                        directives: [],
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
            name: NameNode(value: 'importantDatesCollection'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ListValueNode(
                  values: [
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'year'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
                        ),
                      ],
                    ),
                    ObjectValueNode(
                      fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'month'),
                          value: EnumValueNode(name: NameNode(value: 'DescNullsLast')),
                        ),
                      ],
                    ),
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
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '50'),
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
                              name: NameNode(value: 'isMine'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'isShared'),
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
                              name: NameNode(value: 'kind'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'month'),
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
                              name: NameNode(value: 'year'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'yearly'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'hidden'),
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
                  name: NameNode(value: 'pageInfo'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'PageInfoFragment'),
                        directives: [],
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
            name: NameNode(value: 'myYear'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'year'),
                value: VariableNode(name: NameNode(value: 'year')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'year'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'slips'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cardsSent'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cardsReceived'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'memories'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'firsts'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'ritualsDone'),
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
    fragmentDefinitionPageInfoFragment,
  ],
);
QueryHistoryOverview _parserFnQueryHistoryOverview(Map<String, dynamic> data) =>
    QueryHistoryOverview.fromJson(data);
typedef OnQueryCompleteQueryHistoryOverview = FutureOr<void> Function(
  Map<String, dynamic>?,
  QueryHistoryOverview?,
);

class OptionsQueryHistoryOverview extends graphql.QueryOptions<QueryHistoryOverview> {
  OptionsQueryHistoryOverview({
    String? operationName,
    required VariablesQueryHistoryOverview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryHistoryOverview? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryCompleteQueryHistoryOverview? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) =>
                   onComplete(data, data == null ? null : _parserFnQueryHistoryOverview(data)),
         onError: onError,
         document: documentNodeQueryHistoryOverview,
         parserFn: _parserFnQueryHistoryOverview,
       );

  final OnQueryCompleteQueryHistoryOverview? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptionsQueryHistoryOverview extends graphql.WatchQueryOptions<QueryHistoryOverview> {
  WatchOptionsQueryHistoryOverview({
    String? operationName,
    required VariablesQueryHistoryOverview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    QueryHistoryOverview? typedOptimisticResult,
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
         document: documentNodeQueryHistoryOverview,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFnQueryHistoryOverview,
       );
}

class FetchMoreOptionsQueryHistoryOverview extends graphql.FetchMoreOptions {
  FetchMoreOptionsQueryHistoryOverview({
    required graphql.UpdateQuery updateQuery,
    required VariablesQueryHistoryOverview variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryHistoryOverview,
       );
}

extension ClientExtensionQueryHistoryOverview on graphql.GraphQLClient {
  Future<graphql.QueryResult<QueryHistoryOverview>> queryHistoryOverview(
    OptionsQueryHistoryOverview options,
  ) async => await this.query(options);

  graphql.ObservableQuery<QueryHistoryOverview> watchQueryHistoryOverview(
    WatchOptionsQueryHistoryOverview options,
  ) => this.watchQuery(options);

  void writeQueryHistoryOverview({
    required QueryHistoryOverview data,
    required VariablesQueryHistoryOverview variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryHistoryOverview),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  QueryHistoryOverview? readQueryHistoryOverview({
    required VariablesQueryHistoryOverview variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryHistoryOverview),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : QueryHistoryOverview.fromJson(result);
  }
}

class QueryHistoryOverviewmyProfile {
  QueryHistoryOverviewmyProfile({
    required this.id,
    this.displayName,
    this.avatarPath,
    required this.avatarKind,
    this.$__typename = 'Profiles',
  });

  factory QueryHistoryOverviewmyProfile.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$displayName = json['displayName'];
    final l$avatarPath = json['avatarPath'];
    final l$avatarKind = json['avatarKind'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewmyProfile(
      id: (l$id as String),
      displayName: (l$displayName as String?),
      avatarPath: (l$avatarPath as String?),
      avatarKind: fromJsonEnumAvatarKind((l$avatarKind as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? displayName;

  final String? avatarPath;

  final EnumAvatarKind avatarKind;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$displayName = displayName;
    _resultData['displayName'] = l$displayName;
    final l$avatarPath = avatarPath;
    _resultData['avatarPath'] = l$avatarPath;
    final l$avatarKind = avatarKind;
    _resultData['avatarKind'] = toJsonEnumAvatarKind(l$avatarKind);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$displayName = displayName;
    final l$avatarPath = avatarPath;
    final l$avatarKind = avatarKind;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$displayName, l$avatarPath, l$avatarKind, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverviewmyProfile || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
      return false;
    }
    final l$avatarPath = avatarPath;
    final lOther$avatarPath = other.avatarPath;
    if (l$avatarPath != lOther$avatarPath) {
      return false;
    }
    final l$avatarKind = avatarKind;
    final lOther$avatarKind = other.avatarKind;
    if (l$avatarKind != lOther$avatarKind) {
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

class QueryHistoryOverviewmyPartner {
  QueryHistoryOverviewmyPartner({
    required this.id,
    this.displayName,
    this.avatarPath,
    required this.avatarKind,
    this.$__typename = 'Profiles',
  });

  factory QueryHistoryOverviewmyPartner.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$displayName = json['displayName'];
    final l$avatarPath = json['avatarPath'];
    final l$avatarKind = json['avatarKind'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewmyPartner(
      id: (l$id as String),
      displayName: (l$displayName as String?),
      avatarPath: (l$avatarPath as String?),
      avatarKind: fromJsonEnumAvatarKind((l$avatarKind as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? displayName;

  final String? avatarPath;

  final EnumAvatarKind avatarKind;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$displayName = displayName;
    _resultData['displayName'] = l$displayName;
    final l$avatarPath = avatarPath;
    _resultData['avatarPath'] = l$avatarPath;
    final l$avatarKind = avatarKind;
    _resultData['avatarKind'] = toJsonEnumAvatarKind(l$avatarKind);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$displayName = displayName;
    final l$avatarPath = avatarPath;
    final l$avatarKind = avatarKind;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$displayName, l$avatarPath, l$avatarKind, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverviewmyPartner || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
      return false;
    }
    final l$avatarPath = avatarPath;
    final lOther$avatarPath = other.avatarPath;
    if (l$avatarPath != lOther$avatarPath) {
      return false;
    }
    final l$avatarKind = avatarKind;
    final lOther$avatarKind = other.avatarKind;
    if (l$avatarKind != lOther$avatarKind) {
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

class QueryHistoryOverviewmySettings {
  QueryHistoryOverviewmySettings({
    required this.profileId,
    this.phase,
    this.togetherSince,
    this.partnerName,
    required this.relationshipStatus,
    this.$__typename = 'ProfileSettings',
  });

  factory QueryHistoryOverviewmySettings.fromJson(Map<String, dynamic> json) {
    final l$profileId = json['profileId'];
    final l$phase = json['phase'];
    final l$togetherSince = json['togetherSince'];
    final l$partnerName = json['partnerName'];
    final l$relationshipStatus = json['relationshipStatus'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewmySettings(
      profileId: (l$profileId as String),
      phase: l$phase == null ? null : fromJsonEnumRelationshipPhase((l$phase as String)),
      togetherSince: l$togetherSince == null ? null : DateTime.parse((l$togetherSince as String)),
      partnerName: (l$partnerName as String?),
      relationshipStatus: fromJsonEnumRelationshipStatus((l$relationshipStatus as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String profileId;

  final EnumRelationshipPhase? phase;

  final DateTime? togetherSince;

  final String? partnerName;

  final EnumRelationshipStatus relationshipStatus;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$profileId = profileId;
    _resultData['profileId'] = l$profileId;
    final l$phase = phase;
    _resultData['phase'] = l$phase == null ? null : toJsonEnumRelationshipPhase(l$phase);
    final l$togetherSince = togetherSince;
    _resultData['togetherSince'] = l$togetherSince == null
        ? null
        : ((v) => v.toIso8601String().substring(0, 10))(l$togetherSince);
    final l$partnerName = partnerName;
    _resultData['partnerName'] = l$partnerName;
    final l$relationshipStatus = relationshipStatus;
    _resultData['relationshipStatus'] = toJsonEnumRelationshipStatus(l$relationshipStatus);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$profileId = profileId;
    final l$phase = phase;
    final l$togetherSince = togetherSince;
    final l$partnerName = partnerName;
    final l$relationshipStatus = relationshipStatus;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$profileId,
      l$phase,
      l$togetherSince,
      l$partnerName,
      l$relationshipStatus,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverviewmySettings || runtimeType != other.runtimeType) {
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
    final l$partnerName = partnerName;
    final lOther$partnerName = other.partnerName;
    if (l$partnerName != lOther$partnerName) {
      return false;
    }
    final l$relationshipStatus = relationshipStatus;
    final lOther$relationshipStatus = other.relationshipStatus;
    if (l$relationshipStatus != lOther$relationshipStatus) {
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

class QueryHistoryOverviewmyCouple {
  QueryHistoryOverviewmyCouple({required this.id, this.$__typename = 'Couples'});

  factory QueryHistoryOverviewmyCouple.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewmyCouple(
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
    if (other is! QueryHistoryOverviewmyCouple || runtimeType != other.runtimeType) {
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

class QueryHistoryOverviewstoryEventsCollection {
  QueryHistoryOverviewstoryEventsCollection({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'StoryEventsConnection',
  });

  factory QueryHistoryOverviewstoryEventsCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewstoryEventsCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryHistoryOverviewstoryEventsCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: FragmentPageInfoFragment.fromJson((l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryHistoryOverviewstoryEventsCollectionedges> edges;

  final FragmentPageInfoFragment pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$pageInfo, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverviewstoryEventsCollection || runtimeType != other.runtimeType) {
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
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

class QueryHistoryOverviewstoryEventsCollectionedges {
  QueryHistoryOverviewstoryEventsCollectionedges({
    required this.node,
    this.$__typename = 'StoryEventsEdge',
  });

  factory QueryHistoryOverviewstoryEventsCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewstoryEventsCollectionedges(
      node: QueryHistoryOverviewstoryEventsCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryHistoryOverviewstoryEventsCollectionedgesnode node;

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
    if (other is! QueryHistoryOverviewstoryEventsCollectionedges ||
        runtimeType != other.runtimeType) {
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

class QueryHistoryOverviewstoryEventsCollectionedgesnode {
  QueryHistoryOverviewstoryEventsCollectionedgesnode({
    required this.id,
    this.isMine,
    this.isShared,
    required this.kind,
    this.title,
    required this.happenedOn,
    required this.datePrecision,
    this.$__typename = 'StoryEvents',
  });

  factory QueryHistoryOverviewstoryEventsCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$isMine = json['isMine'];
    final l$isShared = json['isShared'];
    final l$kind = json['kind'];
    final l$title = json['title'];
    final l$happenedOn = json['happenedOn'];
    final l$datePrecision = json['datePrecision'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewstoryEventsCollectionedgesnode(
      id: (l$id as String),
      isMine: (l$isMine as bool?),
      isShared: (l$isShared as bool?),
      kind: fromJsonEnumStoryEventKind((l$kind as String)),
      title: (l$title as String?),
      happenedOn: DateTime.parse((l$happenedOn as String)),
      datePrecision: fromJsonEnumDatePrecision((l$datePrecision as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final bool? isMine;

  final bool? isShared;

  final EnumStoryEventKind kind;

  final String? title;

  final DateTime happenedOn;

  final EnumDatePrecision datePrecision;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$isMine = isMine;
    _resultData['isMine'] = l$isMine;
    final l$isShared = isShared;
    _resultData['isShared'] = l$isShared;
    final l$kind = kind;
    _resultData['kind'] = toJsonEnumStoryEventKind(l$kind);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$happenedOn = happenedOn;
    _resultData['happenedOn'] = ((v) => v.toIso8601String().substring(0, 10))(l$happenedOn);
    final l$datePrecision = datePrecision;
    _resultData['datePrecision'] = toJsonEnumDatePrecision(l$datePrecision);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$isMine = isMine;
    final l$isShared = isShared;
    final l$kind = kind;
    final l$title = title;
    final l$happenedOn = happenedOn;
    final l$datePrecision = datePrecision;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$isMine,
      l$isShared,
      l$kind,
      l$title,
      l$happenedOn,
      l$datePrecision,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverviewstoryEventsCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$isMine = isMine;
    final lOther$isMine = other.isMine;
    if (l$isMine != lOther$isMine) {
      return false;
    }
    final l$isShared = isShared;
    final lOther$isShared = other.isShared;
    if (l$isShared != lOther$isShared) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$happenedOn = happenedOn;
    final lOther$happenedOn = other.happenedOn;
    if (l$happenedOn != lOther$happenedOn) {
      return false;
    }
    final l$datePrecision = datePrecision;
    final lOther$datePrecision = other.datePrecision;
    if (l$datePrecision != lOther$datePrecision) {
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

class QueryHistoryOverviewmemoriesCollection {
  QueryHistoryOverviewmemoriesCollection({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'MemoriesConnection',
  });

  factory QueryHistoryOverviewmemoriesCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewmemoriesCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) =>
                QueryHistoryOverviewmemoriesCollectionedges.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      pageInfo: FragmentPageInfoFragment.fromJson((l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryHistoryOverviewmemoriesCollectionedges> edges;

  final FragmentPageInfoFragment pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$pageInfo, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverviewmemoriesCollection || runtimeType != other.runtimeType) {
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
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

class QueryHistoryOverviewmemoriesCollectionedges {
  QueryHistoryOverviewmemoriesCollectionedges({
    required this.node,
    this.$__typename = 'MemoriesEdge',
  });

  factory QueryHistoryOverviewmemoriesCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewmemoriesCollectionedges(
      node: QueryHistoryOverviewmemoriesCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryHistoryOverviewmemoriesCollectionedgesnode node;

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
    if (other is! QueryHistoryOverviewmemoriesCollectionedges || runtimeType != other.runtimeType) {
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

class QueryHistoryOverviewmemoriesCollectionedgesnode {
  QueryHistoryOverviewmemoriesCollectionedgesnode({
    required this.id,
    this.isMine,
    this.isShared,
    required this.title,
    this.body,
    required this.happenedOn,
    required this.datePrecision,
    this.place,
    this.photoPath,
    required this.origin,
    this.$__typename = 'Memories',
  });

  factory QueryHistoryOverviewmemoriesCollectionedgesnode.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$isMine = json['isMine'];
    final l$isShared = json['isShared'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$happenedOn = json['happenedOn'];
    final l$datePrecision = json['datePrecision'];
    final l$place = json['place'];
    final l$photoPath = json['photoPath'];
    final l$origin = json['origin'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewmemoriesCollectionedgesnode(
      id: (l$id as String),
      isMine: (l$isMine as bool?),
      isShared: (l$isShared as bool?),
      title: (l$title as String),
      body: (l$body as String?),
      happenedOn: DateTime.parse((l$happenedOn as String)),
      datePrecision: fromJsonEnumDatePrecision((l$datePrecision as String)),
      place: (l$place as String?),
      photoPath: (l$photoPath as String?),
      origin: fromJsonEnumMemoryOrigin((l$origin as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final bool? isMine;

  final bool? isShared;

  final String title;

  final String? body;

  final DateTime happenedOn;

  final EnumDatePrecision datePrecision;

  final String? place;

  final String? photoPath;

  final EnumMemoryOrigin origin;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$isMine = isMine;
    _resultData['isMine'] = l$isMine;
    final l$isShared = isShared;
    _resultData['isShared'] = l$isShared;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$happenedOn = happenedOn;
    _resultData['happenedOn'] = ((v) => v.toIso8601String().substring(0, 10))(l$happenedOn);
    final l$datePrecision = datePrecision;
    _resultData['datePrecision'] = toJsonEnumDatePrecision(l$datePrecision);
    final l$place = place;
    _resultData['place'] = l$place;
    final l$photoPath = photoPath;
    _resultData['photoPath'] = l$photoPath;
    final l$origin = origin;
    _resultData['origin'] = toJsonEnumMemoryOrigin(l$origin);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$isMine = isMine;
    final l$isShared = isShared;
    final l$title = title;
    final l$body = body;
    final l$happenedOn = happenedOn;
    final l$datePrecision = datePrecision;
    final l$place = place;
    final l$photoPath = photoPath;
    final l$origin = origin;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$isMine,
      l$isShared,
      l$title,
      l$body,
      l$happenedOn,
      l$datePrecision,
      l$place,
      l$photoPath,
      l$origin,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverviewmemoriesCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$isMine = isMine;
    final lOther$isMine = other.isMine;
    if (l$isMine != lOther$isMine) {
      return false;
    }
    final l$isShared = isShared;
    final lOther$isShared = other.isShared;
    if (l$isShared != lOther$isShared) {
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
    final l$happenedOn = happenedOn;
    final lOther$happenedOn = other.happenedOn;
    if (l$happenedOn != lOther$happenedOn) {
      return false;
    }
    final l$datePrecision = datePrecision;
    final lOther$datePrecision = other.datePrecision;
    if (l$datePrecision != lOther$datePrecision) {
      return false;
    }
    final l$place = place;
    final lOther$place = other.place;
    if (l$place != lOther$place) {
      return false;
    }
    final l$photoPath = photoPath;
    final lOther$photoPath = other.photoPath;
    if (l$photoPath != lOther$photoPath) {
      return false;
    }
    final l$origin = origin;
    final lOther$origin = other.origin;
    if (l$origin != lOther$origin) {
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

class QueryHistoryOverviewimportantDatesCollection {
  QueryHistoryOverviewimportantDatesCollection({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'ImportantDatesConnection',
  });

  factory QueryHistoryOverviewimportantDatesCollection.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewimportantDatesCollection(
      edges: (l$edges as List<dynamic>)
          .map(
            (e) => QueryHistoryOverviewimportantDatesCollectionedges.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      pageInfo: FragmentPageInfoFragment.fromJson((l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<QueryHistoryOverviewimportantDatesCollectionedges> edges;

  final FragmentPageInfoFragment pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([Object.hashAll(l$edges.map((v) => v)), l$pageInfo, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverviewimportantDatesCollection ||
        runtimeType != other.runtimeType) {
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
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

class QueryHistoryOverviewimportantDatesCollectionedges {
  QueryHistoryOverviewimportantDatesCollectionedges({
    required this.node,
    this.$__typename = 'ImportantDatesEdge',
  });

  factory QueryHistoryOverviewimportantDatesCollectionedges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewimportantDatesCollectionedges(
      node: QueryHistoryOverviewimportantDatesCollectionedgesnode.fromJson(
        (l$node as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final QueryHistoryOverviewimportantDatesCollectionedgesnode node;

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
    if (other is! QueryHistoryOverviewimportantDatesCollectionedges ||
        runtimeType != other.runtimeType) {
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

class QueryHistoryOverviewimportantDatesCollectionedgesnode {
  QueryHistoryOverviewimportantDatesCollectionedgesnode({
    required this.id,
    this.isMine,
    this.isShared,
    required this.title,
    required this.kind,
    required this.month,
    required this.day,
    this.year,
    required this.yearly,
    required this.hidden,
    this.$__typename = 'ImportantDates',
  });

  factory QueryHistoryOverviewimportantDatesCollectionedgesnode.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$isMine = json['isMine'];
    final l$isShared = json['isShared'];
    final l$title = json['title'];
    final l$kind = json['kind'];
    final l$month = json['month'];
    final l$day = json['day'];
    final l$year = json['year'];
    final l$yearly = json['yearly'];
    final l$hidden = json['hidden'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewimportantDatesCollectionedgesnode(
      id: (l$id as String),
      isMine: (l$isMine as bool?),
      isShared: (l$isShared as bool?),
      title: (l$title as String),
      kind: fromJsonEnumImportantDateKind((l$kind as String)),
      month: (l$month as int),
      day: (l$day as int),
      year: (l$year as int?),
      yearly: (l$yearly as bool),
      hidden: (l$hidden as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final bool? isMine;

  final bool? isShared;

  final String title;

  final EnumImportantDateKind kind;

  final int month;

  final int day;

  final int? year;

  final bool yearly;

  final bool hidden;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$isMine = isMine;
    _resultData['isMine'] = l$isMine;
    final l$isShared = isShared;
    _resultData['isShared'] = l$isShared;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$kind = kind;
    _resultData['kind'] = toJsonEnumImportantDateKind(l$kind);
    final l$month = month;
    _resultData['month'] = l$month;
    final l$day = day;
    _resultData['day'] = l$day;
    final l$year = year;
    _resultData['year'] = l$year;
    final l$yearly = yearly;
    _resultData['yearly'] = l$yearly;
    final l$hidden = hidden;
    _resultData['hidden'] = l$hidden;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$isMine = isMine;
    final l$isShared = isShared;
    final l$title = title;
    final l$kind = kind;
    final l$month = month;
    final l$day = day;
    final l$year = year;
    final l$yearly = yearly;
    final l$hidden = hidden;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$isMine,
      l$isShared,
      l$title,
      l$kind,
      l$month,
      l$day,
      l$year,
      l$yearly,
      l$hidden,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverviewimportantDatesCollectionedgesnode ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$isMine = isMine;
    final lOther$isMine = other.isMine;
    if (l$isMine != lOther$isMine) {
      return false;
    }
    final l$isShared = isShared;
    final lOther$isShared = other.isShared;
    if (l$isShared != lOther$isShared) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) {
      return false;
    }
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (l$year != lOther$year) {
      return false;
    }
    final l$yearly = yearly;
    final lOther$yearly = other.yearly;
    if (l$yearly != lOther$yearly) {
      return false;
    }
    final l$hidden = hidden;
    final lOther$hidden = other.hidden;
    if (l$hidden != lOther$hidden) {
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

class QueryHistoryOverviewmyYear {
  QueryHistoryOverviewmyYear({
    this.year,
    this.slips,
    this.cardsSent,
    this.cardsReceived,
    this.memories,
    this.firsts,
    this.ritualsDone,
    this.$__typename = 'YearRecap',
  });

  factory QueryHistoryOverviewmyYear.fromJson(Map<String, dynamic> json) {
    final l$year = json['year'];
    final l$slips = json['slips'];
    final l$cardsSent = json['cardsSent'];
    final l$cardsReceived = json['cardsReceived'];
    final l$memories = json['memories'];
    final l$firsts = json['firsts'];
    final l$ritualsDone = json['ritualsDone'];
    final l$$__typename = json['__typename'];
    return QueryHistoryOverviewmyYear(
      year: (l$year as int?),
      slips: (l$slips as int?),
      cardsSent: (l$cardsSent as int?),
      cardsReceived: (l$cardsReceived as int?),
      memories: (l$memories as int?),
      firsts: (l$firsts as int?),
      ritualsDone: (l$ritualsDone as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? year;

  final int? slips;

  final int? cardsSent;

  final int? cardsReceived;

  final int? memories;

  final int? firsts;

  final int? ritualsDone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$year = year;
    _resultData['year'] = l$year;
    final l$slips = slips;
    _resultData['slips'] = l$slips;
    final l$cardsSent = cardsSent;
    _resultData['cardsSent'] = l$cardsSent;
    final l$cardsReceived = cardsReceived;
    _resultData['cardsReceived'] = l$cardsReceived;
    final l$memories = memories;
    _resultData['memories'] = l$memories;
    final l$firsts = firsts;
    _resultData['firsts'] = l$firsts;
    final l$ritualsDone = ritualsDone;
    _resultData['ritualsDone'] = l$ritualsDone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$year = year;
    final l$slips = slips;
    final l$cardsSent = cardsSent;
    final l$cardsReceived = cardsReceived;
    final l$memories = memories;
    final l$firsts = firsts;
    final l$ritualsDone = ritualsDone;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$year,
      l$slips,
      l$cardsSent,
      l$cardsReceived,
      l$memories,
      l$firsts,
      l$ritualsDone,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! QueryHistoryOverviewmyYear || runtimeType != other.runtimeType) {
      return false;
    }
    final l$year = year;
    final lOther$year = other.year;
    if (l$year != lOther$year) {
      return false;
    }
    final l$slips = slips;
    final lOther$slips = other.slips;
    if (l$slips != lOther$slips) {
      return false;
    }
    final l$cardsSent = cardsSent;
    final lOther$cardsSent = other.cardsSent;
    if (l$cardsSent != lOther$cardsSent) {
      return false;
    }
    final l$cardsReceived = cardsReceived;
    final lOther$cardsReceived = other.cardsReceived;
    if (l$cardsReceived != lOther$cardsReceived) {
      return false;
    }
    final l$memories = memories;
    final lOther$memories = other.memories;
    if (l$memories != lOther$memories) {
      return false;
    }
    final l$firsts = firsts;
    final lOther$firsts = other.firsts;
    if (l$firsts != lOther$firsts) {
      return false;
    }
    final l$ritualsDone = ritualsDone;
    final lOther$ritualsDone = other.ritualsDone;
    if (l$ritualsDone != lOther$ritualsDone) {
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
