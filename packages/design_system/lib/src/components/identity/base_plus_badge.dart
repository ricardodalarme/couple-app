import 'package:design_system/design_system.dart';

const double _height = 22;

/// A small pill that marks a Plus feature with a word, never a count.
class const BasePlusBadge({required final String text, final String? semanticLabel, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final badge = Container(
      constraints: const BoxConstraints(minHeight: _height),
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.s8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.accentSoft,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: colors.accentHighlight),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.text.micro.copyWith(fontWeight: FontWeight.w600, color: colors.accentOnSoft),
      ),
    );

    if (semanticLabel == null) return badge;

    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(child: badge),
    );
  }
}
