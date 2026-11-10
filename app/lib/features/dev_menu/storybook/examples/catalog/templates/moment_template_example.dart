import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/foundation_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode momentTemplateExample = WidgetbookComponent(
  name: 'Moment template',
  useCases: [
    WidgetbookUseCase(
      name: 'Centred moment with footer',
      builder: (context) => ScreenPreview(
        appBar: BaseAppBar(title: 'A moment', onClose: () {}),
        child: BaseMomentContent(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BaseFace(
                kind: FaceKind.affectionate,
                size: FaceSize.showcase,
                semanticLabel: 'Affectionate face',
              ),
              const SizedBox(height: AppSpace.s24),
              Text(
                'The bakery on the corner',
                textAlign: TextAlign.center,
                style: context.text.titleLg,
              ),
              const SizedBox(height: AppSpace.s8),
              Text(
                'We walked home the long way and shared the last cinnamon roll.',
                textAlign: TextAlign.center,
                style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
              ),
            ],
          ),
          footer: BaseButton.secondary(text: 'Send a reaction', onPressed: () {}),
        ),
      ),
    ),
  ],
);
