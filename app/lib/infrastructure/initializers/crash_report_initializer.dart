import 'package:core/core.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/firebase_initializer.dart';
import 'package:logger/logger.dart';

final class CrashReportInitializer({final CrashReportService? crashReportService})
    extends Initializer {
  static final Logger _logger = Logger('CrashReportInitializer');

  @override
  FailurePolicy get failurePolicy => FailurePolicy.nonCritical;

  @override
  List<Type> get dependencies => const [FirebaseInitializer];

  @override
  Future<void> initialize() async {
    final service = crashReportService ?? AppInjector.instance.get<CrashReportService>();

    try {
      await service.setCrashlyticsCollectionEnabled(!kDebugMode);
    } on Object catch (error) {
      _logger.warning('Could not change the crash collection setting', error: error);
    }

    _logger.info('Installing crash report handlers');

    FlutterError.onError = (details) {
      service.recordFlutterFatalError(details);
      _logger.fatal('Flutter UI Error', error: details.exception, stackTrace: details.stack);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      service.recordError(error, stack, fatal: true);
      _logger.fatal('Unhandled Dart Error', error: error, stackTrace: stack);
      return true;
    };
  }
}
