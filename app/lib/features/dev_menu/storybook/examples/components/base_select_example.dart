import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseSelectExample = WidgetbookUseCase(
  name: 'BaseSelect',
  builder: (context) => _SelectDemo(
    label: context.knobs.string(label: 'Label', initialValue: 'Category'),
    placeholder: context.knobs.string(label: 'Placeholder', initialValue: 'Pick a category'),
    hintText: context.knobs.stringOrNull(label: 'Hint'),
    errorText: context.knobs.stringOrNull(label: 'Error'),
    sheetTitle: context.knobs.stringOrNull(label: 'Sheet title', initialValue: 'Category'),
  ),
);

class const _SelectDemo({
  required final String label,
  required final String placeholder,
  required final String? hintText,
  required final String? errorText,
  required final String? sheetTitle,
}) extends StatefulWidget {
  @override
  State<_SelectDemo> createState() => _SelectDemoState();
}

class _SelectDemoState() extends State<_SelectDemo> {
  static const List<BaseSelectOption<String>> _options = [
    BaseSelectOption(value: 'design', label: 'Design', subtitle: 'Layout and visuals'),
    BaseSelectOption(value: 'engineering', label: 'Engineering'),
    BaseSelectOption(value: 'research', label: 'Research'),
  ];

  String? _value;

  @override
  Widget build(BuildContext context) {
    return BaseSelect<String>(
      label: widget.label,
      options: _options,
      value: _value,
      placeholder: widget.placeholder,
      hintText: widget.hintText,
      errorText: widget.errorText,
      sheetTitle: widget.sheetTitle,
      onChanged: (value) => setState(() => _value = value),
    );
  }
}
