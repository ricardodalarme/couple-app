import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/plus/data/data_sources/plus_data_source.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/manage/cubit/manage_plus_cubit.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/plans/cubit/plans_cubit.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/restore/cubit/restore_purchases_cubit.dart';
import 'package:network/network.dart';
import 'package:purchase_service/purchase_service.dart';

class PlusInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<PlusDataSource>(() => PlusDataSource(client: injector.get<GQLClient>()))
    ..registerLazySingleton<PlusRepository>(
      () => PlusRepository(
        dataSource: injector.get<PlusDataSource>(),
        purchaseService: injector.get<PurchaseService>(),
      ),
    )
    ..registerFactory<PlansCubit>(() => PlansCubit(plusRepository: injector.get<PlusRepository>()))
    ..registerFactory<ManagePlusCubit>(
      () => ManagePlusCubit(plusRepository: injector.get<PlusRepository>()),
    )
    ..registerFactory<RestorePurchasesCubit>(
      () => RestorePurchasesCubit(plusRepository: injector.get<PlusRepository>()),
    );
}
