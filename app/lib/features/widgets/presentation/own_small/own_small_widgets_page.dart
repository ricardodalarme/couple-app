import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/own_small/cubit/own_small_widgets_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/own_small/widgets/own_small_grid.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Small personal widgets screen (`X-146`): 2x2 grid of Anotar slip, Próxima data,
/// Humor, and Ritual with light/dark appearance preview.
@RoutePage()
class const OwnSmallWidgetsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<OwnSmallWidgetsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final overviewResource = context.select((OwnSmallWidgetsCubit cubit) => cubit.state.overview);
    final isDarkPreview = context.select((OwnSmallWidgetsCubit cubit) => cubit.state.isDarkPreview);
    final cubit = context.read<OwnSmallWidgetsCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.ownSmallPageTitle),
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
          successBuilder: (overview) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseSegmented(
                segments: [l10n.themeLight, l10n.themeDark],
                selectedIndex: isDarkPreview ? 1 : 0,
                onSelectionChanged: (index) => cubit.setDarkPreview(isDark: index == 1),
              ),
              const SizedBox(height: AppSpace.s16),
              OwnSmallWidgetsGrid(payload: overview.payload, isDarkPreview: isDarkPreview),
            ],
          ),
        ),
      ),
    );
  }
}
