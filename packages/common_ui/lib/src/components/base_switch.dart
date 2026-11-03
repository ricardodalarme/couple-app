import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show Switch;

class const BaseSwitch({
  required final bool value,
  required final ValueChanged<bool> onChanged,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(value: value, onChanged: onChanged);
  }
}
