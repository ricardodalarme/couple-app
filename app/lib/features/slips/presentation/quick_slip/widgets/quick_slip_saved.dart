import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/cubit/quick_slip_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const QuickSlipSaved({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.quickSlip.saved;
    final outcome = context.select((QuickSlipCubit cubit) => cubit.state.saveAction);
    final canUndo = context.select((QuickSlipCubit cubit) => cubit.state.canUndo);
    final isUndoing = context.select((QuickSlipCubit cubit) => cubit.state.undoAction.isLoading);
    final isQueued = outcome is Success<SlipSaveOutcome> && outcome.value == SlipSaveOutcome.queued;

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            liveRegion: true,
            child: Text(l10n.title, style: context.text.titleXl, textAlign: TextAlign.center),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            isQueued ? l10n.queued : l10n.added,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          if (canUndo) ...[
            const SizedBox(height: AppSpace.s8),
            Text(
              l10n.undoHint,
              textAlign: TextAlign.center,
              style: context.text.caption.copyWith(color: context.colors.textSecondary),
            ),
          ],
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (canUndo) ...[
            BaseButton(
              text: l10n.undo,
              variant: .secondary,
              isLoading: isUndoing,
              onPressed: context.read<QuickSlipCubit>().undo,
            ),
            const SizedBox(height: AppSpace.s10),
          ],
          BaseButton(text: l10n.done, onPressed: () => context.router.maybePop()),
        ],
      ),
    );
  }
}
