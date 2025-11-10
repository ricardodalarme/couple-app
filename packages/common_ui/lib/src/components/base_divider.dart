import 'package:common_ui/src/theme/theme_extensions.dart';
import 'package:common_ui/src/tokens/spacings.dart';
import 'package:flutter/widgets.dart';

class BaseDivider extends StatelessWidget {
  const BaseDivider({this.startMargin = Spacings.none, this.endMargin = Spacings.none, super.key});

  final double startMargin;
  final double endMargin;

  static const double _borderWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: startMargin, bottom: endMargin),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.palette.onBackground, width: _borderWidth),
        ),
      ),
    );
  }
}
