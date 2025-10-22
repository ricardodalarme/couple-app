import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show IconButton, Icons, showModalBottomSheet;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/account/presentation/profile/widgets/image_picker_modal.dart';
import 'package:quickstart_flutter_bloc/features/app/presentation/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/router/app_router.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TranslationsAccountProfileEn l10n = context.l10n.account.profile;

    return BaseView(
      title: l10n.title,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _ProfilePictureWithSelect(),
              const Gap(Spacings.xxlarge),
              ListTile(
                title: l10n.buttonEditProfile,
                leading: const Icon(Icons.person),
                onTap: () => context.pushRoute(const EditProfileRoute()),
              ),
              ListTile(
                title: l10n.buttonChangePassword,
                leading: const Icon(Icons.lock),
                onTap: () => context.pushRoute(const ChangePasswordRoute()),
              ),
              ListTile(
                title: l10n.buttonSettings,
                leading: const Icon(Icons.settings),
                onTap: () => context.pushRoute(const SettingsRoute()),
              ),
              ListTile(
                title: l10n.buttonPrivacyPolicy,
                leading: const Icon(Icons.privacy_tip),
                onTap: () => context.pushRoute(const PrivacyPolicyRoute()),
              ),
              ListTile(
                title: l10n.buttonTerms,
                leading: const Icon(Icons.description),
                onTap: () => context.pushRoute(const TermsListRoute()),
              ),
              ListTile(
                title: l10n.buttonLogout,
                leading: const Icon(Icons.logout),
                onTap: () => context.read<AppBloc>().add(const AppLogoutRequested()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfilePictureWithSelect extends StatelessWidget {
  const _ProfilePictureWithSelect();

  static const _profilePictureSize = 150.0;

  @override
  Widget build(BuildContext context) {
    final TranslationsAccountProfileEn l10n = context.l10n.account.profile;

    return Stack(
      children: [
        const ProfilePicture(photoUrl: null, size: _profilePictureSize),
        Positioned(
          bottom: 0,
          right: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.secondaryContainer,
              shape: BoxShape.circle,
              border: Border.all(color: context.colors.surface, width: 2),
            ),
            child: IconButton(
              color: context.colors.onSecondaryContainer,
              tooltip: l10n.buttonChangePicture,
              onPressed: () => showModalBottomSheet<void>(
                context: context,
                builder: (_) => const ImagePickerModal(),
              ),
              icon: const Icon(Icons.camera_alt),
            ),
          ),
        ),
      ],
    );
  }
}
