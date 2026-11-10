import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/checkin/data/repositories/checkin_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';

part 'together_state.dart';

class TogetherCubit({
  required final PairingRepository _pairingRepository,
  required final CheckinRepository _checkinRepository,
}) extends Cubit<TogetherState> {
  this : super(const TogetherState());

  /// Finds out whether the person has a partner and whether this week's check-in was dismissed.
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

    emit(state.copyWith(hasPartner: hasPartner, showCheckin: showCheckin));
  }

  void onViewChanged(TogetherView view) => emit(state.copyWith(view: view));
}
