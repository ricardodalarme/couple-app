import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/partner_mood.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/queries/generated/TodayHome.graphql.dart';
import 'package:flutter_bloc_starter/features/today/data/mappers/today_home_mapper.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PartnerMood', () {
    test('maps the shared mood and need', () {
      final node = QueryTodayHomepartnerMoodToday(
        day: DateTime(2026, 11, 10),
        mood: 'tired',
        need: 'hug',
      );

      final partnerMood = node.toPartnerMood();

      expect(partnerMood.day, DateTime(2026, 11, 10));
      expect(partnerMood.mood, MoodKind.tired);
      expect(partnerMood.need, NeedKind.hug);
      expect(partnerMood.isVisible, isTrue);
    });

    test('a mood shared without the need has no need line', () {
      final node = QueryTodayHomepartnerMoodToday(mood: 'happy', need: null);

      final partnerMood = node.toPartnerMood();

      expect(partnerMood.mood, MoodKind.happy);
      expect(partnerMood.need, isNull);
    });

    test('an unknown mood stays hidden', () {
      final partnerMood = QueryTodayHomepartnerMoodToday(mood: 'dreamy').toPartnerMood();

      expect(partnerMood.isVisible, isFalse);
    });

    test("yesterday's shared mood is hidden from Hoje", () {
      final model = QueryTodayHome(
        today: QueryTodayHometoday(localDate: DateTime(2026, 11, 10)),
        partnerMoodToday: QueryTodayHomepartnerMoodToday(day: DateTime(2026, 11, 9), mood: 'tired'),
      ).toModel();

      expect(model?.partnerMood, isNull);
    });

    test("today's shared mood is shown", () {
      final model = QueryTodayHome(
        today: QueryTodayHometoday(localDate: DateTime(2026, 11, 10)),
        partnerMoodToday: QueryTodayHomepartnerMoodToday(
          day: DateTime(2026, 11, 10),
          mood: 'tired',
        ),
      ).toModel();

      expect(model?.partnerMood?.mood, MoodKind.tired);
    });

    test('the Hoje cache keeps the local date but never the partner mood', () {
      final home = TodayHome(
        isPaired: true,
        unopenedCards: 0,
        slipsThisWeek: 0,
        slipsTotal: 0,
        hasPendingInvite: false,
        hasPlus: false,
        partnerName: 'Rui',
        localDate: DateTime(2026, 11, 10),
        partnerMood: PartnerMood(
          day: DateTime(2026, 11, 10),
          mood: MoodKind.loving,
          need: NeedKind.space,
        ),
      );

      final cached = TodayHome.fromMap(home.toMap());

      expect(cached.localDate, DateTime(2026, 11, 10));
      expect(cached.partnerMood, isNull);
    });
  });
}
