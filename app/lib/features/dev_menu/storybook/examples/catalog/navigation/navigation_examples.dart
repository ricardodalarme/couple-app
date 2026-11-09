import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/navigation/app_bar_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/navigation/sheet_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/navigation/stepper_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/navigation/tab_bar_example.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode navigationExamples = WidgetbookFolder(
  name: 'Navigation',
  children: <WidgetbookNode>[tabBarExample, appBarExample, stepperExample, sheetExample],
);
