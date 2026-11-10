// SVG markup is split across lines so each path stays readable.
// ignore_for_file: missing_whitespace_between_adjacent_strings
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The envelope with a heart that opens a received card.
class const AppEnvelope({
  final double width = 48,
  final double height = 40,
  final Color? color,
  final Color? paperColor,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ink = _hex(color ?? AppPalette.ideaLabel);
    final paper = _hex(paperColor ?? AppPalette.white);

    final svg =
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 40">'
        '<g fill="none" stroke="$ink" stroke-width="1.8" stroke-linejoin="round" '
        'stroke-linecap="round">'
        '<rect x="3" y="8" width="38" height="27" rx="4" fill="$paper"/>'
        '<path d="M4 10l18 13 18-13"/>'
        '<path d="M38 3c-2.4-2-5.6 1-3 3.6l3 2.8 3-2.8c2.6-2.6-.6-5.6-3-3.6z" '
        'fill="$ink" stroke="none"/>'
        '</g></svg>';

    final picture = SvgPicture.string(svg, width: width, height: height);

    final label = semanticLabel;
    if (label == null) return ExcludeSemantics(child: picture);
    return Semantics(label: label, image: true, child: picture);
  }
}

String _hex(Color color) {
  final value = color.toARGB32() & 0xFFFFFF;
  return '#${value.toRadixString(16).padLeft(6, '0')}';
}
