import 'package:design_system/src/theme/app_theme.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';

/// The scrollable, width-capped page body shared by the templates.
class const PageContent({
  required final Widget child,
  final EdgeInsetsGeometry? padding,
  final ScrollController? controller,
  final bool centre = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      padding:
          padding ??
          const EdgeInsets.fromLTRB(
            AppSpace.screenMargin,
            AppSpace.screenTop,
            AppSpace.screenMargin,
            AppSpace.scrollTail,
          ),
      child: PageColumn(centre: centre, child: child),
    );
  }
}

/// Aligns [child] to the page content column: capped to
/// [AppSpace.maxContentWidth] and centred horizontally.
class const PageColumn({required final Widget child, final bool centre = false, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSpace.maxContentWidth),
        child: centre ? Center(child: child) : child,
      ),
    );
  }
}

/// A fixed footer that stacks its children below [AppSpace.compactWidth].
class const FooterBar({
  required final List<Widget> children,
  final bool hasBackground = true,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colours = context.colors;

    final buttons = LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < AppSpace.compactWidth;

        if (children.length == 1) return children.single;

        if (compact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < children.length; i++) ...[
                if (i > 0) const SizedBox(height: AppSpace.s10),
                children[i],
              ],
            ],
          );
        }

        return Row(
          children: [
            for (var i = 0; i < children.length; i++) ...[
              if (i > 0) const SizedBox(width: AppSpace.s10),
              Expanded(child: children[i]),
            ],
          ],
        );
      },
    );

    final footer = SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpace.screenMargin,
          AppSpace.s16,
          AppSpace.screenMargin,
          AppSpace.s8,
        ),
        child: buttons,
      ),
    );

    if (!hasBackground) return footer;

    return ColoredBox(color: colours.bgScreen, child: footer);
  }
}
