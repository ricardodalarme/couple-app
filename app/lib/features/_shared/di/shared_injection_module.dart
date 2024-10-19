import 'dart:async';

import 'package:analytics_service/analytics_service.dart';
import 'package:auto_route/auto_route.dart' hide PageInfo;
import 'package:biometric_service/biometric_service.dart';
import 'package:common/common.dart';
import 'package:crash_report_service/crash_report_service.dart';
import 'package:network/network.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/data_sources/fragments/generated/PageInfoFragment.graphql.dart';
import 'package:quickstart_flutter_bloc/features/_shared/data/mappers/page_info_response_mapper.dart';
import 'package:quickstart_flutter_bloc/features/_shared/domain/entities/page_info.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';
import 'package:remote_config_service/remote_config_service.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class SharedInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector
      ..registerLazySingleton<RootStackRouter>(
        AppRouter.new,
      )
      ..registerLazySingleton<SecureStorageService>(
        SecureStorageServiceImpl.new,
      )
      ..registerLazySingleton<PersistentStorageService>(
        PersistentStorageServiceImpl.new,
      )
      ..registerLazySingleton<GQLClient>(
        () => GQLClientImpl(
          storage: injector.get<SecureStorageService>(),
        ),
      )
      ..registerLazySingleton<RestClient>(
        RestClientImpl.new,
      )
      ..registerLazySingleton<AnalyticsService>(
        AnalyticsServiceImpl.new,
      )
      ..registerLazySingleton<RemoteConfigService>(
        RemoteConfigServiceImpl.new,
      )
      ..registerLazySingleton<CrashReportService>(
        CrashReportServiceImpl.new,
      )
      ..registerLazySingleton<BiometricService>(
        BiometricServiceImpl.new,
      )
      ..registerFactory<Mapper<FragmentPageInfoFragment, PageInfo>>(
        PageInfoResponseMapper.new,
      );
  }
}
