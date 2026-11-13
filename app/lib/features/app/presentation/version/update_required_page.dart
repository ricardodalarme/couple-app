import 'dart:io';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:link_launcher_service/link_launcher_service.dart';

/// The blocking screen for an app below the minimum version. Local drafts are untouched.
class const UpdateRequiredPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.globalErrors;

    return BaseView(
      appBar: null,
      body: BaseMomentContent(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BaseFace(kind: FaceKind.tired, size: FaceSize.showcase),
            const SizedBox(height: AppSpace.s20),
            AppHighlightedText(
              text: l10n.updateTitle,
              highlight: l10n.updateHighlight,
              style: context.text.display,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpace.s8),
            Text(
              l10n.updateText,
              textAlign: TextAlign.center,
              style: context.text.body.copyWith(color: context.colors.textSecondary),
            ),
          ],
        ),
        footer: BaseButton(text: l10n.updateAction, onPressed: () => _openStore(context)),
      ),
    );
  }

  Future<void> _openStore(BuildContext context) async {
    final uri = Uri.parse(
      Platform.isIOS ? 'https://apps.apple.com/' : 'https://play.google.com/store/apps',
    );
    final opened = await AppInjector.instance.get<LinkLauncherService>().openExternal(uri);
    if (!opened && context.mounted) {
      BaseToast.show(context, context.l10n.globalErrors.updateUnavailable);
    }
  }
}
