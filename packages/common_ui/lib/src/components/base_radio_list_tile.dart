import 'package:flutter/material.dart' show RadioListTile;
import 'package:flutter/widgets.dart';

class const BaseRadioListTile<T>({required final T value, required final String title, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(value: value, title: Text(title));
  }
}
