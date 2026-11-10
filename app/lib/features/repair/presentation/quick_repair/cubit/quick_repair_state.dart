part of 'quick_repair_cubit.dart';

final class const QuickRepairState({
  final String text = '',
  final String? preset,
  final Resource<void> sendAction = const Initial(),
}) with Equatable {
  /// Whether the message can be sent.
  bool get canSend => text.trim().isNotEmpty && text.length <= repairMessageMaxLength;

  QuickRepairState copyWith({
    String? text,
    String? preset,
    bool clearPreset = false,
    Resource<void>? sendAction,
  }) {
    return QuickRepairState(
      text: text ?? this.text,
      preset: clearPreset ? null : preset ?? this.preset,
      sendAction: sendAction ?? this.sendAction,
    );
  }

  @override
  List<Object?> get props => [text, preset, sendAction];
}
