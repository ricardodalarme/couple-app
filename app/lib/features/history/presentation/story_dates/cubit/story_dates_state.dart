part of 'story_dates_cubit.dart';

final class const StoryDatesState({
  final Resource<HistoryOverview> overview = const Loading(),
  final String? selectedKind,
  final DateTime? draftDate,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  StoryDatesState copyWith({
    Resource<HistoryOverview>? overview,
    String? selectedKind,
    bool clearSelectedKind = false,
    DateTime? draftDate,
    Resource<void>? saveAction,
  }) {
    return StoryDatesState(
      overview: overview ?? this.overview,
      selectedKind: clearSelectedKind ? null : (selectedKind ?? this.selectedKind),
      draftDate: draftDate ?? this.draftDate,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [overview, selectedKind, draftDate, saveAction];
}
