part of 'slip_kind_cubit.dart';

final class const SlipKindState({
  final String kind = 'specific',
  final String text = '',
  final String feeling = '',
  final String plan = '',
  final String? workArea,
  final Resource<SlipSaveOutcome> saveAction = const Initial(),
}) with Equatable {
  /// Whether the fields the current kind needs are filled and within their limits.
  bool get canSave {
    final hasText = text.trim().isNotEmpty && text.length <= slipKindMaxLength;
    if (!hasText) return false;

    return switch (kind) {
      'specific' => feeling.length <= slipKindNoteMaxLength,
      'if_then' => plan.trim().isNotEmpty && plan.length <= slipKindNoteMaxLength,
      _ => true,
    };
  }

  SlipKindState copyWith({
    String? kind,
    String? text,
    String? feeling,
    String? plan,
    String? workArea,
    bool clearWorkArea = false,
    Resource<SlipSaveOutcome>? saveAction,
  }) {
    return SlipKindState(
      kind: kind ?? this.kind,
      text: text ?? this.text,
      feeling: feeling ?? this.feeling,
      plan: plan ?? this.plan,
      workArea: clearWorkArea ? null : workArea ?? this.workArea,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [kind, text, feeling, plan, workArea, saveAction];
}
