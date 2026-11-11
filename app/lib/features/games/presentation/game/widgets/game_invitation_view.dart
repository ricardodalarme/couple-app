import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/cubit/game_cubit.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_kind_l10n.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The partner's invitation, with the choice to join now or later.
class const GameInvitationView({required final GamePlay play, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.invitation;
    final cubit = context.read<GameCubit>();
    final isBusy = context.select((GameCubit cubit) => cubit.state.isBusy);
    final name = gamePartnerName(play.partnerName, '');

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.affectionate, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            child: Text(
              name.isEmpty ? l10n.titleFallback : l10n.title(name: name),
              textAlign: TextAlign.center,
              style: context.text.titleXl,
            ),
          ),
          const SizedBox(height: AppSpace.s10),
          Text(
            '${play.kind.title(context)} · ${context.l10n.games.hub.minutes(minutes: play.kind.minutes)}',
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s10),
          Text(
            play.kind.intro(context),
            textAlign: TextAlign.center,
            style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton.primary(text: l10n.join, isLoading: isBusy, onPressed: cubit.join),
          const SizedBox(height: AppSpace.s6),
          BaseButton.text(
            text: l10n.later,
            onPressed: () => context.router.maybePop(),
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
}
