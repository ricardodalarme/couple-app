import 'package:design_system/design_system.dart';

/// A list that renders items, an empty state and optional pull-to-refresh.
class const BaseListView({
  required final int itemCount,
  required final Widget Function(BuildContext context, int index) itemBuilder,
  final Future<void> Function()? onRefresh,
  final EdgeInsets? padding = EdgeInsets.zero,
  final Widget? separator,
  final ScrollController? controller,
  final WidgetBuilder? emptyBuilder,
  final String? refreshLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onRefresh = this.onRefresh;
    final separator = this.separator;
    final physics = onRefresh == null ? null : const AlwaysScrollableScrollPhysics();

    if (itemCount == 0 && emptyBuilder != null) {
      final empty = ListView(
        controller: controller,
        padding: padding,
        physics: physics,
        children: [emptyBuilder!(context)],
      );

      return onRefresh == null
          ? empty
          : BaseRefreshable(onRefresh: onRefresh, semanticLabel: refreshLabel, child: empty);
    }

    final list = separator == null
        ? ListView.builder(
            controller: controller,
            padding: padding,
            itemCount: itemCount,
            itemBuilder: itemBuilder,
            physics: physics,
          )
        : ListView.separated(
            controller: controller,
            padding: padding,
            itemCount: itemCount,
            itemBuilder: itemBuilder,
            separatorBuilder: (_, _) => separator,
            physics: physics,
          );

    if (onRefresh == null) return list;

    return BaseRefreshable(onRefresh: onRefresh, semanticLabel: refreshLabel, child: list);
  }
}
