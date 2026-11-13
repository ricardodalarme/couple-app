import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/guided_session.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/repair_path.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:uuid/uuid.dart';

part 'guided_repair_state.dart';

/// When a follow-up check-in can be scheduled after a repair.
enum FollowUp() {
  none,
  tomorrow,
  inThreeDays,
}

class GuidedRepairCubit({
  required final RepairRepository _repairRepository,
  required final RemindersRepository _remindersRepository,
  required final ReminderSyncService _syncService,
}) extends Cubit<GuidedRepairState> {
  this : super(const GuidedRepairState());

  final Uuid _uuid = const Uuid();

  /// Resumes the unfinished guided repair, or starts a new one.
  Future<void> load() async {
    emit(state.copyWith(session: const Loading()));
    try {
      var session = await _repairRepository.openGuidedSession();
      if (session == null) {
        final id = _uuid.v4();
        await _repairRepository.startSession(id: id, path: RepairPath.guided);
        session = GuidedSession(id: id);
      }
      emit(state.copyWith(session: Success(session)));
    } catch (exception) {
      emit(state.copyWith(session: Failure.fromObject(exception)));
    }
  }

  void onAnswerChanged(String text) {
    final session = state.current;
    if (session == null || session.step >= guidedWrittenSteps) return;

    final answers = [...session.answers]..[session.step] = text;
    emit(state.copyWith(session: Success(session.copyWith(answers: answers))));
  }

  /// Saves the step and moves on; a step may stay empty.
  Future<void> next() => _move(1);

  Future<void> back() => _move(-1);

  /// Saves where the person is so the repair can be resumed later; nothing reaches the partner.
  Future<void> saveForLater() async {
    final session = state.current;
    if (session == null) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _repairRepository.saveProgress(session);
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }

  void onFeelingChosen(String feeling) => emit(state.copyWith(feeling: feeling));

  void onFollowUpChosen(FollowUp followUp) => emit(state.copyWith(followUp: followUp));

  /// Closes the repair and, when asked, schedules the generic follow-up reminder.
  Future<void> finish() async {
    final session = state.current;
    if (session == null || state.completeAction.isLoading) return;

    emit(state.copyWith(completeAction: const Loading()));
    try {
      final now = clock.now();
      await _repairRepository.completeSession(id: session.id, now: now, feeling: state.feeling);
      if (state.followUp != FollowUp.none) {
        final days = state.followUp == FollowUp.tomorrow ? 1 : 3;
        final day = now.add(Duration(days: days));
        await _remindersRepository.addFollowUp(
          DateTime(day.year, day.month, day.day, reminderHour),
          now: now,
        );
        await _syncService.sync();
      }
      emit(state.copyWith(completeAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(completeAction: Failure.fromObject(exception)));
      emit(state.copyWith(completeAction: const Initial()));
    }
  }

  Future<void> _move(int delta) async {
    final session = state.current;
    if (session == null || state.saveAction.isLoading) return;

    final step = (session.step + delta).clamp(0, guidedWrittenSteps);
    if (step == session.step) return;

    final moved = session.copyWith(step: step);
    emit(state.copyWith(session: Success(moved), saveAction: const Loading()));
    try {
      await _repairRepository.saveProgress(moved);
      emit(state.copyWith(saveAction: const Initial()));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }
}
