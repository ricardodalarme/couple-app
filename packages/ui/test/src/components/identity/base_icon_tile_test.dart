import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void _noop() {}

Widget _gallery() {
  return const Row(
    children: [
      BaseIconTile(icon: AppIcons.lock, semanticLabel: 'Private'),
      SizedBox(width: AppSpace.s12),
      BaseIconTile(
        icon: AppIcons.heart,
        variant: BaseIconTileVariant.neutral,
        size: BaseIconTileSize.small,
        semanticLabel: 'Favourite',
      ),
      SizedBox(width: AppSpace.s12),
      BaseIconTile(
        icon: AppIcons.calendar,
        size: BaseIconTileSize.large,
        onTap: _noop,
        semanticLabel: 'Open calendar',
      ),
    ],
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in const [1.0, 2.0]) {
      testWidgets('icon tiles render in ${variant.name} at ${scale}x text', (tester) async {
        await tester.pumpWidget(galleryHost(_gallery(), variant: variant, textScale: scale));
        await tester.pump();

        expect(find.byType(BaseIconTile), findsNWidgets(3));
        expect(tester.takeException(), isNull);

        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
      });
    }
  }
}
