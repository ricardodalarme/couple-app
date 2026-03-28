import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:formatters/formatters.dart';
import 'package:logger/logger.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';
import 'package:quickstart_flutter_bloc/app.dart';
import 'package:quickstart_flutter_bloc/features/_shared/di/shared_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/account/di/account_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/app/di/app_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/authentication/di/authentication_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/onboarding/di/onboarding_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/post/di/post_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/models/settings.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/repositories/settings_repository.dart';
import 'package:quickstart_flutter_bloc/features/settings/di/settings_injection_module.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/router/app_router.dart';

final _logger = Logger('Bootstrap');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.level = kDebugMode ? LogLevel.ALL : LogLevel.WARNING;

  _setupLocale();

  await _setupFirebase();
  _registerModules();
  await Future.wait([_configureCrashReportService(), _initializeStorageService()]);
  _checkOnboardingStatus();

  runApp(const App());
}

Future<void> _setupFirebase() async {
  _logger.info('Initializing Firebase');
  await Firebase.initializeApp();
}

Future<void> _configureCrashReportService() async {
  _logger.info('Configuring Crash Report Service');

  final CrashReportService crashReportService = AppInjector.instance.get<CrashReportService>();

  await crashReportService.setCrashlyticsCollectionEnabled(true);

  FlutterError.onError = (details) {
    crashReportService.recordFlutterFatalError(details);
    _logger.fatal('Flutter UI Error', error: details.exception, stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    crashReportService.recordError(error, stack, fatal: true);
    _logger.fatal('Unhandled Dart Error', error: error, stackTrace: stack);
    return true;
  };
}

Future<void> _initializeStorageService() async {
  _logger.info('Initializing Persistent Storage Service');

  final PersistentStorageService persistentStorageService = AppInjector.instance
      .get<PersistentStorageService>();

  await persistentStorageService.initialize();
}

void _setupLocale() {
  _logger.info('Setting up locale');

  LocaleSettings.getLocaleStream().listen(
    (locale) => Formatters.setDefaultLocale(locale.languageCode),
  );

  LocaleSettings.useDeviceLocaleSync();
}

void _checkOnboardingStatus() {
  final RootStackRouter appRouter = AppInjector.instance.get<RootStackRouter>();
  final SettingsRepository settingsRepository = AppInjector.instance.get<SettingsRepository>();
  final Settings settings = settingsRepository.get();

  if (!settings.hasOnboarded) {
    appRouter.replaceAll([const OnboardingRoute()]);
  }
}

void _registerModules() {
  _logger.info('Registering dependency injection modules');

  final injectionModules = <InjectionModule>[
    SharedInjectionModule(),
    AppInjectionModule(),
    AuthenticationInjectionModule(),
    OnboardingInjectionModule(),
    AccountInjectionModule(),
    PostInjectionModule(),
    SettingsInjectionModule(),
  ];

  final Injector injector = AppInjector.instance;

  for (final injectionModule in injectionModules) {
    injectionModule.registerDependencies(injector: injector);
  }
}
