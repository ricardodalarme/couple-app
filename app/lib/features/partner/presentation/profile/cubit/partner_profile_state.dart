part of 'partner_profile_cubit.dart';

final class const PartnerProfileState({
  final Resource<List<PartnerFact>> facts = const Loading(),
  final String label = '',
  final String value = '',
  final String? category,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// Whether both the label and the value are filled within their limits.
  bool get canSave =>
      label.trim().isNotEmpty &&
      label.length <= partnerFactLabelMaxLength &&
      value.trim().isNotEmpty &&
      value.length <= partnerFactValueMaxLength;

  PartnerProfileState copyWith({
    Resource<List<PartnerFact>>? facts,
    String? label,
    String? value,
    String? category,
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
