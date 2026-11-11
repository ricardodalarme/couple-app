import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/dates_models.dart';
import 'package:flutter_bloc_starter/features/dates/data/repositories/dates_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:uuid/uuid.dart';

part 'dates_state.dart';

/// The three views of the dates screen.
enum DatesView() {
  dates,
  gifts,
  holidays,
}

class DatesCubit({
  required final DatesRepository _datesRepository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<DatesState> {
  this : super(const DatesState());

  final Uuid _uuid = const Uuid();

  void onViewChanged(DatesView view) => emit(state.copyWith(view: view));

  /// Reads the dates and gift ideas; holidays are read once.
  Future<void> load() async {
    if (state.dates is! Success) emit(state.copyWith(dates: const Loading()));
    if (state.gifts is! Success) emit(state.copyWith(gifts: const Loading()));
    try {
      emit(state.copyWith(dates: Success(await _datesRepository.getDates())));
    } catch (exception) {
      if (state.dates is! Success) emit(state.copyWith(dates: Failure.fromObject(exception)));
    }
    try {
      emit(state.copyWith(gifts: Success(await _datesRepository.getGiftIdeas())));
    } catch (exception) {
      if (state.gifts is! Success) emit(state.copyWith(gifts: Failure.fromObject(exception)));
    }
    if (state.holidays is! Success) await _loadHolidays();
  }

  void onTitleChanged(String title) => emit(state.copyWith(title: title));

  void onKindChosen(String kind) => emit(state.copyWith(kind: kind));

  void onMonthChosen(int month) => emit(state.copyWith(month: month));

  void onDayChosen(int day) => emit(state.copyWith(day: day));

  void onYearChanged(String year) => emit(state.copyWith(year: year));

  void onGiftTitleChanged(String title) => emit(state.copyWith(giftTitle: title));

  /// Saves the date being typed; an unknown year still repeats every year.
  ///
  /// A reunion is a single meeting, so it never repeats yearly.
  Future<void> saveDate() async {
    if (!state.canSaveDate || state.saveAction.isLoading) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _datesRepository.addDate(
        id: _uuid.v4(),
        title: state.title,
        kind: state.kind,
        month: state.month!,
        day: state.day!,
        year: state.yearValue,
        isYearly: state.kind != 'reunion',
      );
      emit(state.copyWith(title: '', year: '', saveAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }

  Future<void> addHoliday(Holiday holiday) => _change(
    () => _datesRepository.addDate(
      id: _uuid.v4(),
      title: holiday.title,
      kind: 'holiday',
      month: holiday.month,
      day: holiday.day,
      holidayKey: holiday.slug,
    ),
  );

  Future<void> deleteDate(ImportantDate date) =>
      _change(() => _datesRepository.deleteDate(date.id));

  Future<void> addGift() async {
    final title = state.giftTitle;
    if (title.trim().isEmpty || title.length > dateTitleMaxLength) return;

    await _change(() => _datesRepository.addGiftIdea(id: _uuid.v4(), title: title));
    emit(state.copyWith(giftTitle: ''));
  }

  Future<void> toggleGift(GiftIdea gift) =>
      _change(() => _datesRepository.setGiftGiven(id: gift.id, isGiven: !gift.isGiven));

  Future<void> deleteGift(GiftIdea gift) => _change(() => _datesRepository.deleteGiftIdea(gift.id));

  Future<void> _loadHolidays() async {
    try {
      final settings = await _profileRepository.getMySettings();
      emit(state.copyWith(holidays: Success(await _datesRepository.getHolidays(settings.locale))));
    } catch (exception) {
      emit(state.copyWith(holidays: Failure.fromObject(exception)));
    }
  }

  Future<void> _change(Future<void> Function() action) async {
    try {
      await action();
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }
}
