part of 'learning_cubit.dart';

final class const LearningState({
  final Resource<List<Learning>> learnings = const Loading(),
  final String? kind,
  final FormInput<String> note = const FormInput(''),
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  LearningState copyWith({
    Resource<List<Learning>>? learnings,
    String? kind,
    bool clearKind = false,
    FormInput<String>? note,
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
