part of 'counter_variations_cubit.dart';

final class const CounterVariationsState({
  final Resource<HistoryOverview> overview = const Loading(),
  final RelationshipPhase selectedPhase = RelationshipPhase.dating,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  CounterVariationsState copyWith({
    Resource<HistoryOverview>? overview,
    RelationshipPhase? selectedPhase,
    Resource<void>? saveAction,
  }) {
    return CounterVariationsState(
      overview: overview ?? this.overview,
      selectedPhase: selectedPhase ?? this.selectedPhase,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [overview, selectedPhase, saveAction];
}
