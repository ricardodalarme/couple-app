part of 'diary_cubit.dart';

final class const DiaryState({
  final Resource<List<DiaryEntry>> entries = const Loading(),
  final FormInput<String> body = const FormInput(''),
  final String? mood,
  final String? editingId,
  final bool isDirty = false,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  DiaryState copyWith({
    Resource<List<DiaryEntry>>? entries,
    FormInput<String>? body,
    String? mood,
    String? editingId,
    bool clearMood = false,
    bool clearEditing = false,
    bool? isDirty,
    Resource<void>? saveAction,
  }) {
    return DiaryState(
      entries: entries ?? this.entries,
      body: body ?? this.body,
      mood: clearMood ? null : (mood ?? this.mood),
      editingId: clearEditing ? null : (editingId ?? this.editingId),
      isDirty: isDirty ?? this.isDirty,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [entries, body, mood, editingId, isDirty, saveAction];
}
