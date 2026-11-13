import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  test('the plan note uses singular counts', () {
    final l10n = Translations();
    final note = l10n.plus.freeLeft(
      slips: l10n.plus.slipCount(count: 11),
      cards: l10n.plus.cardCount(count: 1),
    );

    expect(note, 'No plano grátis, este mês: 11 slips e 1 cartão enviado.');
    expect(note, isNot(contains('1 cartões')));
  });

  test('the plan note keeps the plural for several cards', () {
    final l10n = Translations();

    expect(l10n.plus.cardCount(count: 3), '3 cartões enviados');
  });
}
