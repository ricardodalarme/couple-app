part of 'ritual_edit_cubit.dart';

final class RitualEditState({
  required final Ritual ritual,
  final bool isNew = false,
  final Resource<void> load = const Success(null),
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// Whether the title is filled within its limit and a repeating ritual has a weekday.
  bool get canSave {
    final title = ritual.title.trim();
    final hasWeekday = !ritual.needsWeekday || ritual.weekday != null;

    return title.isNotEmpty && title.length <= ritualTitleMaxLength && hasWeekday;
  }

  RitualEditState copyWith({Ritual? ritual, Resource<void>? load, Resource<void>? saveAction}) {
    return RitualEditState(
      ritual: ritual ?? this.ritual,
      isNew: isNew,
      load: load ?? this.load,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [ritual, isNew, load, saveAction];
}
