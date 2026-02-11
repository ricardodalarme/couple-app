import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class LanguageSelectorPage extends StatelessWidget {
  const LanguageSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale currentLocale = Localizations.localeOf(context);

    return BaseView(
      title: 'Language Selector',
      body: RadioGroup(
        groupValue: currentLocale.languageCode,
        onChanged: (languageCode) => LocaleSettings.setLocaleRaw(languageCode!),
        child: ListView(
          children: AppLocale.values
              .map(
                (locale) =>
                    RadioListTile(value: locale.languageCode, title: Text(locale.languageCode)),
              )
              .toList(),
        ),
      ),
    );
  }
}
