import 'package:flutter_bloc_starter/features/widgets/data/data_sources/queries/generated/WidgetOverview.graphql.dart';
import 'package:flutter_bloc_starter/features/widgets/data/mappers/widgets_mapper.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime.utc(2026, 11, 11, 12);
  final pauseReturnAt = now.add(const Duration(hours: 2));

  QueryWidgetOverview response({Map<String, dynamic>? mySettings, bool widgetInDiscreet = true}) =>
      QueryWidgetOverview.fromJson(<String, dynamic>{
        'widget': <String, dynamic>{
          'nodeId': 'widget-1',
          'discreet': false,
          'isPaired': true,
          'partnerName': 'Marina',
          'nextDateTitle': 'Aniversário',
          'nextDateOn': '2026-12-01',
          'unopenedCards': 0,
          'pauseReturnAt': pauseReturnAt.toIso8601String(),
          '__typename': 'WidgetState',
        },
        'today': <String, dynamic>{
          'nodeId': 'today-1',
          'isPaired': true,
          'hasPlus': true,
          'partnerName': 'Redacted',
          'nextDateTitle': 'Redacted',
          'nextDateOn': '2099-01-01',
          'pauseReturnAt': '2099-01-01T00:00:00.000Z',
          'pauseIsMine': true,
          '__typename': 'TodayState',
        },
        'mySettings':
            mySettings ??
            <String, dynamic>{
              'nodeId': 'settings-1',
              'profileId': 'profile-1',
              'partnerName': 'Redacted',
              'widgetAllowPartnerNotes': true,
              'widgetOnLockScreen': false,
              'widgetInDiscreet': widgetInDiscreet,
              'widgetShowNames': true,
              '__typename': 'ProfileSettings',
            },
        'ritualsCollection': <String, dynamic>{
          'edges': <dynamic>[],
          '__typename': 'RitualsConnection',
        },
        'moodsCollection': <String, dynamic>{'edges': <dynamic>[], '__typename': 'MoodsConnection'},
        '__typename': 'Query',
      });

  WidgetOverview map(QueryWidgetOverview value, {bool localHideWidgetText = false}) =>
      value.toModel(
        localHideWidgetText: localHideWidgetText,
        contentSource: WidgetContentSource.favorites,
        rotationCadence: WidgetRotationCadence.daily,
        now: now,
      );

  test('partner name, date, and pause come only from the widget state', () {
    final overview = map(response());

    expect(overview.payload.partnerName, 'Marina');
    expect(overview.payload.nextDateTitle, 'Aniversário');
    expect(overview.payload.pauseReturnAt, pauseReturnAt.toUtc().toIso8601String());
    expect(overview.preferences.hideInDiscreet, isFalse);
  });

  test('the server widgetInDiscreet boolean is inverted into hideInDiscreet', () {
    final overview = map(response(widgetInDiscreet: false));

    expect(overview.preferences.hideInDiscreet, isTrue);
    expect(overview.payload.discreet, isTrue);
  });

  test('missing settings fail closed for names, notes, and discreet text', () {
    final overview =
        QueryWidgetOverview.fromJson(<String, dynamic>{
          'widget': <String, dynamic>{
            'nodeId': 'widget-1',
            'discreet': false,
            'isPaired': true,
            'partnerName': 'Marina',
            '__typename': 'WidgetState',
          },
          'today': <String, dynamic>{
            'nodeId': 'today-1',
            'isPaired': true,
            'hasPlus': true,
            '__typename': 'TodayState',
          },
          'ritualsCollection': <String, dynamic>{
            'edges': <dynamic>[],
            '__typename': 'RitualsConnection',
          },
          'moodsCollection': <String, dynamic>{
            'edges': <dynamic>[],
            '__typename': 'MoodsConnection',
          },
          '__typename': 'Query',
        }).toModel(
          localHideWidgetText: false,
          contentSource: WidgetContentSource.favorites,
          rotationCadence: WidgetRotationCadence.daily,
          now: now,
        );

    expect(overview.preferences.showNames, isFalse);
    expect(overview.preferences.allowPartnerNotes, isFalse);
    expect(overview.preferences.hideInDiscreet, isTrue);
    expect(overview.payload.discreet, isTrue);
    expect(overview.payload.partnerName, isNull);
  });
}
