import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

abstract final class HistoryDateFormatter() {
  static String formatFullDate(Translations$history$pt l10n, DateTime date) {
    final month = l10n.monthsLong[(date.month - 1).clamp(0, 11)];
    return l10n.fullDate(day: date.day, month: month, year: date.year);
  }

  static String formatMilestoneDate(
    Translations$history$pt l10n, {
    required DateTime? date,
    required MilestoneDatePrecision precision,
  }) {
    if (precision == MilestoneDatePrecision.unknown || date == null) {
      return l10n.unknownDateLabel;
    }
    final month = l10n.monthsShort[(date.month - 1).clamp(0, 11)];
    return switch (precision) {
      .day => l10n.shortDayMonthYear(day: date.day, month: month, year: date.year),
      .month => l10n.shortMonthYear(month: _capitalize(month), year: date.year),
      .year => date.year.toString(),
      .unknown => l10n.unknownDateLabel,
    };
  }

  static String formatMilestoneSubtitle(Translations$history$pt l10n, HistoryMilestone milestone) {
    final datePart = formatMilestoneDate(
      l10n,
      date: milestone.date,
      precision: milestone.precision,
    );
    final place = milestone.place?.trim();
    if (place != null && place.isNotEmpty) {
      return '$datePart · $place';
    }
    return datePart;
  }

  static String formatDurationHeadline(
    Translations$history$pt l10n,
    HistoryNumbers numbers, {
    bool inline = false,
  }) {
    final yearsUnit = numbers.years == 1 ? l10n.yearOne : l10n.yearMany;
    final monthsUnit = numbers.months == 1 ? l10n.monthOne : l10n.monthMany;
    final daysUnit = numbers.remainingDays == 1 ? l10n.dayOne : l10n.dayMany;

    if (numbers.years > 0) {
      return inline
          ? l10n.durationFullInline(
              years: numbers.years,
              yearsUnit: yearsUnit,
              months: numbers.months,
              monthsUnit: monthsUnit,
              days: numbers.remainingDays,
              daysUnit: daysUnit,
            )
          : l10n.durationFull(
              years: numbers.years,
              yearsUnit: yearsUnit,
              months: numbers.months,
              monthsUnit: monthsUnit,
              days: numbers.remainingDays,
              daysUnit: daysUnit,
            );
    }
    if (numbers.months > 0) {
      return l10n.durationMonthsDays(
        months: numbers.months,
        monthsUnit: monthsUnit,
        days: numbers.remainingDays,
        daysUnit: daysUnit,
      );
    }
    final totalDaysUnit = numbers.daysTogether == 1 ? l10n.dayOne : l10n.dayMany;
    return l10n.durationDaysOnly(days: numbers.daysTogether, daysUnit: totalDaysUnit);
  }

  static String _capitalize(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1);
  }
}
