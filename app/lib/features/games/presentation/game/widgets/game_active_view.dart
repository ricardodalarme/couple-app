import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/cubit/game_cubit.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_content_view.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_kind_l10n.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_result_l10n.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The question being answered in a running session.
class const GameActiveView({required final GamePlay play, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (play.stepItem == null) return GameNoContentView(play: play, canCancel: true);

    return switch (play.kind.flow) {
      GameFlow.pick => _PickPlayView(play: play),
      GameFlow.guess => _GuessPlayView(play: play),
      GameFlow.talk => _TalkPlayView(play: play),
      GameFlow.date => _DatePlayView(play: play),
    };
  }
}

class const _PlayScaffold({
  required final GamePlay play,
  required final String title,
  required final Widget content,
  final String? label,
  final String? subtitle,
  final Widget? footer,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.playing;

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.progress(current: play.currentStep + 1, total: play.totalSteps),
            style: context.text.caption.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s8),
          if (label != null) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: BaseTag(text: label!),
            ),
            const SizedBox(height: AppSpace.s12),
          ],
          Semantics(header: true, child: Text(title, style: context.text.titleXl)),
          if (subtitle != null) ...[
            const SizedBox(height: AppSpace.s8),
            Text(subtitle!, style: context.text.body.copyWith(color: context.colors.textSecondary)),
          ],
          const SizedBox(height: AppSpace.s20),
          content,
        ],
      ),
      footer: footer,
    );
  }
}

class const _PickPlayView({required final GamePlay play}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.playing;
    final cubit = context.read<GameCubit>();
    final isBusy = context.select((GameCubit cubit) => cubit.state.isBusy);
    final name = gamePartnerName(play.partnerName, l10n.partnerFallback);
    final item = play.stepItem!;

    Future<void> choose(String answer) async {
      cubit.onDraftChanged(answer);
      await cubit.submit();
    }

    return _PlayScaffold(
      play: play,
      title: item.title,
      content: Column(
        children: [
          BaseOptionTile(
            title: l10n.you,
            isEnabled: !isBusy,
            onTap: isBusy
                ? null
                : () async {
                    await choose(pickSelf);
                  },
          ),
          const SizedBox(height: AppSpace.s10),
          BaseOptionTile(
            title: name,
            isEnabled: !isBusy,
            onTap: isBusy
                ? null
                : () async {
                    await choose(pickPartner);
                  },
          ),
        ],
      ),
    );
  }
}

class const _GuessPlayView({required final GamePlay play}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.playing;
    final cubit = context.read<GameCubit>();
    final draft = context.select((GameCubit cubit) => cubit.state.draft);
    final isBusy = context.select((GameCubit cubit) => cubit.state.isBusy);
    final name = gamePartnerName(play.partnerName, '');
    final isGuess = play.stepPhase == GamePhase.guess;
    final item = play.stepItem!;
    final label = isGuess
        ? name.isEmpty
              ? l10n.guessAboutPartnerFallback
              : l10n.guessAboutPartner(name: name)
        : l10n.guessAboutYou;
    final prompt = isGuess
        ? name.isEmpty
              ? l10n.guessPromptFallback
              : l10n.guessPrompt(name: name)
        : null;
    final hint = isGuess ? l10n.guessHint : l10n.answerHint;
    final options = item.options;

    return _PlayScaffold(
      play: play,
      label: label,
      title: item.title,
      subtitle: prompt,
      content: options.isEmpty
          ? BaseTextArea(
              text: draft,
              hint: hint,
              maxLength: gameAnswerMaxLength,
              onChanged: cubit.onDraftChanged,
            )
          : Column(
              children: [
                for (final option in options)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpace.s10),
                    child: BaseOptionTile(
                      title: option,
                      isSelected: draft == option,
                      isEnabled: !isBusy,
                      onTap: isBusy ? null : () => cubit.onDraftChanged(option),
                    ),
                  ),
              ],
            ),
      footer: _AnswerFooter(
        canSubmit: draft.trim().isNotEmpty && !isBusy,
        isBusy: isBusy,
        onSubmit: cubit.submit,
        onSkip: cubit.skip,
      ),
    );
  }
}

class const _TalkPlayView({required final GamePlay play}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.playing;
    final cubit = context.read<GameCubit>();
    final draft = context.select((GameCubit cubit) => cubit.state.draft);
    final isBusy = context.select((GameCubit cubit) => cubit.state.isBusy);
    final item = play.stepItem!;

    return _PlayScaffold(
      play: play,
      title: item.title,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseTextArea(
            text: draft,
            hint: l10n.talkHint,
            maxLength: gameAnswerMaxLength,
            onChanged: cubit.onDraftChanged,
          ),
          const SizedBox(height: AppSpace.s12),
          BaseNote(text: l10n.talkNote),
        ],
      ),
      footer: _AnswerFooter(
        canSubmit: draft.trim().isNotEmpty && !isBusy,
        isBusy: isBusy,
        onSubmit: cubit.submit,
        onSkip: cubit.skip,
      ),
    );
  }
}

class const _DatePlayView({required final GamePlay play}) extends StatefulWidget {
  @override
  State<_DatePlayView> createState() => _DatePlayViewState();
}

class _DatePlayViewState() extends State<_DatePlayView> {
  bool _started = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games;
    final cubit = context.read<GameCubit>();
    final draft = context.select((GameCubit cubit) => cubit.state.draft);
    final isBusy = context.select((GameCubit cubit) => cubit.state.isBusy);
    final item = widget.play.stepItem!;

    if (!_started) {
      return _PlayScaffold(
        play: widget.play,
        title: item.title,
        subtitle: item.body,
        content: BaseNote(text: l10n.date.startNote, icon: AppIcons.heart),
        footer: BaseButton.primary(
          text: l10n.date.start,
          onPressed: () => setState(() => _started = true),
        ),
      );
    }

    final canSubmit = draft.isNotEmpty && !isBusy;

    return _PlayScaffold(
      play: widget.play,
      title: item.title,
      subtitle: l10n.date.reflectionTitle,
      content: Column(
        children: [
          for (final reflection in dateReflections)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.s10),
              child: BaseOptionTile(
                title: gameReflectionLabel(context, reflection),
                isSelected: draft == reflection,
                isEnabled: !isBusy,
                onTap: isBusy ? null : () => cubit.onDraftChanged(reflection),
              ),
            ),
          BaseNote(text: l10n.date.reflectionText),
        ],
      ),
      footer: BaseButton.primary(
        text: l10n.playing.submit,
        isEnabled: canSubmit,
        isLoading: isBusy,
        onPressed: canSubmit ? cubit.submit : null,
      ),
    );
  }
}

class const _AnswerFooter({
  required final bool canSubmit,
  required final bool isBusy,
  required final VoidCallback onSubmit,
  required final VoidCallback onSkip,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.playing;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseButton.primary(
          text: l10n.submit,
          isEnabled: canSubmit,
          isLoading: isBusy,
          onPressed: canSubmit ? onSubmit : null,
        ),
        const SizedBox(height: AppSpace.s6),
        BaseButton.text(
          text: l10n.skip,
          isEnabled: !isBusy,
          onPressed: isBusy ? null : onSkip,
          isFullWidth: true,
        ),
      ],
    );
  }
}
