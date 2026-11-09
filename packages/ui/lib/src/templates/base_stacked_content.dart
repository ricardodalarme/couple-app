import 'package:flutter/widgets.dart';
import 'package:ui/src/templates/template_parts.dart';
import 'package:ui/src/tokens/tokens.dart';

/// Stacked screen template: an app bar, scrolling content and an optional
/// fixed footer. Render it inside `BaseView`.
class const BaseStackedContent({
  required final Widget body,
  final Widget? footer,
  final ScrollController? controller,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footer = this.footer;

    return Column(
      children: [
        Expanded(
          child: PageContent(
            controller: controller,
            padding: const EdgeInsets.fromLTRB(
              AppSpace.screenMargin,
              AppSpace.s8,
              AppSpace.screenMargin,
              AppSpace.s34,
            ),
            child: body,
          ),
        ),
        if (footer != null) FooterBar(children: [footer]),
      ],
    );
  }
}
