import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_photos/cubit/couple_photos_widget_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_photos/widgets/couple_photos_preview_section.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Couple photos widget screen (`X-150`): Plus-gated photo container with local cache
/// and honest neutral fallback when no photo is cached or discreet mode is active.
@RoutePage()
class const CouplePhotosWidgetPage({super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<CouplePhotosWidgetCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final overviewResource = context.select(
      (CouplePhotosWidgetCubit cubit) => cubit.state.overview,
    );
    final isDarkPreview = context.select(
      (CouplePhotosWidgetCubit cubit) => cubit.state.isDarkPreview,
    );
    final chooseAction = context.select(
      (CouplePhotosWidgetCubit cubit) => cubit.state.chooseAction,
    );
    final removeAction = context.select(
      (CouplePhotosWidgetCubit cubit) => cubit.state.removeAction,
    );
    final localPreview = context.select(
      (CouplePhotosWidgetCubit cubit) => cubit.state.localPreview,
    );
    final cubit = context.read<CouplePhotosWidgetCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.photosPageTitle),
      body: BaseStackedContent(
        footer: BaseButton(
          text: l10n.howToAddAction,
          onPressed: () => context.pushRoute(const WidgetHowToAddRoute()),
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
            final canManage = payload.isPaired && payload.hasPlus && !payload.discreet;
            final hasPhoto = payload.cachedPhotoPath != null || localPreview != null;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BaseSegmented(
                  segments: [l10n.themeLight, l10n.themeDark],
                  selectedIndex: isDarkPreview ? 1 : 0,
                  onSelectionChanged: (index) => cubit.setDarkPreview(isDark: index == 1),
                ),
                const SizedBox(height: AppSpace.s16),
                CouplePhotosPreviewSection(
                  payload: payload,
                  isDarkPreview: isDarkPreview,
                  localPreview: localPreview,
                ),
                if (canManage) ...[
                  const SizedBox(height: AppSpace.s16),
                  BaseButton(
                    text: l10n.photosChooseAction,
                    isLoading: chooseAction.isLoading,
                    onPressed: chooseAction.isLoading || removeAction.isLoading
                        ? null
                        : () => _choose(context, cubit),
                  ),
                  if (hasPhoto) ...[
                    const SizedBox(height: AppSpace.s12),
                    BaseButton.secondary(
                      text: l10n.photosRemoveAction,
                      isLoading: removeAction.isLoading,
                      onPressed: chooseAction.isLoading || removeAction.isLoading
                          ? null
                          : () => _remove(context, cubit),
                    ),
                  ],
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _choose(BuildContext context, CouplePhotosWidgetCubit cubit) async {
    final l10n = context.l10n.widgets;
    await cubit.choosePhoto();
    if (!context.mounted) return;

    final action = cubit.state.chooseAction;
    if (action is Failure) {
      BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
    } else if (action is Success) {
      BaseToast.show(context, l10n.photosSavedToast);
    }
  }

  Future<void> _remove(BuildContext context, CouplePhotosWidgetCubit cubit) async {
    final l10n = context.l10n.widgets;
    await cubit.removePhoto();
    if (!context.mounted) return;

    final action = cubit.state.removeAction;
    if (action is Failure) {
      BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
    } else if (action is Success) {
      BaseToast.show(context, l10n.photosRemovedToast);
    }
  }
}
