import 'package:flutter/material.dart' show TextButton;
import 'package:flutter/widgets.dart';

class BaseTextButton extends StatelessWidget {
  const BaseTextButton({required this.text, required this.onPressed, super.key});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}
