part of 'relationship_changed_cubit.dart';

final class const RelationshipChangedState({
  final Resource<RelationshipDetails> details = const Loading(),
  final RelationshipStatus? selected,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// The loaded relationship fields, or null while loading or failed.
  RelationshipDetails? get current => switch (details) {
    Success(:final value) => value,
    _ => null,
  };

  bool get canContinue => selected != null && !saveAction.isLoading;

  RelationshipChangedState copyWith({
    Resource<RelationshipDetails>? details,
    RelationshipStatus? selected,
    Resource<void>? saveAction,
  }) {
    return RelationshipChangedState(
      details: details ?? this.details,
      selected: selected ?? this.selected,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [details, selected, saveAction];
}
