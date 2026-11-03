import 'package:analytics_service/analytics_service.dart';
import 'package:auto_route/auto_route.dart' hide PageInfo;
import 'package:biometric_service/biometric_service.dart';
import 'package:connectivity_service/connectivity_service.dart';
import 'package:core/core.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:device_info_service/device_info_service.dart';
import 'package:file_picker_service/file_picker_service.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:flutter_bloc_starter/router/observers/analytics_router_observer.dart';
import 'package:flutter_bloc_starter/router/observers/log_router_observer.dart';
import 'package:network/network.dart';
import 'package:notification_service/notification_service.dart';
import 'package:performance_service/performance_service.dart';
import 'package:permission_service/permission_service.dart';
import 'package:preferences_service/preferences_service.dart';
import 'package:purchase_service/purchase_service.dart';
import 'package:remote_config_service/remote_config_service.dart';
import 'package:review_service/review_service.dart';
import 'package:secure_storage_service/secure_storage_service.dart';
import 'package:share_service/share_service.dart';

class SharedInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<RootStackRouter>(AppRouter.new)
    ..registerLazySingleton(LogRouterObserver.new)
    ..registerLazySingleton<AnalyticsRouterObserver>(
      () => AnalyticsRouterObserver(analyticsService: injector.get<AnalyticsService>()),
    )
    ..registerLazySingleton<SecureStorageService>(SecureStorageService.new)
    ..registerLazySingleton<PreferencesService>(PreferencesService.new)
    ..registerLazySingleton<GQLClient>(
      () => GQLClient(
        serverUrl: Config.serverUrl,
        tokenCallback: injector.get<AuthenticationRepository>().getAccessToken,
        defaultHeaders: {'apikey': Config.serverApiKey},
      ),
    )
    ..registerLazySingleton<RestClient>(() => RestClientImpl(baseUrl: Config.restServerUrl))
    ..registerLazySingleton<AnalyticsService>(FirebaseAnalyticsService.new)
    ..registerLazySingleton<RemoteConfigService>(RemoteConfigService.new)
    ..registerLazySingleton<ReviewService>(ReviewService.new)
    ..registerLazySingleton<CrashReportService>(CrashReportServiceImpl.new)
    ..registerLazySingleton<DeviceInfoService>(DeviceInfoService.new)
    ..registerLazySingleton<FilePickerService>(FilePickerService.new)
    ..registerLazySingleton<PerformanceService>(FirebasePerformanceService.new)
    ..registerLazySingleton<PermissionService>(PermissionService.new)
    ..registerLazySingleton<NotificationService>(NotificationService.new)
    ..registerLazySingleton<PurchaseService>(
      () => PurchaseService(
        iosApiKey: Config.revenueCatIosApiKey,
        androidApiKey: Config.revenueCatAndroidApiKey,
      ),
    )
    ..registerLazySingleton<ShareService>(ShareService.new)
    ..registerLazySingleton<ConnectivityService>(InternetConnectivityService.new)
    ..registerLazySingleton<BiometricService>(BiometricServiceImpl.new);
}
