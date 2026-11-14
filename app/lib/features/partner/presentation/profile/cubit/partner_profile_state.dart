part of 'partner_profile_cubit.dart';

final class const PartnerProfileState({
  final Resource<List<PartnerFact>> facts = const Loading(),
  final FormInput<String> label = const FormInput(''),
  final FormInput<String> value = const FormInput(''),
  final PartnerFactCategory? category,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  PartnerProfileState copyWith({
    Resource<List<PartnerFact>>? facts,
    FormInput<String>? label,
    FormInput<String>? value,
    PartnerFactCategory? category,
    bool clearCategory = false,
    Resource<void>? saveAction,
  }) {
    return PartnerProfileState(
      facts: facts ?? this.facts,
      label: label ?? this.label,
      value: value ?? this.value,
      category: clearCategory ? null : category ?? this.category,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [facts, label, value, category, saveAction];
}
