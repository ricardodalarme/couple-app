import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/hard_conversation_draft.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/hard_conversation/cubit/hard_conversation_cubit.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/lock/plus_lock.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Three steps that end with a sentence the person edits and sends themselves.
@RoutePage()
class const HardConversationPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<HardConversationCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.hardConversation;
    final status = context.select((HardConversationCubit cubit) => cubit.state.status);
    final gate = context.select((HardConversationCubit cubit) => cubit.state.gate);
    final step = context.select((HardConversationCubit cubit) => cubit.state.step);
    final cubit = context.read<HardConversationCubit>();

    return BaseView(
      appBar: BaseAppBar(
        title: l10n.title,
        subtitle: status is Success && gate == HardConversationGate.ready
            ? l10n.stepOf(current: step.index + 1, total: 3)
            : null,
        stepIndicator: status is Success && gate == HardConversationGate.ready
            ? BaseStepper(count: 3, currentIndex: step.index)
            : null,
      ),
      body: BlocListener<HardConversationCubit, HardConversationState>(
        listenWhen: (previous, current) =>
            previous.generateAction != current.generateAction ||
            previous.sendAction != current.sendAction ||
            previous.copyAction != current.copyAction ||
            previous.enableAction != current.enableAction,
        listener: (context, state) {
          final failure = switch ((
            state.generateAction,
            state.sendAction,
            state.copyAction,
            state.enableAction,
          )) {
            (Failure(:final exception), _, _, _) ||
            (_, Failure(:final exception), _, _) ||
            (_, _, Failure(:final exception), _) ||
            (_, _, _, Failure(:final exception)) => exception,
            _ => null,
          };
          if (failure != null) {
            BaseToast.show(context, l10n.errors.selectOrFallback(failure.l10nKey));
          } else if (state.sendAction is Success) {
            BaseToast.show(context, l10n.sent);
          } else if (state.copyAction is Success) {
            BaseToast.show(context, l10n.copied);
          }
        },
        child: switch (status) {
          Loading() || Initial() => const Center(child: BaseLoadingDots()),
          Failure() => BaseEmptyState(
            title: l10n.emptyTitle,
            text: l10n.emptyText,
            actionText: context.l10n.common.retry,
            onAction: cubit.load,
          ),
          Success() => _Body(gate: gate, step: step),
        },
      ),
    );
  }
}

class const _Body({
  required final HardConversationGate gate,
  required final HardConversationStep step,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chat = context.l10n.chat;
    final cubit = context.read<HardConversationCubit>();

    return switch (gate) {
      HardConversationGate.plusRequired => BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              header: true,
              child: Text(context.l10n.hardConversation.title, style: context.text.titleXl),
            ),
            const SizedBox(height: AppSpace.s16),
            PlusLock(
              title: context.l10n.hardConversation.plusTitle,
              text: context.l10n.hardConversation.plusText,
            ),
          ],
        ),
        footer: BaseButton(
          text: context.l10n.hardConversation.plusCta,
          onPressed: () => context.pushRoute(const PlansRoute()),
        ),
      ),
      HardConversationGate.needsConsent => BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              header: true,
              child: Text(context.l10n.hardConversation.title, style: context.text.titleXl),
            ),
            const SizedBox(height: AppSpace.s8),
            Text(
              chat.consentText,
              style: context.text.body.copyWith(color: context.colors.textSecondary),
            ),
            const SizedBox(height: AppSpace.s16),
            BaseNote(text: chat.consentPrivacy),
          ],
        ),
        footer: BaseButton(text: chat.consentTurnOn, onPressed: cubit.enable),
      ),
      HardConversationGate.limitReached => BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              header: true,
              child: Text(context.l10n.hardConversation.title, style: context.text.titleXl),
            ),
            const SizedBox(height: AppSpace.s16),
            PlusLock(
              title: context.l10n.hardConversation.limitTitle,
              text: context.l10n.hardConversation.limitText,
            ),
          ],
        ),
        footer: BaseButton(
          text: context.l10n.hardConversation.plusCta,
          onPressed: () => context.pushRoute(const PlansRoute()),
        ),
      ),
      HardConversationGate.unavailable => BaseEmptyState(
        title: chat.unavailableTitle,
        text: chat.unavailableText,
      ),
      HardConversationGate.ready => switch (step) {
        HardConversationStep.whatHappened => const _WhatStep(),
        HardConversationStep.whatINeed => const _NeedStep(),
        HardConversationStep.howToSay => const _SayStep(),
      },
    };
  }
}

class const _WhatStep() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.hardConversation;
    final choice = context.select((HardConversationCubit cubit) => cubit.state.whatChoice);
    final text = context.select((HardConversationCubit cubit) => cubit.state.whatText);
    final canContinue = context.select(
      (HardConversationCubit cubit) => cubit.state.canContinueWhat,
    );
    final cubit = context.read<HardConversationCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(header: true, child: Text(l10n.whatTitle, style: context.text.titleXl)),
          const SizedBox(height: AppSpace.s16),
          Column(
            spacing: AppSpace.s10,
            children: [
              BaseOptionTile(
                title: l10n.whatIgnored,
                isSelected: choice == l10n.whatIgnored,
                onTap: () => cubit.selectWhat(l10n.whatIgnored),
              ),
              BaseOptionTile(
                title: l10n.whatMoney,
                isSelected: choice == l10n.whatMoney,
                onTap: () => cubit.selectWhat(l10n.whatMoney),
              ),
              BaseOptionTile(
                title: l10n.whatMisunderstanding,
                isSelected: choice == l10n.whatMisunderstanding,
                onTap: () => cubit.selectWhat(l10n.whatMisunderstanding),
              ),
              BaseOptionTile(
                title: l10n.whatOther,
                isSelected: choice == hardConversationOtherChoice,
                onTap: () => cubit.selectWhat(hardConversationOtherChoice),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.s16),
          BaseTextField(text: text.value, hint: l10n.whatHint, onChanged: cubit.onWhatTextChanged),
          const SizedBox(height: AppSpace.s16),
          BaseNote(text: l10n.privateNote),
        ],
      ),
      footer: Row(
        children: [
          BaseButton.secondary(
            text: l10n.needPause,
            onPressed: () => context.pushRoute(const PauseRoute()),
          ),
          const SizedBox(width: AppSpace.s10),
          Expanded(
            child: BaseButton(text: l10n.next, isEnabled: canContinue, onPressed: cubit.next),
          ),
        ],
      ),
    );
  }
}

class const _NeedStep() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.hardConversation;
    final choice = context.select((HardConversationCubit cubit) => cubit.state.needChoice);
    final text = context.select((HardConversationCubit cubit) => cubit.state.needText);
    final canContinue = context.select(
      (HardConversationCubit cubit) => cubit.state.canContinueNeed,
    );
    final isOffline = context.select((ConnectivityCubit cubit) => cubit.state.isOffline);
    final cubit = context.read<HardConversationCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(header: true, child: Text(l10n.needTitle, style: context.text.titleXl)),
          const SizedBox(height: AppSpace.s16),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              BaseChoiceChip(
                label: l10n.needHeard,
                isSelected: choice == l10n.needHeard,
                onTap: () => cubit.selectNeed(l10n.needHeard),
              ),
              BaseChoiceChip(
                label: l10n.needApology,
                isSelected: choice == l10n.needApology,
                onTap: () => cubit.selectNeed(l10n.needApology),
              ),
              BaseChoiceChip(
                label: l10n.needAgree,
                isSelected: choice == l10n.needAgree,
                onTap: () => cubit.selectNeed(l10n.needAgree),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.s16),
          BaseTextField(text: text.value, hint: l10n.needHint, onChanged: cubit.onNeedTextChanged),
          if (isOffline) ...[
            const SizedBox(height: AppSpace.s16),
            BaseNote(text: l10n.offline, icon: AppIcons.wifi_off),
          ],
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(text: l10n.next, isEnabled: canContinue && !isOffline, onPressed: cubit.next),
          const SizedBox(height: AppSpace.s6),
          BaseButton.text(text: l10n.back, onPressed: cubit.back, isFullWidth: true),
        ],
      ),
    );
  }
}

class const _SayStep() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.hardConversation;
    final message = context.select((HardConversationCubit cubit) => cubit.state.message);
    final isGenerating = context.select((HardConversationCubit cubit) => cubit.state.isGenerating);
    final canCopy = context.select((HardConversationCubit cubit) => cubit.state.canCopy);
    final isSending = context.select(
      (HardConversationCubit cubit) => cubit.state.sendAction.isLoading,
    );
    final generateFailed = context.select(
      (HardConversationCubit cubit) => cubit.state.generateAction is Failure,
    );
    final isOffline = context.select((ConnectivityCubit cubit) => cubit.state.isOffline);
    final cubit = context.read<HardConversationCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(header: true, child: Text(l10n.sayTitle, style: context.text.titleXl)),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.sayIntro,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s16),
          if (isGenerating) ...[
            const Center(child: BaseLoadingDots()),
            const SizedBox(height: AppSpace.s8),
            Text(
              l10n.generating,
              textAlign: TextAlign.center,
              style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
            ),
            const SizedBox(height: AppSpace.s16),
          ],
          BaseTextArea(
            text: message.value,
            hint: l10n.sayHint,
            maxLength: hardConversationMessageMaxLength,
            isEnabled: !isGenerating,
            errorText: l10n.messageErrors.selectOrNull(message.errorName),
            onChanged: cubit.onMessageChanged,
          ),
          const SizedBox(height: AppSpace.s12),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              BaseButton.secondary(
                text: l10n.gentler,
                onPressed: isGenerating || isOffline
                    ? null
                    : () => cubit.regenerate(HardConversationTone.gentler),
              ),
              BaseButton.secondary(
                text: l10n.moreDirect,
                onPressed: isGenerating || isOffline
                    ? null
                    : () => cubit.regenerate(HardConversationTone.moreDirect),
              ),
            ],
          ),
          if (generateFailed || (!isGenerating && message.value.trim().isEmpty)) ...[
            const SizedBox(height: AppSpace.s8),
            BaseTextLink(text: l10n.retry, onPressed: isOffline ? null : cubit.retry),
          ],
          if (isOffline) ...[
            const SizedBox(height: AppSpace.s16),
            BaseNote(text: l10n.offline, icon: AppIcons.wifi_off),
          ],
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(
            text: l10n.sendAsNote,
            isEnabled: !isGenerating,
            isLoading: isSending,
            onPressed: cubit.send,
          ),
          const SizedBox(height: AppSpace.s6),
          Row(
            children: [
              Expanded(
                child: BaseButton.text(
                  text: l10n.copy,
                  onPressed: canCopy ? cubit.copy : null,
                  isFullWidth: true,
                ),
              ),
              Expanded(
                child: BaseButton.text(
                  text: l10n.exit,
                  onPressed: () => context.router.maybePop(),
                  isFullWidth: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
