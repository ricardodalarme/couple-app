import 'package:flutter_bloc_starter/features/help/data/models/help_faq.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every bundled FAQ entry has a question and an answer in both locales', () {
    expect(helpFaqKeys, isNotEmpty);

    for (final locale in AppLocale.values) {
      final l10n = locale.buildSync().helpSupport;

      for (final key in helpFaqKeys) {
        expect(l10n.faqQuestions[key], isNotEmpty, reason: 'missing question $key in $locale');
        expect(l10n.faqAnswers[key], isNotEmpty, reason: 'missing answer $key in $locale');
      }
    }
  });

  test('rate limit and generic failures have localized copy in both locales', () {
    for (final locale in AppLocale.values) {
      final errors = locale.buildSync().helpSupport.errors;

      expect(errors['RATE_LIMITED'], isNotEmpty, reason: 'missing rate limit copy in $locale');
      expect(errors['other'], isNotEmpty, reason: 'missing generic copy in $locale');
    }
  });
}
