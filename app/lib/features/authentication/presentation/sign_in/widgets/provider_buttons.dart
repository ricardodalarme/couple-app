import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter_bloc_starter/infrastructure/config/env_variables.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Whether the build offers Apple and Google. The dev project keeps both off.
const bool showProviderButtons = !EnvVariables.debugSignIn;

const double _markSize = 20;

const String _appleMark =
    '<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="#FFFFFF" d="M16.4 12.5c0-2.3 1.9-3.4 2-3.5-1.1-1.6-2.8-1.8-3.4-1.8-1.4-.1-2.8.9-3.5.9s-1.8-.8-3-.8c-1.5 0-3 .9-3.8 2.3-1.6 2.8-.4 7 1.2 9.3.8 1.1 1.7 2.4 2.9 2.3 1.2 0 1.6-.7 3-.7s1.8.7 3 .7c1.3 0 2.1-1.1 2.8-2.3.9-1.3 1.3-2.5 1.3-2.6-.1 0-2.5-1-2.5-3.8zM14.2 5.7c.6-.8 1.1-1.9.9-3-.9 0-2.1.6-2.7 1.4-.6.7-1.1 1.8-1 2.9 1.1.1 2.2-.5 2.8-1.3z"/></svg>';

const String _googleMark =
    '<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="#4285F4" d="M21.6 12.2c0-.7-.1-1.3-.2-1.9H12v3.6h5.4a4.6 4.6 0 01-2 3v2.5h3.2c1.9-1.7 3-4.3 3-7.2z"/><path fill="#34A853" d="M12 22c2.7 0 5-.9 6.6-2.4l-3.2-2.5c-.9.6-2 .9-3.4.9-2.6 0-4.8-1.8-5.6-4.1H3.1v2.6A10 10 0 0012 22z"/><path fill="#FBBC05" d="M6.4 13.9a6 6 0 010-3.8V7.5H3.1a10 10 0 000 9z"/><path fill="#EA4335" d="M12 6c1.5 0 2.8.5 3.8 1.5l2.9-2.9A10 10 0 003.1 7.5l3.3 2.6C7.2 7.8 9.4 6 12 6z"/></svg>';

/// The Apple and Google actions shared by the sign-in and existing-account screens.
///
/// When [showProviders] is false it offers the email/password fallback instead.
class const ProviderButtons({
  final bool showProviders = showProviderButtons,
  final void Function()? onEmailSignIn,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.authentication;

    if (!showProviders) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseNote(text: l10n.providersUnavailable),
          const SizedBox(height: AppSpace.s16),
          BaseButton(text: l10n.emailSignInFallback, onPressed: onEmailSignIn),
        ],
      );
    }

    final isLoading = context.select((SignInCubit cubit) => cubit.state.signInAction.isLoading);
    final cubit = context.read<SignInCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseButton(
          text: l10n.continueWithApple,
          isLoading: isLoading,
          leading: SvgPicture.string(_appleMark, width: _markSize, height: _markSize),
          onPressed: cubit.signInWithApple,
        ),
        const SizedBox(height: AppSpace.s12),
        BaseButton(
          text: l10n.continueWithGoogle,
          variant: .secondary,
          isEnabled: !isLoading,
          leading: SvgPicture.string(_googleMark, width: _markSize, height: _markSize),
          onPressed: cubit.signInWithGoogle,
        ),
      ],
    );
  }
}
