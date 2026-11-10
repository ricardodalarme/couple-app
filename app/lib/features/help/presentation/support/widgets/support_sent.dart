import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const SupportSent({required final SupportSendOutcome outcome, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.helpSupport;
    final isQueued = outcome == SupportSendOutcome.queued;

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseFace(kind: isQueued ? FaceKind.thinking : FaceKind.smile, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            liveRegion: true,
            child: Text(
              isQueued ? l10n.queuedTitle : l10n.sentTitle,
              style: context.text.titleXl,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            isQueued ? l10n.queuedText : l10n.sentText,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: BaseButton(text: l10n.done, onPressed: () => context.router.maybePop()),
    );
  }
}
