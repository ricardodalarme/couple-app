import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:quickstart_flutter_bloc/features/account/presentation/profile/widgets/circle_icon_button.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class ImagePickerModal extends StatelessWidget {
  const ImagePickerModal({super.key});

  @override
  Widget build(BuildContext context) {
    final TranslationsAccountProfileEn l10n = context.l10n.account.profile;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: Spacings.xxlarge, bottom: Spacings.large),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleIconButton(
                  label: l10n.buttonPickImageFromCamera,
                  icon: Icons.camera_alt,
                  onTap: () => context.maybePop(),
                ),
                const Gap(Spacings.medium),
                CircleIconButton(
                  label: l10n.buttonPickImageFromGallery,
                  icon: Icons.photo_library,
                  onTap: () => context.maybePop(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
