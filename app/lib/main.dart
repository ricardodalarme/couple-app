import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_starter/app.dart';
import 'package:flutter_bloc_starter/features/_shared/di/shared_injection_module.dart';
import 'package:flutter_bloc_starter/features/account/di/account_injection_module.dart';
import 'package:flutter_bloc_starter/features/app/di/app_injection_module.dart';
import 'package:flutter_bloc_starter/features/authentication/di/authentication_injection_module.dart';
import 'package:flutter_bloc_starter/features/cards/di/cards_injection_module.dart';
import 'package:flutter_bloc_starter/features/dates/di/dates_injection_module.dart';
import 'package:flutter_bloc_starter/features/devices/di/devices_injection_module.dart';
import 'package:flutter_bloc_starter/features/help/di/help_injection_module.dart';
import 'package:flutter_bloc_starter/features/ideas/di/ideas_injection_module.dart';
import 'package:flutter_bloc_starter/features/memories/di/memories_injection_module.dart';
import 'package:flutter_bloc_starter/features/mood/di/mood_injection_module.dart';
import 'package:flutter_bloc_starter/features/notifications/di/notifications_injection_module.dart';
import 'package:flutter_bloc_starter/features/onboarding/di/onboarding_injection_module.dart';
import 'package:flutter_bloc_starter/features/pairing/di/pairing_injection_module.dart';
import 'package:flutter_bloc_starter/features/partner/di/partner_injection_module.dart';
import 'package:flutter_bloc_starter/features/plus/di/plus_injection_module.dart';
import 'package:flutter_bloc_starter/features/privacy/di/privacy_injection_module.dart';
import 'package:flutter_bloc_starter/features/profile/di/profile_injection_module.dart';
import 'package:flutter_bloc_starter/features/reminders/di/reminders_injection_module.dart';
import 'package:flutter_bloc_starter/features/repair/di/repair_injection_module.dart';
import 'package:flutter_bloc_starter/features/safety/di/safety_injection_module.dart';
import 'package:flutter_bloc_starter/features/settings/di/settings_injection_module.dart';
import 'package:flutter_bloc_starter/features/slips/di/slips_injection_module.dart';
import 'package:flutter_bloc_starter/features/today/di/today_injection_module.dart';
import 'package:flutter_bloc_starter/features/together/di/together_injection_module.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/initializers.dart';
import 'package:logger/logger.dart';

final _logger = Logger('Bootstrap');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.level = kDebugMode ? LogLevel.ALL : LogLevel.WARNING;

  _registerModules();
  await _runStartupPipeline();

  runApp(const App());
}

void _registerModules() {
  _logger.info('Registering dependency injection modules');

  final injectionModules = <InjectionModule>[
    SharedInjectionModule(),
    AppInjectionModule(),
    AuthenticationInjectionModule(),
    PrivacyInjectionModule(),
    AccountInjectionModule(),
    SafetyInjectionModule(),
    SettingsInjectionModule(),
    DevicesInjectionModule(),
    IdeasInjectionModule(),
    NotificationsInjectionModule(),
    OnboardingInjectionModule(),
    PairingInjectionModule(),
    DatesInjectionModule(),
    HelpInjectionModule(),
    MemoriesInjectionModule(),
    MoodInjectionModule(),
    PartnerInjectionModule(),
    PlusInjectionModule(),
    ProfileInjectionModule(),
    CardsInjectionModule(),
    RemindersInjectionModule(),
    RepairInjectionModule(),
    SlipsInjectionModule(),
    TodayInjectionModule(),
    TogetherInjectionModule(),
  ];

  final injector = AppInjector.instance;

  for (final injectionModule in injectionModules) {
    injectionModule.registerDependencies(injector: injector);
  }
}

Future<void> _runStartupPipeline() async {
  final pipeline = StartupPipeline([
    AppCubitInitializer(),
    AuthenticationInitializer(),
    BlocInitializer(),
    CrashReportInitializer(),
    FirebaseInitializer(),
    LocaleInitializer(),
    NotificationsInitializer(),
    PreferencesInitializer(),
  ]);

  final report = await pipeline.execute();

  _logger.info('App startup completed in ${report.totalDuration.inMilliseconds}ms');

  for (final entry in report.metrics.entries) {
    _logger.debug(' • ${entry.key}: ${entry.value.inMilliseconds}ms');
  }

  for (final entry in report.errors.entries) {
    _logger.warning(' • ${entry.key}: ${entry.value}');
  }
}
