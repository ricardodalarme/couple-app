import 'package:flutter/material.dart' show Switch;
import 'package:flutter/widgets.dart';

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
