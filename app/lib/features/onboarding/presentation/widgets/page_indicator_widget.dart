import 'package:common_ui/common_ui.dart';

class const PageIndicatorWidget({
  required final int current,
  required final int totalPages,
  super.key,
}) extends StatelessWidget {
  static const double _indicatorSize = 8;
  static const double _indicatorSelectedSize = 24;
  static const double _indicatorRadius = 4;
  static const Duration _animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: _animationDuration,
          margin: const EdgeInsets.symmetric(horizontal: Spacings.xsmall),
          height: _indicatorSize,
          width: current == index ? _indicatorSelectedSize : _indicatorSize,
          decoration: BoxDecoration(
            color: current == index ? context.palette.primary : context.palette.onBackground,
            borderRadius: BorderRadius.circular(_indicatorRadius),
          ),
        ),
      ),
    );
  }
}
