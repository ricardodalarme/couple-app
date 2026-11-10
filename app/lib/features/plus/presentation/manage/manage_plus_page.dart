import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/manage/cubit/manage_plus_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// The current plan, what each plan includes and the way to the store page.
@RoutePage()
class const ManagePlusPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ManagePlusCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.plus;
    final plus = context.select((ManagePlusCubit cubit) => cubit.state.plus);
    final manageAction = context.select((ManagePlusCubit cubit) => cubit.state.manageAction);
    final cubit = context.read<ManagePlusCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.manageTitle),
      body: BlocListener<ManagePlusCubit, ManagePlusState>(
        listenWhen: (previous, current) => previous.manageAction != current.manageAction,
        listener: (context, state) async {
          if (state.manageAction case Success(:final value)) {
            final opened = await _openStore(value);
            if (!context.mounted) return;
            if (!opened) {
              BaseToast.show(context, l10n.errors.selectOrFallback('storeUnavailable'));
            }
            context.read<ManagePlusCubit>().clearManagement();
          }
        },
        child: SkeletonizerResourceWidget<PlusState>(
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
                if (value.hasBillingProblem) ...[
                  BaseBanner(title: l10n.billingTitle, text: l10n.billingText),
                  const SizedBox(height: AppSpace.s16),
                ],
                BaseListGroup(
                  children: [
                    BaseListTile(
                      title: l10n.planRow,
                      value: value.hasPlus ? _planLabel(context, value.plan) : l10n.freeName,
                    ),
                    if (value.hasPlus && value.status != null)
                      BaseListTile(
                        title: l10n.statusRow,
                        value: _statusLabel(context, value.status!),
                      ),
                    if (value.hasPlus)
                      BaseListTile(
                        title: l10n.coversRow,
                        value: value.isPaidByPartner ? l10n.coveredByPartner : l10n.coversBoth,
                      ),
                    BaseListTile(
                      title: l10n.restorePurchases,
                      icon: AppIcons.refresh,
                      showsChevron: true,
                      onTap: () async {
                        await context.pushRoute(const RestorePurchasesRoute());
                        if (context.mounted) await cubit.load();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: AppSpace.s12),
                if (value.hasPlus) ...[
                  if (value.isPaidByPartner) ...[
                    BaseNote(text: l10n.partnerPays, icon: AppIcons.users),
                    const SizedBox(height: AppSpace.s8),
                  ],
                  BaseNote(text: l10n.partnerCancel, icon: AppIcons.info),
                ] else
                  BaseNote(
                    text: l10n.freeLeft(slips: value.slipsLeft, cards: value.cardsLeft),
                  ),
                const SizedBox(height: AppSpace.s20),
                const _Comparison(),
                if (manageAction case Failure(:final exception)) ...[
                  const SizedBox(height: AppSpace.s16),
                  BaseBanner(
                    title: l10n.storeIssueTitle,
                    text: l10n.errors.selectOrFallback(exception.l10nKey),
                  ),
                ],
                const SizedBox(height: AppSpace.s16),
                BaseNote(text: l10n.alwaysFree),
              ],
            ),
            footer: value.hasPlus
                ? value.isPaidByPartner
                      ? null
                      : BaseButton(
                          text: l10n.manageInStore,
                          isLoading: manageAction.isLoading,
                          onPressed: cubit.openManagement,
                        )
                : BaseButton(
                    text: l10n.seePlus,
                    onPressed: () => context.pushRoute(const PlansRoute()),
                  ),
          ),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: cubit.load,
          ),
        ),
      ),
    );
  }
}

Future<bool> _openStore(Uri url) async {
  try {
    return await launchUrl(url, mode: LaunchMode.externalApplication);
  } catch (_) {
    return false;
  }
}

String _planLabel(BuildContext context, String? plan) {
  final l10n = context.l10n.plus;

  return switch (plan) {
    'plus_monthly' => l10n.monthly,
    'plus_annual' => l10n.yearly,
    'plus_gift' => l10n.giftPlan,
    _ => l10n.plusActive,
  };
}

String _statusLabel(BuildContext context, String status) {
  final l10n = context.l10n.plus;

  return switch (status) {
    'trialing' => l10n.statusTrialing,
    'grace' => l10n.statusGrace,
    'billing_issue' => l10n.statusBillingIssue,
    _ => l10n.statusActive,
  };
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
