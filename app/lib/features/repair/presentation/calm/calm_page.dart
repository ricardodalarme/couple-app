import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// A calm screen with a slow breathing cadence written as text; there is no timer.
@RoutePage()
class const CalmPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.repair.calm;

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: BaseMomentContent(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
            const SizedBox(height: AppSpace.s20),
            Semantics(
              header: true,
              child: AppHighlightedText(
                text: l10n.title,
                highlight: l10n.titleHighlight,
                style: context.text.titleXl,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppSpace.s12),
            Semantics(
              liveRegion: true,
              child: Text(l10n.cadence, textAlign: TextAlign.center, style: context.text.bodyLg),
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
              text: l10n.ready,
              onPressed: () => context.router.replace(const SoftStartRoute()),
            ),
            const SizedBox(height: AppSpace.s10),
            BaseButton(
              text: l10n.askPause,
              variant: .secondary,
              onPressed: () => context.router.replace(const PauseRoute()),
            ),
            const SizedBox(height: AppSpace.s10),
            BaseButton(
              text: l10n.leave,
              variant: .secondary,
              onPressed: () => context.router.maybePop(),
            ),
          ],
        ),
      ),
    );
  }
}
