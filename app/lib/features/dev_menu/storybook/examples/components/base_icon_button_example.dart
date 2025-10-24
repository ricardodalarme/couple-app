import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseIconButtonExample = WidgetbookUseCase(
  name: 'BaseIconButton',
  builder: (context) => BaseIconButton(
    icon: const Icon(Icons.favorite),
    tooltip: context.knobs.stringOrNull(label: 'Tooltip', initialValue: 'Favorite'),
    onPressed: () => context.showSnackBar('Icon button pressed'),
  ),
);
