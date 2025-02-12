import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode listTileExample = WidgetbookUseCase(
  name: 'ListTile',
  builder:
      (context) => ListTile(
        title: context.knobs.string(label: 'Title', initialValue: 'List Tile'),
        leading: const Icon(Icons.person),
        onTap: () => context.showSnackBar(message: 'Click success'),
      ),
);
