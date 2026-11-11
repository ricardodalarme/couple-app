import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/chat/cubit/chat_cubit.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/chat/widgets/save_learning_sheet.dart';
import 'package:flutter_bloc_starter/features/plus/presentation/lock/plus_lock.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// A calm chat with the mascot; nothing said here is stored.
@RoutePage()
class const ChatPage({final ChatMode mode = ChatMode.free, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ChatCubit>()
        ..setMode(mode)
        ..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.chat;
    final stage = context.select((ChatCubit cubit) => cubit.state.stage);
    final isEnabling = context.select((ChatCubit cubit) => cubit.state.enableAction.isLoading);
    final cubit = context.read<ChatCubit>();

    return BaseView(
      appBar: BaseAppBar(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BaseRoundButton(
              icon: AppIcons.settings,
              semanticLabel: l10n.settingsTitle,
              onPressed: () => _openSettings(context, cubit),
            ),
            const SizedBox(width: AppSpace.s4),
            BaseTextLink(
              text: l10n.learnedLink,
              onPressed: () => context.pushRoute(const LearnedItemsRoute()),
            ),
          ],
        ),
      ),
      body: BlocListener<ChatCubit, ChatState>(
        listenWhen: (previous, current) =>
            previous.saveAction != current.saveAction ||
            previous.saveLearningAction != current.saveLearningAction ||
            previous.enableAction != current.enableAction,
        listener: (context, state) {
          final failure = switch ((
            state.saveAction,
            state.saveLearningAction,
            state.enableAction,
          )) {
            (Failure(:final exception), _, _) ||
            (_, Failure(:final exception), _) ||
            (_, _, Failure(:final exception)) => exception,
            _ => null,
          };
          if (failure != null) {
            BaseToast.show(context, l10n.errors.selectOrFallback(failure.l10nKey));
          } else if (state.saveLearningAction is Success) {
            BaseToast.show(context, l10n.learningSaved);
          } else if (state.saveAction is Success) {
            BaseToast.show(context, l10n.slipSaved);
          }
        },
        child: switch (stage) {
          Loading() || Initial() => const Center(child: BaseLoadingDots()),
          Failure() => BaseEmptyState(
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: cubit.load,
          ),
          Success(:final value) => switch (value) {
            ChatStage.needsConsent => BaseStackedContent(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
                  const SizedBox(height: AppSpace.s8),
                  Text(
                    l10n.consentText,
                    style: context.text.body.copyWith(color: context.colors.textSecondary),
                  ),
                  const SizedBox(height: AppSpace.s16),
                  BaseNote(text: l10n.consentPrivacy),
                ],
              ),
              footer: BaseButton(
                text: l10n.consentTurnOn,
                isLoading: isEnabling,
                onPressed: cubit.enable,
              ),
            ),
            ChatStage.unavailable => BaseEmptyState(
              title: l10n.unavailableTitle,
              text: l10n.unavailableText,
            ),
            ChatStage.plusRequired => BaseStackedContent(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
                  const SizedBox(height: AppSpace.s16),
                  PlusLock(title: l10n.plusTitle, text: l10n.plusText),
                ],
              ),
            ),
            ChatStage.ready || ChatStage.limitReached => _Conversation(
              isLimitReached: value == ChatStage.limitReached,
            ),
          },
        },
      ),
    );
  }
}

/// Re-reads the consent when the person comes back, so turning it off closes the composer.
Future<void> _openSettings(BuildContext context, ChatCubit cubit) async {
  await context.pushRoute(const ChatSettingsRoute());
  if (!cubit.isClosed) await cubit.load();
}

class const _Conversation({required final bool isLimitReached}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.chat;
    final isOffline = context.select((ConnectivityCubit cubit) => cubit.state.isOffline);
    final messages = context.select((ChatCubit cubit) => cubit.state.messages);
    final options = context.select((ChatCubit cubit) => cubit.state.options);
    final draft = context.select((ChatCubit cubit) => cubit.state.draft);
    final canSend = context.select((ChatCubit cubit) => cubit.state.canSend) && !isOffline;
    final isReplying = context.select((ChatCubit cubit) => cubit.state.isReplying);
    final messagesLeft = context.select((ChatCubit cubit) => cubit.state.messagesLeft);
    final cubit = context.read<ChatCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.screenMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
          const SizedBox(height: AppSpace.s8),
          Expanded(
            child: messages.isEmpty
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      l10n.emptyHint,
                      style: context.text.body.copyWith(color: context.colors.textSecondary),
                    ),
                  )
                : ListView.separated(
                    reverse: true,
                    itemCount: messages.length,
                    separatorBuilder: (_, _) => const SizedBox(height: AppSpace.s8),
                    itemBuilder: (context, index) =>
                        _Message(message: messages[messages.length - 1 - index]),
                  ),
          ),
          if (options.isNotEmpty) ...[
            const SizedBox(height: AppSpace.s8),
            Wrap(
              spacing: AppSpace.s8,
              runSpacing: AppSpace.s8,
              children: [
                for (final option in options)
                  BaseChoiceChip(label: option, onTap: () => cubit.send(option)),
              ],
            ),
          ],
          const SizedBox(height: AppSpace.s12),
          if (isLimitReached)
            PlusLock(title: l10n.limitTitle, text: l10n.limitText)
          else ...[
            BaseTextField(
              text: draft,
              hint: l10n.inputHint,
              isEnabled: !isReplying && !isOffline,
              onChanged: cubit.onDraftChanged,
              onSubmitted: (_) => canSend ? cubit.sendDraft() : null,
              trailingAction: BaseTextLink(
                text: l10n.send,
                onPressed: canSend ? cubit.sendDraft : null,
              ),
            ),
            const SizedBox(height: AppSpace.s4),
            Text(
              isOffline ? l10n.offline : l10n.messagesLeft(count: messagesLeft),
              style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
            ),
          ],
          const SizedBox(height: AppSpace.s12),
        ],
      ),
    );
  }
}

class const _Message({required final ChatMessage message}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.chat;
    final cubit = context.read<ChatCubit>();

    if (message.isCrisis) return const _CrisisCard();

    if (message.role == ChatRole.user) {
      return Align(
        alignment: Alignment.centerRight,
        child: BaseBubble(variant: BaseBubbleVariant.own, text: message.text),
      );
    }

    if (message.isStreaming && message.text.isEmpty) {
      return const Align(
        alignment: Alignment.centerLeft,
        child: BaseBubble(variant: BaseBubbleVariant.typing),
      );
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: BaseBubble(
        variant: message.isInterrupted ? BaseBubbleVariant.failure : BaseBubbleVariant.other,
        text: message.text.isEmpty ? l10n.interrupted : message.text,
        action: message.isInterrupted
            ? BaseTextLink(text: l10n.retry, onPressed: () => cubit.retry(message))
            : (message.isStreaming
                  ? null
                  : Wrap(
                      spacing: AppSpace.s12,
                      runSpacing: AppSpace.s4,
                      children: [
                        BaseTextLink(
                          text: l10n.saveAsSlip,
                          onPressed: () => cubit.saveAsSlip(message),
                        ),
                        BaseTextLink(
                          text: l10n.saveLearning,
                          onPressed: () => _saveLearning(context, message),
                        ),
                      ],
                    )),
      ),
    );
  }

  Future<void> _saveLearning(BuildContext context, ChatMessage message) async {
    final l10n = context.l10n.chat;
    final cubit = context.read<ChatCubit>();

    await BaseSheet.show<void>(
      context: context,
      title: l10n.learningSheetTitle,
      child: SaveLearningSheet(
        initialText: message.text,
        onSave: (target, text) {
          cubit.saveLearning(target: target, text: text, excerpt: message.text);
        },
      ),
    );
  }
}

class const _CrisisCard() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.chat;

    return BaseSurfaceCard(
      title: l10n.crisisTitle,
      supportText: l10n.crisisText,
      child: Padding(
        padding: const EdgeInsets.only(top: AppSpace.s12),
        child: BaseButton(
          text: l10n.crisisSafeMode,
          variant: .secondary,
          onPressed: () => context.pushRoute(const SafeModeRoute()),
        ),
      ),
    );
  }
}
