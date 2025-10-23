import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

abstract interface class CrashReportService {
  Future<void> setCrashlyticsCollectionEnabled(bool enabled);
  Future<void> recordFlutterFatalError(FlutterErrorDetails details);
  Future<void> recordError(dynamic error, StackTrace stack, {bool fatal});
}

class CrashReportServiceImpl implements CrashReportService {
  factory CrashReportServiceImpl([FirebaseCrashlytics? crashlytics]) {
    return CrashReportServiceImpl._(crashlytics ?? FirebaseCrashlytics.instance);
  }

  const CrashReportServiceImpl._(this._crashlytics);

  final FirebaseCrashlytics _crashlytics;

  @override
  Future<void> setCrashlyticsCollectionEnabled(bool enabled) async {
    await _crashlytics.setCrashlyticsCollectionEnabled(enabled);
  }

  @override
  Future<void> recordFlutterFatalError(FlutterErrorDetails details) async {
    await _crashlytics.recordFlutterFatalError(details);
  }

  @override
  Future<void> recordError(dynamic error, StackTrace stack, {bool fatal = false}) async {
    await _crashlytics.recordError(error, stack, fatal: fatal);
  }
}
