import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';
import 'package:quickstart_flutter_bloc/features/_shared/di/shared_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/app/di/app_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/app/observers/bloc_observer.dart';
import 'package:quickstart_flutter_bloc/features/authentication/di/authentication_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/change_password/di/change_password_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/di/edit_profile_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/di/forgot_password_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/login/di/login_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/onboarding/di/onboarding_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/post/di/post_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/settings/di/settings_injection_module.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/models/settings_model.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/repositories/settings_repository.dart';
import 'package:quickstart_flutter_bloc/features/signup/di/signup_injection_module.dart';
import 'package:quickstart_flutter_bloc/firebase_options.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

Future<void> bootstrap(Widget Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  await _setupFirebase();
  _registerModules();
  await Future.wait([
    _checkAuthenticationStatus(),
    _configureCrashReportService(),
    _initializeStorageService(),
  ]);
  _setupBloc();
  _checkOnboardingStatus();

  runApp(builder());
}

Future<void> _setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void _setupBloc() {
  Bloc.observer = AppBlocObserver();
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

Future<void> _checkAuthenticationStatus() async {
  final AuthenticationRepository authenticationRepository =
      AppInjector.instance.get<AuthenticationRepository>();

  await authenticationRepository.checkAuthenticationStatus();
}

Future<void> _initializeStorageService() async {
  final PersistentStorageService persistentStorageService =
      AppInjector.instance.get<PersistentStorageService>();

  await persistentStorageService.initialize();
}

void _checkOnboardingStatus() {
  final RootStackRouter appRouter = AppInjector.instance.get<RootStackRouter>();
  final SettingsRepository settingsRepository = AppInjector.instance.get<SettingsRepository>();
  final SettingsModel settings = settingsRepository.get();

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
    LoginInjectionModule(),
    SignupInjectionModule(),
    ForgotPasswordInjectionModule(),
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
