import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode sheetExample = WidgetbookComponent(
  name: 'BaseSheet',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Open with title, close and action',
      builder: (context) => const _SheetDemo(),
    ),
  ],
);

class const _SheetDemo() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GalleryPage(
      title: 'Bottom sheet',
      children: <Widget>[
        GallerySurface(
          child: BaseButton.primary(
            text: 'Open the sheet',
            onPressed: () => BaseSheet.show<void>(
              context: context,
              title: 'Send your slip',
              subtitle: 'It joins the card this Sunday.',
              primaryAction: BaseButton.primary(text: 'Send now', onPressed: () {}),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Marina sees it on Sunday. Until then it stays private.',
                    style: context.text.body.copyWith(color: context.colors.textSecondary),
                  ),
                  const SizedBox(height: AppSpace.s16),
                  Text(
                    'You can close the sheet with the button, a tap outside, or a drag down.',
                    style: context.text.caption.copyWith(color: context.colors.textSecondary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
