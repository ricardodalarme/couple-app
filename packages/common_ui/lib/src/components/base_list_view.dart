import 'package:common_ui/src/components/base_pull_to_refresh.dart';
import 'package:flutter/widgets.dart';

class BaseListView extends StatelessWidget {
  const BaseListView({
    required this.itemCount,
    required this.itemBuilder,
    this.onRefresh,
    this.padding = EdgeInsets.zero,
    this.separator,
    this.controller,
    this.emptyBuilder,
    super.key,
  });

  final EdgeInsets? padding;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget? separator;
  final Future<void> Function()? onRefresh;
  final ScrollController? controller;
  final WidgetBuilder? emptyBuilder;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0 && emptyBuilder != null) {
      return onRefresh == null
          ? emptyBuilder!(context)
          : BasePullToRefresh(onRefresh: onRefresh!, child: _buildRefreshableEmpty(context));
    }

    return onRefresh == null ? _buildListView() : _buildRefreshableListView();
  }

  Widget _buildRefreshableEmpty(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: emptyBuilder!(context),
        ),
      ),
    );
  }

  Widget _buildListView() {
    if (separator == null) {
      return ListView.builder(
        padding: padding,
        itemBuilder: itemBuilder,
        itemCount: itemCount,
        controller: controller,
      );
    }

    return ListView.separated(
      padding: padding,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      controller: controller,
      separatorBuilder: (_, _) => separator!,
    );
  }

  Widget _buildRefreshableListView() {
    return BasePullToRefresh(onRefresh: onRefresh!, child: _buildListView());
  }
}
