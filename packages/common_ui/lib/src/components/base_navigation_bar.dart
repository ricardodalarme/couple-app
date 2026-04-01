import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:flutter/material.dart' show NavigationBar, NavigationDestination;
import 'package:flutter/widgets.dart';

class BaseNavigationBarItem {
  const BaseNavigationBarItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

class BaseNavigationBar extends StatelessWidget {
  const BaseNavigationBar({
    required this.items,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final List<BaseNavigationBarItem> items;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

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
