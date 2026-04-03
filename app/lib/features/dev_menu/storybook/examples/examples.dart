import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_avatar_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_button_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_card_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_divider_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_icon_button_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_list_tile_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_loading_indicator_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_navigation_bar_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_snack_bar_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_text_field_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_tooltip_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/theme/colors_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/theme/typography_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/widgets/error_indicator_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/widgets/sign_in_button_example.dart';
import 'package:widgetbook/widgetbook.dart';

final List<WidgetbookNode> examples = [
  WidgetbookFolder(
    name: 'Components',
    children: [
      baseAvatarExample,
      baseButtonExample,
      baseCardExample,
      baseDividerExample,
      baseIconButtonExample,
      baseListTileExample,
      baseLoadingIndicatorExample,
      baseNavigationBarExample,
      baseSnackBarExample,
      baseTextFieldExample,
      baseTooltipExample,
    ],
  ),
  WidgetbookFolder(name: 'Widgets', children: [errorIndicatorExample, signInButtonExample]),
  WidgetbookFolder(name: 'Theme', children: [colorsExample, typographyExample]),
];
