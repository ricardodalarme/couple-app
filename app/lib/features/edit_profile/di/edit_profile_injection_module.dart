import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/data/data_sources/edit_profile_data_source.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/data/repositories/edit_profile_repository.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';

class EditProfileInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<EditProfileDataSource>(
      () => EditProfileDataSource(graphlQLClient: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<EditProfileRepository>(
      () => EditProfileRepository(editProfileDataSource: injector.get<EditProfileDataSource>()),
    )
    ..registerFactory<EditProfileBloc>(
      () => EditProfileBloc(editProfileRepository: injector.get<EditProfileRepository>()),
    );
}
