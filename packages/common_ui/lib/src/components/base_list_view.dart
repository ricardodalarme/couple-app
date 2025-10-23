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
    super.key,
  });

  final EdgeInsets? padding;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget? separator;
  final Future<void> Function()? onRefresh;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return onRefresh == null ? _buildListView() : _buildRefreshableListView();
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
