import 'package:equatable/equatable.dart';

/// The clock of one person in their own time zone.
final class const ZoneClock({required final String zone, required final DateTime time})
    with Equatable {
  /// The city part of an IANA name, for example `Sao Paulo` for `America/Sao_Paulo`.
  String get city => zone.split('/').last.replaceAll('_', ' ');

  @override
  List<Object?> get props => [zone, time];
}

/// The two clocks of a long-distance couple and the next time they meet.
final class const DistanceInfo({
  required final ZoneClock own,
  final ZoneClock? partner,
  final DateTime? nextReunion,
  final int? daysToReunion,
  final String? reunionTitle,
}) with Equatable {
  factory fake() => DistanceInfo(
    own: ZoneClock(zone: 'America/Sao_Paulo', time: DateTime(2026, 11, 11, 19, 40)),
    partner: ZoneClock(zone: 'Europe/Lisbon', time: DateTime(2026, 11, 11, 22, 40)),
    nextReunion: DateTime(2026, 12, 23),
    daysToReunion: 42,
    reunionTitle: 'Viagem',
  );

  /// Whether the two people are on different clocks, so both must be labeled.
  bool get hasDifferentZones => partner != null && partner!.zone != own.zone;

  @override
  List<Object?> get props => [own, partner, nextReunion, daysToReunion, reunionTitle];
}

/// The next day on or after [today] that a date falls on, or null when a one-off date has passed.
DateTime? nextOccurrence({
  required int month,
  required int day,
  required int? year,
  required bool isYearly,
  required DateTime today,
}) {
  final start = DateTime(today.year, today.month, today.day);
  if (!isYearly && year != null) {
    final date = DateTime(year, month, day);

    return date.isBefore(start) ? null : date;
  }
  var candidate = DateTime(start.year, month, day);
  if (candidate.isBefore(start)) candidate = DateTime(start.year + 1, month, day);

  return candidate;
}
