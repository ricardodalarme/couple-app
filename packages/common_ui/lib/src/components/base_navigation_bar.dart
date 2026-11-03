import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show NavigationBar, NavigationDestination;

class const BaseNavigationBarItem({required final IconData icon, required final String label});

class const BaseNavigationBar({
  required final List<BaseNavigationBarItem> items,
  required final int selectedIndex,
  required final ValueChanged<int> onDestinationSelected,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      indicatorColor: context.palette.primary,
      selectedIndex: selectedIndex,
      destinations: items
          .map((item) => NavigationDestination(icon: Icon(item.icon), label: item.label))
          .toList(),
    );
  }
}
