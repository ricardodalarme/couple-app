import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/partner_note/cubit/partner_note_widget_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/partner_note/widgets/partner_note_preview_section.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Partner note widget screen (`X-151`): displays notes marked widget-safe (`for_widget`)
/// when permitted by `allowPartnerNotes`, with a neutral placeholder when empty or unpaired.
@RoutePage()
class const PartnerNoteWidgetPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<PartnerNoteWidgetCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final overviewResource = context.select((PartnerNoteWidgetCubit cubit) => cubit.state.overview);
    final isDarkPreview = context.select(
      (PartnerNoteWidgetCubit cubit) => cubit.state.isDarkPreview,
    );
    final cubit = context.read<PartnerNoteWidgetCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.partnerNotePageTitle),
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
              PartnerNotePreviewSection(
                payload: overview.payload,
                isDarkPreview: isDarkPreview,
                onToggleAllowNotes: (allow) => cubit.setAllowPartnerNotes(allow: allow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
