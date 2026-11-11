import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('exposes the three theme palettes', (tester) async {
    for (final variant in AppThemeVariant.values) {
      final colors = AppColors.forVariant(variant);
      expect(colors.bgScreen, isNot(equals(colors.bgSurface)));
      expect(colors.actionPrimary, const Color(0xFF2B2828));
    }
  });
}
