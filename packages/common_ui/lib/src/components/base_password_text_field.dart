import 'package:common_ui/src/components/base_text_field.dart';
import 'package:flutter/material.dart' show IconButton, Icons;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class BasePasswordTextField extends StatefulWidget {
  const BasePasswordTextField({
    required this.text,
    this.label,
    this.onChanged,
    this.textInputAction,
    this.errorText,
    this.onSubmitted,
    super.key,
  });

  final String text;
  final String? label;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;

  @override
  State<BasePasswordTextField> createState() => _BasePasswordTextFieldState();
}

class _BasePasswordTextFieldState extends State<BasePasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      text: widget.text,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      label: widget.label,
      errorText: widget.errorText,
      suffixIcon: ExcludeFocus(
        child: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),
      ),
    );
  }
}
