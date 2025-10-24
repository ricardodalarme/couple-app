import 'package:common_ui/common_ui.dart';
import 'package:quickstart_flutter_bloc/features/_shared/presentation/widgets/error_indicator.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode errorIndicatorExample = WidgetbookUseCase(
  name: 'ErrorIndicator',
  builder: (context) => ErrorIndicator(
    title: 'Something went wrong',
    message: 'Please try again later',
    buttonText: 'Retry',
    onButtonPressed: () => context.showSnackBar('Click success'),
  ),
);
