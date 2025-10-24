import 'package:common_ui/common_ui.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode basePasswordTextFieldExample = WidgetbookUseCase(
  name: 'BasePasswordTextField',
  builder: (context) => BasePasswordTextField(
    text: context.knobs.string(label: 'Text'),
    label: context.knobs.string(label: 'Label', initialValue: 'Password'),
    textInputAction: context.knobs.objectOrNull.dropdown(
      label: 'Text input action',
      options: TextInputAction.values,
    ),
    onSubmitted: (value) => context.showSnackBar('Submitted "$value"'),
  ),
);
