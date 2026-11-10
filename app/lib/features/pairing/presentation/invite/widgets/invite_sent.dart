import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/data/models/active_invite.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/invite/cubit/invite_cubit.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/invite/widgets/invite_compose.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const InviteSent({required final ActiveInvite invite, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.invite;
    final name = context.select((InviteCubit cubit) => cubit.state.partnerName);
    final isRevoking = context.select((InviteCubit cubit) => cubit.state.revokeAction.isLoading);
    final cubit = context.read<InviteCubit>();

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            header: true,
            liveRegion: true,
            child: AppHighlightedText(
              text: l10n.sentTitle,
              highlight: l10n.sentHighlight,
              style: context.text.display,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpace.s12),
          Text(
            name == null ? l10n.sentTextNoName : l10n.sentText(name: name),
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(
            text: l10n.resend,
            onPressed: () => cubit.share(inviteMessage(context, invite)),
          ),
          const SizedBox(height: AppSpace.s10),
          BaseButton(
            text: l10n.revoke,
            variant: .secondary,
            isLoading: isRevoking,
            onPressed: cubit.revoke,
          ),
        ],
      ),
    );
  }
}
