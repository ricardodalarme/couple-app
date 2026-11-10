import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/checkin/presentation/checkin/cubit/checkin_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const CheckinWaitingView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.checkin;
    final isComplete = context.select((CheckinCubit cubit) => cubit.state.isOwnComplete);
    final cubit = context.read<CheckinCubit>();

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.affectionate, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            child: Text(
              l10n.waitingTitle,
              textAlign: TextAlign.center,
              style: context.text.titleMd,
            ),
          ),
          const SizedBox(height: AppSpace.s10),
          Text(
            isComplete ? l10n.waitingText : l10n.waitingIncomplete,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s12),
          BaseTextLink(text: l10n.checkAgain, onPressed: cubit.load),
        ],
      ),
      footer: Column(
        children: [
          BaseButton.secondary(
            text: isComplete ? l10n.review : l10n.answerMissing,
            onPressed: isComplete ? cubit.review : cubit.start,
            isFullWidth: true,
          ),
          const SizedBox(height: AppSpace.s6),
          BaseButton.text(
            text: l10n.close,
            onPressed: () => context.router.maybePop(),
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
}
