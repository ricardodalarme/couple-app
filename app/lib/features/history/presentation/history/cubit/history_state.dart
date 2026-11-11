part of 'history_cubit.dart';

final class const HistoryState({
  final Resource<HistoryOverview> overview = const Loading(),
  final int? selectedYear,
  final bool showUnknownOnly = false,
  final int visibleYearCount = 2,
}) with Equatable {
  HistoryState copyWith({
    Resource<HistoryOverview>? overview,
    int? selectedYear,
    bool clearSelectedYear = false,
    bool? showUnknownOnly,
    int? visibleYearCount,
  }) {
    return HistoryState(
      overview: overview ?? this.overview,
      selectedYear: clearSelectedYear ? null : (selectedYear ?? this.selectedYear),
      showUnknownOnly: showUnknownOnly ?? this.showUnknownOnly,
      visibleYearCount: visibleYearCount ?? this.visibleYearCount,
    );
  }

  @override
  List<Object?> get props => [overview, selectedYear, showUnknownOnly, visibleYearCount];
}
