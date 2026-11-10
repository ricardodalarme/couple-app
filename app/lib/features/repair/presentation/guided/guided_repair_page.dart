import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/guided_session.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/guided/cubit/guided_repair_cubit.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/guided/widgets/guided_final_step.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/guided/widgets/guided_written_step.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const GuidedRepairPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<GuidedRepairCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.repair.guided;
    final session = context.select((GuidedRepairCubit cubit) => cubit.state.session);

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: BlocListener<GuidedRepairCubit, GuidedRepairState>(
        listenWhen: (previous, current) =>
            previous.completeAction != current.completeAction ||
            previous.saveAction != current.saveAction,
        listener: _onChanged,
        child: SkeletonizerResourceWidget<GuidedSession>(
          session,
          fakeValue: const GuidedSession(id: 'fake'),
          successBuilder: (value) => value.step >= guidedWrittenSteps
              ? const GuidedFinalStep()
              : const GuidedWrittenStep(),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.loadErrorTitle,
            text: l10n.loadErrorText,
            actionText: context.l10n.common.retry,
            onAction: context.read<GuidedRepairCubit>().load,
          ),
        ),
      ),
    );
  }

  void _onChanged(BuildContext context, GuidedRepairState state) {
    final l10n = context.l10n.repair.guided;
    final failure = switch ((state.completeAction, state.saveAction)) {
      (Failure(:final exception), _) || (_, Failure(:final exception)) => exception,
      _ => null,
    };
    if (failure != null) {
      BaseToast.show(context, l10n.errors.selectOrFallback(failure.l10nKey));
      return;
    }
    final session = state.current;
    if (state.completeAction is Success && session != null) {
      context.router.replace(LearningRoute(sessionId: session.id));
    }
  }
}
