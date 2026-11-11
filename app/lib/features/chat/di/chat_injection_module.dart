import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/chat_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/chat/cubit/chat_cubit.dart';
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
    ..registerLazySingleton<ChatRepository>(
      () => ChatRepository(
        dataSource: injector.get<ChatDataSource>(),
        profileRepository: injector.get<ProfileRepository>(),
        authenticationRepository: injector.get<AuthenticationRepository>(),
        slipRepository: injector.get<SlipRepository>(),
      ),
    )
    ..registerFactory<ChatCubit>(() => ChatCubit(chatRepository: injector.get<ChatRepository>()));
}
