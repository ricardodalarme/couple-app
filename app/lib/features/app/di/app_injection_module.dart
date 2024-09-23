import 'dart:async';

import 'package:analytics_service/analytics_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:biometric_service/biometric_service.dart';
import 'package:common/common.dart';
import 'package:common_data/common_data.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';
import 'package:remote_config_service/remote_config_service.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class AppInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerLazySingleton<RootStackRouter>(
      AppRouter.new,
    );

    injector.registerLazySingleton<SecureStorageService>(
      SecureStorageServiceImpl.new,
    );

    injector.registerLazySingleton<PersistentStorageService>(
      PersistentStorageServiceImpl.new,
    );

    injector.registerLazySingleton<GQLClient>(
      () => GQLClientImpl(
        storage: injector.get<SecureStorageService>(),
      ),
    );

    injector.registerLazySingleton<RestClient>(
      RestClientImpl.new,
    );

    injector.registerSingleton<AnalyticsService>(
      AnalyticsServiceImpl(),
    );

    injector.registerSingleton<RemoteConfigService>(
      RemoteConfigServiceImpl(),
    );

    injector.registerSingleton<CrashReportService>(
      CrashReportServiceImpl(),
    );

    injector.registerSingleton<BiometricService>(
      BiometricServiceImpl(),
    );

    injector.registerFactory<AppBloc>(
      () => AppBloc(
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    );
  }
}
