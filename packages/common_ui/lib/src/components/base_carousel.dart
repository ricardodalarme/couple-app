import 'package:common_ui/src/components/base_page_indicator.dart';
import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:common_ui/src/tokens/durations.dart';
import 'package:common_ui/src/tokens/easings.dart';
import 'package:common_ui/src/tokens/spacings.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

/// Where a [BaseCarousel] draws its page indicator.
enum BaseCarouselIndicatorPlacement() {
  below,
  onMedia,
}

/// A horizontal set of equally weighted items shown one at a time.
class const BaseCarousel({
  required final int itemCount,
  required final Widget Function(BuildContext context, int index) itemBuilder,
  final double? aspectRatio,
  final double? height,
  final String Function(int current, int count)? dotLabelBuilder,
  final EdgeInsets indicatorPadding = const EdgeInsets.only(
    right: Spacings.large,
    bottom: Spacings.small,
  ),
  final BaseCarouselIndicatorPlacement indicatorPlacement = BaseCarouselIndicatorPlacement.below,
  super.key,
}) extends StatefulWidget {
  this
    : assert(
        aspectRatio != null || height != null,
        'Provide an aspectRatio or a height for the carousel',
      );

  @override
  State<BaseCarousel> createState() => _BaseCarouselState();
}

class _BaseCarouselState() extends State<BaseCarousel> {
  static const double _indicatorHeight = Spacings.small + BasePageIndicator.selectionTargetSize;

  final _controller = PageController();
  int _current = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount <= 0) return const SizedBox.shrink();
    if (widget.itemCount == 1) return _sized(widget.itemBuilder(context, 0));

    return LayoutBuilder(
      builder: (context, constraints) {
        final pages = SizedBox(
          height: _itemHeight(constraints),
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.itemCount,
            onPageChanged: (index) => setState(() => _current = index),
            itemBuilder: widget.itemBuilder,
          ),
        );
        final onMedia = widget.indicatorPlacement == BaseCarouselIndicatorPlacement.onMedia;
        final indicator = SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BasePageIndicator(
            count: widget.itemCount,
            current: _current.clamp(0, widget.itemCount - 1),
            label: widget.dotLabelBuilder?.call(_current + 1, widget.itemCount),
            activeColor: onMedia ? context.palette.background : null,
            inactiveColor: onMedia ? context.palette.background.withValues(alpha: 0.6) : null,
            onSelected: onMedia ? null : (index) => _goTo(context, index),
          ),
        );

        if (onMedia) {
          return Stack(
            children: [
              pages,
              Positioned(
                bottom: widget.indicatorPadding.bottom,
                right: widget.indicatorPadding.right,
                child: indicator,
              ),
            ],
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [pages, const Gap(Spacings.small), indicator],
        );
      },
    );
  }

  void _goTo(BuildContext context, int index) {
    final hideAnimation = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    if (hideAnimation) {
      _controller.jumpToPage(index);
      return;
    }
    _controller.animateToPage(index, duration: Durations.regular, curve: Easings.standard);
  }

  double _itemHeight(BoxConstraints constraints) {
    final aspectRatio = widget.aspectRatio;
    final fromWidth = aspectRatio == null ? widget.height! : constraints.maxWidth / aspectRatio;
    if (!constraints.hasBoundedHeight) return fromWidth;

    final reserved = widget.indicatorPlacement == BaseCarouselIndicatorPlacement.below
        ? _indicatorHeight
        : 0.0;
    final available = (constraints.maxHeight - reserved).clamp(0.0, double.infinity);
    return available < fromWidth ? available : fromWidth;
  }

  Widget _sized(Widget child) {
    final aspectRatio = widget.aspectRatio;
    if (aspectRatio != null) return AspectRatio(aspectRatio: aspectRatio, child: child);

    return SizedBox(height: widget.height, child: child);
  }
}
