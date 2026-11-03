import 'package:common_ui/common_ui.dart';
import 'package:material_ui/material_ui.dart' show FilledButton;

class const BaseButton({
  required final String text,
  required final VoidCallback onPressed,
  final bool isLoading = false,
  final bool isEnabled = true,
  super.key,
}) extends StatelessWidget {
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

class const _LoadingIndicator() extends StatelessWidget {
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
