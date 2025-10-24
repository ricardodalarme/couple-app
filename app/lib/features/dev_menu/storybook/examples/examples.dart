import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/components/base_button_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/components/base_divider_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/components/base_list_tile_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/components/base_loading_indicator_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/components/base_snack_bar_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/components/base_text_field_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/theme/colors_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/theme/typography_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/widgets/error_indicator_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/widgets/profile_picture_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/widgets/sign_in_button_example.dart';
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/widgets/text_divider_example.dart';
import 'package:widgetbook/widgetbook.dart';

final List<WidgetbookNode> examples = [
  WidgetbookFolder(
    name: 'Components',
    children: [
      baseButtonExample,
      baseDividerExample,
      baseListTileExample,
      baseLoadingIndicatorExample,
      baseSnackBarExample,
      baseTextFieldExample,
    ],
  ),
  WidgetbookFolder(
    name: 'Widgets',
    children: [
      errorIndicatorExample,
      profilePictureExample,
      signInButtonExample,
      textDividerExample,
    ],
  ),
  WidgetbookFolder(name: 'Theme', children: [colorsExample, typographyExample]),
];
