import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/dates_models.dart';
import 'package:flutter_bloc_starter/features/dates/data/repositories/dates_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_bloc_starter/features/together/presentation/day/cubit/day_cubit.dart';
import 'package:flutter_bloc_starter/features/together/presentation/help/cubit/help_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockTogetherRepository() extends Mock implements TogetherRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockDatesRepository() extends Mock implements DatesRepository;

void main() {
  late TogetherRepository together;
  late ProfileRepository profile;
  late DatesRepository dates;

  const tips = [
    HelpItem(slug: 'a', title: 'Faça um chá'),
    HelpItem(slug: 'b', title: 'Mande uma mensagem'),
    HelpItem(slug: 'c', title: 'Ouça sem resolver'),
    HelpItem(slug: 'd', title: 'Abrace'),
  ];

  setUp(() {
    together = _MockTogetherRepository();
    profile = _MockProfileRepository();
    dates = _MockDatesRepository();
    when(() => profile.getMySettings())
        .thenAnswer((_) async => const AccountSettings(theme: .rose, locale: 'en'));
    when(
      () => together.getHelpContent(
        kind: any(named: 'kind'),
        locale: any(named: 'locale'),
      ),
    ).thenAnswer((_) async => tips);
  });

  group('HelpCubit', () {
    HelpCubit build() => HelpCubit(togetherRepository: together, profileRepository: profile);

    test('load reads the content kind in the person language', () async {
      final cubit = build();

      await cubit.load('mood_tip');

      verify(() => together.getHelpContent(kind: 'mood_tip', locale: 'en')).called(1);
      expect((cubit.state.items as Success<List<HelpItem>>).value, tips);
    });

    test('next wraps around the openers', () async {
      final cubit = build();
      await cubit.load('question');

      for (var i = 0; i < tips.length; i++) {
        cubit.next();
      }

      expect(cubit.state.index, 0);
    });

    test('a failed load ends as a failure', () async {
      when(
        () => together.getHelpContent(
          kind: any(named: 'kind'),
          locale: any(named: 'locale'),
        ),
      ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
      final cubit = build();

      await cubit.load('question');

      expect(cubit.state.items, isA<Failure>());
    });
  });

  group('matchesDay', () {
    const birthday = ImportantDate(
      id: 'b',
      title: 'Aniversário',
      kind: 'birthday',
      month: 5,
      day: 12,
    );

    test('a yearly date matches in any year', () {
      expect(matchesDay(birthday, DateTime(2027, 5, 12)), isTrue);
      expect(matchesDay(birthday, DateTime(2027, 5, 13)), isFalse);
    });

    test('a one-off date only matches its own year', () {
      const trip = ImportantDate(
        id: 't',
        title: 'Viagem',
        kind: 'trip',
        month: 7,
        day: 1,
        year: 2026,
        isYearly: false,
      );

      expect(matchesDay(trip, DateTime(2026, 7, 1)), isTrue);
      expect(matchesDay(trip, DateTime(2027, 7, 1)), isFalse);
    });
  });

  group('DayCubit', () {
    test('lists the dates and planned ideas of the day and moves between days', () async {
      when(() => dates.getDates()).thenAnswer(
        (_) async => const [
          ImportantDate(id: 'b', title: 'Aniversário', kind: 'birthday', month: 5, day: 12),
        ],
      );
      when(() => together.getDateIdeas()).thenAnswer(
        (_) async => [
          DateIdea(
            id: 'i',
            title: 'Piquenique',
            status: 'planned',
            plannedFor: DateTime(2026, 5, 12),
          ),
        ],
      );
      final cubit = DayCubit(datesRepository: dates, togetherRepository: together);
      await cubit.move(0);
      // Jump to the day the fixtures fall on.
      final target = DateTime(2026, 5, 12);
      await cubit.move(target.difference(cubit.state.day).inDays);

      final content = (cubit.state.content as Success<DayContent>).value;
      expect(content.dates.single.title, 'Aniversário');
      expect(content.plans.single.title, 'Piquenique');

      await cubit.move(1);
      final next = (cubit.state.content as Success<DayContent>).value;
      expect(next.dates, isEmpty);
      expect(next.plans, isEmpty);
    });
  });
}
