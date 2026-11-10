import 'package:design_system/design_system.dart';
import 'package:material_ui/material_ui.dart';

const double _barHeight = AppIconSize.touch;
const double _scrolledSurfaceOpacity = .94;

/// The page app bar with leading, centre title and trailing slots.
///
/// When [hasScrolled] it gains a translucent surface and a bottom hairline.
class const BaseAppBar({
  final String? title,
  final String? subtitle,
  final VoidCallback? onBack,
  final VoidCallback? onClose,
  final Widget? trailing,
  final Widget? stepIndicator,
  final bool hasScrolled = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final localizations = Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    final defaultOnBack = onClose == null ? _pageBack(context) : null;
    final resolvedOnBack = onBack ?? defaultOnBack;

    final Widget leading;
    if (resolvedOnBack != null) {
      leading = BaseRoundButton(
        icon: AppIcons.chevron_left,
        onPressed: resolvedOnBack,
        semanticLabel: localizations?.backButtonTooltip,
      );
    } else if (onClose != null) {
      leading = BaseRoundButton(
        icon: AppIcons.close,
        onPressed: onClose,
        semanticLabel: localizations?.closeButtonTooltip,
      );
    } else {
      leading = const SizedBox(width: AppIconSize.touch);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.s8),
      child: AnimatedContainer(
        duration: context.motionDuration(AppMotion.base),
        constraints: const BoxConstraints(minHeight: _barHeight),
        decoration: BoxDecoration(
          color: hasScrolled ? colors.bgScreen.withValues(alpha: _scrolledSurfaceOpacity) : null,
          border: hasScrolled ? Border(bottom: BorderSide(color: colors.borderDefault)) : null,
        ),
        child: Row(
          children: [
            leading,
            Expanded(
              child: _Centre(title: title, subtitle: subtitle, stepIndicator: stepIndicator),
            ),
            trailing ?? const SizedBox(width: AppIconSize.touch),
          ],
        ),
      ),
    );
  }

  VoidCallback? _pageBack(BuildContext context) {
    final route = ModalRoute.of(context);
    final navigator = Navigator.maybeOf(context);
    if (route == null || navigator == null) return null;
    if (route.canPop) return navigator.maybePop;

    final rootNavigator = Navigator.maybeOf(context, rootNavigator: true);
    if (rootNavigator != null && rootNavigator != navigator && rootNavigator.canPop()) {
      return rootNavigator.maybePop;
    }

    return null;
  }
}

class const _Centre({
  required final String? title,
  required final String? subtitle,
  required final Widget? stepIndicator,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final heading = title;
    final support = subtitle;
    final steps = stepIndicator;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (heading != null)
            Text(
              heading,
              style: context.text.titleXs.copyWith(color: colors.textPrimary),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          if (support != null)
            Text(
              support,
              style: context.text.bodySm.copyWith(color: colors.textSecondary),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          if (steps != null)
            Padding(
              padding: EdgeInsets.only(top: heading == null && support == null ? 0 : AppSpace.s6),
              child: steps,
            ),
        ],
      ),
    );
  }
}
