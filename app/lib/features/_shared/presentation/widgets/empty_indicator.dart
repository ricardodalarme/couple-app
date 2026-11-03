import 'package:common_ui/common_ui.dart';

class const EmptyIndicator({required final String title, super.key, final String? description})
    extends StatelessWidget {
  static const double _imageSize = 200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacings.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, textAlign: TextAlign.center, style: context.typography.titleMedium),
            if (description != null)
              Text(description!, textAlign: TextAlign.center, style: context.typography.bodyMedium),
            const Gap(Spacings.large),
            Assets.images.placeholder.svg(width: _imageSize),
          ],
        ),
      ),
    );
  }
}
