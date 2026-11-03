import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:flutter/material.dart' show CircularProgressIndicator;
import 'package:flutter/widgets.dart';

class const BaseLoadingIndicator({final double strokeWidth = 4.0, final Color? color, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? context.palette.primary,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
