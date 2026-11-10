import 'package:design_system/src/theme/app_theme.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';

/// A small theme label.
class const BaseTag({required final String text, super.key}) extends StatelessWidget {
  static const double _minHeight = 30;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      constraints: const BoxConstraints(minHeight: _minHeight),
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.s12),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: AppBorders.hair(colors.borderDefault),
      ),
      child: Center(
        widthFactor: 1,
        heightFactor: 1,
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: context.text.label.copyWith(color: colors.accentLabel),
        ),
      ),
    );
  }
}
