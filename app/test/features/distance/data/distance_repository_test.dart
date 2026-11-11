import 'package:flutter_bloc_starter/features/dates/data/models/dates_models.dart';
import 'package:flutter_bloc_starter/features/dates/data/repositories/dates_repository.dart';
import 'package:flutter_bloc_starter/features/distance/data/data_sources/distance_data_source.dart';
import 'package:flutter_bloc_starter/features/distance/data/models/distance_info.dart';
import 'package:flutter_bloc_starter/features/distance/data/repositories/distance_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDataSource() extends Mock implements DistanceDataSource;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockDatesRepository() extends Mock implements DatesRepository;

void main() {
  late DistanceDataSource dataSource;
  late ProfileRepository profileRepository;
  late DatesRepository datesRepository;

  setUp(() {
    dataSource = _MockDataSource();
    profileRepository = _MockProfileRepository();
    datesRepository = _MockDatesRepository();
    when(
      () => profileRepository.getMySettings(),
    ).thenAnswer((_) async => const AccountSettings(theme: .rose, timeZone: 'America/Sao_Paulo'));
    when(() => dataSource.getPartnerTimeZone()).thenAnswer((_) async => 'Europe/Lisbon');
    when(() => datesRepository.getDates()).thenAnswer((_) async => const []);
  });

  DistanceRepository build() => DistanceRepository(
    dataSource: dataSource,
    profileRepository: profileRepository,
    datesRepository: datesRepository,
  );

  test('each person keeps their own clock', () async {
    final info = await build().getDistance(now: DateTime.utc(2026, 11, 11, 22, 40));

    expect(info.own.time.hour, 19);
    expect(info.partner!.time.hour, 22);
    expect(info.hasDifferentZones, isTrue);
  });

  test('the nearest reunion date sets the countdown', () async {
    when(() => datesRepository.getDates()).thenAnswer(
      (_) async => const [
        ImportantDate(id: 'a', title: 'Natal', kind: 'reunion', month: 12, day: 23, year: 2026),
        ImportantDate(id: 'b', title: 'Depois', kind: 'reunion', month: 1, day: 5, year: 2027),
        ImportantDate(id: 'c', title: 'Festa', kind: 'birthday', month: 11, day: 12),
      ],
    );

    final info = await build().getDistance(now: DateTime(2026, 11, 11, 12));

    expect(info.daysToReunion, 42);
    expect(info.reunionTitle, 'Natal');
  });

  test('a saved one-off reunion sets the countdown', () async {
    when(() => datesRepository.getDates()).thenAnswer(
      (_) async => const [
        ImportantDate(
          id: 'r',
          title: 'Reencontro',
          kind: 'reunion',
          month: 12,
          day: 23,
          year: 2026,
          isYearly: false,
        ),
      ],
    );

    final info = await build().getDistance(now: DateTime(2026, 11, 11, 12));

    expect(info.daysToReunion, 42);
    expect(info.reunionTitle, 'Reencontro');
  });

  test('a daylight-saving change does not shift the day count', () async {
    when(() => datesRepository.getDates()).thenAnswer(
      (_) async => const [
        ImportantDate(
          id: 'r',
          title: 'Reencontro',
          kind: 'reunion',
          month: 3,
          day: 9,
          year: 2026,
          isYearly: false,
        ),
      ],
    );

    final info = await build().getDistance(now: DateTime(2026, 3, 7, 12));

    expect(info.daysToReunion, 2);
    expect(info.nextReunion, DateTime.utc(2026, 3, 9));
  });

  test('without a partner there is only one clock', () async {
    when(() => dataSource.getPartnerTimeZone()).thenAnswer((_) async => null);

    final info = await build().getDistance();

    expect(info.partner, isNull);
  });

  test('a one-off date in the past is ignored and a yearly one rolls forward', () {
    final today = DateTime(2026, 11, 11);

    expect(nextOccurrence(month: 3, day: 1, year: 2026, isYearly: false, today: today), isNull);
    expect(
      nextOccurrence(month: 3, day: 1, year: 2020, isYearly: true, today: today),
      DateTime.utc(2027, 3),
    );
  });
}
