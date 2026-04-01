import 'package:flutter/material.dart' show RadioListTile;
import 'package:flutter/widgets.dart';

class BaseRadioListTile<T> extends StatelessWidget {
  const BaseRadioListTile({required this.value, required this.title, super.key});

  final T value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(value: value, title: Text(title));
  }
}
