import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/partner/cubit/partner_step_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const PartnerStepPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => PartnerStepCubit(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.partnerStep;
    final choice = context.select((PartnerStepCubit cubit) => cubit.state);

    Future<void> next() async {
      if (choice == PartnerChoice.invite) await context.pushRoute(const InviteRoute());
      if (context.mounted) await context.pushRoute(const NotificationPermissionRoute());
      if (context.mounted) context.read<AppCubit>().completeOnboarding();
    }

    return BaseView(
      appBar: null,
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpace.s24),
            Semantics(
              header: true,
              child: AppHighlightedText(
                text: l10n.title,
                highlight: l10n.titleHighlight,
                style: context.text.display,
              ),
            ),
            const SizedBox(height: AppSpace.s8),
            Text(
              l10n.subtitle,
              style: context.text.body.copyWith(color: context.colors.textSecondary),
            ),
            const SizedBox(height: AppSpace.s24),
            BaseOptionTile(
              title: l10n.inviteTitle,
              support: l10n.inviteSupport,
              isSelected: choice == PartnerChoice.invite,
              onTap: () => context.read<PartnerStepCubit>().choose(PartnerChoice.invite),
            ),
            const SizedBox(height: AppSpace.s10),
            BaseOptionTile(
              title: l10n.aloneTitle,
              support: l10n.aloneSupport,
              isSelected: choice == PartnerChoice.alone,
              onTap: () => context.read<PartnerStepCubit>().choose(PartnerChoice.alone),
            ),
            const SizedBox(height: AppSpace.s12),
            Align(
              alignment: Alignment.centerLeft,
              child: BaseTextLink(
                text: l10n.haveCode,
                onPressed: () => context.pushRoute(const AcceptInviteRoute()),
              ),
            ),
          ],
        ),
        footer: BaseButton(text: l10n.continueButton, onPressed: next),
      ),
    );
  }
}
