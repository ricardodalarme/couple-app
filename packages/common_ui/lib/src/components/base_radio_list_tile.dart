import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show RadioListTile;

class const BaseRadioListTile<T>({required final T value, required final String title, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(value: value, title: Text(title));
  }
}
