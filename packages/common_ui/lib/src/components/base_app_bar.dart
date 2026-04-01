import 'package:flutter/material.dart' show AppBar, kToolbarHeight;
import 'package:flutter/widgets.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key, this.title, this.actions});

  final String? title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: title != null ? Text(title!) : null, actions: actions);
  }
}
