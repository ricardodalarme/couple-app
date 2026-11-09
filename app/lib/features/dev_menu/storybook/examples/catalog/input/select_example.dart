import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode selectExample = WidgetbookComponent(
  name: 'BaseSelect',
  useCases: [
    WidgetbookUseCase(
      name: 'Field, compact, error and disabled',
      builder: (context) => const GalleryPage(
        title: 'Select',
        children: [
          GallerySection(
            title: 'Field',
            children: [GallerySurface(child: _SelectDemo())],
          ),
        ],
      ),
    ),
  ],
);

class const _SelectDemo() extends StatefulWidget {
  @override
  State<_SelectDemo> createState() => _SelectDemoState();
}

class _SelectDemoState() extends State<_SelectDemo> {
  static const List<BaseSelectOption<String>> _options = [
    BaseSelectOption(value: 'day', label: 'Every day'),
    BaseSelectOption(value: 'week', label: 'Every week'),
    BaseSelectOption(value: 'fortnight', label: 'Every two weeks'),
    BaseSelectOption(value: 'never', label: 'Never'),
  ];

  String _value = 'week';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpace.s16,
      children: [
        BaseSelect<String>(
          label: 'Frequency',
          value: _value,
          options: _options,
          onChanged: (value) => setState(() => _value = value),
        ),
        BaseSelect<String>(
          label: 'Country',
          value: null,
          placeholder: 'Choose a country',
          options: const [
            BaseSelectOption(value: 'br', label: 'Brazil'),
            BaseSelectOption(value: 'pt', label: 'Portugal'),
            BaseSelectOption(value: 'us', label: 'United States'),
          ],
          onChanged: (_) {},
        ),
        BaseSelect<String>(
          label: 'Error',
          value: null,
          placeholder: 'Choose a country',
          errorText: 'Choose an option to continue.',
          options: const [BaseSelectOption(value: 'br', label: 'Brazil')],
          onChanged: (_) {},
        ),
        BaseSelect<String>(
          label: 'Disabled',
          value: 'week',
          isEnabled: false,
          options: _options,
          onChanged: (_) {},
        ),
        BaseSelect<String>(
          label: 'Compact',
          value: 'week',
          isCompact: true,
          options: _options,
          onChanged: (_) {},
        ),
      ],
    );
  }
}
