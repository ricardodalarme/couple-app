part of 'idea_detail_cubit.dart';

final class const IdeaDetailState({
  final Resource<List<Idea>> ideas = const Loading(),
  final int index = 0,
  final RelationshipPhase? phase,
  final List<RelationshipGoal> goals = const [],
  final bool isDone = false,
  final Resource<ReminderChoice> reminderAction = const Initial(),
}) with Equatable {
  /// The idea on screen, once the list has loaded.
  Idea? get current {
    final list = ideas;
    if (list is! Success<List<Idea>> || list.value.isEmpty) return null;

    return list.value[index % list.value.length];
  }

  IdeaDetailState copyWith({
    Resource<List<Idea>>? ideas,
    int? index,
    RelationshipPhase? phase,
    List<RelationshipGoal>? goals,
    bool? isDone,
    Resource<ReminderChoice>? reminderAction,
  }) {
    return IdeaDetailState(
      ideas: ideas ?? this.ideas,
      index: index ?? this.index,
      phase: phase ?? this.phase,
      goals: goals ?? this.goals,
      isDone: isDone ?? this.isDone,
      reminderAction: reminderAction ?? this.reminderAction,
    );
  }

  @override
  List<Object?> get props => [ideas, index, phase, goals, isDone, reminderAction];
}
