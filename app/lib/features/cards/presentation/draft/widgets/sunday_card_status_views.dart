import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/draft/cubit/sunday_card_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// A card the person is keeping for later. Nothing is lost and it can still be sent.
class const SundayCardHeld({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.sundayCard.held;
    final isSending = context.select(
      (SundayCardCubit cubit) => cubit.state.deliverAction.isLoading,
    );

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            header: true,
            liveRegion: true,
            child: AppHighlightedText(
              text: l10n.title,
              highlight: l10n.titleHighlight,
              style: context.text.display,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpace.s12),
          Text(
            l10n.text,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(text: l10n.keepHolding, onPressed: () => context.router.maybePop()),
          const SizedBox(height: AppSpace.s10),
          BaseButton(
            text: l10n.sendAnyway,
            variant: .secondary,
            isLoading: isSending,
            onPressed: () => confirmSend(context),
          ),
        ],
      ),
    );
  }
}

/// A card that reached the partner.
class const SundayCardSent({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.sundayCard.sent;
    final name = context.select((SundayCardCubit cubit) => cubit.state.partnerName);

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            liveRegion: true,
            child: Text(l10n.title, style: context.text.titleXl, textAlign: TextAlign.center),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            name == null ? l10n.textNoName : l10n.text(name: name),
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: BaseButton(text: l10n.done, onPressed: () => context.router.maybePop()),
    );
  }
}

/// Asks before sending, since a sent card cannot be changed.
Future<void> confirmSend(BuildContext context) async {
  final l10n = context.l10n.sundayCard.send;
  final cubit = context.read<SundayCardCubit>();
  final name = cubit.state.partnerName;
  final confirmed = await BaseConfirmSheet.show(
    context: context,
    title: l10n.title,
    text: name == null ? l10n.textNoName : l10n.text(name: name),
    confirmText: l10n.confirm,
  );
  if (confirmed) await cubit.send();
}

/// Asks before holding the card back for the week.
Future<void> confirmHold(BuildContext context) async {
  final l10n = context.l10n.sundayCard.hold;
  final cubit = context.read<SundayCardCubit>();
  final confirmed = await BaseConfirmSheet.show(
    context: context,
    title: l10n.title,
    text: l10n.text,
    confirmText: l10n.confirm,
  );
  if (confirmed) await cubit.hold();
}
