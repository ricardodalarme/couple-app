import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class StorybookThemeModeAddon() extends ThemeAddon<ThemeMode> {
  this
    : super(
        themes: const [
          WidgetbookTheme(name: 'System', data: ThemeMode.system),
          WidgetbookTheme(name: 'Light', data: ThemeMode.light),
          WidgetbookTheme(name: 'Dark', data: ThemeMode.dark),
        ],
        themeBuilder: (context, themeMode, child) {
          return _ThemeModeSync(themeMode: themeMode, child: child);
        },
      );
}

class const _ThemeModeSync({required final ThemeMode themeMode, required final Widget child})
    extends StatefulWidget {
  @override
  State<_ThemeModeSync> createState() => _ThemeModeSyncState();
}

class _ThemeModeSyncState() extends State<_ThemeModeSync> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncThemeMode();
  }

  @override
  void didUpdateWidget(covariant _ThemeModeSync oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.themeMode != widget.themeMode) {
      _syncThemeMode();
    }
  }

  void _syncThemeMode() {
    final provider = ThemeModeProvider.of(context);

    if (provider.themeMode != widget.themeMode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ThemeModeProvider.of(context).setThemeMode(widget.themeMode);
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
