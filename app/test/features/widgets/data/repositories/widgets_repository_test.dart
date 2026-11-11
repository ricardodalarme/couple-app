import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/discreet_local_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/mutations/generated/UpdateWidgetPreferences.graphql.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/queries/generated/WidgetOverview.graphql.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/widgets_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/widgets_local_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/couple_photo_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/services/widget_data_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsDataSource() extends Mock implements WidgetsDataSource;

class _MockWidgetsLocalDataSource() extends Mock implements WidgetsLocalDataSource;

class _MockDiscreetLocalDataSource() extends Mock implements DiscreetLocalDataSource;

class _MockWidgetDataService() extends Mock implements WidgetDataService;

class _MockCouplePhotoRepository() extends Mock implements CouplePhotoRepository;

void main() {
  late WidgetsDataSource dataSource;
  late WidgetsLocalDataSource localDataSource;
  late DiscreetLocalDataSource discreetLocalDataSource;
  late WidgetDataService widgetDataService;
  late CouplePhotoRepository couplePhotoRepository;
  late WidgetsRepository repository;
  late List<WidgetPayload> writes;
  WidgetPayload? cached;
  var hideWidgetText = false;

  final now = DateTime.utc(2026, 11, 11, 12);
  QueryWidgetOverview response() => QueryWidgetOverview.fromJson(<String, dynamic>{
    'widget': <String, dynamic>{
      'nodeId': 'widget-1',
      'discreet': false,
      'isPaired': true,
      'partnerName': 'Marina',
      'nextDateTitle': 'Aniversário',
      'nextDateOn': '2026-12-01',
      'unopenedCards': 0,
      '__typename': 'WidgetState',
    },
    'today': <String, dynamic>{
      'nodeId': 'today-1',
      'isPaired': true,
      'hasPlus': true,
      '__typename': 'TodayState',
    },
    'mySettings': <String, dynamic>{
      'nodeId': 'settings-1',
      'profileId': 'profile-1',
      'widgetAllowPartnerNotes': true,
      'widgetOnLockScreen': false,
      'widgetInDiscreet': true,
      'widgetShowNames': true,
      '__typename': 'ProfileSettings',
    },
    'ritualsCollection': <String, dynamic>{'edges': <dynamic>[], '__typename': 'RitualsConnection'},
    'moodsCollection': <String, dynamic>{'edges': <dynamic>[], '__typename': 'MoodsConnection'},
    '__typename': 'Query',
  });

  setUpAll(() {
    registerFallbackValue(WidgetPayload.signedOut());
    registerFallbackValue(WidgetContentSource.favorites);
    registerFallbackValue(WidgetRotationCadence.daily);
    registerFallbackValue(
      VariablesMutationUpdateWidgetPreferences(
        profileId: 'profile-1',
        widgetShowNames: false,
        widgetInDiscreet: false,
        widgetAllowPartnerNotes: false,
        widgetOnLockScreen: false,
      ),
    );
  });

  setUp(() {
    dataSource = _MockWidgetsDataSource();
    localDataSource = _MockWidgetsLocalDataSource();
    discreetLocalDataSource = _MockDiscreetLocalDataSource();
    widgetDataService = _MockWidgetDataService();
    couplePhotoRepository = _MockCouplePhotoRepository();
    repository = WidgetsRepository(
      dataSource: dataSource,
      localDataSource: localDataSource,
      discreetLocalDataSource: discreetLocalDataSource,
      widgetDataService: widgetDataService,
      couplePhotoRepository: couplePhotoRepository,
    );
    writes = <WidgetPayload>[];
    cached = WidgetPayload.fake();
    hideWidgetText = false;

    when(() => localDataSource.contentSource).thenReturn(WidgetContentSource.favorites);
    when(() => localDataSource.rotationCadence).thenReturn(WidgetRotationCadence.daily);
    when(() => localDataSource.readCachedPayload()).thenAnswer((_) => cached);
    when(() => localDataSource.writeCachedPayload(any())).thenAnswer((invocation) async {
      cached = invocation.positionalArguments.first as WidgetPayload;
    });
    when(() => localDataSource.clear()).thenAnswer((_) async {
      cached = null;
    });
    when(() => localDataSource.setContentSource(any())).thenAnswer((_) async {});
    when(() => localDataSource.setRotationCadence(any())).thenAnswer((_) async {});
    when(() => discreetLocalDataSource.hideWidgetText).thenAnswer((_) => hideWidgetText);
    when(() => discreetLocalDataSource.setHideWidgetText(value: any(named: 'value')))
        .thenAnswer((invocation) async {
          hideWidgetText = invocation.namedArguments[#value] as bool;
        });
    when(
      () => widgetDataService.readCachedPhotoPath(
        discreet: any(named: 'discreet'),
        hasPlus: any(named: 'hasPlus'),
      ),
    ).thenAnswer((_) async => null);
    when(() => couplePhotoRepository.syncWidgetCache(cacheAllowed: any(named: 'cacheAllowed')))
        .thenAnswer((_) async => false);
    when(() => widgetDataService.clearCouplePhoto()).thenAnswer((_) async {});
    when(() => widgetDataService.readStoredPayload()).thenAnswer((_) async => cached);
    when(() => widgetDataService.writePayload(any(), referenceNow: any(named: 'referenceNow')))
        .thenAnswer((invocation) async {
          final payload = invocation.positionalArguments.first as WidgetPayload;
          writes.add(payload);
          cached = payload;
          return payload;
        });
    when(() => widgetDataService.clearForSignOut(referenceNow: any(named: 'referenceNow')))
        .thenAnswer((_) async => WidgetPayload.signedOut());
  });

  test('saving preferences without a profile id fails instead of succeeding silently', () async {
    final preferences = WidgetPreferences.fake().copyWith(profileId: '');

    await expectLater(
      repository.savePreferences(preferences, now: now),
      throwsA(isA<LocalizedException>()),
    );
    verifyNever(() => dataSource.updatePreferences(any()));
  });

  test('saving preferences inverts the hide flag before sending it to the server', () async {
    VariablesMutationUpdateWidgetPreferences? sent;
    when(() => dataSource.updatePreferences(any())).thenAnswer((invocation) async {
      sent = invocation.positionalArguments.first as VariablesMutationUpdateWidgetPreferences;
      return 1;
    });
    when(() => dataSource.getOverview()).thenAnswer((_) async => response());

    final preferences = WidgetPreferences.fake().copyWith(
      profileId: 'profile-1',
      hideInDiscreet: true,
    );
    await repository.savePreferences(preferences, now: now);

    expect(sent, isNotNull);
    expect(sent!.widgetInDiscreet, isFalse);
    expect(hideWidgetText, isTrue);
  });

  test('a delayed sync cannot overwrite a newer sign-out payload', () async {
    final delayed = Completer<QueryWidgetOverview>();
    when(() => dataSource.getOverview()).thenAnswer((_) => delayed.future);

    final sync = repository.loadAndSync(now: now);
    await repository.clearOnSignOut(now: now);
    delayed.complete(response());
    await sync;

    expect(writes, isEmpty);
    expect(cached?.isSignedIn ?? false, isFalse);
  });

  test('a delayed sync cannot re-show names after discreet mode is enabled', () async {
    final delayed = Completer<QueryWidgetOverview>();
    when(() => dataSource.getOverview()).thenAnswer((_) => delayed.future);

    final sync = repository.loadAndSync(now: now);
    await repository.applyDiscreetModeImmediately(discreet: true, now: now);
    delayed.complete(response());
    await sync;

    expect(writes, isNotEmpty);
    expect(writes.last.discreet, isTrue);
    expect(writes.any((payload) => payload.partnerName != null), isFalse);
  });

  test('loadAndSync reads the couple photo row and exposes it on the overview', () async {
    when(() => dataSource.getOverview()).thenAnswer((_) async => response());
    when(() => couplePhotoRepository.syncWidgetCache(cacheAllowed: any(named: 'cacheAllowed')))
        .thenAnswer((_) async => true);
    when(
      () => widgetDataService.readCachedPhotoPath(
        discreet: any(named: 'discreet'),
        hasPlus: any(named: 'hasPlus'),
      ),
    ).thenAnswer((_) async => '/tmp/repara_widget_photo.png');

    final overview = await repository.loadAndSync(now: now);

    expect(overview.hasPhoto, isTrue);
    expect(overview.payload.cachedPhotoPath, '/tmp/repara_widget_photo.png');
    verify(() => couplePhotoRepository.syncWidgetCache(cacheAllowed: true)).called(1);
  });

  test('loadAndSync clears the photo cache when the couple is unpaired', () async {
    when(() => dataSource.getOverview()).thenAnswer((_) async {
      final json = response();
      return QueryWidgetOverview.fromJson(<String, dynamic>{
        ...json.toJson(),
        'widget': <String, dynamic>{
          ...(json.toJson()['widget'] as Map<String, dynamic>),
          'isPaired': false,
        },
      });
    });

    final overview = await repository.loadAndSync(now: now);

    expect(overview.hasPhoto, isFalse);
    verify(() => widgetDataService.clearCouplePhoto()).called(1);
    verifyNever(
      () => couplePhotoRepository.syncWidgetCache(cacheAllowed: any(named: 'cacheAllowed')),
    );
  });
}
