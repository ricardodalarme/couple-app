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
  late final _Translations$firstSlip$en firstSlip = _Translations$firstSlip$en._(_root);
  @override
  late final _Translations$intro$en intro = _Translations$intro$en._(_root);
  @override
  late final _Translations$invite$en invite = _Translations$invite$en._(_root);
  @override
  late final _Translations$notFound$en notFound = _Translations$notFound$en._(_root);
  @override
  late final _Translations$notificationPermission$en notificationPermission =
      _Translations$notificationPermission$en._(_root);
  @override
  late final _Translations$partnerStep$en partnerStep = _Translations$partnerStep$en._(_root);
  @override
  late final _Translations$profileSetup$en profileSetup = _Translations$profileSetup$en._(_root);
  @override
  late final _Translations$quickSlip$en quickSlip = _Translations$quickSlip$en._(_root);
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

// Path: firstSlip
class _Translations$firstSlip$en extends Translations$firstSlip$pt {
  _Translations$firstSlip$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Start with one good thing';
  @override
  String get titleHighlight => 'one good thing';
  @override
  String get subtitle =>
      'What did your partner do lately that made you smile? 30 seconds is enough. No account yet.';
  @override
  String get hint => 'E.g. made coffee before I woke up';
  @override
  String get localNote => 'Stays saved on this phone only.';
  @override
  String get save => 'Save';
  @override
  String get saveError => 'Could not keep it right now. Try again.';
}

// Path: intro
class _Translations$intro$en extends Translations$intro$pt {
  _Translations$intro$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get skip => 'Skip';
  @override
  String get continueButton => 'Continue';
  @override
  late final _Translations$intro$phase$en phase = _Translations$intro$phase$en._(_root);
  @override
  late final _Translations$intro$goals$en goals = _Translations$intro$goals$en._(_root);
  @override
  late final _Translations$intro$theme$en theme = _Translations$intro$theme$en._(_root);
}

// Path: invite
class _Translations$invite$en extends Translations$invite$pt {
  _Translations$invite$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object name}) => 'Invite ${name}';
  @override
  String get titleNoName => 'Invite your person';
  @override
  String get messageIntro => 'This message will be sent:';
  @override
  String message({required Object code}) =>
      'I started something small for us. To connect in the app, use the code ${code}.';
  @override
  String expiryNote({required Object days}) =>
      'The invite is valid for ${days} days. Only the latest invite you create works.';
  @override
  String get share => 'Share invite';
  @override
  String get copy => 'Copy invite';
  @override
  String get sentTitle => 'Invite sent';
  @override
  String get sentHighlight => 'sent';
  @override
  String sentText({required Object name}) =>
      '${name} has not joined yet. In the meantime you can use the app on your own.';
  @override
  String get sentTextNoName =>
      'Your person has not joined yet. In the meantime you can use the app on your own.';
  @override
  String get resend => 'Send again';
  @override
  String get revoke => 'Revoke';
  @override
  String get errorTitle => 'Could not create the invite';
  @override
  Map<String, String> get errors => {
    'ALREADY_PAIRED': 'You are already connected with someone.',
    'RATE_LIMITED': 'You created too many invites today. Try again tomorrow.',
    'NETWORK': 'No connection. Check your internet and try again.',
    'other': 'Something went wrong. Try again.',
  };
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

// Path: notificationPermission
class _Translations$notificationPermission$en extends Translations$notificationPermission$pt {
  _Translations$notificationPermission$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Reminders';
  @override
  String get title => 'Gentle reminders?';
  @override
  String get titleHighlight => 'Gentle';
  @override
  String get pointLimit => 'At most 1 or 2 a day.';
  @override
  String get pointPrivate => 'They never show names on the lock screen.';
  @override
  String get pointChoice => 'You choose what arrives and when.';
  @override
  String get changeLater => 'You can change this whenever you like.';
  @override
  String get notNow => 'Not now';
  @override
  String get allow => 'Allow';
  @override
  String get offBanner => 'Reminders are off. Turn them on in settings.';
  @override
  String get openSettings => 'Open settings';
  @override
  String get close => 'Close';
}

// Path: partnerStep
class _Translations$partnerStep$en extends Translations$partnerStep$pt {
  _Translations$partnerStep$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Want to bring your partner?';
  @override
  String get titleHighlight => 'partner';
  @override
  String get subtitle => 'The app works on your own. Invite whenever you want.';
  @override
  String get inviteTitle => 'Send an invite';
  @override
  String get inviteSupport => 'Your person joins with a code';
  @override
  String get aloneTitle => 'Start on my own for now';
  @override
  String get aloneSupport => 'Your slips stay with you only';
  @override
  String get continueButton => 'Continue';
}

// Path: profileSetup
class _Translations$profileSetup$en extends Translations$profileSetup$pt {
  _Translations$profileSetup$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'The basics';
  @override
  String get titleHighlight => 'basics';
  @override
  String get subtitle => 'Used for the words in the app and for the first date of your story.';
  @override
  String get nameLabel => 'Your name';
  @override
  String get nameHint => 'Marina';
  @override
  String get partnerNameLabel => 'Partner\'s name';
  @override
  String get partnerNameHint => 'Ricardo';
  @override
  String get partnerNameNote => 'Your partner\'s name stays on your account only.';
  @override
  String get themeLabel => 'Your app colour';
  @override
  String get themeRose => 'Rose';
  @override
  String get themeBlue => 'Blue';
  @override
  String get themeNeutral => 'Neutral';
  @override
  String get dateLabel => 'When did you start?';
  @override
  String get dateHint => 'Pick a date';
  @override
  String dateFormat({required Object month, required Object day, required Object year}) =>
      '${month} ${day}, ${year}';
  @override
  List<String> get months => [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  String get continueButton => 'Continue';
  @override
  Map<String, String> get errors => {
    'INVALID_DATE': 'That date does not look right. Pick one between 1950 and today.',
    'NETWORK': 'No connection. Your answers are still here, try again.',
    'other': 'Could not save right now. Try again.',
  };
}

// Path: quickSlip
class _Translations$quickSlip$en extends Translations$quickSlip$pt {
  _Translations$quickSlip$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String dateLine({required Object weekday, required Object month, required Object day}) =>
      '${weekday}, ${month} ${day}';
  @override
  List<String> get weekdays => [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  String get title => 'What made you happy?';
  @override
  String get titleHighlight => 'happy';
  @override
  String get subtitle => 'One line is enough. 30 seconds.';
  @override
  String get hint => 'E.g. made coffee before I woke up';
  @override
  Map<String, String> get categories => {
    'said': 'Said something',
    'did': 'Did something',
    'noticed': 'Noticed me',
    'helped': 'Helped me',
    'other': '',
  };
  @override
  String get privacyNote => 'It stays private. On Sunday you choose what goes on the card.';
  @override
  String get save => 'Save';
  @override
  late final _Translations$quickSlip$saved$en saved = _Translations$quickSlip$saved$en._(_root);
  @override
  Map<String, String> get errors => {
    'FREE_LIMIT_REACHED': 'You reached the free plan\'s slip limit.',
    'RATE_LIMITED': 'Too many tries in a row. Wait a moment.',
    'other': 'Could not save right now. Your text is still here, try again.',
  };
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

// Path: intro.phase
class _Translations$intro$phase$en extends Translations$intro$phase$pt {
  _Translations$intro$phase$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Where are you two right now?';
  @override
  String get titleHighlight => 'right now';
  @override
  String get subtitle => 'Pick the closest one. You can change it later.';
  @override
  Map<String, String> get options => {
    'dating': 'Dating',
    'living_together': 'Living together',
    'engaged': 'Engaged',
    'married': 'Married',
    'with_kids': 'With kids',
    'long_distance': 'Long distance',
    'restarting': 'Starting over',
    'other': '',
  };
}

// Path: intro.goals
class _Translations$intro$goals$en extends Translations$intro$goals$pt {
  _Translations$intro$goals$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'What do you want from the app?';
  @override
  String get titleHighlight => 'app';
  @override
  String get subtitle => 'Pick as many as you like.';
  @override
  Map<String, String> get options => {
    'reconnect': 'Reconnect',
    'fight_less': 'Fight less',
    'keep_romance': 'Keep the romance',
    'remember_dates': 'Remember dates',
    'organize_routine': 'Organise the routine',
    'just_record': 'Just note the good things',
    'other': '',
  };
}

// Path: intro.theme
class _Translations$intro$theme$en extends Translations$intro$theme$pt {
  _Translations$intro$theme$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Which colour suits you?';
  @override
  String get titleHighlight => 'colour';
  @override
  String get subtitle => 'You pick the colour, not the gender. The features are the same.';
  @override
  String get rose => 'Soft rose';
  @override
  String get roseSupport => 'Delicate and warm';
  @override
  String get blue => 'Soft blue';
  @override
  String get blueSupport => 'Calm and light';
  @override
  String get neutral => 'Neutral';
  @override
  String get neutralSupport => 'Paper and green';
  @override
  String get footnote => 'You can change it later in Settings, Appearance.';
}

// Path: quickSlip.saved
class _Translations$quickSlip$saved$en extends Translations$quickSlip$saved$pt {
  _Translations$quickSlip$saved$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Saved';
  @override
  String get added => 'Slip added to this week.';
  @override
  String get queued => 'Saved on this phone. We send it when the connection is back.';
  @override
  String get undoHint => 'Undo for 30 seconds.';
  @override
  String get undo => 'Undo';
  @override
  String get done => 'Done';
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
      'firstSlip.title' => 'Start with one good thing',
      'firstSlip.titleHighlight' => 'one good thing',
      'firstSlip.subtitle' => 'What did your partner do lately that made you smile? 30 seconds is enough. No account yet.',
      'firstSlip.hint' => 'E.g. made coffee before I woke up',
      'firstSlip.localNote' => 'Stays saved on this phone only.',
      'firstSlip.save' => 'Save',
      'firstSlip.saveError' => 'Could not keep it right now. Try again.',
      'intro.skip' => 'Skip',
      'intro.continueButton' => 'Continue',
      'intro.phase.title' => 'Where are you two right now?',
      'intro.phase.titleHighlight' => 'right now',
      'intro.phase.subtitle' => 'Pick the closest one. You can change it later.',
      'intro.phase.options.dating' => 'Dating',
      'intro.phase.options.living_together' => 'Living together',
      'intro.phase.options.engaged' => 'Engaged',
      'intro.phase.options.married' => 'Married',
      'intro.phase.options.with_kids' => 'With kids',
      'intro.phase.options.long_distance' => 'Long distance',
      'intro.phase.options.restarting' => 'Starting over',
      'intro.phase.options.other' => '',
      'intro.goals.title' => 'What do you want from the app?',
      'intro.goals.titleHighlight' => 'app',
      'intro.goals.subtitle' => 'Pick as many as you like.',
      'intro.goals.options.reconnect' => 'Reconnect',
      'intro.goals.options.fight_less' => 'Fight less',
      'intro.goals.options.keep_romance' => 'Keep the romance',
      'intro.goals.options.remember_dates' => 'Remember dates',
      'intro.goals.options.organize_routine' => 'Organise the routine',
      'intro.goals.options.just_record' => 'Just note the good things',
      'intro.goals.options.other' => '',
      'intro.theme.title' => 'Which colour suits you?',
      'intro.theme.titleHighlight' => 'colour',
      'intro.theme.subtitle' => 'You pick the colour, not the gender. The features are the same.',
      'intro.theme.rose' => 'Soft rose',
      'intro.theme.roseSupport' => 'Delicate and warm',
      'intro.theme.blue' => 'Soft blue',
      'intro.theme.blueSupport' => 'Calm and light',
      'intro.theme.neutral' => 'Neutral',
      'intro.theme.neutralSupport' => 'Paper and green',
      'intro.theme.footnote' => 'You can change it later in Settings, Appearance.',
      'invite.title' => ({required Object name}) => 'Invite ${name}',
      'invite.titleNoName' => 'Invite your person',
      'invite.messageIntro' => 'This message will be sent:',
      'invite.message' => ({
        required Object code,
      }) => 'I started something small for us. To connect in the app, use the code ${code}.',
      'invite.expiryNote' => ({
        required Object days,
      }) => 'The invite is valid for ${days} days. Only the latest invite you create works.',
      'invite.share' => 'Share invite',
      'invite.copy' => 'Copy invite',
      'invite.sentTitle' => 'Invite sent',
      'invite.sentHighlight' => 'sent',
      'invite.sentText' => ({
        required Object name,
      }) => '${name} has not joined yet. In the meantime you can use the app on your own.',
      'invite.sentTextNoName' =>
        'Your person has not joined yet. In the meantime you can use the app on your own.',
      'invite.resend' => 'Send again',
      'invite.revoke' => 'Revoke',
      'invite.errorTitle' => 'Could not create the invite',
      'invite.errors.ALREADY_PAIRED' => 'You are already connected with someone.',
      'invite.errors.RATE_LIMITED' => 'You created too many invites today. Try again tomorrow.',
      'invite.errors.NETWORK' => 'No connection. Check your internet and try again.',
      'invite.errors.other' => 'Something went wrong. Try again.',
      'notFound.title' => '404',
      'notFound.description' => 'Page not found',
      'notFound.buttonBack' => 'Go back home',
      'notificationPermission.label' => 'Reminders',
      'notificationPermission.title' => 'Gentle reminders?',
      'notificationPermission.titleHighlight' => 'Gentle',
      'notificationPermission.pointLimit' => 'At most 1 or 2 a day.',
      'notificationPermission.pointPrivate' => 'They never show names on the lock screen.',
      'notificationPermission.pointChoice' => 'You choose what arrives and when.',
      'notificationPermission.changeLater' => 'You can change this whenever you like.',
      'notificationPermission.notNow' => 'Not now',
      'notificationPermission.allow' => 'Allow',
      'notificationPermission.offBanner' => 'Reminders are off. Turn them on in settings.',
      'notificationPermission.openSettings' => 'Open settings',
      'notificationPermission.close' => 'Close',
      'partnerStep.title' => 'Want to bring your partner?',
      'partnerStep.titleHighlight' => 'partner',
      'partnerStep.subtitle' => 'The app works on your own. Invite whenever you want.',
      'partnerStep.inviteTitle' => 'Send an invite',
      'partnerStep.inviteSupport' => 'Your person joins with a code',
      'partnerStep.aloneTitle' => 'Start on my own for now',
      'partnerStep.aloneSupport' => 'Your slips stay with you only',
      'partnerStep.continueButton' => 'Continue',
      'profileSetup.title' => 'The basics',
      'profileSetup.titleHighlight' => 'basics',
      'profileSetup.subtitle' =>
        'Used for the words in the app and for the first date of your story.',
      'profileSetup.nameLabel' => 'Your name',
      'profileSetup.nameHint' => 'Marina',
      'profileSetup.partnerNameLabel' => 'Partner\'s name',
      'profileSetup.partnerNameHint' => 'Ricardo',
      'profileSetup.partnerNameNote' => 'Your partner\'s name stays on your account only.',
      'profileSetup.themeLabel' => 'Your app colour',
      'profileSetup.themeRose' => 'Rose',
      'profileSetup.themeBlue' => 'Blue',
      'profileSetup.themeNeutral' => 'Neutral',
      'profileSetup.dateLabel' => 'When did you start?',
      'profileSetup.dateHint' => 'Pick a date',
      'profileSetup.dateFormat' => ({
        required Object month,
        required Object day,
        required Object year,
      }) => '${month} ${day}, ${year}',
      'profileSetup.months.0' => 'January',
      'profileSetup.months.1' => 'February',
      'profileSetup.months.2' => 'March',
      'profileSetup.months.3' => 'April',
      'profileSetup.months.4' => 'May',
      'profileSetup.months.5' => 'June',
      'profileSetup.months.6' => 'July',
      'profileSetup.months.7' => 'August',
      'profileSetup.months.8' => 'September',
      'profileSetup.months.9' => 'October',
      'profileSetup.months.10' => 'November',
      'profileSetup.months.11' => 'December',
      'profileSetup.continueButton' => 'Continue',
      'profileSetup.errors.INVALID_DATE' =>
        'That date does not look right. Pick one between 1950 and today.',
      'profileSetup.errors.NETWORK' => 'No connection. Your answers are still here, try again.',
      'profileSetup.errors.other' => 'Could not save right now. Try again.',
      'quickSlip.dateLine' => ({
        required Object weekday,
        required Object month,
        required Object day,
      }) => '${weekday}, ${month} ${day}',
      'quickSlip.weekdays.0' => 'Monday',
      'quickSlip.weekdays.1' => 'Tuesday',
      'quickSlip.weekdays.2' => 'Wednesday',
      'quickSlip.weekdays.3' => 'Thursday',
      'quickSlip.weekdays.4' => 'Friday',
      'quickSlip.weekdays.5' => 'Saturday',
      'quickSlip.weekdays.6' => 'Sunday',
      'quickSlip.monthsShort.0' => 'Jan',
      'quickSlip.monthsShort.1' => 'Feb',
      'quickSlip.monthsShort.2' => 'Mar',
      'quickSlip.monthsShort.3' => 'Apr',
      'quickSlip.monthsShort.4' => 'May',
      'quickSlip.monthsShort.5' => 'Jun',
      'quickSlip.monthsShort.6' => 'Jul',
      'quickSlip.monthsShort.7' => 'Aug',
      'quickSlip.monthsShort.8' => 'Sep',
      'quickSlip.monthsShort.9' => 'Oct',
      'quickSlip.monthsShort.10' => 'Nov',
      'quickSlip.monthsShort.11' => 'Dec',
      'quickSlip.title' => 'What made you happy?',
      'quickSlip.titleHighlight' => 'happy',
      'quickSlip.subtitle' => 'One line is enough. 30 seconds.',
      'quickSlip.hint' => 'E.g. made coffee before I woke up',
      'quickSlip.categories.said' => 'Said something',
      'quickSlip.categories.did' => 'Did something',
      'quickSlip.categories.noticed' => 'Noticed me',
      'quickSlip.categories.helped' => 'Helped me',
      'quickSlip.categories.other' => '',
      'quickSlip.privacyNote' => 'It stays private. On Sunday you choose what goes on the card.',
      'quickSlip.save' => 'Save',
      'quickSlip.saved.title' => 'Saved',
      'quickSlip.saved.added' => 'Slip added to this week.',
      'quickSlip.saved.queued' => 'Saved on this phone. We send it when the connection is back.',
      'quickSlip.saved.undoHint' => 'Undo for 30 seconds.',
      'quickSlip.saved.undo' => 'Undo',
      'quickSlip.saved.done' => 'Done',
      'quickSlip.errors.FREE_LIMIT_REACHED' => 'You reached the free plan\'s slip limit.',
      'quickSlip.errors.RATE_LIMITED' => 'Too many tries in a row. Wait a moment.',
      'quickSlip.errors.other' => 'Could not save right now. Your text is still here, try again.',
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
