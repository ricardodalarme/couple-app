import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/heavy_day/presentation/heavy_day/cubit/heavy_day_cubit.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/privacy/data/repositories/privacy_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

class HeavyDayInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) =>
      injector..registerFactory<HeavyDayCubit>(
        () => HeavyDayCubit(
          privacyRepository: injector.get<PrivacyRepository>(),
          profileRepository: injector.get<ProfileRepository>(),
          notesRepository: injector.get<NotesRepository>(),
        ),
      );
}
