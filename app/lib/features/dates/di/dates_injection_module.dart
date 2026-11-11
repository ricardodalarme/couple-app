import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/dates/data/data_sources/dates_data_source.dart';
import 'package:flutter_bloc_starter/features/dates/data/repositories/dates_repository.dart';
import 'package:flutter_bloc_starter/features/dates/presentation/dates/cubit/dates_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:network/network.dart';

class DatesInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<DatesDataSource>(
      () => DatesDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<DatesRepository>(
      () => DatesRepository(
        dataSource: injector.get<DatesDataSource>(),
        togetherRepository: injector.get<TogetherRepository>(),
        widgetsRepository: injector.get<WidgetsRepository>(),
      ),
    )
    ..registerFactory<DatesCubit>(
      () => DatesCubit(
        datesRepository: injector.get<DatesRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
      ),
    );
}
