import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class LanguageSelectorPage extends StatelessWidget {
  const LanguageSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);

    return BaseView(
      title: 'Language Selector',
      body: RadioGroup(
        groupValue: currentLocale.languageCode,
        onChanged: (languageCode) => LocaleSettings.setLocaleRaw(languageCode!),
        child: ListView(
          children: AppLocale.values
              .map(
                (locale) =>
                    BaseRadioListTile(value: locale.languageCode, title: locale.languageCode),
              )
              .toList(),
        ),
      ),
    );
  }
}
