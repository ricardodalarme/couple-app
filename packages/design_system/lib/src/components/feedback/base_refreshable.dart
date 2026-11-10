import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart' show RefreshIndicator, RefreshIndicatorStatus;

const double _indicatorSide = 38;
const double _ringSide = 22;
const double _ringStroke = 2.4;
const Duration _minRefreshDuration = Duration(milliseconds: 600);
const Duration _spinDuration = Duration(milliseconds: 900);

/// Pull-to-refresh with an arc progress ring.
class const BaseRefreshable({
  required final Future<void> Function() onRefresh,
  required final Widget child,
  final String? semanticLabel,
  super.key,
}) extends StatefulWidget {
  @override
  State<BaseRefreshable> createState() => _BaseRefreshableState();
}

class _BaseRefreshableState() extends State<BaseRefreshable> {
  RefreshIndicatorStatus? _status;
  bool _isRefreshing = false;
  bool _isTrackingPull = false;
  double _pullOffset = 0;
  double _pullProgress = 0;
  double _viewportDimension = 0;

  Future<void> _refresh() async {
    if (mounted) {
      setState(() {
        _isRefreshing = true;
        _pullProgress = 1;
      });
    }
    final startedAt = DateTime.now();
    try {
      await widget.onRefresh();
      final elapsed = DateTime.now().difference(startedAt);
      if (elapsed < _minRefreshDuration) {
        await Future<void>.delayed(_minRefreshDuration - elapsed);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isRefreshing = false;
          _isTrackingPull = false;
          _pullOffset = 0;
          _pullProgress = 0;
        });
      }
    }
  }

  void _handleStatus(RefreshIndicatorStatus? status) {
    if (status == RefreshIndicatorStatus.armed) HapticFeedback.lightImpact();
    if (status != _status) setState(() => _status = status);
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth != 0) return false;

    if (notification is ScrollStartNotification &&
        notification.dragDetails != null &&
        notification.metrics.extentBefore == 0 &&
        !_isRefreshing) {
      _isTrackingPull = true;
      _pullOffset = 0;
      _viewportDimension = notification.metrics.viewportDimension;
      return false;
    }

    if (!_isTrackingPull) return false;

    if (notification is ScrollUpdateNotification && notification.dragDetails != null) {
      _pullOffset -= notification.scrollDelta ?? 0;
      _updatePullProgress();
    } else if (notification is OverscrollNotification) {
      _pullOffset -= notification.overscroll;
      _updatePullProgress();
    } else if (notification is ScrollEndNotification) {
      _isTrackingPull = false;
      final keepsIndicator =
          _isRefreshing ||
          _status == RefreshIndicatorStatus.armed ||
          _status == RefreshIndicatorStatus.snap ||
          _status == RefreshIndicatorStatus.refresh;
      _pullOffset = keepsIndicator ? _viewportDimension * .25 : 0;
      _updatePullProgress();
    }

    return false;
  }

  void _updatePullProgress() {
    final progress = _viewportDimension <= 0
        ? 0.0
        : (_pullOffset / (_viewportDimension * .25)).clamp(0.0, 1.0);
    if (progress != _pullProgress) {
      setState(() => _pullProgress = progress);
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = _isRefreshing ? 1.0 : _pullProgress;

    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: RefreshIndicator.noSpinner(
        onRefresh: _refresh,
        onStatusChange: _handleStatus,
        semanticsLabel: widget.semanticLabel,
        child: Stack(
          children: [
            widget.child,
            if (progress > 0 || _isRefreshing)
              Positioned(
                top: AppSpace.s12,
                left: 0,
                right: 0,
                child: Center(
                  child: Opacity(
                    opacity: progress,
                    child: Transform.scale(
                      scale: .88 + .12 * progress,
                      child: _RefreshBubble(isRefreshing: _isRefreshing),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class const _RefreshBubble({required final bool isRefreshing}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      key: const ValueKey('baseRefreshableIndicator'),
      width: _indicatorSide,
      height: _indicatorSide,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.bgSurface,
        border: AppBorders.hair(colors.borderDefault),
        boxShadow: AppShadows.knob,
      ),
      child: _RefreshRing(isRefreshing: isRefreshing),
    );
  }
}

class const _RefreshRing({required final bool isRefreshing}) extends StatefulWidget {
  @override
  State<_RefreshRing> createState() => _RefreshRingState();
}

class _RefreshRingState() extends State<_RefreshRing> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _spinDuration);
    if (widget.isRefreshing) _controller.repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncAnimation();
  }

  @override
  void didUpdateWidget(_RefreshRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _syncAnimation() {
    if (widget.isRefreshing && !context.reduceMotion) {
      if (!_controller.isAnimating) _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => SizedBox(
        width: _ringSide,
        height: _ringSide,
        child: CustomPaint(
          painter: _RefreshRingPainter(
            color: context.colors.accentLabel,
            progress: context.reduceMotion ? 0 : _controller.value,
          ),
        ),
      ),
    );
  }
}

class const _RefreshRingPainter({required final Color color, required final double progress})
    extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - _ringStroke) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas
      ..drawCircle(
        center,
        radius,
        Paint()
          ..color = color.withValues(alpha: .2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = _ringStroke,
      )
      ..drawArc(
        rect,
        -math.pi / 2 + progress * 2 * math.pi,
        math.pi / 2,
        false,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = _ringStroke
          ..strokeCap = StrokeCap.round,
      );
  }

  @override
  bool shouldRepaint(_RefreshRingPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.progress != progress;
}
