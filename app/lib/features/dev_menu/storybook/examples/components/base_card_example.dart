import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseCardExample = WidgetbookUseCase(
  name: 'BaseCard',
  builder: (context) => Column(
    children: [
      BaseCard(
        title: context.knobs.stringOrNull(label: 'Title', initialValue: 'Card Title'),
        leading: context.knobs.boolean(label: 'Show Leading Icon') ? const Icon(Icons.info) : null,
        child: Text(
          context.knobs.string(label: 'Content', initialValue: 'This is the card content'),
        ),
      ),
    ],
  ),
);
