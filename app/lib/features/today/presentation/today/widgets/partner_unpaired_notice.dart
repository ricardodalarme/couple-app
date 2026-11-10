import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const PartnerUnpairedNotice({
  required final VoidCallback onOk,
  final String? partnerName,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.unpair.partnerNotice;
    final name = partnerName;

    return Column(
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpace.screenMargin,
                vertical: AppSpace.s24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BaseFace(kind: FaceKind.sad, size: FaceSize.showcase),
                  const SizedBox(height: AppSpace.s24),
                  Semantics(
                    header: true,
                    liveRegion: true,
                    child: AppHighlightedText(
                      text: name == null ? l10n.titleNoName : l10n.title(name: name),
                      highlight: l10n.highlight,
                      style: context.text.display,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: AppSpace.s12),
                  Text(
                    l10n.text,
                    textAlign: TextAlign.center,
                    style: context.text.body.copyWith(color: context.colors.textSecondary),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpace.screenMargin,
            AppSpace.s16,
            AppSpace.screenMargin,
            AppSpace.s16,
          ),
          child: BaseButton(text: l10n.ok, onPressed: onOk),
        ),
      ],
    );
  }
}
