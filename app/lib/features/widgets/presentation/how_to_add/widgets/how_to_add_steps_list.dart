import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const HowToAddStepsList({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseListGroup(
          children: [
            BaseListTile(
              title: l10n.howToAddStep1Title,
              subtitle: l10n.howToAddStep1Body,
              icon: AppIcons.smartphone,
            ),
            BaseListTile(
              title: l10n.howToAddStep2Title,
              subtitle: l10n.howToAddStep2Body,
              icon: AppIcons.plus,
            ),
            BaseListTile(
              title: l10n.howToAddStep3Title,
              subtitle: l10n.howToAddStep3Body,
              icon: AppIcons.check,
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s16),
        BaseNote(
          text: Platform.isAndroid ? l10n.howToAddAndroidLockNote : l10n.howToAddIosLockNote,
          icon: AppIcons.info,
        ),
      ],
    );
  }
}
