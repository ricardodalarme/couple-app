import 'package:flutter/material.dart' show RefreshIndicator;
import 'package:flutter/widgets.dart';

class PullToRefresh extends StatelessWidget {
  const PullToRefresh({required this.onRefresh, required this.child, super.key});

  final VoidCallback onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: () async => onRefresh, child: child);
  }
}
