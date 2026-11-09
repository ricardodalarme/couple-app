import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/src/theme/app_theme.dart';
import 'package:ui/src/tokens/tokens.dart';

/// The seven moods. Emotion lives only in the line drawing.
enum FaceKind() {
  good,
  affectionate,
  tired,
  tense,
  sad,
  thinking,
  smile,
}

/// Face circle and drawing diameters per size token.
enum FaceSize() {
  small,
  medium,
  large,
  reaction,
  showcase,
}

extension FaceSizeGeometry on FaceSize {
  /// Diameter of the white circle.
  double get circle => switch (this) {
    .small => 42,
    .medium => 46,
    .large => 52,
    .reaction => 56,
    .showcase => 64,
  };

  /// Diameter of the line drawing inside the circle.
  double get drawing => switch (this) {
    .small => 28,
    .medium => 30,
    .large => 34,
    .reaction => 32,
    .showcase => 40,
  };
}

/// A hand-drawn face inside a white circle. Pass [semanticLabel] when the face
/// carries meaning, leave it null when it is decoration.
class const BaseFace({
  required final FaceKind kind,
  final FaceSize size = .medium,
  final bool selected = false,
  final String? semanticLabel,
  final Color? tint,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final ink = tint ?? colors.textPrimary;
    final isMarked = selected;

    final circle = Container(
      width: size.circle,
      height: size.circle,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isMarked ? colors.accentSoft : colors.bgSurface,
        border: isMarked ? null : Border.all(color: AppPalette.faceBorder),
        boxShadow: isMarked ? null : AppShadows.face,
      ),
      alignment: Alignment.center,
      child: SvgPicture.string(_faceSvg(kind, ink), width: size.drawing, height: size.drawing),
    );

    final label = semanticLabel;
    if (label == null) return ExcludeSemantics(child: circle);
    return Semantics(label: label, image: true, child: circle);
  }
}

String _faceSvg(FaceKind kind, Color tint) {
  final color = _hex(tint);
  final body = switch (kind) {
    .good =>
      '''
      <path d="M11.5 13v3M20.5 13v3"/>
      <path d="M10 20.5c3.2 3.6 8.8 3.6 12 0"/>''',
    .affectionate =>
      '''
      <path fill="$color" stroke="none" d="M11 16.8c-2.6-1.7-3.6-2.9-3.6-4.2 0-1 .8-1.8 1.8-1.8.8 0 1.4.4 1.8 1.1.4-.7 1-1.1 1.8-1.1 1 0 1.8.8 1.8 1.8 0 1.3-1 2.5-3.6 4.2zM21 16.8c-2.6-1.7-3.6-2.9-3.6-4.2 0-1 .8-1.8 1.8-1.8.8 0 1.4.4 1.8 1.1.4-.7 1-1.1 1.8-1.1 1 0 1.8.8 1.8 1.8 0 1.3-1 2.5-3.6 4.2z"/>
      <path d="M11.5 21.5c2.6 2.6 6.4 2.6 9 0"/>''',
    .tired =>
      '''
      <path d="M9.5 15c1.2 1.2 3 1.2 4.2 0M18.3 15c1.2 1.2 3 1.2 4.2 0"/>
      <path d="M14 22h4"/>
      <path d="M22 6h3.5L22 9.5h3.5" stroke-width="1.5"/>''',
    .tense =>
      '''
      <path d="M9.5 11.5l4 1.5M22.5 11.5l-4 1.5"/>
      <path d="M12 15.5v2M20 15.5v2"/>
      <path d="M10.5 22.5l2-1.5 1.8 1.5 1.8-1.5 1.8 1.5 1.8-1.5 1.8 1.5"/>''',
    .sad =>
      '''
      <path d="M11.5 13.5v2.6M20.5 13.5v2.6"/>
      <path d="M11.5 23c2.6-2.6 6.4-2.6 9 0"/>
      <path stroke-width="1.4" d="M8.6 18.5c-.7 1-1 1.7-1 2.2a1 1 0 002 0c0-.5-.3-1.2-1-2.2z"/>''',
    .thinking =>
      '''
      <path d="M8 9.5l1.4 2.2M5.8 13l1.6.6M24 9.5l-1.4 2.2M26.2 13l-1.6.6"/>
      <path d="M13 14.5v2.4M19 14.5v2.4"/>
      <path d="M13.5 22c1.6 1.3 3.4 1.3 5 0"/>
      <path d="M16 17.5l-.8 2.2h1.4"/>''',
    .smile =>
      '''
      <path d="M10 14.5c.9-1.4 2.7-1.4 3.6 0M18.4 14.5c.9-1.4 2.7-1.4 3.6 0"/>
      <path d="M10.5 19.5c2.8 3.6 8.2 3.6 11 0"/>
      <path d="M6 9l1.6 1.2M26 9l-1.6 1.2"/>''',
  };

  return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
<g fill="none" stroke="$color" stroke-width="1.8" stroke-linecap="round"
stroke-linejoin="round">$body</g></svg>''';
}

String _hex(Color color) {
  final value = color.toARGB32() & 0xFFFFFF;
  return '#${value.toRadixString(16).padLeft(6, '0')}';
}
