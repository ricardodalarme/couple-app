import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void _show() {}

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('avatars render in ${variant.name}', (tester) async {
      await tester.pumpWidget(
        galleryHost(
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseAvatar(initials: 'M', semanticLabel: 'Your avatar'),
              BaseAvatar(initials: 'R', isPartner: true, onTap: _show),
              BaseAvatar(isEmpty: true, semanticLabel: 'Add a photo'),
            ],
          ),
          variant: variant,
        ),
      );
      await tester.pump();

      expect(find.byType(BaseAvatar), findsNWidgets(3));
      expect(tester.takeException(), isNull);
    });

    testWidgets('avatars survive 200% text in ${variant.name}', (tester) async {
      await tester.pumpWidget(
        galleryHost(
          const BaseAvatar(initials: 'M', semanticLabel: 'Your avatar'),
          variant: variant,
          textScale: 2,
        ),
      );
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  }
}
