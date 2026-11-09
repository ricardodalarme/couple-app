import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';

void noopBool(bool value) {}

void noopIndex(int value) {}

class const ScreenPreview({required final Widget child, final Widget? appBar, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpace.s24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: SizedBox(
          height: AppSpace.s120 * 5,
          child: BaseView(appBar: appBar, body: child),
        ),
      ),
    );
  }
}

class const SheetLauncher({
  required final String title,
  required final String buttonText,
  required final VoidCallback onPressed,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GalleryPage(
      title: title,
      children: [
        GallerySurface(
          child: BaseButton.primary(text: buttonText, onPressed: onPressed),
        ),
      ],
    );
  }
}
