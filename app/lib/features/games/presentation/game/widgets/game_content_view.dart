import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_cancel_dialog.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_kind_l10n.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The honest empty state of a game with no published content.
class const GameNoContentView({
  required final GamePlay play,
  final bool canCancel = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games;

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: Text(play.kind.title(context), style: context.text.titleXl),
          ),
          const SizedBox(height: AppSpace.s20),
          BaseEmptyState(
            title: l10n.start.noContentTitle,
            text: l10n.start.noContentText,
            actionText: canCancel ? l10n.active.cancel : null,
            onAction: canCancel ? () => confirmCancelGame(context) : null,
            isSecondaryAction: true,
          ),
        ],
      ),
    );
  }
}

/// The empty state shown while the couple is not connected.
class const GameNoPartnerView({required final GamePlay play, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.noPartner;

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: Text(play.kind.title(context), style: context.text.titleXl),
          ),
          const SizedBox(height: AppSpace.s20),
          BaseEmptyState(title: l10n.title, text: l10n.text),
        ],
      ),
    );
  }
}
