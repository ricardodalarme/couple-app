import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

double _contrast(Color foreground, Color background) {
  final lighter = math.max(foreground.computeLuminance(), background.computeLuminance());
  final darker = math.min(foreground.computeLuminance(), background.computeLuminance());
  return (lighter + .05) / (darker + .05);
}

void main() {
  testWidgets('exposes the three theme palettes', (tester) async {
    for (final variant in AppThemeVariant.values) {
      final colors = AppColors.forVariant(variant);
      expect(colors.bgScreen, isNot(equals(colors.bgSurface)));
      expect(colors.actionPrimary, const Color(0xFF2B2828));
    }
  });

  test('high contrast strengthens borders and secondary text in every palette', () {
    for (final variant in AppThemeVariant.values) {
      final normal = AppColors.forVariant(variant);
      final contrast = AppColors.forVariant(variant, highContrast: true);

      expect(_contrast(contrast.borderDefault, contrast.bgSurface), greaterThanOrEqualTo(4.5));
      expect(_contrast(contrast.textSecondary, contrast.bgSurface), greaterThanOrEqualTo(7));
      expect(
        _contrast(contrast.borderDefault, contrast.bgSurface),
        greaterThan(_contrast(normal.borderDefault, normal.bgSurface)),
      );
      expect(
        _contrast(contrast.textSecondary, contrast.bgSurface),
        greaterThan(_contrast(normal.textSecondary, normal.bgSurface)),
      );
    }
  });
}
