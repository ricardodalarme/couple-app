import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/partner/data/data_sources/remote/partner_data_source.dart';
import 'package:flutter_bloc_starter/features/partner/data/repositories/partner_repository.dart';
import 'package:flutter_bloc_starter/features/partner/presentation/profile/cubit/partner_profile_cubit.dart';
import 'package:network/network.dart';

class PartnerInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<PartnerDataSource>(
      () => PartnerDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<PartnerRepository>(
      () => PartnerRepository(dataSource: injector.get<PartnerDataSource>()),
    )
    ..registerFactory<PartnerProfileCubit>(
      () => PartnerProfileCubit(partnerRepository: injector.get<PartnerRepository>()),
    );
}
