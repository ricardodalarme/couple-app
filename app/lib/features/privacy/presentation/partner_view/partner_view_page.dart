import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Exactly what the partner can and cannot see, with no examples invented.
@RoutePage()
class const PartnerViewPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.privacy;

    return BaseView(
      appBar: BaseAppBar(title: l10n.partnerTitle),
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BaseListGroup(
              children: [
                BaseListTile(title: l10n.partnerSlips, subtitle: l10n.partnerSlipsText),
                BaseListTile(title: l10n.partnerPrivateSlips, value: l10n.never),
                BaseListTile(title: l10n.partnerTemperature, value: l10n.never),
                BaseListTile(title: l10n.partnerJournal, value: l10n.never),
                BaseListTile(title: l10n.partnerPause, subtitle: l10n.partnerPauseText),
              ],
            ),
            const SizedBox(height: AppSpace.s12),
            BaseNote(text: l10n.partnerNote, icon: AppIcons.info),
          ],
        ),
      ),
    );
  }
}
