import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:performance_service/performance_service.dart';

class MockFirebasePerformance() extends Mock implements FirebasePerformance;

class MockTrace() extends Mock implements Trace;

class MockHttpMetric() extends Mock implements HttpMetric;

void main() {
  group('FirebasePerformanceService', () {
    late FirebasePerformance firebasePerformance;
    late PerformanceService performanceService;

    setUp(() {
      firebasePerformance = MockFirebasePerformance();
      performanceService = FirebasePerformanceService(firebasePerformance);
    });

    test('reads whether collection is enabled', () async {
      when(() => firebasePerformance.isPerformanceCollectionEnabled())
          .thenAnswer((_) async => true);

      expect(await performanceService.isPerformanceCollectionEnabled(), isTrue);
    });

    test('forwards the collection toggle', () async {
      when(() => firebasePerformance.setPerformanceCollectionEnabled(false))
          .thenAnswer((_) async {});

      await performanceService.setPerformanceCollectionEnabled(false);

      verify(() => firebasePerformance.setPerformanceCollectionEnabled(false)).called(1);
    });

    test('creates a trace through the SDK', () {
      final trace = MockTrace();
      when(() => firebasePerformance.newTrace('checkout')).thenReturn(trace);

      expect(performanceService.newTrace('checkout'), same(trace));
    });

    test('creates an HTTP metric through the SDK', () {
      final metric = MockHttpMetric();
      when(() => firebasePerformance.newHttpMetric('https://example.com', HttpMethod.Get))
          .thenReturn(metric);

      expect(performanceService.newHttpMetric('https://example.com', HttpMethod.Get), same(metric));
    });
  });
}
