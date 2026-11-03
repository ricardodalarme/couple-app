import 'package:flutter/material.dart' show TextButton;
import 'package:flutter/widgets.dart';

class const BaseTextButton({
  required final String text,
  required final VoidCallback onPressed,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}
