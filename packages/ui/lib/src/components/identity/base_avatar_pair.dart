import 'package:ui/ui.dart';

const double _largeSize = 64;
const double _overlap = 8;
const double _largeOverlap = 12;

/// The account holder's avatar followed by the partner's, slightly overlapped.
///
/// Without a partner the second slot is an empty avatar. [onTap] makes the
/// pair actionable.
class const BaseAvatarPair({
  final String? selfInitials,
  final String? partnerInitials,
  final String? selfImageUrl,
  final String? partnerImageUrl,
  final double size = 40,
  final VoidCallback? onTap,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final overlap = size >= _largeSize ? _largeOverlap : _overlap;
    final hasPartner = partnerInitials != null || partnerImageUrl != null;

    final pair = SizedBox(
      width: size * 2 - overlap,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            child: BaseAvatar(
              initials: selfInitials,
              imageUrl: selfImageUrl,
              size: size,
              isEmpty: selfInitials == null && selfImageUrl == null,
            ),
          ),
          Positioned(
            left: size - overlap,
            child: BaseAvatar(
              initials: partnerInitials,
              imageUrl: partnerImageUrl,
              size: size,
              isPartner: true,
              isEmpty: !hasPartner,
            ),
          ),
        ],
      ),
    );

    if (onTap != null) {
      return AppPressable(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size),
        semanticLabel: semanticLabel,
        enforceMinTapTarget: true,
        child: pair,
      );
    }
    if (semanticLabel == null) return pair;

    return Semantics(label: semanticLabel, image: true, child: pair);
  }
}
