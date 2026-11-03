import 'package:authentication_service/authentication_service.dart';
import 'package:core/core.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/app.dart';
import 'package:flutter_bloc_starter/features/_shared/di/shared_injection_module.dart';
import 'package:flutter_bloc_starter/features/account/di/account_injection_module.dart';
import 'package:flutter_bloc_starter/features/app/di/app_injection_module.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/observers/bloc_error_observer.dart';
import 'package:flutter_bloc_starter/features/authentication/di/authentication_injection_module.dart';
import 'package:flutter_bloc_starter/features/notifications/data/services/push_token_registrar.dart';
import 'package:flutter_bloc_starter/features/notifications/di/notifications_injection_module.dart';
import 'package:flutter_bloc_starter/features/onboarding/di/onboarding_injection_module.dart';
import 'package:flutter_bloc_starter/features/post/di/post_injection_module.dart';
import 'package:flutter_bloc_starter/features/settings/di/settings_injection_module.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:formatters/formatters.dart';
import 'package:logger/logger.dart';
import 'package:notification_service/notification_service.dart';
import 'package:preferences_service/preferences_service.dart';

final _logger = Logger('Bootstrap');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.level = kDebugMode ? LogLevel.ALL : LogLevel.WARNING;

  _setupLocale();

  await _setupFirebase();
  _setupNotifications();
  _registerModules();
  await Future.wait([
    _configureCrashReportService(),
    _initializeStorageService(),
    _initializeAuthenticationService(),
  ]);
  _setupBloc();
  await _initializePushNotifications();
  _initializeAppCubit();

  runApp(const App());
}

Future<void> _setupFirebase() async {
  _logger.info('Initializing Firebase');
  await Firebase.initializeApp();
}

void _setupNotifications() {
  _logger.info('Registering notification background handler');
  registerNotificationBackgroundHandler();
}

Future<void> _configureCrashReportService() async {
  _logger.info('Configuring Crash Report Service');

  final crashReportService = AppInjector.instance.get<CrashReportService>();

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

  final preferencesService = AppInjector.instance.get<PreferencesService>();

  await preferencesService.initialize();
}

Future<void> _initializeAuthenticationService() async {
  _logger.info('Initializing Authentication Service');

  final authenticationService = AppInjector.instance.get<AuthenticationService>();

  await authenticationService.initialize(url: Config.supabaseUrl, anonKey: Config.supabaseAnonKey);
}

void _setupLocale() {
  _logger.info('Setting up locale');

  LocaleSettings.getLocaleStream().listen(
    (locale) => Formatters.setDefaultLocale(locale.languageCode),
  );

  LocaleSettings.useDeviceLocaleSync();
}

void _initializeAppCubit() {
  AppInjector.instance.get<AppCubit>().initialize();
}

Future<void> _initializePushNotifications() async {
  _logger.info('Initializing push notification registration');
  await AppInjector.instance.get<PushTokenRegistrar>().initialize();
}

void _setupBloc() {
  final crashReportService = AppInjector.instance.get<CrashReportService>();

  Bloc.observer = BlocErrorObserver(crashReportService: crashReportService);
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
    NotificationsInjectionModule(),
  ];

  final injector = AppInjector.instance;

  for (final injectionModule in injectionModules) {
    injectionModule.registerDependencies(injector: injector);
  }
}
