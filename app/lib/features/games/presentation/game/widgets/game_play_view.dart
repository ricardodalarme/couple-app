import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_active_view.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_content_view.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_finished_view.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_invitation_view.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_start_view.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_waiting_partner_view.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_waiting_view.dart';

/// Picks the screen for where the game stands.
class const GamePlayView({required final GamePlay play, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return switch (play.stage(clock.now())) {
      GameStage.noPartner => GameNoPartnerView(play: play),
      GameStage.noContent => GameNoContentView(play: play),
      GameStage.start => GameStartView(play: play),
      GameStage.waiting => GameWaitingView(play: play),
      GameStage.invitation => GameInvitationView(play: play),
      GameStage.contentMissing => GameNoContentView(play: play, canCancel: true),
      GameStage.playing => GameActiveView(play: play),
      GameStage.waitingForPartner => GameWaitingPartnerView(play: play),
      GameStage.finished => GameFinishedView(play: play),
    };
  }
}
