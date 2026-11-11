import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/cubit/game_cubit.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_cancel_dialog.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_kind_l10n.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The sent invitation, waiting for the partner to join.
class const GameWaitingView({required final GamePlay play, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games;
    final cubit = context.read<GameCubit>();
    final name = gamePartnerName(play.partnerName, '');

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.thinking, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            child: Text(
              play.kind.title(context),
              textAlign: TextAlign.center,
              style: context.text.titleXl,
            ),
          ),
          const SizedBox(height: AppSpace.s10),
          Text(
            name.isEmpty ? l10n.waiting.textFallback : l10n.waiting.text(name: name),
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s16),
          BaseTag(text: l10n.waiting.status),
          const SizedBox(height: AppSpace.s16),
          BaseNote(text: l10n.waiting.window, icon: AppIcons.clock),
          const SizedBox(height: AppSpace.s8),
          BaseNote(text: l10n.hub.refreshNote, icon: AppIcons.refresh),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton.primary(text: l10n.waiting.checkAgain, onPressed: cubit.refresh),
          const SizedBox(height: AppSpace.s6),
          BaseButton.text(
            text: l10n.waiting.cancel,
            onPressed: () => confirmCancelGame(context),
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
}
