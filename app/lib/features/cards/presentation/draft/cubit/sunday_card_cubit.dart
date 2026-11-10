import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

part 'sunday_card_state.dart';

/// The longest closing note a card accepts.
const int cardNoteMaxLength = 200;

class SundayCardCubit({
  required final CardsRepository _cardsRepository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<SundayCardState> {
  this : super(const SundayCardState());

  Future<void> load() async {
    if (state.card is! Success) emit(state.copyWith(card: const Loading()));
    final names = await _readNames();
    try {
      final card = await _cardsRepository.getDraft();
      emit(state.copyWith(card: Success(card), selfName: names.self, partnerName: names.partner));
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

  Future<({String? self, String? partner})> _readNames() async {
    var self = state.selfName;
    var partner = state.partnerName;
    try {
      self ??= (await _profileRepository.getMyProfile()).displayName;
      partner ??= (await _profileRepository.getMySettings()).partnerName;
    } on Object {
      // The card still renders without the names.
    }

    return (self: self, partner: partner);
  }
}
