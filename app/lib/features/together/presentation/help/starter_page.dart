import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/features/together/presentation/help/cubit/help_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// A bundled opening for a conversation, one at a time.
@RoutePage()
class const StarterPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<HelpCubit>()..load('question'),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.help;
    final items = context.select((HelpCubit cubit) => cubit.state.items);
    final index = context.select((HelpCubit cubit) => cubit.state.index);
    final cubit = context.read<HelpCubit>();

    return BaseView(
      body: SkeletonizerResourceWidget<List<HelpItem>>(
        items,
        fakeValue: [HelpItem.fake()],
        successBuilder: (list) => list.isEmpty
            ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
            : BaseStackedContent(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Semantics(
                      header: true,
                      child: Text(l10n.starterTitle, style: context.text.titleXl),
                    ),
                    const SizedBox(height: AppSpace.s8),
                    Text(
                      l10n.starterText,
                      style: context.text.body.copyWith(color: context.colors.textSecondary),
                    ),
                    const SizedBox(height: AppSpace.s20),
                    BaseSurfaceCard(title: list[index % list.length].title),
                  ],
                ),
                footer: BaseButton(text: l10n.another, variant: .secondary, onPressed: cubit.next),
              ),
        failureBuilder: (_) => BaseEmptyState(
          title: l10n.errorTitle,
          text: l10n.errorText,
          actionText: context.l10n.common.retry,
          onAction: () => cubit.load('question'),
        ),
      ),
    );
  }
}
