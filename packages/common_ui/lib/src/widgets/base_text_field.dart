import 'package:flutter/material.dart' show InputDecoration, TextField;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const _errorMaxLines = 2;

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    required this.text,
    super.key,
    this.label,
    this.errorText,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
    this.keyboardType,
    this.suffixIcon,
  });

  final String text;
  final String? label;
  final String? errorText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String)? onSubmitted;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  void didUpdateWidget(covariant BaseTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.text != widget.text) {
      _controller.text = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      autocorrect: widget.autocorrect,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: widget.suffixIcon,
        errorText: widget.errorText,
        errorMaxLines: _errorMaxLines,
      ),
      enableSuggestions: widget.enableSuggestions,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
    );
  }
}
