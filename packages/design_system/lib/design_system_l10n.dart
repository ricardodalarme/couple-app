/// Design-system translations.
///
/// Components read them through `designSystemL10nOrBase`; import this entry
/// point only for the generated types or [TranslationProvider].
library;

import 'package:design_system/src/l10n/translations.g.dart';
import 'package:flutter/widgets.dart';

export 'src/l10n/translations.g.dart';

final Translations _baseTranslations = AppLocale.en.buildSync();

extension DesignSystemL10nFallback on BuildContext {
  /// The active translations, falling back to English without a [TranslationProvider].
  Translations get designSystemL10nOrBase {
    final data = dependOnInheritedWidgetOfExactType<InheritedLocaleData<AppLocale, Translations>>();
    return data?.translations ?? _baseTranslations;
  }
}
