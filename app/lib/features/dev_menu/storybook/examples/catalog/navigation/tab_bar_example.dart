import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode tabBarExample = WidgetbookComponent(
  name: 'BaseTabBar',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Five positions and the plus action',
      builder: (context) => const _TabBarDemo(),
    ),
  ],
);

class const _TabBarDemo() extends StatefulWidget {
  @override
  State<_TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState() extends State<_TabBarDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return GalleryPage(
      title: 'Tab bar',
      children: <Widget>[
        GallerySection(
          title: 'Five positions · tap to change the active tab',
          children: <Widget>[
            GallerySurface(
              child: BaseTabBar(
                currentIndex: _index,
                onSelected: (index) => setState(() => _index = index),
                items: const <BaseTabBarItem>[
                  BaseTabBarItem(label: 'Today', icon: AppIcons.home),
                  BaseTabBarItem(label: 'Slips', icon: AppIcons.note),
                  BaseTabBarItem(label: '', icon: AppIcons.plus, isPrimaryAction: true),
                  BaseTabBarItem(label: 'Together', icon: AppIcons.rings),
                  BaseTabBarItem(label: 'Memories', icon: AppIcons.bookmark),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s24),
        Text(
          'The active item takes the accent label and filled icon; '
          'the centre column is the 46pt dark plus circle.',
          style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
        ),
      ],
    );
  }
}
