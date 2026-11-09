import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/presentation/profile/widgets/image_picker_modal.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/dev_menu/dev_menu_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:ui/ui.dart';

@RoutePage()
class const ProfilePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.profile;

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: _ProfilePictureWithSelect()),
            const SizedBox(height: AppSpace.s24),
            BaseListGroup(
              children: [
                BaseListTile(
                  title: l10n.buttonEditProfile,
                  icon: AppIcons.user,
                  onTap: () => context.pushRoute(const EditProfileRoute()),
                ),
                BaseListTile(
                  title: l10n.buttonChangePassword,
                  icon: AppIcons.lock,
                  onTap: () => context.pushRoute(const ChangePasswordRoute()),
                ),
                BaseListTile(
                  title: l10n.buttonSettings,
                  icon: AppIcons.settings,
                  onTap: () => context.pushRoute(const SettingsRoute()),
                ),
                BaseListTile(
                  title: l10n.buttonPrivacyPolicy,
                  icon: AppIcons.shield,
                  onTap: () => context.pushRoute(const PrivacyPolicyRoute()),
                ),
                BaseListTile(
                  title: l10n.buttonTerms,
                  icon: AppIcons.note,
                  onTap: () => context.pushRoute(const TermsListRoute()),
                ),
                BaseListTile(
                  title: l10n.buttonLogout,
                  icon: AppIcons.logout,
                  onTap: context.read<AppCubit>().logout,
                ),
              ],
            ),
            const SizedBox(height: AppSpace.s24),
            Center(
              child: BaseTextLink(
                text: 'Dev Menu',
                onPressed: () => context.router.pushWidget(const DevMenuPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class const _ProfilePictureWithSelect() extends StatelessWidget {
  static const _profilePictureSize = 150.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.account.profile;

    return Stack(
      children: [
        const BaseAvatar(size: _profilePictureSize),
        Positioned(
          bottom: 0,
          right: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.bgSurface,
              shape: BoxShape.circle,
              border: Border.all(color: context.colors.textPrimary, width: AppBorder.focus),
            ),
            child: BaseRoundButton(
              icon: AppIcons.camera,
              semanticLabel: l10n.buttonChangePicture,
              onPressed: () =>
                  BaseSheet.show<void>(context: context, child: const ImagePickerModal()),
            ),
          ),
        ),
      ],
    );
  }
}
