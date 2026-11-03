import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show AppBar, kToolbarHeight;

class const BaseAppBar({super.key, final String? title, final List<Widget>? actions})
    extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: title != null ? Text(title!) : null, actions: actions);
  }
}
