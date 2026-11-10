import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void _noop() {}

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('avatar pairs render in ${variant.name}', (tester) async {
      await tester.pumpWidget(
        galleryHost(
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseAvatarPair(selfInitials: 'M', partnerInitials: 'R', onTap: _noop),
              BaseAvatarPair(selfInitials: 'M'),
            ],
          ),
          variant: variant,
        ),
      );
      await tester.pump();

      expect(find.byType(BaseAvatarPair), findsNWidgets(2));
      expect(tester.takeException(), isNull);
    });
  }
}
