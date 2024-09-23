import 'dart:async';

import 'package:common/common.dart';
import 'package:common_data/common_data.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/data/data_sources/edit_profile_data_source.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/data/repositories/edit_profile_repository_impl.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:quickstart_flutter_bloc/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';

class EditProfileInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerLazySingleton<EditProfileDataSource>(
      () => EditProfileDataSourceImpl(
        graphlQLClient: injector.get<GQLClient>(),
      ),
    );

    injector.registerLazySingleton<EditProfileRepository>(
      () => EditProfileRepositoryImpl(
        editProfileDataSource: injector.get<EditProfileDataSource>(),
      ),
    );

    injector.registerFactory<EditProfileBloc>(
      () => EditProfileBloc(
        editProfileRepository: injector.get<EditProfileRepository>(),
      ),
    );
  }
}
