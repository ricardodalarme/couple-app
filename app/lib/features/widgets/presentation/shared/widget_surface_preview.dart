import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/navigation/widget_deep_link_resolver.dart';

/// Simulated home-screen widget card surface supporting light and dark system appearances,
/// ellipsis overflow truncation, and `repara://` deep-link tap navigation.
class const WidgetSurfacePreview({
  required final String categoryLabel,
  required final String title,
  required final String subtitle,
  final String? badgeText,
  final bool isDark = false,
  final Uri? deepLinkUri,
  final VoidCallback? onTapOverride,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bgColor = isDark ? AppPalette.neutral900 : colors.bgSurface;
    final borderColor = isDark ? AppPalette.neutral800 : colors.borderDefault;
    final labelColor = isDark ? colors.accentSoft : colors.accentLabel;
    final titleColor = isDark ? AppPalette.white : colors.textPrimary;
    final subtitleColor = isDark ? AppPalette.neutral400 : colors.textSecondary;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _handleTap(context),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.xxl)),
          border: AppBorders.hair(borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpace.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                categoryLabel.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.text.micro.copyWith(color: labelColor),
              ),
              const SizedBox(height: AppSpace.s8),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.text.titleSm.copyWith(color: titleColor),
              ),
              const SizedBox(height: AppSpace.s4),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.text.caption.copyWith(color: subtitleColor),
              ),
              if (badgeText != null && badgeText!.isNotEmpty) ...[
                const SizedBox(height: AppSpace.s8),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: isDark ? AppPalette.neutral800 : colors.accentSoft,
                    borderRadius: const BorderRadius.all(Radius.circular(AppRadius.pill)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.s8,
                      vertical: AppSpace.s4,
                    ),
                    child: Text(
                      badgeText!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.text.micro.copyWith(
                        color: isDark ? AppPalette.white : colors.accentOnSoft,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _handleTap(BuildContext context) {
    if (onTapOverride != null) {
      onTapOverride!();
      return;
    }
    final uri = deepLinkUri;
    if (uri == null) return;
    final injector = AppInjector.instance;
    final appState = injector.get<AppCubit>().state;
    final routes = resolveWidgetDeepLinkUri(uri, appState: appState);
    if (routes != null) {
      unawaited(context.router.replaceAll(routes));
    }
  }
}
