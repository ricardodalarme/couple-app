import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/viewer/cubit/guide_cubit.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/viewer/widgets/guide_finish_view.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/viewer/widgets/guide_step_view.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// One conversation guide, step by step and private.
@RoutePage()
class const GuidePage({@PathParam('slug') final String slug = '', super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<GuideCubit>()..start(slug),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.guides.viewer;
    final guide = context.select((GuideCubit cubit) => cubit.state.currentGuide);
    final resource = context.select((GuideCubit cubit) => cubit.state.guide);
    final isFinished = context.select((GuideCubit cubit) => cubit.state.isFinished);
    final cubit = context.read<GuideCubit>();

    return BlocListener<GuideCubit, GuideState>(
      listenWhen: (previous, current) =>
          previous.showSensitiveGate != current.showSensitiveGate ||
          previous.saveAction != current.saveAction,
      listener: (context, state) async {
        if (state.showSensitiveGate) {
          final goAhead = await BaseDialog.show<bool>(
            context: context,
            title: context.l10n.guides.gate.title,
            text: state.currentGuide?.gateKey == 'cycle'
                ? context.l10n.guides.gate.cycleText
                : context.l10n.guides.gate.text,
            primaryText: context.l10n.guides.gate.continueAction,
            primaryResult: true,
            secondaryText: context.l10n.guides.gate.otherAction,
            secondaryResult: false,
          );
          if (!context.mounted) return;
          cubit.hideSensitiveGate();
          if (goAhead != true) await context.router.maybePop();

          return;
        }

        final saveAction = state.saveAction;
        if (saveAction is Failure) {
          BaseToast.show(context, l10n.errors.selectOrFallback(saveAction.exception.l10nKey));
        }
      },
      child: BaseView(
        appBar: BaseAppBar(title: guide?.title, onClose: () => context.router.maybePop()),
        body: switch (resource) {
          Loading() => const Center(child: BaseLoadingDots()),
          Failure() => BaseEmptyState(
            title: l10n.loadErrorTitle,
            text: l10n.loadErrorText,
            actionText: context.l10n.common.retry,
            onAction: () => cubit.start(slug),
          ),
          _ => isFinished ? const GuideFinishView() : const GuideStepView(),
        },
      ),
    );
  }
}
