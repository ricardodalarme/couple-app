import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/love_style/presentation/exercise/cubit/love_style_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The warm outcome of the exercise: a description, never a label or a score.
class const LoveStyleResultView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.loveStyle;
    final result = context.select((LoveStyleCubit cubit) => cubit.state.savedResult);
    final isInManual = context.select((LoveStyleCubit cubit) => cubit.state.isInManual);
    final isSavingManual = context.select((LoveStyleCubit cubit) => cubit.state.isSavingManual);
    final isSharing = context.select((LoveStyleCubit cubit) => cubit.state.isSharing);
    final isRevoking = context.select((LoveStyleCubit cubit) => cubit.state.isRevokingShare);
    final isShared = context.select((LoveStyleCubit cubit) => cubit.state.isShared);
    final hasPartner = context.select((LoveStyleCubit cubit) => cubit.state.hasPartner);
    final partnerName = context.select((LoveStyleCubit cubit) => cubit.state.partnerName);
    final pairingFailed = context.select((LoveStyleCubit cubit) => cubit.state.pairingFailed);
    final cubit = context.read<LoveStyleCubit>();
    if (result == null) return const SizedBox.shrink();

    final description = l10n.descriptions.selectOrFallback(result.topPattern);
    final shareDescription = l10n.shareDescriptions.selectOrFallback(result.topPattern);

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.resultTitle,
              highlight: l10n.resultHighlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.resultSubtitle,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          BaseSurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BaseTag(text: l10n.topTag),
                    const Spacer(),
                    const BaseFace(kind: FaceKind.affectionate, size: FaceSize.small),
                  ],
                ),
                const SizedBox(height: AppSpace.s14),
                Text(description, style: context.text.titleSm),
              ],
            ),
          ),
          const SizedBox(height: AppSpace.s16),
          BaseNote(text: l10n.resultPrivacyNote),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(
            text: isInManual ? l10n.savedManualAction : l10n.saveManualAction,
            isEnabled: !isInManual,
            isLoading: isSavingManual,
            onPressed: () => cubit.saveToManual(description),
          ),
          const SizedBox(height: AppSpace.s10),
          if (pairingFailed) ...[
            BaseNote(text: l10n.pairingErrorNote),
            BaseTextLink(text: l10n.retryPairing, onPressed: cubit.load),
          ] else if (!hasPartner)
            BaseNote(text: l10n.shareSoloNote)
          else if (isShared)
            BaseButton(
              text: l10n.revokeAction,
              variant: BaseButtonVariant.secondary,
              isLoading: isRevoking,
              onPressed: cubit.revokeShare,
            )
          else
            BaseButton(
              text: l10n.shareAction(name: partnerName ?? l10n.partnerFallback),
              variant: BaseButtonVariant.secondary,
              isLoading: isSharing,
              onPressed: () => cubit.share(shareDescription),
            ),
        ],
      ),
    );
  }
}
