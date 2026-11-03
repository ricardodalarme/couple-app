import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';

class const InfiniteListViewWidget({
  required final int itemCount,
  required final VoidCallback onFetchData,
  required final Widget Function(BuildContext context, int index) itemBuilder,
  required final bool hasNextPage,
  required final bool isLoading,
  final Duration debounceDuration = const Duration(milliseconds: 100),
  final Future<void> Function()? onRefresh,
  final EdgeInsets? padding,
  final Widget? separator,
  super.key,
}) extends StatefulWidget {
  @override
  State<InfiniteListViewWidget> createState() => _InfiniteListViewWidgetState();
}

class _InfiniteListViewWidgetState() extends State<InfiniteListViewWidget> {
  late final CallbackDebouncer debounce;

  int? _lastFetchedIndex;

  @override
  void initState() {
    super.initState();
    debounce = CallbackDebouncer(widget.debounceDuration);
  }

  @override
  void dispose() {
    debounce.dispose();
    super.dispose();
  }

  void attemptFetch() {
    if (widget.hasNextPage && !widget.isLoading) {
      debounce(widget.onFetchData);
    }
  }

  void onBuiltLast(int lastItemIndex) {
    if (_lastFetchedIndex != lastItemIndex) {
      _lastFetchedIndex = lastItemIndex;
      attemptFetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveItemCount = widget.itemCount + (widget.isLoading ? 1 : 0);
    final lastItemIndex = effectiveItemCount - 1;

    return BaseListView(
      padding: widget.padding,
      itemCount: effectiveItemCount,
      separator: widget.separator,
      onRefresh: widget.onRefresh,
      itemBuilder: (context, index) {
        if (index == lastItemIndex) {
          onBuiltLast(lastItemIndex);
        }

        if (index == lastItemIndex && widget.isLoading) {
          return const BaseLoadingIndicator();
        }

        return widget.itemBuilder(context, index);
      },
    );
  }
}
