import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/widgets/skeletonizer_resource_widget.dart';
import 'package:widgetbook/widgetbook.dart';

enum _ResourceState() {
  initial,
  loading,
  success,
  failure,
}

final WidgetbookNode skeletonizerResourceWidgetExample = WidgetbookUseCase(
  name: 'SkeletonizerResourceWidget',
  builder: (context) {
    final state = context.knobs.object.dropdown(label: 'State', options: _ResourceState.values);

    return SkeletonizerResourceWidget<List<String>>(
      switch (state) {
        _ResourceState.initial => const Initial(),
        _ResourceState.loading => const Loading(),
        _ResourceState.success => const Success(['First item', 'Second item', 'Third item']),
        _ResourceState.failure => const Failure(LocalizedException(l10nKey: 'common.genericError')),
      },
      fakeValue: const ['Fake item', 'Fake item', 'Fake item'],
      successBuilder: (items) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [for (final item in items) Text(item)],
      ),
      failureBuilder: (exception) => Text('Failure: ${exception.l10nKey}'),
    );
  },
);
