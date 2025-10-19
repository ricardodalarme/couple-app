import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';
import 'package:quickstart_flutter_bloc/app.dart';
import 'package:quickstart_flutter_bloc/features/_shared/di/shared_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/app/di/app_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/authentication/di/authentication_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/change_password/di/change_password_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/di/edit_profile_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/onboarding/di/onboarding_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/post/di/post_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/models/settings.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/repositories/settings_repository.dart';
import 'package:quickstart_flutter_bloc/features/settings/di/settings_injection_module.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocaleSync();

  await _setupFirebase();
  _registerModules();
  await Future.wait([_configureCrashReportService(), _initializeStorageService()]);
  _checkOnboardingStatus();

  runApp(const App());
}

Future<void> _setupFirebase() async {
  await Firebase.initializeApp();
}

Future<void> _configureCrashReportService() async {
  final CrashReportService crashReportService = AppInjector.instance.get<CrashReportService>();

  await crashReportService.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = crashReportService.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    crashReportService.recordError(error, stack, fatal: true);
    return true;
  };
}

Future<void> _initializeStorageService() async {
  final PersistentStorageService persistentStorageService = AppInjector.instance
      .get<PersistentStorageService>();

  await persistentStorageService.initialize();
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
  final injectionModules = <InjectionModule>[
    SharedInjectionModule(),
    AppInjectionModule(),
    AuthenticationInjectionModule(),
    OnboardingInjectionModule(),
    EditProfileInjectionModule(),
    ChangePasswordInjectionModule(),
    PostInjectionModule(),
    SettingsInjectionModule(),
  ];

  final Injector injector = AppInjector.instance;

  for (final injectionModule in injectionModules) {
    injectionModule.registerDependencies(injector: injector);
  }
}
