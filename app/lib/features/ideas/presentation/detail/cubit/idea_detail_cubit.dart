import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/ideas/data/models/idea.dart';
import 'package:flutter_bloc_starter/features/ideas/data/repositories/ideas_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';

part 'idea_detail_state.dart';

/// When a reminder for an idea can be set.
enum ReminderChoice() {
  tonight,
  tomorrow,
  weekend,
}

/// The moment each [ReminderChoice] means, always in the future.
DateTime reminderMoment(ReminderChoice choice, DateTime now) {
  DateTime at(DateTime day, int hour) => DateTime(day.year, day.month, day.day, hour);

  switch (choice) {
    case ReminderChoice.tonight:
      final tonight = at(now, 20);

      return tonight.isAfter(now) ? tonight : at(now.add(const Duration(days: 1)), 20);
    case ReminderChoice.tomorrow:
      return at(now.add(const Duration(days: 1)), 9);
    case ReminderChoice.weekend:
      final daysToSaturday = (DateTime.saturday - now.weekday) % 7;
      final saturday = at(now.add(Duration(days: daysToSaturday)), 10);

      return saturday.isAfter(now) ? saturday : at(saturday.add(const Duration(days: 7)), 10);
  }
}

class IdeaDetailCubit({
  required final IdeasRepository _ideasRepository,
  required final ProfileRepository _profileRepository,
  required final RemindersRepository _remindersRepository,
  required final ReminderSyncService _reminderSyncService,
  required final NotificationsRepository _notificationsRepository,
}) extends Cubit<IdeaDetailState> {
  this : super(const IdeaDetailState());

  /// Loads the ideas and shows the one with [slug], or the first when it is not in the list.
  Future<void> load(String? slug) async {
    emit(state.copyWith(ideas: const Loading()));
    try {
      final settings = await _profileRepository.getMySettings();
      final ideas = await _ideasRepository.getIdeas(settings.locale);
      final found = ideas.indexWhere((idea) => idea.slug == slug);
      final index = found < 0 ? 0 : found;
      emit(
        state.copyWith(
          ideas: Success(ideas),
          index: index,
          phase: settings.phase,
          goals: settings.goals,
          isDone: ideas.isNotEmpty && _ideasRepository.isDone(ideas[index].slug),
        ),
      );
    } catch (exception) {
      emit(state.copyWith(ideas: Failure.fromObject(exception)));
    }
  }

  /// Shows the next idea; after the last one the list starts again, never an empty end.
  void another() {
    final ideas = state.ideas;
    if (ideas is! Success<List<Idea>> || ideas.value.length < 2) return;

    final index = (state.index + 1) % ideas.value.length;
    emit(state.copyWith(index: index, isDone: _ideasRepository.isDone(ideas.value[index].slug)));
  }

  /// Marks the idea as done. Marking it again changes nothing.
  Future<void> markDone() async {
    final idea = state.current;
    if (idea == null || state.isDone) return;

    await _ideasRepository.markDone(idea.slug);
    emit(state.copyWith(isDone: true));
  }

  /// Sets a local reminder. It is kept even when notifications are off.
  Future<void> remindLater(ReminderChoice choice) async {
    final now = clock.now();
    try {
      await _remindersRepository.addCustomReminder(reminderMoment(choice, now), now: now);
      await _reminderSyncService.sync(now: now);
      emit(state.copyWith(reminderAction: Success(choice)));
      emit(state.copyWith(reminderAction: const Initial()));
    } catch (exception) {
      emit(state.copyWith(reminderAction: Failure.fromObject(exception)));
      emit(state.copyWith(reminderAction: const Initial()));
    }
  }

  /// Whether the device would actually show a reminder.
  Future<bool> canNotify() async =>
      await _notificationsRepository.currentAccess() == NotificationAccess.granted;
}
