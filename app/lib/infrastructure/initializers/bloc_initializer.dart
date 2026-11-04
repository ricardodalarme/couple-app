import 'package:core/core.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/observers/bloc_error_observer.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/firebase_initializer.dart';
import 'package:logger/logger.dart';

final class BlocInitializer() extends Initializer {
  static final Logger _logger = Logger('BlocInitializer');

  @override
  List<Type> get dependencies => const [FirebaseInitializer];

  @override
  void initialize() {
    _logger.info('Installing Bloc observer');

    Bloc.observer = BlocErrorObserver(
      crashReportService: AppInjector.instance.get<CrashReportService>(),
    );
  }
}
