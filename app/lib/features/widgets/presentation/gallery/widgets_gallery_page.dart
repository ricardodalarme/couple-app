import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/gallery/cubit/widgets_gallery_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/gallery/widgets/gallery_preview_cards.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Widgets gallery (`X-145`): live previews for personal and couple widgets, configuration,
/// and step-by-step home-screen instructions.
@RoutePage()
class const WidgetsGalleryPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<WidgetsGalleryCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final overviewResource = context.select((WidgetsGalleryCubit cubit) => cubit.state.overview);
    final segment = context.select((WidgetsGalleryCubit cubit) => cubit.state.segment);
    final cubit = context.read<WidgetsGalleryCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.galleryTitle),
      body: BaseStackedContent(
        footer: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            BaseButton(
              text: l10n.howToAddAction,
              onPressed: () => context.pushRoute(const WidgetHowToAddRoute()),
            ),
            const SizedBox(height: AppSpace.s8),
            BaseButton(
              text: l10n.configureAction,
              variant: BaseButtonVariant.secondary,
              onPressed: () async {
                await context.pushRoute(WidgetConfigureRoute());
                if (context.mounted) await cubit.load();
              },
            ),
          ],
        ),
        body: SkeletonizerResourceWidget<WidgetOverview>(
          overviewResource,
          fakeValue: WidgetOverview.fake(),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.loadErrorTitle,
            text: l10n.loadErrorBody,
            actionText: l10n.retryAction,
            onAction: cubit.load,
          ),
          successBuilder: (overview) {
            final payload = overview.payload;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BaseSegmented(
                  segments: [l10n.segmentOwn, l10n.segmentCouple],
                  selectedIndex: segment.index,
                  onSelectionChanged: (index) =>
                      cubit.selectSegment(WidgetGallerySegment.values[index]),
                ),
                const SizedBox(height: AppSpace.s16),
                if (payload.isOffline) ...[
                  BaseNote(text: l10n.offlineBanner, icon: AppIcons.wifi_off),
                  const SizedBox(height: AppSpace.s12),
                ],
                if (payload.discreet) ...[
                  BaseNote(text: l10n.discreetBanner, icon: AppIcons.eye_off),
                  const SizedBox(height: AppSpace.s12),
                ] else if (segment == WidgetGallerySegment.couple && !payload.isPaired) ...[
                  BaseNote(text: l10n.unpairedBanner, icon: AppIcons.heart),
                  const SizedBox(height: AppSpace.s12),
                ],
                GalleryPreviewSection(
                  segment: segment,
                  payload: payload,
                  onSelectFamily: (family) => _onSelectFamily(context, cubit, family),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _onSelectFamily(
    BuildContext context,
    WidgetsGalleryCubit cubit,
    WidgetFamilyKind family,
  ) async {
    final route = switch (family) {
      WidgetFamilyKind.ownSmall => const OwnSmallWidgetsRoute() as PageRouteInfo<void>,
      WidgetFamilyKind.ownMedium => const OwnMediumWidgetsRoute(),
      WidgetFamilyKind.lockScreen => const LockRouteWidgetRoute(),
      _ => WidgetConfigureRoute(initialFamily: family),
    };
    await context.pushRoute(route);
    if (context.mounted) await cubit.load();
  }
}
