import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_stats_row.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  const surfaceWidth = 390.0;
  const slotWidth = (surfaceWidth - 2 * AppSpace.s8) / 3;

  HistoryNumbers numbersFor(List<String> places, {required DateTime since}) =>
      HistoryNumbers.compute(togetherSince: since, now: DateTime(2026, 11, 8), places: places);

  final longHistory = [
    numbersFor(const [], since: DateTime(2024, 3, 14)),
    numbersFor(const ['Paraty', 'Lisboa'], since: DateTime(2024, 3, 14)),
  ];
  final shortHistory = [
    numbersFor(const [], since: DateTime(2026, 9, 1)),
    numbersFor(const ['Paraty', 'Lisboa'], since: DateTime(2026, 9, 1)),
  ];

  Future<List<Size>> pumpCards(
    WidgetTester tester,
    HistoryNumbers numbers, {
    required double scale,
  }) async {
    await tester.pumpApp(
      Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(scale)),
          child: HistoryStatsRow(numbers: numbers, onNumbersTap: () {}),
        ),
      ),
    );

    final l10n = tester.element(find.byType(HistoryStatsRow)).l10n.history;
    final labels = [
      l10n.statDays(count: numbers.daysTogether),
      l10n.statWeekends(count: numbers.weekendsTogether),
      if (numbers.placesCount > 0)
        l10n.statPlaces(count: numbers.placesCount)
      else
        l10n.statChristmases(count: numbers.christmasesTogether),
    ];

    return [
      for (final label in labels)
        tester.getSize(find.ancestor(of: find.text(label), matching: find.byType(Container)).first),
    ];
  }

  Future<void> pump390(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(surfaceWidth, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
  }

  testWidgets('the three stat cards share one width at every text scale', (tester) async {
    await pump390(tester);

    for (final scale in [1.0, 1.3, 2.0]) {
      for (final numbers in longHistory) {
        final sizes = await pumpCards(tester, numbers, scale: scale);

        for (final size in sizes) {
          expect(
            size.width,
            moreOrLessEquals(slotWidth, epsilon: .001),
            reason: 'at ${scale}x with ${numbers.placesCount} places',
          );
        }
      }
    }
  });

  testWidgets('the three stat cards share one size while their values fit one line', (
    tester,
  ) async {
    await pump390(tester);

    for (final scale in [1.0, 1.3, 2.0]) {
      for (final numbers in shortHistory) {
        final sizes = await pumpCards(tester, numbers, scale: scale);
        final reason = 'at ${scale}x with ${numbers.placesCount} places';

        expect(sizes[1], sizes[0], reason: reason);
        expect(sizes[2], sizes[0], reason: reason);
      }
    }
  });
}
