import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/dates_models.dart';
import 'package:flutter_bloc_starter/features/dates/data/repositories/dates_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';

part 'day_state.dart';

/// What is relevant on one day: the dates that fall on it and the date ideas planned for it.
typedef DayContent = ({List<ImportantDate> dates, List<DateIdea> plans});

class DayCubit({
  required final DatesRepository _datesRepository,
  required final TogetherRepository _togetherRepository,
}) extends Cubit<DayState> {
  this : super(DayState(day: _today()));

  static DateTime _today() {
    final now = clock.now();

    return DateTime(now.year, now.month, now.day);
  }

  Future<void> load() async {
    emit(state.copyWith(content: const Loading()));
    try {
      final dates = await _datesRepository.getDates();
      final ideas = await _togetherRepository.getDateIdeas();
      emit(
        state.copyWith(
          content: Success((
            dates: [
              for (final date in dates)
                if (matchesDay(date, state.day)) date,
            ],
            plans: [
              for (final idea in ideas)
                if (idea.isPlanned && _isSameDay(idea.plannedFor, state.day)) idea,
            ],
          )),
        ),
      );
    } catch (exception) {
      emit(state.copyWith(content: Failure.fromObject(exception)));
    }
  }

  /// Moves to the day [delta] days away and reads what is relevant there.
  Future<void> move(int delta) {
    emit(state.copyWith(day: DateTime(state.day.year, state.day.month, state.day.day + delta)));

    return load();
  }

  static bool _isSameDay(DateTime? a, DateTime b) =>
      a != null && a.year == b.year && a.month == b.month && a.day == b.day;
}

/// Whether [date] falls on [day]; a yearly date matches in any year, a one-off only in its own.
bool matchesDay(ImportantDate date, DateTime day) {
  if (date.month != day.month || date.day != day.day) return false;

  return date.isYearly || date.year == null || date.year == day.year;
}
