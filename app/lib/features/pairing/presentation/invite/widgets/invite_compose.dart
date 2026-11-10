import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/data/models/active_invite.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/invite/cubit/invite_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The invite message the partner receives, shared as the share sheet text.
String inviteMessage(BuildContext context, ActiveInvite invite) =>
    context.l10n.invite.message(code: invite.code);

class const InviteCompose({required final ActiveInvite invite, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.invite;
    final name = context.select((InviteCubit cubit) => cubit.state.partnerName);
    final message = inviteMessage(context, invite);
    final cubit = context.read<InviteCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: Text(
              name == null ? l10n.titleNoName : l10n.title(name: name),
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s20),
          Text(
            l10n.messageIntro,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s10),
          BaseSurfaceCard(child: Text(message, style: context.text.bodyLg)),
          const SizedBox(height: AppSpace.s16),
          BaseNote(text: l10n.expiryNote(days: _days(invite))),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(text: l10n.share, icon: AppIcons.share, onPressed: () => cubit.share(message)),
          const SizedBox(height: AppSpace.s10),
          BaseButton(
            text: l10n.copy,
            variant: .secondary,
            icon: AppIcons.copy,
            onPressed: () => cubit.copy(message),
          ),
        ],
      ),
    );
  }

  int _days(ActiveInvite invite) {
    final remaining = (invite.expiresAt.difference(DateTime.now()).inHours / 24).ceil();

    return remaining < 1 ? 1 : remaining;
  }
}
