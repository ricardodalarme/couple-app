import 'dart:ui';

import 'package:crash_report_service/crash_report_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/crash_report_initializer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCrashReportService() extends Mock implements CrashReportService;

void main() {
  final service = _MockCrashReportService();
  late FlutterExceptionHandler? previousHandler;
  late ErrorCallback? previousDispatcherHandler;

  setUp(() {
    previousHandler = FlutterError.onError;
    previousDispatcherHandler = PlatformDispatcher.instance.onError;

    when(() => service.setCrashlyticsCollectionEnabled(any())).thenAnswer((_) async {});
  });

  tearDown(() {
    FlutterError.onError = previousHandler;
    PlatformDispatcher.instance.onError = previousDispatcherHandler;
    reset(service);
  });

  test('leaves collection on for release builds only', () async {
    await CrashReportInitializer(crashReportService: service).initialize();

    verify(() => service.setCrashlyticsCollectionEnabled(!kDebugMode)).called(1);
  });

  test('installs both handlers after the switch', () async {
    await CrashReportInitializer(crashReportService: service).initialize();

    expect(FlutterError.onError, isNot(previousHandler));
    expect(PlatformDispatcher.instance.onError, isNot(previousDispatcherHandler));
  });

  test('a rejected switch still installs the handlers', () async {
    when(() => service.setCrashlyticsCollectionEnabled(any())).thenThrow(Exception('no firebase'));

    await CrashReportInitializer(crashReportService: service).initialize();

    expect(FlutterError.onError, isNot(previousHandler));
    expect(PlatformDispatcher.instance.onError, isNot(previousDispatcherHandler));
  });
}
