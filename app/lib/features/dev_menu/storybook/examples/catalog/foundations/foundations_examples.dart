import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/colors_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/faces_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/icons_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/tokens_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/typography_example.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode foundationsExamples = WidgetbookFolder(
  name: 'Foundations',
  children: <WidgetbookNode>[
    semanticColoursExample,
    typographyExample,
    tokensExample,
    iconsExample,
    facesExample,
  ],
);
