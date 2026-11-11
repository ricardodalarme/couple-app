import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/cubit/game_cubit.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_cancel_dialog.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_kind_l10n.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_result_l10n.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Everything this person saved, while the partner finishes their side.
class const GameWaitingPartnerView({required final GamePlay play, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games;
    final cubit = context.read<GameCubit>();
    final name = gamePartnerName(play.partnerName, '');

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BaseFace(kind: FaceKind.thinking, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            child: Text(l10n.waitingPartner.title, style: context.text.titleXl),
          ),
          const SizedBox(height: AppSpace.s10),
          Text(
            name.isEmpty ? l10n.waitingPartner.textFallback : l10n.waitingPartner.text(name: name),
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          BaseSectionHeader(title: l10n.waitingPartner.answersTitle, isLabel: true),
          const SizedBox(height: AppSpace.s8),
          BaseListGroup(children: _rows(context, play)),
          const SizedBox(height: AppSpace.s16),
          BaseNote(text: l10n.hub.refreshNote, icon: AppIcons.refresh),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton.primary(text: l10n.waitingPartner.checkAgain, onPressed: cubit.refresh),
          const SizedBox(height: AppSpace.s6),
          BaseButton.text(
            text: l10n.waitingPartner.cancel,
            onPressed: () => confirmCancelGame(context),
            isFullWidth: true,
          ),
        ],
      ),
    );
  }

  List<Widget> _rows(BuildContext context, GamePlay play) {
    final l10n = context.l10n.games;

    return switch (play.kind.flow) {
      GameFlow.pick => [
        for (final result in play.pickResults)
          if (result.mine != null)
            BaseListTile(
              title: result.item.title,
              subtitle: gamePersonLabel(context, result.mine, partnerName: play.partnerName),
              subtitleMaxLines: 2,
              showsDivider: true,
            ),
      ],
      GameFlow.guess => [
        for (final result in play.guessResults)
          BaseListTile(
            title: result.item.title,
            subtitle:
                '${l10n.finished.you}: ${gameAnswerLabel(context, result.ownAnswer)} · '
                '${l10n.playing.guessYourGuess}: ${gameAnswerLabel(context, result.ownGuess)}',
            subtitleMaxLines: 2,
            showsDivider: true,
          ),
      ],
      GameFlow.talk => [
        for (final result in play.talkResults)
          BaseListTile(
            title: result.item.title,
            subtitle: gameAnswerLabel(context, result.mine),
            subtitleMaxLines: 2,
            showsDivider: true,
          ),
      ],
      GameFlow.date => [
        BaseListTile(
          title: play.items.isEmpty ? l10n.date.reflectionTitle : play.items.first.title,
          subtitle: gameReflectionLabel(context, play.ownReflection),
          subtitleMaxLines: 2,
        ),
      ],
    };
  }
}
