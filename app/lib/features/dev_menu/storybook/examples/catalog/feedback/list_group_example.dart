import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/list_tile_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode listGroupAndTileExample = WidgetbookComponent(
  name: 'List group and tile',
  useCases: [
    WidgetbookUseCase(
      name: 'Navigation, controls, plus, slider and destructive',
      builder: (_) {
        return const _ListGroupDemo();
      },
    ),
    WidgetbookUseCase(name: 'Loose tile', builder: (context) => const LooseListTilePage()),
  ],
);

class const _ListGroupDemo() extends StatefulWidget {
  @override
  State<_ListGroupDemo> createState() => _ListGroupDemoState();
}

class _ListGroupDemoState() extends State<_ListGroupDemo> {
  bool _notifications = true;
  bool _reminder = false;
  double _intensity = 2;

  @override
  Widget build(BuildContext context) {
    return GalleryPage(
      title: 'List group and tile',
      children: [
        GallerySection(
          title: 'Grouped rows',
          children: [
            GallerySurface(
              child: BaseListGroup(
                footer: 'Rows are separated by a hairline inset from the left.',
                children: [
                  BaseListTile(
                    title: 'Appearance',
                    subtitle: 'Soft pink',
                    icon: AppIcons.sun,
                    value: 'Rose',
                    showsChevron: true,
                    onTap: () {},
                  ),
                  BaseListTile(
                    title: 'Notifications',
                    icon: AppIcons.bell,
                    control: BaseSwitch(
                      value: _notifications,
                      onChanged: (value) => setState(() => _notifications = value),
                      semanticLabel: 'Notifications',
                    ),
                  ),
                  BaseListTile(
                    title: 'Daily reminder',
                    icon: AppIcons.clock,
                    control: BaseCheckbox(
                      value: _reminder,
                      onChanged: (value) => setState(() => _reminder = value),
                      semanticLabel: 'Daily reminder',
                    ),
                  ),
                  const BaseListTile(
                    title: 'Weekly insights',
                    icon: AppIcons.star,
                    control: BasePlusBadge(text: 'Plus'),
                  ),
                  BaseListTile(
                    title: 'Intensity',
                    icon: AppIcons.settings,
                    control: SizedBox(
                      width: AppSpace.s120,
                      child: BaseSlider(
                        value: _intensity,
                        max: 4,
                        divisions: 4,
                        semanticLabel: 'Intensity',
                        onChanged: (value) => setState(() => _intensity = value),
                      ),
                    ),
                  ),
                  BaseListTile(
                    title: 'Delete all slips',
                    icon: AppIcons.trash,
                    isDestructive: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
