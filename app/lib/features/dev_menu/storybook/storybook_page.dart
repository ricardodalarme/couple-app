import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/catalog_examples.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/addons/design_system_theme_addon.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

class const StorybookPage({super.key}) extends StatelessWidget {
  static final List<WidgetbookAddon<dynamic>> _addons = [
    DesignSystemThemeAddon(),
    TextScaleAddon(),
    AlignmentAddon(),
  ];

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appBuilder: (context, child) => Localizations(
        locale: Localizations.maybeLocaleOf(context) ?? const Locale('en', 'US'),
        delegates: GlobalMaterialLocalizations.delegates,
        child: SizedBox.expand(
          child: Stack(
            children: [
              Positioned.fill(child: ColoredBox(color: context.colors.bgScreen)),
              child,
            ],
          ),
        ),
      ),
      addons: _addons,
      directories: catalogExamples,
      home: Center(
        child: Text(
          'Design system',
          style: context.text.titleLg.copyWith(color: context.colors.textPrimary),
        ),
      ),
    );
  }
}
