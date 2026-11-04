import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_avatar_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_avatar_stack_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_button_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_card_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_carousel_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_chip_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_divider_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_icon_button_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_list_tile_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_loading_indicator_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_navigation_bar_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_page_indicator_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_select_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_snack_bar_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_tag_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_text_field_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/components/base_tooltip_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/theme/colors_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/theme/typography_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/widgets/error_indicator_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/widgets/skeletonizer_resource_widget_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/widgets/social_button_example.dart';
import 'package:widgetbook/widgetbook.dart';

final List<WidgetbookNode> examples = [
  WidgetbookFolder(
    name: 'Components',
    children: [
      baseAvatarExample,
      baseAvatarStackExample,
      baseButtonExample,
      baseCardExample,
      baseCarouselExample,
      baseChipExample,
      baseDividerExample,
      baseIconButtonExample,
      baseListTileExample,
      baseLoadingIndicatorExample,
      baseNavigationBarExample,
      basePageIndicatorExample,
      baseSelectExample,
      baseSnackBarExample,
      baseTagExample,
      baseTextFieldExample,
      baseTooltipExample,
    ],
  ),
  WidgetbookFolder(
    name: 'Widgets',
    children: [errorIndicatorExample, skeletonizerResourceWidgetExample, socialButtonExample],
  ),
  WidgetbookFolder(name: 'Theme', children: [colorsExample, typographyExample]),
];
