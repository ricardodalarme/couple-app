import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode calendarGridExample = WidgetbookComponent(
  name: 'Calendar grid',
  useCases: [
    WidgetbookUseCase(
      name: 'Single, range, today, milestone and blocked',
      builder: (_) => const _CalendarDemo(),
    ),
  ],
);

class const _CalendarDemo() extends StatefulWidget {
  @override
  State<_CalendarDemo> createState() => _CalendarDemoState();
}

class _CalendarDemoState() extends State<_CalendarDemo> {
  DateTime _selected = DateTime(2026, 11, 12);
  DateTime? _rangeStart = DateTime(2026, 11, 10);
  DateTime? _rangeEnd = DateTime(2026, 11, 15);

  @override
  Widget build(BuildContext context) {
    final today = DateTime(2026, 11, 9);

    return GalleryPage(
      title: 'Calendar grid',
      children: [
        GallerySection(
          title: 'Single · Sunday start',
          children: [
            GallerySurface(
              child: BaseCalendarGrid(
                month: DateTime(2026, 11),
                selectedDate: _selected,
                today: today,
                milestones: {DateTime(2026, 11, 14), DateTime(2026, 11, 24)},
                blockedDays: {DateTime(2026, 11, 22)},
                onDaySelected: (date) => setState(() => _selected = date),
              ),
            ),
          ],
        ),
        GallerySection(
          title: 'Range · Monday start',
          children: [
            GallerySurface(
              child: BaseCalendarGrid(
                month: DateTime(2026, 11),
                selectionMode: BaseCalendarSelectionMode.range,
                rangeStart: _rangeStart,
                rangeEnd: _rangeEnd,
                today: today,
                milestones: {DateTime(2026, 11, 24)},
                blockedDays: {DateTime(2026, 11, 28)},
                weekStart: BaseCalendarWeekStart.monday,
                onRangeChanged: (start, end) => setState(() {
                  _rangeStart = start;
                  _rangeEnd = end;
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
