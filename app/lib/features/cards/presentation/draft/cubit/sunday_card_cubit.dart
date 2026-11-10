import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

part 'sunday_card_state.dart';

/// The longest closing note a card accepts.
const int cardNoteMaxLength = 200;

class SundayCardCubit({
  required final CardsRepository _cardsRepository,
  required final ProfileRepository _profileRepository,
  required final PairingRepository _pairingRepository,
}) extends Cubit<SundayCardState> {
  this : super(const SundayCardState());

  Future<void> load() async {
    if (state.card is! Success) emit(state.copyWith(card: const Loading()));
    final names = await _readNames();
    try {
      final card = await _cardsRepository.getDraft();
      emit(
        state.copyWith(
          card: Success(card),
          selfName: names.self,
          partnerName: names.partner,
          isPaired: names.isPaired,
        ),
      );
    } catch (exception) {
      if (state.card is Success) return;
      emit(state.copyWith(card: Failure.fromObject(exception)));
    }
  }

  void startEditing() {
    final card = state.card;
    if (card is Success<SundayCard> && card.value.isDraft) {
      emit(state.copyWith(draft: card.value));
    }
  }

  void cancelEditing() => emit(state.copyWith(clearDraft: true));

  void removeItem(int index) {
    final draft = state.draft;
    if (draft == null || index < 0 || index >= draft.items.length) return;

    emit(state.copyWith(draft: draft.copyWith(items: [...draft.items]..removeAt(index))));
  }

  /// Moves an item one place up (`-1`) or down (`1`).
  void moveItem(int index, int delta) {
    final draft = state.draft;
    final target = index + delta;
    if (draft == null || index < 0 || target < 0) return;
    if (index >= draft.items.length || target >= draft.items.length) return;

    final items = [...draft.items];
    final moved = items.removeAt(index);
    items.insert(target, moved);
    emit(state.copyWith(draft: draft.copyWith(items: items)));
  }

  void onNoteChanged(String note) {
    final draft = state.draft;
    if (draft == null) return;

    emit(
      state.copyWith(
        draft: draft.copyWith(
          note: note.length > cardNoteMaxLength ? note.substring(0, cardNoteMaxLength) : note,
        ),
      ),
    );
  }

  Future<void> save() async {
    final draft = state.draft;
    if (draft == null || state.saveAction.isLoading) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      final saved = await _cardsRepository.saveDraft(draft);
      emit(state.copyWith(card: Success(saved), clearDraft: true, saveAction: const Success(null)));
      emit(state.copyWith(saveAction: const Initial()));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  /// Sends the card to the connected partner. A double tap sends once.
  Future<void> send() => _deliver((card) => _cardsRepository.send(card.id));

  /// Keeps the card for later; it can still be sent until the week ends.
  Future<void> hold() => _deliver((card) => _cardsRepository.hold(card.id));

  Future<void> _deliver(Future<SundayCard> Function(SundayCard card) action) async {
    final current = state.card;
    if (current is! Success<SundayCard> || state.deliverAction.isLoading) return;
    if (current.value.isSent) return;

    emit(state.copyWith(deliverAction: const Loading(), clearDraft: true));
    try {
      final card = await action(current.value);
      emit(state.copyWith(card: Success(card), deliverAction: const Success(null)));
      emit(state.copyWith(deliverAction: const Initial()));
    } catch (exception) {
      emit(state.copyWith(deliverAction: Failure.fromObject(exception)));
      emit(state.copyWith(deliverAction: const Initial()));
    }
  }

  Future<({String? self, String? partner, bool isPaired})> _readNames() async {
    var self = state.selfName;
    var partner = state.partnerName;
    var isPaired = false;
    try {
      self ??= (await _profileRepository.getMyProfile()).displayName;
      final partnerProfile = await _pairingRepository.getPartner();
      isPaired = partnerProfile != null;
      partner ??=
          partnerProfile?.displayName ?? (await _profileRepository.getMySettings()).partnerName;
    } on Object {
      // The card still renders without the names.
    }

    return (self: self, partner: partner, isPaired: isPaired);
  }
}
