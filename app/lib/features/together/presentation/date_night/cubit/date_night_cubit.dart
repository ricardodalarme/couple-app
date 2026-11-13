import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:uuid/uuid.dart';

part 'date_night_state.dart';

/// When a date can be planned, offered as simple choices.
enum PlanChoice() {
  today,
  tomorrow,
  saturday,
  sunday,
}

/// The day for [choice] counted from [now]; a weekday that is today moves a week ahead.
DateTime planDay(PlanChoice choice, DateTime now) {
  final today = DateTime(now.year, now.month, now.day);
  int ahead(int weekday) {
    final days = (weekday - today.weekday) % 7;

    return days == 0 ? 7 : days;
  }

  return switch (choice) {
    PlanChoice.today => today,
    PlanChoice.tomorrow => today.add(const Duration(days: 1)),
    PlanChoice.saturday => today.add(Duration(days: ahead(DateTime.saturday))),
    PlanChoice.sunday => today.add(Duration(days: ahead(DateTime.sunday))),
  };
}

class DateNightCubit({
  required final TogetherRepository _togetherRepository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<DateNightState> {
  this : super(const DateNightState());

  final Uuid _uuid = const Uuid();

  /// Reads the couple's ideas; with none yet, a few editorial ones are offered.
  Future<void> load() async {
    if (state.ideas is! Success) emit(state.copyWith(ideas: const Loading()));
    try {
      final ideas = await _togetherRepository.getDateIdeas();
      emit(state.copyWith(ideas: Success(ideas)));
      if (ideas.isEmpty && state.suggestions.isEmpty) await _loadSuggestions();
    } catch (exception) {
      if (state.ideas is Success) return;
      emit(state.copyWith(ideas: Failure.fromObject(exception)));
    }
  }

  void onTitleChanged(String title) => emit(state.copyWith(title: title));

  /// Saves the typed idea, or the editorial one named by [suggestion].
  Future<void> add({DateIdeaSuggestion? suggestion}) async {
    final title = suggestion?.title ?? state.title;
    if (title.trim().isEmpty || title.length > dateIdeaTitleMaxLength) return;
    if (state.addAction.isLoading) return;

    emit(state.copyWith(addAction: const Loading()));
    try {
      await _togetherRepository.addDateIdea(id: _uuid.v4(), title: title, slug: suggestion?.slug);
      emit(state.copyWith(title: '', addAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(addAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(addAction: const Initial()));
  }

  /// Plans [idea] for [choice], which also adds the shared date with its reminder.
  Future<void> plan(DateIdea idea, PlanChoice choice) =>
      _change(() => _togetherRepository.planDateIdea(idea, day: planDay(choice, clock.now())));

  Future<void> toggleDone(DateIdea idea) =>
      _change(() => _togetherRepository.setDateIdeaDone(id: idea.id, isDone: !idea.isDone));

  Future<void> delete(DateIdea idea) => _change(() => _togetherRepository.deleteDateIdea(idea.id));

  Future<void> _loadSuggestions() async {
    try {
      final settings = await _profileRepository.getMySettings();
      final suggestions = await _togetherRepository.getDateIdeaSuggestions(settings.locale);
      emit(state.copyWith(suggestions: suggestions));
    } on Object {
      // Suggestions are a bonus; an empty state without them is still honest.
    }
  }

  Future<void> _change(Future<void> Function() action) async {
    try {
      await action();
      await load();
    } catch (exception) {
      emit(state.copyWith(changeAction: Failure.fromObject(exception)));
      emit(state.copyWith(changeAction: const Initial()));
    }
  }
}
