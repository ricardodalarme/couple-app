import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/story/data/repositories/story_repository.dart';
import 'package:flutter_bloc_starter/features/story/presentation/story/cubit/story_cubit.dart';
import 'package:flutter_bloc_starter/features/story/presentation/story/widgets/story_painter.dart';
import 'package:share_service/share_service.dart';

class StoryInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<StoryRepository>(
      () => StoryRepository(
        historyRepository: injector.get<HistoryRepository>(),
        shareService: injector.get<ShareService>(),
      ),
    )
    ..registerFactory<StoryCubit>(
      () =>
          StoryCubit(storyRepository: injector.get<StoryRepository>(), renderStory: renderStoryPng),
    );
}
