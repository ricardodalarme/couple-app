import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/widgets/today_header.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  const home = TodayHome(
    isPaired: true,
    unopenedCards: 0,
    slipsThisWeek: 2,
    slipsTotal: 2,
    hasPendingInvite: false,
    hasPlus: false,
    partnerName: 'Rui',
  );

  testWidgets('the greeting uses the title scale with a time-of-day glyph', (tester) async {
    final now = DateTime.now();
    final l10n = Translations();
    final greeting = switch (now.hour) {
      < 12 => l10n.today.greetingMorning(name: 'Ana'),
      < 18 => l10n.today.greetingAfternoon(name: 'Ana'),
      _ => l10n.today.greetingEvening(name: 'Ana'),
    };
    final timeIcon = now.hour >= 18 || now.hour < 6 ? AppIcons.moon : AppIcons.sun;

    await tester.pumpApp(const TodayHeader(home: home, selfName: 'Ana'));

    final greetingText = tester.widget<Text>(find.text(greeting));
    expect(greetingText.style?.fontSize, AppTypography.system.titleLg.fontSize);
    expect(greetingText.style?.fontWeight, AppTypography.system.titleLg.fontWeight);
    expect(find.byIcon(timeIcon), findsOneWidget);
  });

  testWidgets('the date and the together chip use the small body scale', (tester) async {
    final now = DateTime.now();
    final l10n = Translations();
    final dateLine = l10n.today.dateLine(
      weekday: l10n.today.weekdays[now.weekday - 1],
      day: now.day,
      month: l10n.today.months[now.month - 1],
    );

    await tester.pumpApp(
      TodayHeader(
        home: TodayHome(
          isPaired: true,
          unopenedCards: 0,
          slipsThisWeek: 2,
          slipsTotal: 2,
          hasPendingInvite: false,
          hasPlus: false,
          partnerName: 'Rui',
          togetherSince: DateTime(now.year, now.month, now.day),
        ),
        selfName: 'Ana',
      ),
    );

    final date = tester.widget<Text>(find.text(dateLine));
    expect(date.style?.fontSize, AppTypography.system.bodySm.fontSize);

    final chip = tester.widget<Text>(find.text(l10n.today.togetherDays(count: 0)));
    expect(chip.style?.fontSize, AppTypography.system.bodySm.fontSize);
    expect(chip.style?.fontWeight, FontWeight.w500);
  });
}
