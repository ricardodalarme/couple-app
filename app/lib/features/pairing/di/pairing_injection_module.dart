import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/pairing/data/data_sources/pairing_data_source.dart';
import 'package:flutter_bloc_starter/features/pairing/data/data_sources/pairing_local_data_source.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/invite/cubit/invite_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:network/network.dart';
import 'package:secure_storage_service/secure_storage_service.dart';
import 'package:share_service/share_service.dart';

class PairingInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<PairingDataSource>(
      () => PairingDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<PairingLocalDataSource>(
      () => PairingLocalDataSource(secureStorageService: injector.get<SecureStorageService>()),
    )
    ..registerLazySingleton<PairingRepository>(
      () => PairingRepository(
        pairingDataSource: injector.get<PairingDataSource>(),
        localDataSource: injector.get<PairingLocalDataSource>(),
      ),
    )
    ..registerFactory<InviteCubit>(
      () => InviteCubit(
        pairingRepository: injector.get<PairingRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
        shareService: injector.get<ShareService>(),
      ),
    );
}
