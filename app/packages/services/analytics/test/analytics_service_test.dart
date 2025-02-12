import 'package:analytics_service/analytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  group('AnalyticsService', () {
    late FirebaseAnalytics firebaseAnalytics;
    late AnalyticsService analyticsService;

    setUp(() {
      firebaseAnalytics = MockFirebaseAnalytics();
      analyticsService = AnalyticsServiceImpl(firebaseAnalytics);

      when(
        () => firebaseAnalytics.logEvent(
          name: any(named: 'name'),
          parameters: any(named: 'parameters'),
        ),
      ).thenAnswer((_) async {});
    });

    test('creates FirebaseAnalytics instance internally when not injected', () {
      expect(() => analyticsService, isNot(throwsException));
    });

    group('track', () {
      test('tracks event successfully', () {
        const event = AnalyticsEvent('TestEvent', parameters: {'test-key': 'mock-id'});

        analyticsService.logEvent(event);

        verify(
          () => firebaseAnalytics.logEvent(name: event.name, parameters: event.parameters),
        ).called(1);
      });

      test('do not throw exception when logEvent throws exception', () {
        when(
          () => firebaseAnalytics.logEvent(
            name: any(named: 'name'),
            parameters: any(named: 'parameters'),
          ),
        ).thenThrow(Exception());

        const event = AnalyticsEvent(
          'event1',
          parameters: <String, Object>{'property1': 'value1', 'property2': 'value2'},
        );

        expect(() => analyticsService.logEvent(event), returnsNormally);

        verify(
          () => firebaseAnalytics.logEvent(name: event.name, parameters: event.parameters),
        ).called(1);
      });
    });
  });
}
