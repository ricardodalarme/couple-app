part of 'first_slip_cubit.dart';

final class const FirstSlipState({
  final String text = '',
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// Whether the text holds something other than spaces.
  bool get canSave => text.trim().isNotEmpty && text.length <= quickSlipMaxLength;

  FirstSlipState copyWith({String? text, Resource<void>? saveAction}) {
    return FirstSlipState(text: text ?? this.text, saveAction: saveAction ?? this.saveAction);
  }

  @override
  List<Object?> get props => [text, saveAction];
}
