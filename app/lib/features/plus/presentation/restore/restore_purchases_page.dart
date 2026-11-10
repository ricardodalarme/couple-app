import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/restore/cubit/restore_purchases_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Asks the store to restore purchases and reports what it found.
@RoutePage()
class const RestorePurchasesPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<RestorePurchasesCubit>()..restore(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.plus;
    final action = context.select((RestorePurchasesCubit cubit) => cubit.state.restoreAction);
    final cubit = context.read<RestorePurchasesCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.restorePurchases),
      body: switch (action) {
        Initial() ||
        Loading() => _Loading(title: l10n.restoreLoadingTitle, text: l10n.restoreLoadingText),
        Success(value: RestoreOutcome.unlocked) => _Moment(
          face: FaceKind.smile,
          title: l10n.restoredTitle,
          highlight: l10n.restoredHighlight,
          text: l10n.restoredText,
          footer: BaseButton(text: l10n.done, onPressed: () => context.router.maybePop()),
        ),
        Success(value: RestoreOutcome.pending) => _Moment(
          face: FaceKind.thinking,
          title: l10n.pendingRestoreTitle,
          highlight: l10n.pendingRestoreHighlight,
          text: l10n.pendingRestoreText,
          footer: _RetryFooter(onRetry: cubit.restore),
        ),
        Success(value: RestoreOutcome.nothing) => _Moment(
          face: FaceKind.thinking,
          title: l10n.nothingTitle,
          highlight: l10n.nothingHighlight,
          text: l10n.nothingText,
          footer: _RetryFooter(onRetry: cubit.restore),
        ),
        Failure(:final exception) => _Moment(
          face: FaceKind.thinking,
          title: l10n.restoreFailedTitle,
          highlight: l10n.restoreFailedHighlight,
          text: l10n.errors.selectOrFallback(exception.l10nKey),
          footer: _RetryFooter(onRetry: cubit.restore),
        ),
      },
    );
  }
}

class const _Loading({required final String title, required final String text})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.thinking, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            liveRegion: true,
            child: Text(title, style: context.text.titleXl, textAlign: TextAlign.center),
          ),
          const SizedBox(height: AppSpace.s16),
          const BaseLoadingDots(),
          const SizedBox(height: AppSpace.s12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class const _Moment({
  required final FaceKind face,
  required final String title,
  required final String highlight,
  required final String text,
  required final Widget footer,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseFace(kind: face, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            liveRegion: true,
            child: AppHighlightedText(
              text: title,
              highlight: highlight,
              style: context.text.display,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpace.s12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: footer,
    );
  }
}

class const _RetryFooter({required final VoidCallback onRetry}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.plus;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseButton(text: l10n.tryAgain, onPressed: onRetry),
        const SizedBox(height: AppSpace.s10),
        BaseButton(
          text: l10n.done,
          variant: BaseButtonVariant.text,
          onPressed: () => context.router.maybePop(),
        ),
      ],
    );
  }
}
