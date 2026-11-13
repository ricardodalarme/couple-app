import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  test('the repair template reads as a first-person sentence', () {
    final l10n = Translations();
    final sentence = l10n.repair.softStart.template(
      feeling: 'cansado',
      situation: 'a louça fica para depois',
      need: 'um pouco de ajuda',
    );

    expect(l10n.repair.softStart.feeling, 'Eu me sinto…');
    expect(
      sentence,
      'Eu me sinto cansado quando a louça fica para depois. Eu preciso de um pouco de ajuda.',
    );
  });

  test('the repair thank-you does not gender the reader', () {
    expect(Translations().received.doneText, isNot(contains('Obrigado')));
  });
}
