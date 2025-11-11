import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/account/data/data_sources/account_data_source.dart';
import 'package:quickstart_flutter_bloc/features/account/data/repositories/account_repository.dart';
import 'package:quickstart_flutter_bloc/features/account/presentation/change_password/cubit/change_password_cubit.dart';
import 'package:quickstart_flutter_bloc/features/account/presentation/edit_profile/cubit/edit_profile_cubit.dart';

class AccountInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<AccountDataSource>(
      () => AccountDataSource(graphlQLClient: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<AccountRepository>(
      () => AccountRepository(accountDataSource: injector.get<AccountDataSource>()),
    )
    ..registerFactory<EditProfileCubit>(
      () => EditProfileCubit(accountRepository: injector.get<AccountRepository>()),
    )
    ..registerFactory<ChangePasswordCubit>(
      () => ChangePasswordCubit(accountRepository: injector.get<AccountRepository>()),
    );
}
