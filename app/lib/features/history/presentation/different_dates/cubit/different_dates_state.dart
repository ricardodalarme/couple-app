part of 'different_dates_cubit.dart';

final class const DifferentDatesState({
  final Resource<HistoryOverview> overview = const Loading(),
  final bool usePartnerDate = false,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  DifferentDatesState copyWith({
    Resource<HistoryOverview>? overview,
    bool? usePartnerDate,
    Resource<void>? saveAction,
  }) {
    return DifferentDatesState(
      overview: overview ?? this.overview,
      usePartnerDate: usePartnerDate ?? this.usePartnerDate,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [overview, usePartnerDate, saveAction];
}
