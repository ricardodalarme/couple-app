part of 'history_numbers_cubit.dart';

final class const HistoryNumbersState({final Resource<HistoryOverview> overview = const Loading()})
    with Equatable {
  HistoryNumbersState copyWith({Resource<HistoryOverview>? overview}) {
    return HistoryNumbersState(overview: overview ?? this.overview);
  }

  @override
  List<Object?> get props => [overview];
}
