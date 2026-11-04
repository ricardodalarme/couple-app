import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseCarouselExample = WidgetbookUseCase(
  name: 'BaseCarousel',
  builder: (context) {
    final itemCount = context.knobs.int.slider(label: 'Items', max: 6, initialValue: 3);
    final onMedia = context.knobs.boolean(label: 'Indicator on media');

    return BaseCarousel(
      itemCount: itemCount,
      aspectRatio: 16 / 9,
      dotLabelBuilder: (current, count) => 'Slide $current of $count',
      indicatorPlacement: onMedia
          ? BaseCarouselIndicatorPlacement.onMedia
          : BaseCarouselIndicatorPlacement.below,
      itemBuilder: (context, index) => ColoredBox(
        color: context.palette.container,
        child: Center(child: Text('Slide ${index + 1}', style: context.typography.titleMedium)),
      ),
    );
  },
);
