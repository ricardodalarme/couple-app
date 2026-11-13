import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/cubit/game_cubit.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_kind_l10n.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The introduction to a game and the invitation to the partner.
class const GameStartView({required final GamePlay play, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.start;
    final cubit = context.read<GameCubit>();
    final isBusy = context.select((GameCubit cubit) => cubit.state.isBusy);
    final name = gamePartnerName(play.partnerName, '');
    final session = play.session;
    final note = switch (session) {
      GameSession(status: GameStatus.cancelled) => l10n.cancelledNote,
      GameSession() when session.isExpired(clock.now()) => l10n.expiredNote,
      _ => null,
    };

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
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
            play.kind.intro(context),
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s16),
          BaseNote(text: l10n.noWinnerNote, icon: AppIcons.heart),
          if (note != null) ...[
            const SizedBox(height: AppSpace.s12),
            BaseNote(text: note, icon: AppIcons.info),
          ],
        ],
      ),
      footer: BaseButton.primary(
        text: name.isEmpty ? l10n.ctaFallback : l10n.cta(name: name),
        isLoading: isBusy,
        onPressed: cubit.invite,
      ),
    );
  }
}
