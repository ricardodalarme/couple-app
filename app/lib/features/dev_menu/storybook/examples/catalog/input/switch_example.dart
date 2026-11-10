import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/foundation_widgets.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode switchExample = WidgetbookComponent(
  name: 'Switch',
  useCases: [WidgetbookUseCase(name: 'On and off', builder: (_) => const _SwitchDemo())],
);

class const _SwitchDemo() extends StatefulWidget {
  @override
  State<_SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState() extends State<_SwitchDemo> {
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return GalleryPage(
      title: 'Switch',
      children: [
        GallerySection(
          title: 'On and off',
          children: [
            GalleryRow(
              children: [
                BaseSwitch(
                  value: _notifications,
                  onChanged: (value) => setState(() => _notifications = value),
                  semanticLabel: 'Notifications',
                ),
                const BaseSwitch(value: false, onChanged: noopBool, semanticLabel: 'Off'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
