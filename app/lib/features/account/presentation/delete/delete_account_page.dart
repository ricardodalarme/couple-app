import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/data/models/deletion_request.dart';
import 'package:flutter_bloc_starter/features/account/presentation/delete/cubit/delete_account_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Explains what deletion erases and when, then asks for the device-owner check.
@RoutePage()
class const DeleteAccountPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<DeleteAccountCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account;
    final deletion = context.select((DeleteAccountCubit c) => c.state.pending);
    final isWorking = context.select((DeleteAccountCubit c) => c.state.action.isLoading);
    final partner = context.select((DeleteAccountCubit c) => c.state.partnerName);

    if (deletion != null) return _PendingBody(deletion: deletion);

    return BaseView(
      appBar: BaseAppBar(title: l10n.deleteTitle),
      body: BlocListener<DeleteAccountCubit, DeleteAccountState>(
        listenWhen: (previous, current) =>
            previous.action != current.action && current.action is Failure,
        listener: (context, state) {
          if (state.action case Failure(:final exception)) {
            BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppHighlightedText(
                text: l10n.deleteTitle,
                highlight: l10n.deleteHighlight,
                style: context.text.display,
              ),
              const SizedBox(height: AppSpace.s12),
              Text(
                l10n.deleteText,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s20),
              BaseBanner(
                title: l10n.deleteWarningTitle,
                text: partner == null
                    ? l10n.deleteWarningNoPartner
                    : l10n.deleteWarning(name: partner),
                variant: BaseBannerVariant.warning,
                icon: AppIcons.warning,
              ),
            ],
          ),
          footer: BaseButton(
            text: l10n.deleteAction,
            variant: BaseButtonVariant.destructive,
            isLoading: isWorking,
            onPressed: () => _confirm(context),
          ),
        ),
      ),
    );
  }

  Future<void> _confirm(BuildContext context) async {
    final l10n = context.l10n.account;
    final cubit = context.read<DeleteAccountCubit>();
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.deleteConfirmTitle,
      text: l10n.deleteConfirmText,
      confirmText: l10n.deleteAction,
      isDestructive: true,
    );
    if (confirmed) await cubit.request(reason: l10n.reauthReason);
  }
}

class const _PendingBody({required final DeletionRequest deletion}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account;
    final date = deletion.purgeAfter.toLocal();
    final month = l10n.months[date.month - 1];

    return BaseView(
      body: BaseMomentContent(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BaseFace(kind: FaceKind.tired, size: FaceSize.showcase),
            const SizedBox(height: AppSpace.s20),
            AppHighlightedText(
              text: l10n.pendingTitle(day: date.day, month: month),
              highlight: l10n.pendingHighlight(day: date.day, month: month),
              style: context.text.display,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpace.s8),
            Text(
              l10n.pendingText,
              textAlign: TextAlign.center,
              style: context.text.body.copyWith(color: context.colors.textSecondary),
            ),
          ],
        ),
        footer: BaseButton(
          text: l10n.pendingCancel,
          onPressed: () async {
            await context.read<DeleteAccountCubit>().cancel();
            if (context.mounted) await context.router.maybePop();
          },
        ),
      ),
    );
  }
}
