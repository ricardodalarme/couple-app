import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_counter/cubit/couple_counter_widget_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_counter/widgets/couple_counter_preview_cards.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Couple counter widget screen (`X-149`): days together calculated at local midnight.
@RoutePage()
class const CoupleCounterWidgetPage({super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<CoupleCounterWidgetCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final overviewResource = context.select(
      (CoupleCounterWidgetCubit cubit) => cubit.state.overview,
    );
    final isDarkPreview = context.select(
      (CoupleCounterWidgetCubit cubit) => cubit.state.isDarkPreview,
    );
    final cubit = context.read<CoupleCounterWidgetCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.counterPageTitle),
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
              CoupleCounterPreviewCards(payload: overview.payload, isDarkPreview: isDarkPreview),
            ],
          ),
        ),
      ),
    );
  }
}
