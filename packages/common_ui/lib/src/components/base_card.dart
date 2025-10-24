import 'package:common_ui/src/components/base_divider.dart';
import 'package:common_ui/src/theme/theme_extensions.dart';
import 'package:common_ui/src/tokens/borders.dart';
import 'package:common_ui/src/tokens/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({required this.child, this.title, this.leading, super.key});

  final String? title;
  final Widget? leading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Borders.large),
      child: ColoredBox(
        color: context.colors.primaryContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacings.large,
                  vertical: Spacings.medium,
                ),
                child: Row(
                  children: [
                    if (leading != null)
                      Padding(
                        padding: const EdgeInsets.only(right: Spacings.medium),
                        child: leading,
                      ),
                    Expanded(child: Text(title!, style: context.typography.titleSmall)),
                  ],
                ),
              ),
              const BaseDivider(),
            ],
            Padding(padding: const EdgeInsets.all(Spacings.large), child: child),
          ],
        ),
      ),
    );
  }
}
