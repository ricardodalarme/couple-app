import 'package:design_system/src/templates/template_parts.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';

/// A scrolling page with an optional full-bleed band and fixed footer.
///
/// [header] and [body] sit in the page content column. [bleed] scrolls with
/// them but spans the whole page width, so an edge-to-edge rail can run past
/// the page margins. Render it inside `BaseView`.
class const BaseStackedContent({
  required final Widget body,
  final Widget? header,
  final Widget? bleed,
  final Widget? footer,
  final ScrollController? controller,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final header = this.header;
    final bleed = this.bleed;
    final footer = this.footer;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: controller,
            padding: const EdgeInsets.symmetric(vertical: AppSpace.s8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (header != null) _PageSection(child: header),
                ?bleed,
                _PageSection(child: body),
              ],
            ),
          ),
        ),
        if (footer != null) FooterBar(children: [footer]),
      ],
    );
  }
}

class const _PageSection({required final Widget child}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.screenMargin),
      child: PageColumn(child: child),
    );
  }
}
