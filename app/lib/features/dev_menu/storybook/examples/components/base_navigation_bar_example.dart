import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseNavigationBarExample = WidgetbookUseCase(
  name: 'BaseNavigationBar',
  builder: (context) {
    final selectedIndex = context.knobs.int.slider(label: 'Selected Index', max: 2);

    return BaseNavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) => context.showSnackBar('Selected index: $index'),
      items: const [
        BaseNavigationBarItem(icon: Icons.home, label: 'Home'),
        BaseNavigationBarItem(icon: Icons.search, label: 'Search'),
        BaseNavigationBarItem(icon: Icons.person, label: 'Profile'),
      ],
    );
  },
);
