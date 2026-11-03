import 'package:flutter/material.dart' show RefreshIndicator;
import 'package:flutter/widgets.dart';

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
