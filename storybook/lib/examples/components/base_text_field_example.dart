import 'package:common_ui/common_ui.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseTextFieldExample = WidgetbookUseCase(
  name: 'BaseTextField',
  builder:
      (context) => BaseTextField(
        text: context.knobs.string(label: 'Text'),
        label: context.knobs.string(label: 'Label', initialValue: 'Label'),
        autocorrect: context.knobs.boolean(label: 'Autocorrect', initialValue: true),
        enableSuggestions: context.knobs.boolean(label: 'Enable suggestions', initialValue: true),
        obscureText: context.knobs.boolean(label: 'Obscure text'),
        textInputAction: context.knobs.listOrNull(
          label: 'Text input action',
          options: TextInputAction.values,
        ),
        keyboardType: context.knobs.listOrNull(
          label: 'Keyboard type',
          options: TextInputType.values,
        ),
        onSubmitted: (value) => context.showSnackBar(message: 'Submitted "$value"'),
      ),
);
