import 'package:analytics_service/analytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class FakeAnalyticsEvent extends Fake implements AnalyticsEvent {
  FakeAnalyticsEvent(this.name, {this.parameters});

  @override
  final String name;

  @override
  final Map<String, Object>? parameters;
}

void main() {
  group('AnalyticsService', () {
    late FirebaseAnalytics firebaseAnalytics;
    late AnalyticsService analyticsService;

    setUp(() {
      firebaseAnalytics = MockFirebaseAnalytics();
      analyticsService = FirebaseAnalyticsService(firebaseAnalytics);

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
        final event = FakeAnalyticsEvent('TestEvent', parameters: {'test-key': 'mock-id'});

        analyticsService.logEvent(event);

        verify(() => firebaseAnalytics.logEvent(name: event.name, parameters: event.parameters))
            .called(1);
      });

      test('do not throw exception when logEvent throws exception', () {
        when(
          () => firebaseAnalytics.logEvent(
            name: any(named: 'name'),
            parameters: any(named: 'parameters'),
          ),
        ).thenThrow(Exception());

        final event = FakeAnalyticsEvent(
          'event1',
          parameters: <String, Object>{'property1': 'value1', 'property2': 'value2'},
        );

        expect(() => analyticsService.logEvent(event), returnsNormally);

        verify(() => firebaseAnalytics.logEvent(name: event.name, parameters: event.parameters))
            .called(1);
      });
    });
  });
}
