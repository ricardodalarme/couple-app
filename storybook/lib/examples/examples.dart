import 'package:storybook/examples/components/base_button_example.dart';
import 'package:storybook/examples/components/base_snack_bar_example.dart';
import 'package:storybook/examples/components/base_text_field_example.dart';
import 'package:storybook/examples/components/divider_example.dart';
import 'package:storybook/examples/components/error_indicator_example.dart';
import 'package:storybook/examples/components/list_tile_example.dart';
import 'package:storybook/examples/components/loading_indicator_example.dart';
import 'package:storybook/examples/components/password_text_field_example.dart';
import 'package:storybook/examples/components/profile_picture_example.dart';
import 'package:storybook/examples/components/sign_in_button_example.dart';
import 'package:storybook/examples/components/text_divider_example.dart';
import 'package:storybook/examples/theme/colors_example.dart';
import 'package:storybook/examples/theme/typography_example.dart';
import 'package:widgetbook/widgetbook.dart';

final List<WidgetbookNode> examples = [
  WidgetbookFolder(
    name: 'Components',
    children: [
      baseButtonExample,
      baseSnackBarExample,
      baseTextFieldExample,
      dividerExample,
      errorIndicatorExample,
      listTileExample,
      loadingIndicatorExample,
      passwordTextFieldExample,
      profilePictureExample,
      signInButtonExample,
      textDividerExample,
    ],
  ),
  WidgetbookFolder(name: 'Theme', children: [colorsExample, typographyExample]),
];
