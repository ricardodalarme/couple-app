part of 'slip_kind_cubit.dart';

final class const SlipKindState({
  final String kind = 'specific',
  final FormInput<String> text = const FormInput(''),
  final FormInput<String> feeling = const FormInput(''),
  final FormInput<String> plan = const FormInput(''),
  final String? workArea,
  final Resource<SlipSaveOutcome> saveAction = const Initial(),
}) with Equatable {
  SlipKindState copyWith({
    String? kind,
    FormInput<String>? text,
    FormInput<String>? feeling,
    FormInput<String>? plan,
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
