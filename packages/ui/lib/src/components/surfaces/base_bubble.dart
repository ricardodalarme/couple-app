import 'package:ui/ui.dart';

/// The four states a message bubble can show.
enum BaseBubbleVariant() {
  own,
  other,
  typing,
  failure,
}

const double _maxWidthFactor = .78;
const double _tailRadius = 6;
const double _dotSize = 6;
const double _timeOpacity = .75;

/// A chat message from the account holder, the other person, or the system.
///
/// The speaker's side gets the 6pt corner: own messages sit on the right in
/// `accent.soft`, incoming messages sit on the left on the surface with a hair
/// border. Typing replaces the text with three dots. Failure is an outgoing
/// message that could not be sent: it keeps the surface but takes the error
/// border, and the caller supplies the retry through [action].
class const BaseBubble({
  final BaseBubbleVariant variant = BaseBubbleVariant.other,
  final String? text,
  final String? time,
  final Widget? action,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isOwn = variant == BaseBubbleVariant.own || variant == BaseBubbleVariant.failure;

    final background = switch (variant) {
      .own => colors.accentSoft,
      .other => colors.bgSurface,
      .typing => colors.bgSurface,
      .failure => colors.bgSurface,
    };
    final border = switch (variant) {
      .own => null,
      .other => AppBorders.hair(colors.borderDefault),
      .typing => AppBorders.hair(colors.borderDefault),
      .failure => Border.all(color: AppStatus.error.inkColor(colors), width: AppBorder.error),
    };
    final ink = switch (variant) {
      .own => colors.accentOnSoft,
      .other => colors.textPrimary,
      .typing => colors.textSecondary,
      .failure => colors.textPrimary,
    };
    const radius = Radius.circular(AppRadius.xxl);
    const tail = Radius.circular(_tailRadius);

    final bubble = Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.s14, vertical: AppSpace.s12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: isOwn ? radius : tail,
          bottomRight: isOwn ? tail : radius,
        ),
        border: border,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (variant == BaseBubbleVariant.typing)
            const _TypingDots()
          else if (text != null)
            Text(text!, style: context.text.bodySm.copyWith(color: ink)),
          if (time != null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpace.s6),
              child: Text(
                time!,
                style: context.text.micro.copyWith(color: ink.withValues(alpha: _timeOpacity)),
              ),
            ),
          if (action != null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpace.s8),
              child: action,
            ),
        ],
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final available = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        return Align(
          alignment: isOwn ? Alignment.centerRight : Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: available * _maxWidthFactor),
            child: Semantics(container: true, label: semanticLabel, child: bubble),
          ),
        );
      },
    );
  }
}

class const _TypingDots() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ExcludeSemantics(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _dot(colors.textSecondary),
          const SizedBox(width: AppSpace.s4),
          _dot(colors.textSecondary),
          const SizedBox(width: AppSpace.s4),
          _dot(colors.textSecondary),
        ],
      ),
    );
  }

  Widget _dot(Color color) => Container(
    width: _dotSize,
    height: _dotSize,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}
