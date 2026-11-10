import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/plans/cubit/plans_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Free and Plus side by side, with store prices and no pressure. Safety, pause and unpair are free.
@RoutePage()
class const PlansPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<PlansCubit>()..load(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.plus;
    final plus = context.select((PlansCubit cubit) => cubit.state.plus);

    return BaseView(
      body: SkeletonizerResourceWidget<PlusState>(
        plus,
        fakeValue: PlusState.fake(),
        successBuilder: (value) => BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                header: true,
                child: Text(
                  value.hasPlus ? l10n.activeTitle : l10n.title,
                  style: context.text.titleXl,
                ),
              ),
              const SizedBox(height: AppSpace.s8),
              Text(
                value.isPaidByPartner
                    ? l10n.paidByPartner
                    : value.hasPlus
                    ? l10n.activeText
                    : l10n.subtitle,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s20),
              if (!value.hasPlus) ...[
                BaseNote(
                  text: l10n.freeLeft(slips: value.slipsLeft, cards: value.cardsLeft),
                ),
                const SizedBox(height: AppSpace.s16),
              ],
              const _Comparison(),
              if (!value.hasPlus) ...[const SizedBox(height: AppSpace.s20), const _Prices()],
              const SizedBox(height: AppSpace.s16),
              BaseNote(text: l10n.alwaysFree),
            ],
          ),
        ),
        failureBuilder: (_) => BaseEmptyState(
          title: l10n.errorTitle,
          text: l10n.errorText,
          actionText: context.l10n.common.retry,
          onAction: context.read<PlansCubit>().load,
        ),
      ),
    );
  }
}

class const _Comparison() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.plus;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSurfaceCard(title: l10n.freeName, supportText: l10n.freeFeatures),
        const SizedBox(height: AppSpace.s12),
        BaseSurfaceCard(title: l10n.plusName, supportText: l10n.plusFeatures),
      ],
    );
  }
}

class const _Prices() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.plus;
    final prices = context.select((PlansCubit cubit) => cubit.state.prices);

    return SkeletonizerResourceWidget<List<PlanPrice>>(
      prices,
      fakeValue: const [
        PlanPrice(id: 'm', price: r'R$ 0,00', isYearly: false),
        PlanPrice(id: 'y', price: r'R$ 0,00', isYearly: true),
      ],
      successBuilder: (list) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final price in list) ...[
            BaseSurfaceCard(
              title: price.isYearly ? l10n.yearly : l10n.monthly,
              supportText: price.price,
            ),
            const SizedBox(height: AppSpace.s12),
          ],
        ],
      ),
      failureBuilder: (_) => BaseEmptyState(
        title: l10n.storeTitle,
        text: l10n.storeText,
        actionText: context.l10n.common.retry,
        onAction: context.read<PlansCubit>().loadPrices,
      ),
    );
  }
}
