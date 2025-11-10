import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show Icons, InputDecoration, TextField;
import 'package:flutter/material.dart' show InputDecoration, TextField, UnderlineInputBorder;
import 'package:flutter/services.dart';

enum BaseTextFieldType { text, password }

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    required this.text,
    super.key,
    this.type = BaseTextFieldType.text,
    this.label,
    this.errorText,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.onChanged,
    this.textInputAction,
    this.onSubmitted,
    this.keyboardType,
  });

  final BaseTextFieldType type;
  final String text;
  final String? label;
  final String? errorText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool autocorrect;
  final bool enableSuggestions;
  final void Function(String)? onSubmitted;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late TextEditingController _controller;
  bool _obscureText = true;

  static const _obscureTextIconSize = 20.0;
  static const _errorMaxLines = 2;

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      autocorrect: widget.autocorrect,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: _effectiveSuffixIcon,
        errorText: widget.errorText,
        errorMaxLines: _errorMaxLines,
        labelStyle: TextStyle(color: context.palette.primary),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.palette.primary)),
        focusColor: context.palette.primary,
        fillColor: context.palette.primary,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.palette.primary)),
      ),
      enableSuggestions: widget.enableSuggestions,
      obscureText: _effectiveObscureText,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
    );
  }

  Widget? get _effectiveSuffixIcon => switch (widget.type) {
    BaseTextFieldType.password => BaseIconButton(
      icon: Icon(
        _obscureText ? Icons.visibility : Icons.visibility_off,
        size: _obscureTextIconSize,
      ),
      onPressed: () => setState(() => _obscureText = !_obscureText),
    ),
    _ => null,
  };

  bool get _effectiveObscureText => switch (widget.type) {
    BaseTextFieldType.password => _obscureText,
    _ => false,
  };
}
