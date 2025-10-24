import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseTooltipExample = WidgetbookUseCase(
  name: 'BaseTooltip',
  builder: (context) => BaseTooltip(
    text: context.knobs.string(label: 'Tooltip Text', initialValue: 'This is a tooltip'),
    child: const Icon(Icons.info),
  ),
);
