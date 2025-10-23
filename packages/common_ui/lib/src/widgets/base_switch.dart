import 'package:flutter/material.dart' show Switch;
import 'package:flutter/widgets.dart';

class BaseSwitch extends StatelessWidget {
  const BaseSwitch({required this.value, required this.onChanged, super.key});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(value: value, onChanged: onChanged);
  }
}
