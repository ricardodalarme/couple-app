import 'package:biometric_service/biometric_service.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/account/data/data_sources/account_data_source.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_bloc_starter/features/account/presentation/delete/cubit/delete_account_cubit.dart';
import 'package:flutter_bloc_starter/features/account/presentation/sign_out/cubit/sign_out_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/today/data/repositories/today_repository.dart';
import 'package:network/network.dart';
import 'package:preferences_service/preferences_service.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class AccountInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<AccountDataSource>(
      () => AccountDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<AccountRepository>(
      () => AccountRepository(dataSource: injector.get<AccountDataSource>()),
    )
    ..registerFactory<DeleteAccountCubit>(
      () => DeleteAccountCubit(
        repository: injector.get<AccountRepository>(),
        pairingRepository: injector.get<PairingRepository>(),
        biometricService: injector.get<BiometricService>(),
      ),
    )
    ..registerFactory<SignOutCubit>(
      () => SignOutCubit(
        authenticationRepository: injector.get<AuthenticationRepository>(),
        slipRepository: injector.get<SlipRepository>(),
        remindersRepository: injector.get<RemindersRepository>(),
        preferencesService: injector.get<PreferencesService>(),
        secureStorageService: injector.get<SecureStorageService>(),
        todayRepository: injector.get<TodayRepository>(),
      ),
    );
}
