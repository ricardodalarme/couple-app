import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode dateFieldExample = WidgetbookComponent(
  name: 'Date field',
  useCases: [
    WidgetbookUseCase(
      name: 'Date, time, date and time, value and error',
      builder: (_) => const _DateFieldDemo(),
    ),
  ],
);

class const _DateFieldDemo() extends StatefulWidget {
  @override
  State<_DateFieldDemo> createState() => _DateFieldDemoState();
}

class _DateFieldDemoState() extends State<_DateFieldDemo> {
  DateTime _date = DateTime(2026, 11, 14);
  DateTime _time = DateTime(2026, 1, 1, 18, 30);
  DateTime _dateTime = DateTime(2026, 12, 24, 20);

  @override
  Widget build(BuildContext context) {
    return GalleryPage(
      title: 'Date field',
      children: [
        GallerySection(
          title: 'Date, time and date with time',
          children: [
            GallerySurface(
              child: BaseDateField(
                label: 'Date',
                value: _date,
                minimum: DateTime(2026),
                maximum: DateTime(2027, 12, 31),
                onChanged: (value) => setState(() => _date = value),
              ),
            ),
            const SizedBox(height: AppSpace.s16),
            GallerySurface(
              child: BaseDateField(
                label: 'Time',
                mode: BaseDateFieldMode.time,
                value: _time,
                onChanged: (value) => setState(() => _time = value),
              ),
            ),
            const SizedBox(height: AppSpace.s16),
            GallerySurface(
              child: BaseDateField(
                label: 'Reminder',
                mode: BaseDateFieldMode.dateTime,
                value: _dateTime,
                onChanged: (value) => setState(() => _dateTime = value),
              ),
            ),
          ],
        ),
        const GallerySection(
          title: 'Empty and error',
          children: [
            GallerySurface(
              child: BaseDateField(
                label: 'Pick a date',
                hint: 'Choose a day',
                helpText: 'Tap to open the sheet.',
              ),
            ),
            SizedBox(height: AppSpace.s16),
            GallerySurface(
              child: BaseDateField(
                label: 'Start date',
                hint: 'Choose a day',
                errorText: 'Pick a date after today.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
