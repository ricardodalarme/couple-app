import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/cards_data_source.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/detail/cubit/card_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/draft/cubit/sunday_card_cubit.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/list/cubit/cards_list_cubit.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:network/network.dart';

class CardsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<CardsDataSource>(
      () => CardsDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<CardsRepository>(
      () => CardsRepository(dataSource: injector.get<CardsDataSource>()),
    )
    ..registerFactory<CardsListCubit>(
      () => CardsListCubit(
        cardsRepository: injector.get<CardsRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
      ),
    )
    ..registerFactory<CardDetailCubit>(
      () => CardDetailCubit(
        cardsRepository: injector.get<CardsRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
      ),
    )
    ..registerFactory<SundayCardCubit>(
      () => SundayCardCubit(
        cardsRepository: injector.get<CardsRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
        pairingRepository: injector.get<PairingRepository>(),
      ),
    );
}
