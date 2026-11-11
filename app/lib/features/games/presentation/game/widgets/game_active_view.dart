import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_cancel_dialog.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_kind_l10n.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// A session both people joined.
class const GameActiveView({required final GamePlay play, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.active;

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.good, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            child: Text(l10n.title, textAlign: TextAlign.center, style: context.text.titleXl),
          ),
          const SizedBox(height: AppSpace.s10),
          Text(
            '${play.kind.title(context)} · ${l10n.text}',
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: BaseButton.text(
        text: l10n.cancel,
        onPressed: () => confirmCancelGame(context),
        isFullWidth: true,
      ),
    );
  }
}
