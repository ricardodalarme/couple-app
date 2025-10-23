import 'package:quickstart_flutter_bloc/features/_shared/presentation/widgets/profile_picture.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode profilePictureExample = WidgetbookUseCase(
  name: 'ProfilePicture',
  builder: (context) => ProfilePicture(
    photoUrl: context.knobs.string(label: 'Photo url', initialValue: 'https://picsum.photos/200'),
    size: context.knobs.double.slider(label: 'Size', initialValue: 200, max: 500),
  ),
);
