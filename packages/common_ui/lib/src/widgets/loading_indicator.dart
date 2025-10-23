import 'package:flutter/material.dart' show CircularProgressIndicator;
import 'package:flutter/widgets.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({this.strokeWidth = 4.0, this.color, super.key});

  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(strokeWidth: strokeWidth, color: color),
    );
  }
}
