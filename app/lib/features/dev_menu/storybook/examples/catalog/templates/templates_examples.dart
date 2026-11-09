import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/templates/flow_template_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/templates/moment_template_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/templates/sheet_template_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/templates/stacked_template_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/templates/tab_template_example.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode templatesExamples = WidgetbookFolder(
  name: 'Templates',
  children: <WidgetbookNode>[
    tabTemplateExample,
    stackedTemplateExample,
    flowTemplateExample,
    momentTemplateExample,
    sheetTemplateExample,
  ],
);
