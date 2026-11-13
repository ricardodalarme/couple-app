import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/forms/discard_changes.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/cubit/quick_slip_cubit.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/widgets/quick_slip_form.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/widgets/quick_slip_saved.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const QuickSlipPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<QuickSlipCubit>()..start(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.quickSlip;
    final isSaved = context.select((QuickSlipCubit cubit) => cubit.state.isSaved);
    final hasDraft = context.select((QuickSlipCubit cubit) => cubit.state.hasDraft);

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: DirtyFormGuard(
        isDirty: !isSaved && hasDraft,
        title: l10n.discardTitle,
        text: context.l10n.common.discardText,
        child: BlocListener<QuickSlipCubit, QuickSlipState>(
          listenWhen: (previous, current) =>
              previous.saveAction != current.saveAction ||
              previous.undoAction != current.undoAction,
          listener: _onStateChanged,
          child: isSaved ? const QuickSlipSaved() : const QuickSlipForm(),
        ),
      ),
    );
  }

  void _onStateChanged(BuildContext context, QuickSlipState state) {
    final errors = context.l10n.quickSlip.errors;

    final failure = switch ((state.saveAction, state.undoAction)) {
      (Failure(:final exception), _) || (_, Failure(:final exception)) => exception,
      _ => null,
    };
    if (failure != null) {
      BaseToast.show(context, errors.selectOrFallback(failure.l10nKey));
      return;
    }
    if (state.undoAction is Success) context.router.maybePop();
  }
}
