import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/together/data/models/ritual.dart';
import 'package:flutter_bloc_starter/features/together/presentation/rituals/cubit/rituals_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The couple's rituals, with a warm confirmation when one happens and no streaks.
@RoutePage()
class const RitualsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<RitualsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.rituals;
    final rituals = context.select((RitualsCubit cubit) => cubit.state.rituals);
    final hasItems = rituals is Success<List<Ritual>> && rituals.value.isNotEmpty;
    final cubit = context.read<RitualsCubit>();

    return BaseView(
      body: BlocListener<RitualsCubit, RitualsState>(
        listenWhen: (previous, current) => previous.completeAction != current.completeAction,
        listener: (context, state) {
          final action = state.completeAction;
          if (action is Success) BaseToast.show(context, l10n.warm);
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          }
        },
        child: BaseRefreshable(
          onRefresh: cubit.load,
          child: BaseStackedContent(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
                const SizedBox(height: AppSpace.s8),
                Text(
                  l10n.subtitle,
                  style: context.text.body.copyWith(color: context.colors.textSecondary),
                ),
                const SizedBox(height: AppSpace.s20),
                SkeletonizerResourceWidget<List<Ritual>>(
                  rituals,
                  fakeValue: [Ritual.fake()],
                  successBuilder: (list) => list.isEmpty
                      ? BaseEmptyState(
                          title: l10n.emptyTitle,
                          text: l10n.emptyText,
                          actionText: l10n.create,
                          onAction: () => _create(context),
                        )
                      : BaseListGroup(
                          children: [for (final ritual in list) _RitualTile(ritual: ritual)],
                        ),
                  failureBuilder: (_) => BaseEmptyState(
                    title: l10n.errorTitle,
                    text: l10n.errorText,
                    actionText: context.l10n.common.retry,
                    onAction: cubit.load,
                  ),
                ),
              ],
            ),
            footer: hasItems
                ? BaseButton(
                    text: l10n.create,
                    variant: .secondary,
                    onPressed: () => _create(context),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

Future<void> _create(BuildContext context) async {
  final cubit = context.read<RitualsCubit>();
  await context.pushRoute(RitualEditRoute());
  if (context.mounted) await cubit.load();
}

class const _RitualTile({required final Ritual ritual}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.rituals;
    final cubit = context.read<RitualsCubit>();
    final cadence = l10n.cadences.selectOrFallback(ritual.cadence);
    final subtitle = ritual.needsWeekday && ritual.weekday != null
        ? l10n.cadenceOn(cadence: cadence, weekday: l10n.weekdays[ritual.weekday!])
        : cadence;

    return BaseListTile(
      title: ritual.title,
      subtitle: subtitle,
      trailing: BaseTextLink(text: l10n.didIt, onPressed: () => cubit.complete(ritual)),
      onTap: () async {
        await context.pushRoute(RitualEditRoute(id: ritual.id));
        if (context.mounted) await cubit.load();
      },
    );
  }
}
