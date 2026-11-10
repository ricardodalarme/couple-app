part of 'sunday_card_cubit.dart';

final class const SundayCardState({
  final Resource<SundayCard> card = const Loading(),
  final SundayCard? draft,
  final String? selfName,
  final String? partnerName,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// Whether the person is changing the card.
  bool get isEditing => draft != null;

  SundayCardState copyWith({
    Resource<SundayCard>? card,
    SundayCard? draft,
    bool clearDraft = false,
    String? selfName,
    String? partnerName,
    Resource<void>? saveAction,
  }) {
    return SundayCardState(
      card: card ?? this.card,
      draft: clearDraft ? null : draft ?? this.draft,
      selfName: selfName ?? this.selfName,
      partnerName: partnerName ?? this.partnerName,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [card, draft, selfName, partnerName, saveAction];
}
