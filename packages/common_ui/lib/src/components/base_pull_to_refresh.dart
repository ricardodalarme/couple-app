import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show RefreshIndicator;

class const BasePullToRefresh({
  required final VoidCallback onRefresh,
  required final Widget child,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: () async => onRefresh(), child: child);
  }
}
