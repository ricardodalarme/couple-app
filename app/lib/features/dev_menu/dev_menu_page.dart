import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/features/dev_menu/device_info/device_info_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/language_selector/language_selector_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/preferences/preferences_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/remote_config/remote_config_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/secure_storage/secure_storage_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/storybook_page.dart';
import 'package:flutter_bloc_starter/features/dev_menu/theme_selector/theme_selector_page.dart';

class const DevMenuPage({super.key}) extends StatelessWidget {
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
          BaseListTile(
            title: 'Preferences',
            onTap: () => context.router.pushWidget(const PreferencesPage()),
          ),
          BaseListTile(
            title: 'Secure Storage',
            onTap: () => context.router.pushWidget(const SecureStoragePage()),
          ),
        ],
      ),
    );
  }
}
