part of 'story_cubit.dart';

final class const StoryState({
  final Resource<StoryCard?> story = const Loading(),
  final String names = '',
  final bool includeNames = false,
  final String phrase = '',
  final Resource<void> shareAction = const Initial(),
}) with Equatable {
  StoryState copyWith({
    Resource<StoryCard?>? story,
    String? names,
    bool? includeNames,
    String? phrase,
    Resource<void>? shareAction,
  }) {
    return StoryState(
      story: story ?? this.story,
      names: names ?? this.names,
      includeNames: includeNames ?? this.includeNames,
      phrase: phrase ?? this.phrase,
      shareAction: shareAction ?? this.shareAction,
    );
  }

  @override
  List<Object?> get props => [story, names, includeNames, phrase, shareAction];
}
