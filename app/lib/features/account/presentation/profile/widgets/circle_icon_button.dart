import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show InkWell, Material, Tooltip;

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({required this.label, required this.icon, required this.onTap, super.key});

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Column(
        children: [
          Material(
            color: context.colors.surfaceContainerHighest,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(Spacings.xlarge),
                child: Icon(icon, color: context.colors.onSurfaceVariant),
              ),
            ),
          ),
          const Gap(Spacings.medium),
          Text(label),
        ],
      ),
    );
  }
}
