import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';

class InfiniteListViewWidget extends StatefulWidget {
  const InfiniteListViewWidget({
    required this.itemCount,
    required this.onFetchData,
    required this.itemBuilder,
    required this.hasNextPage,
    required this.isLoading,
    this.debounceDuration = const Duration(milliseconds: 100),
    this.onRefresh,
    this.padding,
    this.separator,
    super.key,
  });

  final Duration debounceDuration;
  final int itemCount;
  final bool isLoading;
  final bool hasNextPage;
  final VoidCallback onFetchData;
  final Future<void> Function()? onRefresh;
  final EdgeInsets? padding;
  final Widget? separator;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  State<InfiniteListViewWidget> createState() => _InfiniteListViewWidgetState();
}

class _InfiniteListViewWidgetState extends State<InfiniteListViewWidget> {
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
    final int effectiveItemCount = widget.itemCount + (widget.isLoading ? 1 : 0);
    final int lastItemIndex = effectiveItemCount - 1;

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
