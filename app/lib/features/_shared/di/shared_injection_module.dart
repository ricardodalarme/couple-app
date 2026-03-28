import 'package:analytics_service/analytics_service.dart';
import 'package:auto_route/auto_route.dart' hide PageInfo;
import 'package:biometric_service/biometric_service.dart';
import 'package:core/core.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:device_info_service/device_info_service.dart';
import 'package:network/network.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';
import 'package:remote_config_service/remote_config_service.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class SharedInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<RootStackRouter>(AppRouter.new)
    ..registerLazySingleton(LogRouterObserver.new)
    ..registerLazySingleton<AnalyticsRouterObserver>(
      () => AnalyticsRouterObserver(analyticsService: injector.get<AnalyticsService>()),
    )
    ..registerLazySingleton<SecureStorageService>(SecureStorageServiceImpl.new)
    ..registerLazySingleton<PersistentStorageService>(PersistentStorageServiceImpl.new)
    ..registerLazySingleton<GQLClient>(
      () => GQLClientImpl(storage: injector.get<SecureStorageService>()),
    )
    ..registerLazySingleton<RestClient>(RestClientImpl.new)
    ..registerLazySingleton<AnalyticsService>(FirebaseAnalyticsService.new)
    ..registerLazySingleton<RemoteConfigService>(RemoteConfigService.new)
    ..registerLazySingleton<CrashReportService>(CrashReportServiceImpl.new)
    ..registerLazySingleton<DeviceInfoService>(DeviceInfoService.new)
    ..registerLazySingleton<BiometricService>(BiometricServiceImpl.new);
}
