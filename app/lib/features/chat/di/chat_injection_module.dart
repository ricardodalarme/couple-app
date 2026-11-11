import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/chat_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/learned_items_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/learned_items_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/chat/cubit/chat_cubit.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/learned/cubit/learned_items_cubit.dart';
import 'package:flutter_bloc_starter/features/partner/data/repositories/partner_repository.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/infrastructure/config/env_variables.dart';
import 'package:network/network.dart';

class ChatInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<ChatDataSource>(
      () => ChatDataSource(
        client: injector.get<GQLClient>(),
        restClient: injector.get<RestClient>(),
        functionUrl: '${EnvVariables.supabaseUrl}/functions/v1/chat',
        apiKey: EnvVariables.supabaseAnonKey,
      ),
    )
    ..registerLazySingleton<LearnedItemsDataSource>(
      () => LearnedItemsDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<LearnedItemsRepository>(
      () => LearnedItemsRepository(dataSource: injector.get<LearnedItemsDataSource>()),
    )
    ..registerLazySingleton<ChatRepository>(
      () => ChatRepository(
        dataSource: injector.get<ChatDataSource>(),
        profileRepository: injector.get<ProfileRepository>(),
        authenticationRepository: injector.get<AuthenticationRepository>(),
        slipRepository: injector.get<SlipRepository>(),
        plusRepository: injector.get<PlusRepository>(),
      ),
    )
    ..registerFactory<ChatCubit>(
      () => ChatCubit(
        chatRepository: injector.get<ChatRepository>(),
        learnedItemsRepository: injector.get<LearnedItemsRepository>(),
      ),
    )
    ..registerFactory<LearnedItemsCubit>(
      () => LearnedItemsCubit(
        learnedItemsRepository: injector.get<LearnedItemsRepository>(),
        partnerRepository: injector.get<PartnerRepository>(),
      ),
    );
}
