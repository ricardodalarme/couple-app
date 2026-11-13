part of 'story_dates_cubit.dart';

final class const StoryDatesState({
  final Resource<HistoryOverview> overview = const Loading(),
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  StoryDatesState copyWith({Resource<HistoryOverview>? overview, Resource<void>? saveAction}) {
    return StoryDatesState(
      overview: overview ?? this.overview,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [overview, saveAction];
}
