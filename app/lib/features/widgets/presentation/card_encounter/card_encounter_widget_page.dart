import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/card_encounter/cubit/card_encounter_widget_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/card_encounter/widgets/card_encounter_preview_section.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Card & next encounter widget screen (`X-153`): displays only card state (`ready`, `sent`,
/// `none`, `pause`) and the next shared date label — never personal names or card text.
@RoutePage()
class const CardEncounterWidgetPage({super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<CardEncounterWidgetCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final overviewResource = context.select(
      (CardEncounterWidgetCubit cubit) => cubit.state.overview,
    );
    final isDarkPreview = context.select(
      (CardEncounterWidgetCubit cubit) => cubit.state.isDarkPreview,
    );
    final cubit = context.read<CardEncounterWidgetCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.cardEncounterPageTitle),
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
              CardEncounterPreviewSection(payload: overview.payload, isDarkPreview: isDarkPreview),
            ],
          ),
        ),
      ),
    );
  }
}
