import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode sliderExample = WidgetbookComponent(
  name: 'Slider',
  useCases: [
    WidgetbookUseCase(name: 'Continuous and five marks', builder: (_) => const _SliderDemo()),
  ],
);

class const _SliderDemo() extends StatefulWidget {
  @override
  State<_SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState() extends State<_SliderDemo> {
  double _continuous = 6;
  double _marked = 2;

  @override
  Widget build(BuildContext context) {
    return GalleryPage(
      title: 'Slider',
      children: [
        GallerySection(
          title: 'Continuous',
          children: [
            GallerySurface(
              child: BaseSlider(
                value: _continuous,
                max: 10,
                startLabel: 'Calm',
                endLabel: 'Full',
                semanticLabel: 'Energy',
                onChanged: (value) => setState(() => _continuous = value),
              ),
            ),
          ],
        ),
        GallerySection(
          title: 'Five marks with labels',
          children: [
            GallerySurface(
              child: BaseSlider(
                value: _marked,
                max: 4,
                divisions: 4,
                startLabel: 'Low',
                endLabel: 'High',
                semanticLabel: 'Intensity',
                valueFormatter: (value) => value.round().toString(),
                onChanged: (value) => setState(() => _marked = value),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
