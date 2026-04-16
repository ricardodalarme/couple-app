import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/examples.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/theme_mode_addon.dart';
import 'package:widgetbook/widgetbook.dart';

class StorybookPage extends StatelessWidget {
  const StorybookPage({super.key});

  static final List<WidgetbookAddon<dynamic>> _addons = [
    StorybookThemeModeAddon(),
    TextScaleAddon(),
    AlignmentAddon(),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView(
      hasSafeArea: false,
      title: 'Storybook',
      body: ThemeModeProvider(
        child: Builder(
          builder: (context) {
            final currentThemeMode = ThemeModeProvider.of(context).themeMode;

            return Widgetbook(
              themeMode: currentThemeMode,
              appBuilder: (_, child) => BaseApp(home: BaseView(hasAppBar: false, body: child)),
              addons: _addons,
              directories: examples,
              home: Center(
                child: Text('Welcome to Storybook!', style: context.typography.titleSmall),
              ),
            );
          },
        ),
      ),
    );
  }
}
