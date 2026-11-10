part of 'learning_cubit.dart';

final class const LearningState({
  final Resource<List<Learning>> learnings = const Loading(),
  final String? kind,
  final String note = '',
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// Whether a kind is chosen and the note is filled within its limit.
  bool get canSave => kind != null && note.trim().isNotEmpty && note.length <= learningMaxLength;

  LearningState copyWith({
    Resource<List<Learning>>? learnings,
    String? kind,
    bool clearKind = false,
    String? note,
    Resource<void>? saveAction,
  }) {
    return LearningState(
      learnings: learnings ?? this.learnings,
      kind: clearKind ? null : kind ?? this.kind,
      note: note ?? this.note,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [learnings, kind, note, saveAction];
}
