import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const AvatarPickerBody({required final HistoryOverview overview, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseOptionTile(
          title: l10n.avatarInitials,
          support: l10n.avatarInitialsNote,
          isSelected: true,
          isEnabled: false,
        ),
        const SizedBox(height: AppSpace.s28),
        Center(
          child: BaseAvatarPair(
            size: 64,
            selfInitials: overview.selfInitials,
            partnerInitials: overview.partnerInitials,
          ),
        ),
        const SizedBox(height: AppSpace.s28),
        BaseNote(text: l10n.avatarNote),
      ],
    );
  }
}
