import 'package:common_ui/common_ui.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode passwordTextFieldExample = WidgetbookUseCase(
  name: 'PasswordTextField',
  builder:
      (context) => PasswordTextField(
        text: context.knobs.string(label: 'Text'),
        label: context.knobs.string(label: 'Label', initialValue: 'Password'),
        textInputAction: context.knobs.listOrNull(
          label: 'Text input action',
          options: TextInputAction.values,
        ),
        onSubmitted: (value) => context.showSnackBar(message: 'Submitted "$value"'),
      ),
);
