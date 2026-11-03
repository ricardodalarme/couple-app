import 'package:authentication_service/authentication_service.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_bloc_starter/features/account/presentation/change_password/cubit/change_password_cubit.dart';
import 'package:flutter_bloc_starter/features/account/presentation/delete_account/cubit/delete_account_cubit.dart';
import 'package:flutter_bloc_starter/features/account/presentation/edit_profile/cubit/edit_profile_cubit.dart';

class AccountInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<AccountRepository>(
      () => AccountRepository(authenticationService: injector.get<AuthenticationService>()),
    )
    ..registerFactory<EditProfileCubit>(
      () => EditProfileCubit(accountRepository: injector.get<AccountRepository>()),
    )
    ..registerFactory<ChangePasswordCubit>(
      () => ChangePasswordCubit(accountRepository: injector.get<AccountRepository>()),
    )
    ..registerFactory<DeleteAccountCubit>(
      () => DeleteAccountCubit(accountRepository: injector.get<AccountRepository>()),
    );
}
