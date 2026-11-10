import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const GriefSupportPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.griefSupport;

    return BaseView(
      body: BaseMomentContent(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BaseFace(kind: FaceKind.sad, size: FaceSize.showcase),
            const SizedBox(height: AppSpace.s20),
            Semantics(
              header: true,
              liveRegion: true,
              child: AppHighlightedText(
                text: l10n.title,
                highlight: l10n.highlight,
                style: context.text.display,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppSpace.s8),
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
            BaseButton(
              text: l10n.backHome,
              onPressed: () => context.router.root.popUntil((route) => route.isFirst),
            ),
            const SizedBox(height: AppSpace.s10),
            BaseButton(
              text: l10n.seeSupport,
              variant: .secondary,
              onPressed: () => context.pushRoute(const HelpRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
