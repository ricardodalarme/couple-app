import 'package:flutter/widgets.dart';
import 'package:ui/src/templates/template_parts.dart';
import 'package:ui/src/tokens/tokens.dart';

/// Moment template: a close header, one centred piece of content and an
/// optional fixed footer for reactions or a single action. Render it inside
/// `BaseView`.
class const BaseMomentContent({
  required final Widget content,
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
            centre: true,
            padding: const EdgeInsets.fromLTRB(
              AppSpace.screenMargin,
              AppSpace.s24,
              AppSpace.screenMargin,
              AppSpace.s24,
            ),
            child: content,
          ),
        ),
        if (footer != null) FooterBar(children: [footer]),
      ],
    );
  }
}
