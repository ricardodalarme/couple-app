import 'package:core/core.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/firebase_initializer.dart';
import 'package:logger/logger.dart';

final class CrashReportInitializer() extends Initializer {
  static final Logger _logger = Logger('CrashReportInitializer');

  @override
  FailurePolicy get failurePolicy => FailurePolicy.nonCritical;

  @override
  List<Type> get dependencies => const [FirebaseInitializer];

  @override
  void initialize() {
    _logger.info('Installing crash report handlers');

    final service = AppInjector.instance.get<CrashReportService>();

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
