import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:ui/ui.dart';

class const ImagePickerModal({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.profile;

    return BaseListGroup(
      children: [
        BaseListTile(
          title: l10n.buttonPickImageFromCamera,
          icon: AppIcons.camera,
          onTap: () => context.maybePop(),
        ),
        BaseListTile(
          title: l10n.buttonPickImageFromGallery,
          icon: AppIcons.image,
          onTap: () => context.maybePop(),
        ),
      ],
    );
  }
}
