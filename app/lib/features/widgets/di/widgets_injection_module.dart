import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/discreet_local_data_source.dart';
import 'package:flutter_bloc_starter/features/today/data/repositories/today_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/widgets_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/widgets_local_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/services/widget_data_service.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/card_encounter/cubit/card_encounter_widget_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/configure/cubit/widget_configure_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_counter/cubit/couple_counter_widget_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_photos/cubit/couple_photos_widget_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/gallery/cubit/widgets_gallery_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/lock_screen/cubit/lock_screen_widget_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/own_medium/cubit/own_medium_widgets_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/own_small/cubit/own_small_widgets_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/partner_note/cubit/partner_note_widget_cubit.dart';
import 'package:network/network.dart';
import 'package:preferences_service/preferences_service.dart';

class WidgetsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) {
    injector
      ..registerLazySingleton<WidgetDataService>(WidgetDataService.new)
      ..registerLazySingleton<WidgetsLocalDataSource>(
        () => WidgetsLocalDataSource(preferencesService: injector.get<PreferencesService>()),
      )
      ..registerLazySingleton<WidgetsDataSource>(
        () => WidgetsDataSource(client: injector.get<GQLClient>()),
      )
      ..registerLazySingleton<WidgetsRepository>(
        () => WidgetsRepository(
          dataSource: injector.get<WidgetsDataSource>(),
          localDataSource: injector.get<WidgetsLocalDataSource>(),
          discreetLocalDataSource: injector.get<DiscreetLocalDataSource>(),
          widgetDataService: injector.get<WidgetDataService>(),
        ),
      )
      ..registerFactory<WidgetsGalleryCubit>(
        () => WidgetsGalleryCubit(repository: injector.get<WidgetsRepository>()),
      )
      ..registerFactory<WidgetConfigureCubit>(
        () => WidgetConfigureCubit(repository: injector.get<WidgetsRepository>()),
      )
      ..registerFactory<OwnSmallWidgetsCubit>(
        () => OwnSmallWidgetsCubit(repository: injector.get<WidgetsRepository>()),
      )
      ..registerFactory<OwnMediumWidgetsCubit>(
        () => OwnMediumWidgetsCubit(repository: injector.get<WidgetsRepository>()),
      )
      ..registerFactory<LockScreenWidgetCubit>(
        () => LockScreenWidgetCubit(
          repository: injector.get<WidgetsRepository>(),
          todayRepository: injector.get<TodayRepository>(),
        ),
      )
      ..registerFactory<CoupleCounterWidgetCubit>(
        () => CoupleCounterWidgetCubit(repository: injector.get<WidgetsRepository>()),
      )
      ..registerFactory<CouplePhotosWidgetCubit>(
        () => CouplePhotosWidgetCubit(repository: injector.get<WidgetsRepository>()),
      )
      ..registerFactory<PartnerNoteWidgetCubit>(
        () => PartnerNoteWidgetCubit(repository: injector.get<WidgetsRepository>()),
      )
      ..registerFactory<CardEncounterWidgetCubit>(
        () => CardEncounterWidgetCubit(repository: injector.get<WidgetsRepository>()),
      );
  }
}
