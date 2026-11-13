import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/together/data/models/ritual.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/services/ritual_reminder_service.dart';

part 'rituals_state.dart';

class RitualsCubit({
  required final TogetherRepository _togetherRepository,
  required final RitualReminderService _reminderService,
}) extends Cubit<RitualsState> {
  this : super(const RitualsState());

  /// Reads the rituals and keeps their local reminders in line; the list stays while it reloads.
  Future<void> load() async {
    if (state.rituals is! Success) emit(state.copyWith(rituals: const Loading()));
    try {
      final rituals = await _togetherRepository.getRituals();
      emit(state.copyWith(rituals: Success(rituals)));
      await _reminderService.update(rituals);
    } catch (exception) {
      if (state.rituals is Success) return;
      emit(state.copyWith(rituals: Failure.fromObject(exception)));
    }
  }

  /// Records that the ritual happened today and shows a warm confirmation; there is no streak.
  Future<void> complete(Ritual ritual) async {
    if (state.completeAction.isLoading) return;

    emit(state.copyWith(completeAction: const Loading()));
    try {
      await _togetherRepository.completeRitual(ritual.id, now: clock.now());
      emit(state.copyWith(completeAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(completeAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(completeAction: const Initial()));
  }
}
