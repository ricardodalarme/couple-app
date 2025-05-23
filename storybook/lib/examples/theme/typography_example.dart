import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode typographyExample = WidgetbookUseCase(
  name: 'Typography',
  builder: (context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('titleLarge', style: context.typography.titleLarge),
      Text('titleMedium', style: context.typography.titleMedium),
      Text('titleSmall', style: context.typography.titleSmall),
      Text('bodyLarge', style: context.typography.bodyLarge),
      Text('bodyMedium', style: context.typography.bodyMedium),
      Text('bodySmall', style: context.typography.bodySmall),
      Text('labelLarge', style: context.typography.labelLarge),
      Text('labelMedium', style: context.typography.labelMedium),
      Text('labelSmall', style: context.typography.labelSmall),
    ],
  ),
);
