import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/received_signal.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';

part 'received_signals_state.dart';

class ReceivedSignalsCubit({
  required final RepairRepository _repairRepository,
  required final ProfileRepository _profileRepository,
  required final RemindersRepository _remindersRepository,
  required final ReminderSyncService _syncService,
}) extends Cubit<ReceivedSignalsState> {
  this : super(const ReceivedSignalsState());

  Future<void> load() async {
    emit(state.copyWith(signals: const Loading()));
    try {
      final me = await _profileRepository.getMyProfile();
      emit(state.copyWith(signals: Success(await _repairRepository.getReceivedSignals(me.id))));
    } catch (exception) {
      emit(state.copyWith(signals: Failure.fromObject(exception)));
    }
  }

  /// Answers the signal on top, or only marks it seen when [response] is null.
  ///
  /// Answering "later" schedules a generic reminder so the person is not left to remember.
  Future<void> respond(ReceivedSignal signal, {String? response}) async {
    if (state.respondAction.isLoading) return;

    emit(state.copyWith(respondAction: const Loading()));
    try {
      await _repairRepository.respondToSignal(signalId: signal.id, response: response);
      if (response == 'later') await _scheduleReminder();
      final current = state.signals;
      if (current is Success<List<ReceivedSignal>>) {
        emit(
          state.copyWith(
            signals: Success([
              for (final item in current.value)
                if (item.id != signal.id) item,
            ]),
            answeredCount: state.answeredCount + 1,
          ),
        );
      }
    } catch (exception) {
      emit(state.copyWith(respondAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(respondAction: const Initial()));
  }

  Future<void> _scheduleReminder() async {
    final now = DateTime.now();
    final tonight = DateTime(now.year, now.month, now.day, reminderHour);
    final at = tonight.isAfter(now.add(const Duration(minutes: 30)))
        ? tonight
        : tonight.add(const Duration(days: 1));
    await _remindersRepository.addFollowUp(at, now: now);
    await _syncService.sync();
  }
}
