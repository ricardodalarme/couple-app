import 'package:flutter/material.dart' show NavigationBar, NavigationDestination;
import 'package:flutter/widgets.dart';

class NavBarItem {
  const NavBarItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

class NavBar extends StatelessWidget {
  const NavBar({
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.items,
    super.key,
  });

  final int currentIndex;
  final void Function(int) onDestinationSelected;
  final List<NavBarItem> items;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      destinations:
          items
              .map((item) => NavigationDestination(icon: Icon(item.icon), label: item.label))
              .toList(),
    );
  }
}
