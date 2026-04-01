import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/features/dev_menu/device_info/device_info_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/language_selector/language_selector_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/remote_config/remote_config_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/storybook_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/theme_selector/theme_selector_page.dart';

class DevMenuPage extends StatelessWidget {
  const DevMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Developer Menu',
      body: ListView(
        children: [
          BaseListTile(
            title: 'Storybook',
            onTap: () => context.router.pushWidget(const StorybookPage()),
          ),
          BaseListTile(
            title: 'Language Selector',
            onTap: () => context.router.pushWidget(const LanguageSelectorPage()),
          ),
          BaseListTile(
            title: 'Theme Selector',
            onTap: () => context.router.pushWidget(const ThemeSelectorPage()),
          ),
          BaseListTile(
            title: 'Device Info',
            onTap: () => context.router.pushWidget(const DeviceInfoPage()),
          ),
          BaseListTile(
            title: 'Remote Config',
            onTap: () => context.router.pushWidget(const RemoteConfigPage()),
          ),
        ],
      ),
    );
  }
}
