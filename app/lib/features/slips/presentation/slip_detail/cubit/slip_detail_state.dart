part of 'slip_detail_cubit.dart';

final class const SlipDetailState({
  final Resource<SlipDetail?> slip = const Loading(),
  final bool isEditing = false,
  final String draftBody = '',
  final Resource<void> saveAction = const Initial(),
  final Resource<void> deleteAction = const Initial(),
}) with Equatable {
  /// The loaded slip, or null while loading, missing or failed.
  SlipDetail? get current => switch (slip) {
    Success(:final value) => value,
    _ => null,
  };

  /// Whether the edited text can be saved.
  bool get canSaveEdit {
    final trimmed = draftBody.trim();

    return trimmed.isNotEmpty &&
        trimmed.length <= slipKindMaxLength &&
        trimmed != current?.body.trim();
  }

  SlipDetailState copyWith({
    Resource<SlipDetail?>? slip,
    bool? isEditing,
    String? draftBody,
    Resource<void>? saveAction,
    Resource<void>? deleteAction,
  }) {
    return SlipDetailState(
      slip: slip ?? this.slip,
      isEditing: isEditing ?? this.isEditing,
      draftBody: draftBody ?? this.draftBody,
      saveAction: saveAction ?? this.saveAction,
      deleteAction: deleteAction ?? this.deleteAction,
    );
  }

  @override
  List<Object?> get props => [slip, isEditing, draftBody, saveAction, deleteAction];
}
