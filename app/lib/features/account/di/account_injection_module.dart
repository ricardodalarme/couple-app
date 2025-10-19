import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/account/data/data_sources/account_data_source.dart';
import 'package:quickstart_flutter_bloc/features/account/data/repositories/account_repository.dart';
import 'package:quickstart_flutter_bloc/features/account/presentation/change_password/bloc/change_password_bloc.dart';
import 'package:quickstart_flutter_bloc/features/account/presentation/edit_profile/bloc/edit_profile_bloc.dart';

class AccountInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<AccountDataSource>(
      () => AccountDataSource(graphlQLClient: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<AccountRepository>(
      () => AccountRepository(accountDataSource: injector.get<AccountDataSource>()),
    )
    ..registerFactory<EditProfileBloc>(
      () => EditProfileBloc(accountRepository: injector.get<AccountRepository>()),
    )
    ..registerFactory<ChangePasswordBloc>(
      () => ChangePasswordBloc(accountRepository: injector.get<AccountRepository>()),
    );
}
