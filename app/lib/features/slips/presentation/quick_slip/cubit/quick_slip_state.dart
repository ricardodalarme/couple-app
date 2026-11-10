part of 'quick_slip_cubit.dart';

final class const QuickSlipState({
  final String text = '',
  final String? category,
  final Resource<SlipSaveOutcome> saveAction = const Initial(),
  final Resource<void> undoAction = const Initial(),
  final bool canUndo = false,
}) with Equatable {
  /// Whether the text can be saved.
  bool get canSave => text.trim().isNotEmpty && text.length <= quickSlipMaxLength;

  /// Whether the saved confirmation is showing.
  bool get isSaved => saveAction is Success;

  QuickSlipState copyWith({
    String? text,
    String? category,
    bool clearCategory = false,
    Resource<SlipSaveOutcome>? saveAction,
    Resource<void>? undoAction,
    bool? canUndo,
  }) {
    return QuickSlipState(
      text: text ?? this.text,
      category: clearCategory ? null : category ?? this.category,
      saveAction: saveAction ?? this.saveAction,
      undoAction: undoAction ?? this.undoAction,
      canUndo: canUndo ?? this.canUndo,
    );
  }

  @override
  List<Object?> get props => [text, category, saveAction, undoAction, canUndo];
}
