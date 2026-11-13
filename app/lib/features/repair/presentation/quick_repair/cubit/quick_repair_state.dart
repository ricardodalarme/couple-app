part of 'quick_repair_cubit.dart';

final class const QuickRepairState({
  final FormInput<String> text = const FormInput(''),
  final String? preset,
  final Resource<void> sendAction = const Initial(),
}) with Equatable {
  QuickRepairState copyWith({
    FormInput<String>? text,
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
