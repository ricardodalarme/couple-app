import 'dart:async';

import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/models/token_local.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/token_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/mappers/login_response_to_local_mapper.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class AuthenticationInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector
      ..registerLazySingleton<AuthenticationDataSource>(
        () => AuthenticationDataSourceImpl(
          graphlQLClient: injector.get<GQLClient>(),
        ),
      )
      ..registerLazySingleton<TokenLocalDataSource>(
        () => TokenLocalDataSourceImpl(
          storage: injector.get<SecureStorageService>(),
        ),
      )
      ..registerFactory<Mapper<MutationLoginlogin, TokenLocal>>(
        LoginResponseToLocalMapper.new,
      )
      ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(
          tokenLocalMapper:
              injector.get<Mapper<MutationLoginlogin, TokenLocal>>(),
          loginDataSource: injector.get<AuthenticationDataSource>(),
          tokenLocalDataSource: injector.get<TokenLocalDataSource>(),
        ),
      );
  }
}
