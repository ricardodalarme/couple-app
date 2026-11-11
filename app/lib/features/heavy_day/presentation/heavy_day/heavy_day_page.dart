import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/heavy_day/presentation/heavy_day/cubit/heavy_day_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Shows exactly what the partner receives before a heavy-day notice is sent.
@RoutePage()
class const HeavyDayPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<HeavyDayCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.heavyDay;
    final setup = context.select((HeavyDayCubit cubit) => cubit.state.setup);
    final action = context.select((HeavyDayCubit cubit) => cubit.state.action);
    final isSent = context.select((HeavyDayCubit cubit) => cubit.state.isSent);
    final cubit = context.read<HeavyDayCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BlocListener<HeavyDayCubit, HeavyDayState>(
        listenWhen: (previous, current) =>
            previous.action != current.action && current.action is Failure,
        listener: (context, _) =>
            BaseToast.show(context, l10n.errorText, variant: BaseToastVariant.error),
        child: switch (setup) {
          Success<HeavyDaySetup>(:final value) =>
            isSent
                ? _SentConfirmation(setup: value)
                : value.hasConsent
                ? _Preview(
                    setup: value,
                    isSaving: action.isLoading,
                    onSharing: cubit.setSharing,
                    onShare: () => cubit.share(body: l10n.noticeBody),
                  )
                : _ActivationGate(isSaving: action.isLoading, onActivate: cubit.activate),
          Failure() => BaseEmptyState(
            face: FaceKind.sad,
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: cubit.load,
          ),
          _ => const Center(child: BaseLoadingDots()),
        },
      ),
    );
  }
}

class const _ActivationGate({required final bool isSaving, required final VoidCallback onActivate})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.heavyDay;

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseEmptyState(title: l10n.gateTitle, text: l10n.gateText, face: FaceKind.thinking),
          const SizedBox(height: AppSpace.s16),
          BaseButton(text: l10n.activate, isLoading: isSaving, onPressed: onActivate),
          const SizedBox(height: AppSpace.s8),
          BaseButton.secondary(
            text: l10n.notNow,
            isFullWidth: true,
            onPressed: () => Navigator.maybePop(context),
          ),
        ],
      ),
    );
  }
}

class const _Preview({
  required final HeavyDaySetup setup,
  required final bool isSaving,
  required final Future<bool> Function(HeavyDaySharing sharing) onSharing,
  required final VoidCallback onShare,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.heavyDay;
    final name = setup.partnerName?.trim();
    final preview = name == null || name.isEmpty
        ? l10n.previewGeneric
        : l10n.previewPartner(name: name);

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.noticeBody, style: context.text.titleSm),
          const SizedBox(height: AppSpace.s8),
          Text(preview, style: context.text.body.copyWith(color: context.colors.textSecondary)),
          const SizedBox(height: AppSpace.s20),
          BaseSegmented(
            segments: [l10n.frequencyAsk, l10n.frequencyAlways],
            selectedIndex: setup.sharing == HeavyDaySharing.always ? 1 : 0,
            onSelectionChanged: (index) =>
                onSharing(index == 0 ? HeavyDaySharing.ask : HeavyDaySharing.always),
          ),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseButton(text: l10n.share, isLoading: isSaving, onPressed: onShare),
          const SizedBox(height: AppSpace.s8),
          BaseButton.secondary(
            text: l10n.cancel,
            isFullWidth: true,
            onPressed: () => Navigator.maybePop(context),
          ),
        ],
      ),
    );
  }
}

class const _SentConfirmation({required final HeavyDaySetup setup}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.heavyDay;
    final name = setup.partnerName?.trim();
    final title = name == null || name.isEmpty
        ? l10n.confirmationGeneric
        : l10n.confirmationTitle(name: name);

    // TODO(owner): no in-app received-notes inbox; widget-only until a read surface exists.
    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: context.text.titleXl),
          const SizedBox(height: AppSpace.s12),
          Text(l10n.noticeBody, style: context.text.body),
          const SizedBox(height: AppSpace.s12),
          BaseNote(text: l10n.confirmationHint, icon: AppIcons.info),
        ],
      ),
    );
  }
}
