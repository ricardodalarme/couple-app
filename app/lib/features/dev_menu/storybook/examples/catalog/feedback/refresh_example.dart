import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode refreshExample = WidgetbookComponent(
  name: 'BaseRefreshable',
  useCases: [
    WidgetbookUseCase(
      name: 'Pull a list to refresh',
      builder: (context) => const GalleryPage(
        title: 'Pull to refresh',
        children: [
          GallerySection(
            title: 'List',
            children: [GallerySurface(child: SizedBox(height: 360, child: _RefreshDemo()))],
          ),
        ],
      ),
    ),
  ],
);

class const _RefreshDemo() extends StatefulWidget {
  @override
  State<_RefreshDemo> createState() => _RefreshDemoState();
}

class _RefreshDemoState() extends State<_RefreshDemo> {
  List<String> _items = const ['One', 'Two', 'Three'];

  Future<void> _refresh() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    setState(() => _items = [..._items, 'New ${_items.length + 1}']);
  }

  @override
  Widget build(BuildContext context) {
    return BaseListView(
      onRefresh: _refresh,
      padding: const EdgeInsets.symmetric(vertical: AppSpace.s8),
      itemCount: _items.length,
      separator: const SizedBox(height: AppSpace.s8),
      itemBuilder: (_, index) => BaseListTile(title: _items[index], isLoose: true),
    );
  }
}
