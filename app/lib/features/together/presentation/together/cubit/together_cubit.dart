import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/checkin/data/repositories/checkin_repository.dart';
import 'package:flutter_bloc_starter/features/gifts/data/repositories/gifts_repository.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/questions/data/repositories/questions_repository.dart';

part 'together_state.dart';

class TogetherCubit({
  required final PairingRepository _pairingRepository,
  required final CheckinRepository _checkinRepository,
  required final ListsRepository _listsRepository,
  required final QuestionsRepository _questionsRepository,
  required final ProfileRepository _profileRepository,
  required final GiftsRepository _giftsRepository,
}) extends Cubit<TogetherState> {
  this : super(const TogetherState()) {
    _profileChanges = _profileRepository.onChanged.listen((_) => load());
  }

  StreamSubscription<void>? _profileChanges;

  /// Finds the partner, the check-in entry, the list count and the current question title.
  Future<void> load() async {
    var hasPartner = true;
    try {
      hasPartner = (await _pairingRepository.getPartner()) != null;
    } on Object {
      // The hub still works without knowing; the note about a missing partner stays hidden.
    }

    var showCheckin = true;
    try {
      showCheckin = !(await _checkinRepository.isCurrentWeekDismissed());
    } on Object {
      // An unreadable dismissal shows the entry rather than hiding it.
    }

    var listCount = 0;
    try {
      listCount = (await _listsRepository.getLists()).length;
    } on Object {
      // An unreadable count leaves the entry without a number.
    }

    RelationshipPhase? phase;
    try {
      phase = (await _profileRepository.getMySettings()).phase;
    } on Object {
      // Without the phase the hub shows the default set of modules.
    }

    String? questionTitle;
    try {
      questionTitle = (await _questionsRepository.getPrompt()).title;
    } on Object {
      // The card falls back to its own title when the question cannot be read.
    }

    var sharedGiftCount = 0;
    try {
      sharedGiftCount = (await _giftsRepository.getGiftIdeas())
          .where((gift) => gift.isShared)
          .length;
    } on Object {
      // An unreadable count keeps the entry's neutral subtitle.
    }

    if (isClosed) return;
    emit(
      state.copyWith(
        hasPartner: hasPartner,
        showCheckin: showCheckin,
        listCount: listCount,
        questionTitle: questionTitle,
        phase: phase,
        sharedGiftCount: sharedGiftCount,
      ),
    );
  }

  void onViewChanged(TogetherView view) => emit(state.copyWith(view: view));

  @override
  Future<void> close() async {
    await _profileChanges?.cancel();

    return super.close();
  }
}
