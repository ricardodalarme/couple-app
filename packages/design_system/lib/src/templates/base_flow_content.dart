import 'package:design_system/src/drawings/app_squiggle.dart';
import 'package:design_system/src/templates/template_parts.dart';
import 'package:design_system/src/theme/app_theme.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';

/// A modal flow: header, highlighted title, subtitle, content and fixed footer.
///
/// Render it inside `BaseView`.
class const BaseFlowContent({
  required final String heading,
  required final Widget content,
  required final Widget primaryAction,
  final String highlightedWord = '',
  final String? subtitle,
  final Widget? secondaryAction,
  final ScrollController? controller,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final words = [?secondaryAction, primaryAction];

    return Column(
      children: [
        Expanded(
          child: PageContent(
            controller: controller,
            padding: const EdgeInsets.fromLTRB(
              AppSpace.screenMargin,
              AppSpace.s24,
              AppSpace.screenMargin,
              AppSpace.s24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppHighlightedText(
                  text: heading,
                  highlight: highlightedWord,
                  style: context.text.titleXl.copyWith(color: context.colors.textPrimary),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: AppSpace.s8),
                  Text(
                    subtitle!,
                    style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
                  ),
                ],
                const SizedBox(height: AppSpace.s24),
                content,
              ],
            ),
          ),
        ),
        FooterBar(children: words),
      ],
    );
  }
}
