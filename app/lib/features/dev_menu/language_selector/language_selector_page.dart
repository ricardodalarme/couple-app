import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:ui/ui.dart';

class const LanguageSelectorPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);

    return BaseView(
      appBar: const BaseAppBar(title: 'Language Selector'),
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpace.s10,
          children: [
            for (final locale in AppLocale.values)
              BaseOptionTile(
                title: locale.languageCode,
                isSelected: currentLocale.languageCode == locale.languageCode,
                onTap: () => LocaleSettings.setLocaleRaw(locale.languageCode),
              ),
          ],
        ),
      ),
    );
  }
}
