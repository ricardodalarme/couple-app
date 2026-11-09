import 'package:flutter/widgets.dart';
import 'package:ui/src/components/feedback/base_loading_dots.dart';
import 'package:ui/src/theme/app_theme.dart';
import 'package:ui/src/tokens/tokens.dart';
import 'package:ui/src/utils/callback_debouncer.dart';
import 'package:ui/src/widgets/base_list_view.dart';

/// A list that asks for the next page when its last item is built.
class const InfiniteListView({
  required final int itemCount,
  required final VoidCallback onFetchData,
  required final Widget Function(BuildContext context, int index) itemBuilder,
  required final bool hasNextPage,
  required final bool isLoading,
  final Duration debounceDuration = const Duration(milliseconds: 100),
  final Future<void> Function()? onRefresh,
  final EdgeInsets? padding,
  final Widget? separator,
  final ScrollController? controller,
  final WidgetBuilder? emptyBuilder,
  final String? loadingLabel,
  final String? refreshLabel,
  super.key,
}) extends StatefulWidget {
  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState() extends State<InfiniteListView> {
  late final CallbackDebouncer _debounce;
  int? _lastFetchedIndex;

  @override
  void initState() {
    super.initState();
    _debounce = CallbackDebouncer(widget.debounceDuration);
  }

  @override
  void dispose() {
    _debounce.dispose();
    super.dispose();
  }

  void _attemptFetch() {
    if (widget.hasNextPage && !widget.isLoading) {
      _debounce(widget.onFetchData);
    }
  }

  void _onBuiltLast(int lastItemIndex) {
    if (_lastFetchedIndex != lastItemIndex) {
      _lastFetchedIndex = lastItemIndex;
      _attemptFetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveItemCount = widget.itemCount + (widget.isLoading ? 1 : 0);
    final lastItemIndex = effectiveItemCount - 1;

    Widget buildItem(BuildContext context, int index) {
      if (index == lastItemIndex) _onBuiltLast(lastItemIndex);
      if (index == lastItemIndex && widget.isLoading) {
        return _LoadMoreFooter(loadingLabel: widget.loadingLabel);
      }
      return widget.itemBuilder(context, index);
    }

    return BaseListView(
      itemCount: effectiveItemCount,
      itemBuilder: buildItem,
      onRefresh: widget.onRefresh,
      padding: widget.padding,
      separator: widget.separator,
      controller: widget.controller,
      emptyBuilder: widget.emptyBuilder,
      refreshLabel: widget.refreshLabel,
    );
  }
}

class const _LoadMoreFooter({required final String? loadingLabel}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpace.s24),
      child: Center(
        child: BaseLoadingDots(semanticLabel: loadingLabel, color: context.colors.accentLabel),
      ),
    );
  }
}
