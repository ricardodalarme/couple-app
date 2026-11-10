///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';

import 'translations.g.dart';

// Path: <root>
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEn({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(
         overrides == null,
         'Set "translation_overrides: true" in order to enable this feature.',
       ),
       _meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsEn _root = this; // ignore: unused_field

  @override
  TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsEn(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _Translations$authentication$en authentication = _Translations$authentication$en._(
    _root,
  );
  @override
  late final _Translations$common$en common = _Translations$common$en._(_root);
  @override
  late final _Translations$notFound$en notFound = _Translations$notFound$en._(_root);
  @override
  late final _Translations$tabs$en tabs = _Translations$tabs$en._(_root);
  @override
  late final _Translations$welcome$en welcome = _Translations$welcome$en._(_root);
}

// Path: authentication
class _Translations$authentication$en extends Translations$authentication$pt {
  _Translations$authentication$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get signInTitle => 'Sign in';
  @override
  String get signInSubtitle => 'No email and password. Just Apple or Google.';
  @override
  String get signInNote => 'Signing in takes you straight to your Today.';
  @override
  String get existingAccountTitle => 'You already have an account';
  @override
  String get existingAccountSubtitle => 'Sign in to pick up where you left off.';
  @override
  String get continueWithApple => 'Continue with Apple';
  @override
  String get continueWithGoogle => 'Continue with Google';
  @override
  Map<String, String> get errors => {
    'NETWORK': 'No connection. Check your internet and try again.',
    'other': 'Could not sign you in right now. Try again.',
  };
}

// Path: common
class _Translations$common$en extends Translations$common$pt {
  _Translations$common$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get appName => 'Flutter Bloc Starter';
  @override
  String get send => 'Send';
  @override
  String get save => 'Save';
  @override
  String get retry => 'Retry';
  @override
  String get loading => 'Loading';
  @override
  String get username => 'Username';
  @override
  String get email => 'Email';
  @override
  String get password => 'Password';
  @override
  String get firstName => 'First Name';
  @override
  String get lastName => 'Last Name';
  @override
  String get genericError => 'Something went wrong';
}

// Path: notFound
class _Translations$notFound$en extends Translations$notFound$pt {
  _Translations$notFound$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '404';
  @override
  String get description => 'Page not found';
  @override
  String get buttonBack => 'Go back home';
}

// Path: tabs
class _Translations$tabs$en extends Translations$tabs$pt {
  _Translations$tabs$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get today => 'Today';
  @override
  String get slips => 'Slips';
  @override
  String get together => 'Together';
  @override
  String get memories => 'Memories';
  @override
  String get capture => 'New slip';
  @override
  String get soonTitle => 'Under construction';
  @override
  String get soonText => 'This part of the app is still being prepared.';
}

// Path: welcome
class _Translations$welcome$en extends Translations$welcome$pt {
  _Translations$welcome$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get headline => 'Small good things, said out loud.';
  @override
  String get headlineHighlight => 'said out loud';
  @override
  String get subtitle => 'A light way to notice what the other does well, every week.';
  @override
  String get start => 'Get started';
  @override
  String get haveAccount => 'I already have an account';
  @override
  String get debugSignIn => 'Sign in (debug)';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'authentication.signInTitle' => 'Sign in',
      'authentication.signInSubtitle' => 'No email and password. Just Apple or Google.',
      'authentication.signInNote' => 'Signing in takes you straight to your Today.',
      'authentication.existingAccountTitle' => 'You already have an account',
      'authentication.existingAccountSubtitle' => 'Sign in to pick up where you left off.',
      'authentication.continueWithApple' => 'Continue with Apple',
      'authentication.continueWithGoogle' => 'Continue with Google',
      'authentication.errors.NETWORK' => 'No connection. Check your internet and try again.',
      'authentication.errors.other' => 'Could not sign you in right now. Try again.',
      'common.appName' => 'Flutter Bloc Starter',
      'common.send' => 'Send',
      'common.save' => 'Save',
      'common.retry' => 'Retry',
      'common.loading' => 'Loading',
      'common.username' => 'Username',
      'common.email' => 'Email',
      'common.password' => 'Password',
      'common.firstName' => 'First Name',
      'common.lastName' => 'Last Name',
      'common.genericError' => 'Something went wrong',
      'notFound.title' => '404',
      'notFound.description' => 'Page not found',
      'notFound.buttonBack' => 'Go back home',
      'tabs.today' => 'Today',
      'tabs.slips' => 'Slips',
      'tabs.together' => 'Together',
      'tabs.memories' => 'Memories',
      'tabs.capture' => 'New slip',
      'tabs.soonTitle' => 'Under construction',
      'tabs.soonText' => 'This part of the app is still being prepared.',
      'welcome.headline' => 'Small good things, said out loud.',
      'welcome.headlineHighlight' => 'said out loud',
      'welcome.subtitle' => 'A light way to notice what the other does well, every week.',
      'welcome.start' => 'Get started',
      'welcome.haveAccount' => 'I already have an account',
      'welcome.debugSignIn' => 'Sign in (debug)',
      _ => null,
    };
  }
}
