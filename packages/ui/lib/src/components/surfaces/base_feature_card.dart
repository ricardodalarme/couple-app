import 'package:flutter/widgets.dart';
import 'package:ui/src/components/actions/actions.dart';
import 'package:ui/src/components/surfaces/base_face.dart';
import 'package:ui/src/components/surfaces/base_tag.dart';
import 'package:ui/src/drawings/app_squiggle.dart';
import 'package:ui/src/drawings/app_wash.dart';
import 'package:ui/src/icons/app_icon.dart';
import 'package:ui/src/theme/app_theme.dart';
import 'package:ui/src/tokens/tokens.dart';

/// The one feature card of a screen, inside its 6pt ring: a tag, a question
/// with one drawn word, an optional answer context and a single action.
class const BaseFeatureCard({
  required final String tag,
  required final String question,
  required final String highlightedWord,
  required final String actionText,
  final VoidCallback? onAction,
  final FaceKind? face,
  final String? supportText,
  final String? privacyNote,
  final bool isAnswered = false,
  final bool isLoading = false,
  super.key,
}) extends StatelessWidget {
  static const double _questionMaxWidth = 310;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;
    final hasSupport = supportText != null;
    final hasPrivacy = privacyNote != null;
    final hasContext = hasSupport || hasPrivacy;

    final card = ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(color: AppPalette.innerGlow),
        ),
        position: DecorationPosition.foreground,
        child: AppWashSurface(
          wash: AppWash.hero,
          padding: const EdgeInsets.all(AppSpace.s22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: BaseTag(text: tag),
                    ),
                  ),
                  if (face != null) BaseFace(kind: face!),
                ],
              ),
              const SizedBox(height: AppSpace.s20),
              Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: _questionMaxWidth),
                  child: AppHighlightedText(
                    text: question,
                    highlight: highlightedWord,
                    style: text.question,
                  ),
                ),
              ),
              if (hasContext) ...[
                const SizedBox(height: AppSpace.s18),
                if (hasSupport)
                  Text(supportText!, style: text.caption.copyWith(color: colors.textSecondary)),
                if (hasPrivacy) ...[
                  const SizedBox(height: AppSpace.s18),
                  _PrivacyNote(text: privacyNote!),
                ],
              ],
              SizedBox(height: hasContext ? AppSpace.s18 : AppSpace.s44),
              if (isAnswered)
                BaseButton.secondary(
                  text: actionText,
                  onPressed: onAction,
                  isEnabled: onAction != null,
                  isFullWidth: true,
                )
              else
                BaseButton.primary(
                  text: actionText,
                  onPressed: onAction,
                  isLoading: isLoading,
                  isEnabled: onAction != null,
                ),
            ],
          ),
        ),
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppPalette.ringSurface,
        borderRadius: BorderRadius.circular(AppRadius.ring),
        border: Border.all(color: colors.borderDefault),
        boxShadow: AppShadows.ring,
      ),
      child: Padding(padding: const EdgeInsets.all(AppSpace.s6), child: card),
    );
  }
}

class const _PrivacyNote({required final String text}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIcon(icon: AppIcons.lock, size: AppIconSize.sm, color: colors.textPlaceholder),
        const SizedBox(width: AppSpace.s6),
        Expanded(
          child: Text(text, style: context.text.caption.copyWith(color: colors.textSecondary)),
        ),
      ],
    );
  }
}
