import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';

part 'together_state.dart';

class TogetherCubit({required final PairingRepository _pairingRepository})
    extends Cubit<TogetherState> {
  this : super(const TogetherState());

  /// Finds out whether the person has a partner; without one only their own things are shared.
  Future<void> load() async {
    try {
      final partner = await _pairingRepository.getPartner();
      emit(state.copyWith(hasPartner: partner != null));
    } on Object {
      // The hub still works without knowing; the note about a missing partner stays hidden.
      emit(state.copyWith(hasPartner: true));
    }
  }

  void onViewChanged(TogetherView view) => emit(state.copyWith(view: view));
}
