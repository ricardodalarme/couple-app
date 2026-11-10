import 'package:core/core.dart';
import 'package:design_system/design_system_l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef SuccessBuilder<T> = Widget Function(T value);
typedef FailureBuilder = Widget Function(LocalizedException exception);

class const SkeletonizerResourceWidget<T>(
  final Resource<T> resource, {
  required final T fakeValue,
  required final SuccessBuilder<T> successBuilder,
  required final FailureBuilder failureBuilder,
  super.key,
}) extends StatefulWidget {
  @override
  State<SkeletonizerResourceWidget<T>> createState() => _SkeletonizerResourceWidgetState<T>();
}

class _SkeletonizerResourceWidgetState<T>() extends State<SkeletonizerResourceWidget<T>> {
  late T _fakeData;

  @override
  void initState() {
    super.initState();
    _fakeData = widget.fakeValue;
  }

  @override
  void didUpdateWidget(covariant SkeletonizerResourceWidget<T> oldWidget) {
    // Reuse the previous success value while loading new data so the screen
    // keeps its visual state.
    if (oldWidget.resource is Success<T> && widget.resource is Loading) {
      _fakeData = (oldWidget.resource as Success<T>).value;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // A successful null is a real value (for example "not visible"); only a
    // loading slot falls back to the fake.
    final value = switch (widget.resource) {
      Success<T>(:final value) => value,
      _ => _fakeData,
    };

    return switch (widget.resource) {
      Initial() => const SizedBox.shrink(),
      Failure(:final exception) => widget.failureBuilder(exception),
      Loading() || Success() => Skeletonizer(
        enabled: widget.resource.isLoading,
        child: _buildContent(context, value),
      ),
    };
  }

  Widget _buildContent(BuildContext context, T value) {
    final content = widget.successBuilder(value);
    if (!widget.resource.isLoading) return content;

    return Semantics(
      liveRegion: true,
      label: context.designSystemL10nOrBase.common.loading,
      child: ExcludeSemantics(child: content),
    );
  }
}
