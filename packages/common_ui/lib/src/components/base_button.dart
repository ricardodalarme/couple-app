import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show FilledButton;

class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    super.key,
  });

  final String text;
  final bool isLoading;
  final bool isEnabled;
  final VoidCallback onPressed;

  VoidCallback? get callback {
    if (!isEnabled) return null;
    if (isLoading) return () {};
    return onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: callback,
        style: FilledButton.styleFrom(backgroundColor: context.palette.primary),
        child: isLoading ? const _LoadingIndicator() : Text(text),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  static const _loadingSize = 24.0;
  static const _loadingStrokeWidth = 2.0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: _loadingSize, maxWidth: _loadingSize),
      child: BaseLoadingIndicator(
        strokeWidth: _loadingStrokeWidth,
        color: context.palette.onPrimary,
      ),
    );
  }
}
