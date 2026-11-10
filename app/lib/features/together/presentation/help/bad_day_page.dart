import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/features/together/presentation/help/cubit/help_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Three concrete things to do when the partner is having a hard day, from bundled content.
@RoutePage()
class const BadDayPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<HelpCubit>()..load('mood_tip'),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.help;
    final items = context.select((HelpCubit cubit) => cubit.state.items);

    return BaseView(
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(header: true, child: Text(l10n.badDayTitle, style: context.text.titleXl)),
            const SizedBox(height: AppSpace.s8),
            Text(
              l10n.badDayText,
              style: context.text.body.copyWith(color: context.colors.textSecondary),
            ),
            const SizedBox(height: AppSpace.s20),
            SkeletonizerResourceWidget<List<HelpItem>>(
              items,
              fakeValue: [HelpItem.fake(), HelpItem.fake(), HelpItem.fake()],
              successBuilder: (list) => list.isEmpty
                  ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final item in list.take(badDayTipCount)) ...[
                          BaseSurfaceCard(title: item.title, supportText: item.body),
                          const SizedBox(height: AppSpace.s12),
                        ],
                      ],
                    ),
              failureBuilder: (_) => BaseEmptyState(
                title: l10n.errorTitle,
                text: l10n.errorText,
                actionText: context.l10n.common.retry,
                onAction: () => context.read<HelpCubit>().load('mood_tip'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
