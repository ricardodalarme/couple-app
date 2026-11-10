import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/accept/cubit/accept_invite_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const AcceptInviteForm({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.acceptInvite;
    final canAccept = context.select((AcceptInviteCubit cubit) => cubit.state.canAccept);
    final isLoading = context.select(
      (AcceptInviteCubit cubit) => cubit.state.acceptAction.isLoading,
    );
    final cubit = context.read<AcceptInviteCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.title,
              highlight: l10n.titleHighlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.subtitle,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s24),
          BaseTextField(
            type: BaseTextFieldType.inviteCode,
            label: l10n.codeLabel,
            hint: l10n.codeHint,
            onChanged: cubit.onCodeChanged,
          ),
          const SizedBox(height: AppSpace.s14),
          BaseNote(text: l10n.privacyNote),
        ],
      ),
      footer: BaseButton(
        text: l10n.accept,
        isEnabled: canAccept,
        isLoading: isLoading,
        onPressed: cubit.accept,
      ),
    );
  }
}
