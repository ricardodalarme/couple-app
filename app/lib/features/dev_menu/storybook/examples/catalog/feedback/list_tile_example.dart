import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';

class const LooseListTilePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GalleryPage(
      title: 'Loose list tile',
      children: [
        GallerySurface(
          child: BaseListTile(
            title: 'Privacy',
            subtitle: 'Who can see your answers',
            icon: AppIcons.lock,
            showsChevron: true,
            isLoose: true,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
