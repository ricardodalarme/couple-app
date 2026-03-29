import 'package:flutter_bloc_starter/features/authentication/presentation/login/widgets/text_divider.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode textDividerExample = WidgetbookUseCase(
  name: 'TextDivider',
  builder: (context) => TextDivider(context.knobs.string(label: 'Text', initialValue: 'Example')),
);
