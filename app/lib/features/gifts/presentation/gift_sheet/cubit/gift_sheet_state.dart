part of 'gift_sheet_cubit.dart';

final class const GiftSheetState({
  final FormInput<String> title = const FormInput(''),
  final FormInput<String> note = const FormInput(''),
  final GiftBudget? budget,
  final bool isShared = false,
  final bool isEditing = false,
  final bool hasPartner = false,
}) with Equatable {
  GiftSheetState copyWith({
    FormInput<String>? title,
    FormInput<String>? note,
    GiftBudget? budget,
    bool clearBudget = false,
    bool? isShared,
    bool? isEditing,
    bool? hasPartner,
  }) => GiftSheetState(
    title: title ?? this.title,
    note: note ?? this.note,
    budget: clearBudget ? null : budget ?? this.budget,
    isShared: isShared ?? this.isShared,
    isEditing: isEditing ?? this.isEditing,
    hasPartner: hasPartner ?? this.hasPartner,
  );

  @override
  List<Object?> get props => [title, note, budget, isShared, isEditing, hasPartner];
}
