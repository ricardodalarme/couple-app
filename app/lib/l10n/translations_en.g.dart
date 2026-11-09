///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations with BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final l10n = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
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
           ) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  dynamic operator [](String key) => _meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      Translations(meta: meta ?? this.$meta);

  // Translations
  late final Translations$account$en account = Translations$account$en.internal(_root);
  late final Translations$authentication$en authentication =
      Translations$authentication$en.internal(_root);
  late final Translations$common$en common = Translations$common$en.internal(_root);
  late final Translations$notFound$en notFound = Translations$notFound$en.internal(_root);
  late final Translations$notifications$en notifications = Translations$notifications$en.internal(
    _root,
  );
  late final Translations$onboarding$en onboarding = Translations$onboarding$en.internal(_root);
  late final Translations$post$en post = Translations$post$en.internal(_root);
  late final Translations$privacyPolicy$en privacyPolicy = Translations$privacyPolicy$en.internal(
    _root,
  );
  late final Translations$search$en search = Translations$search$en.internal(_root);
  late final Translations$settings$en settings = Translations$settings$en.internal(_root);
  late final Translations$terms$en terms = Translations$terms$en.internal(_root);
}

// Path: account
class Translations$account$en {
  Translations$account$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$account$profile$en profile = Translations$account$profile$en.internal(
    _root,
  );
  late final Translations$account$editProfile$en editProfile =
      Translations$account$editProfile$en.internal(_root);
  late final Translations$account$changePassword$en changePassword =
      Translations$account$changePassword$en.internal(_root);
  late final Translations$account$deleteAccount$en deleteAccount =
      Translations$account$deleteAccount$en.internal(_root);
}

// Path: authentication
class Translations$authentication$en {
  Translations$authentication$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$authentication$login$en login =
      Translations$authentication$login$en.internal(_root);
  late final Translations$authentication$signup$en signup =
      Translations$authentication$signup$en.internal(_root);
  late final Translations$authentication$forgotPassword$en forgotPassword =
      Translations$authentication$forgotPassword$en.internal(_root);
}

// Path: common
class Translations$common$en {
  Translations$common$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Flutter Bloc Starter'
  String get appName => 'Flutter Bloc Starter';

  /// en: 'Send'
  String get send => 'Send';

  /// en: 'Save'
  String get save => 'Save';

  /// en: 'Retry'
  String get retry => 'Retry';

  /// en: 'Loading'
  String get loading => 'Loading';

  /// en: 'Username'
  String get username => 'Username';

  /// en: 'Email'
  String get email => 'Email';

  /// en: 'Password'
  String get password => 'Password';

  /// en: 'First Name'
  String get firstName => 'First Name';

  /// en: 'Last Name'
  String get lastName => 'Last Name';

  /// en: 'Something went wrong'
  String get genericError => 'Something went wrong';
}

// Path: notFound
class Translations$notFound$en {
  Translations$notFound$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: '404'
  String get title => '404';

  /// en: 'Page not found'
  String get description => 'Page not found';

  /// en: 'Go back home'
  String get buttonBack => 'Go back home';
}

// Path: notifications
class Translations$notifications$en {
  Translations$notifications$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Notifications'
  String get title => 'Notifications';

  /// en: 'Mark all as read'
  String get markAllRead => 'Mark all as read';

  /// en: 'Failed to load notifications.'
  String get textFailure => 'Failed to load notifications.';

  /// en: 'No notifications yet'
  String get emptyTitle => 'No notifications yet';

  /// en: 'Updates and activity will appear here.'
  String get emptyDescription => 'Updates and activity will appear here.';

  /// en: 'Unread'
  String get semanticsUnread => 'Unread';

  /// en: 'Notifications'
  String get badgeTooltip => 'Notifications';

  Map<String, String> get errors => {
    'serverError': 'Something went wrong. Try again.',
    'other': _root.common.genericError,
  };
}

// Path: onboarding
class Translations$onboarding$en {
  Translations$onboarding$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  List<OnboardingPageData> get pages => [
    Translations$onboarding$pages$0$en.internal(_root),
    Translations$onboarding$pages$1$en.internal(_root),
    Translations$onboarding$pages$2$en.internal(_root),
  ];

  /// en: 'Get started'
  String get doneButton => 'Get started';
}

// Path: post
class Translations$post$en {
  Translations$post$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$post$list$en list = Translations$post$list$en.internal(_root);
}

// Path: privacyPolicy
class Translations$privacyPolicy$en {
  Translations$privacyPolicy$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Privacy Policy'
  String get title => 'Privacy Policy';
}

// Path: search
class Translations$search$en {
  Translations$search$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Search'
  String get title => 'Search';

  /// en: 'Search'
  String get fieldSearchHint => 'Search';
}

// Path: settings
class Translations$settings$en {
  Translations$settings$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Settings'
  String get title => 'Settings';

  /// en: 'Account'
  String get sectionAccount => 'Account';

  /// en: 'Biometrics'
  String get optionBiometrics => 'Biometrics';
}

// Path: terms
class Translations$terms$en {
  Translations$terms$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$terms$list$en list = Translations$terms$list$en.internal(_root);
}

// Path: account.profile
class Translations$account$profile$en {
  Translations$account$profile$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Profile'
  String get title => 'Profile';

  /// en: 'Edit Profile'
  String get buttonEditProfile => 'Edit Profile';

  /// en: 'Change Password'
  String get buttonChangePassword => 'Change Password';

  /// en: 'Settings'
  String get buttonSettings => 'Settings';

  /// en: 'Privacy Policy'
  String get buttonPrivacyPolicy => 'Privacy Policy';

  /// en: 'Terms'
  String get buttonTerms => 'Terms';

  /// en: 'Logout'
  String get buttonLogout => 'Logout';

  /// en: 'Change Picture'
  String get buttonChangePicture => 'Change Picture';

  /// en: 'Camera'
  String get buttonPickImageFromCamera => 'Camera';

  /// en: 'Gallery'
  String get buttonPickImageFromGallery => 'Gallery';
}

// Path: account.editProfile
class Translations$account$editProfile$en {
  Translations$account$editProfile$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Edit Profile'
  String get title => 'Edit Profile';

  /// en: 'Profile updated successfully'
  String get messageSuccess => 'Profile updated successfully';

  Map<String, String> get firstNameErrors => {'empty': 'First name is required'};
  Map<String, String> get lastNameErrors => {'empty': 'Last name is required'};
  Map<String, String> get emailErrors => {'invalid': 'Email is invalid'};
  Map<String, String> get errors => {
    'invalid_email': 'Email is invalid',
    'email_address_invalid': 'Email is invalid',
    'email_already_in_use': 'This email is already in use',
    'email_exists': 'This email is already in use',
    'user_sso_managed':
        'This account is managed by your company login and profile details cannot be changed here',
    'validation_failed': 'Some fields are invalid. Please review and try again',
    'over_request_rate_limit': 'Too many requests. Please wait a moment and try again',
    'request_timeout': 'Request timed out. Please try again',
    'unexpected_failure': 'Service is temporarily unavailable. Please try again',
    'other': _root.common.genericError,
  };
}

// Path: account.changePassword
class Translations$account$changePassword$en {
  Translations$account$changePassword$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Change Password'
  String get title => 'Change Password';

  /// en: 'Current Password'
  String get labelCurrentPassword => 'Current Password';

  /// en: 'New Password'
  String get labelNewPassword => 'New Password';

  /// en: 'Confirm Password'
  String get labelConfirmPassword => 'Confirm Password';

  /// en: 'Password changed successfully'
  String get messageSuccess => 'Password changed successfully';

  Map<String, String> get currentPasswordErrors => {'empty': 'Current password is required'};
  Map<String, String> get newPasswordErrors => {
    'weak': 'New password must be at least 8 characters long and contain at least one letter and one number',
  };
  Map<String, String> get confirmPasswordErrors => {'invalid': 'Passwords do not match'};
  Map<String, String> get errors => {
    'wrong_current_password': 'Current password is incorrect',
    'invalid_credentials': 'Current password is incorrect',
    'same_password': 'New password must be different from your current password',
    'weak_password': 'New password is too weak',
    'reauthentication_needed': 'Please reauthenticate before changing your password',
    'user_not_found': 'Your user session is no longer valid. Please sign in again',
    'over_request_rate_limit': 'Too many requests. Please wait a moment and try again',
    'request_timeout': 'Request timed out. Please try again',
    'unexpected_failure': 'Service is temporarily unavailable. Please try again',
    'other': _root.common.genericError,
  };
}

// Path: account.deleteAccount
class Translations$account$deleteAccount$en {
  Translations$account$deleteAccount$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Delete Account'
  String get title => 'Delete Account';

  /// en: 'This permanently deletes your account and its data. This action cannot be undone.'
  String get warning =>
      'This permanently deletes your account and its data. This action cannot be undone.';

  /// en: 'Delete Account'
  String get buttonDelete => 'Delete Account';

  /// en: 'Cancel'
  String get buttonCancel => 'Cancel';

  /// en: 'Your account has been deleted.'
  String get messageSuccess => 'Your account has been deleted.';

  Map<String, String> get errors => {
    'account_deletion_failed': 'We couldn\'t delete your account. Try again.',
    'deletion_failed': 'We couldn\'t delete your account. Try again.',
    'not_authenticated': 'Your session expired. Sign in again.',
    'other': _root.common.genericError,
  };
}

// Path: authentication.login
class Translations$authentication$login$en {
  Translations$authentication$login$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Login'
  String get title => 'Login';

  /// en: 'Login'
  String get buttonLogin => 'Login';

  /// en: 'Forgot password?'
  String get buttonForgotPassword => 'Forgot password?';

  /// en: 'Sign in with {provider}'
  String buttonSignInWith({required Object provider}) => 'Sign in with ${provider}';

  /// en: 'Don't have an account? Sign up'
  String get buttonNewAccount => 'Don\'t have an account? Sign up';

  /// en: 'Open DevMenu'
  String get buttonDevMenu => 'Open DevMenu';

  /// en: 'OR'
  String get dividerOr => 'OR';

  Map<String, String> get emailErrors => {'invalid': 'Email is invalid'};
  Map<String, String> get passwordErrors => {'empty': 'Password is required'};
  Map<String, String> get errors => {
    'invalid_credentials': 'Email or password is incorrect',
    'email_not_confirmed': 'Please confirm your email before signing in',
    'user_banned': 'Your account is temporarily unavailable',
    'other': _root.common.genericError,
  };
}

// Path: authentication.signup
class Translations$authentication$signup$en {
  Translations$authentication$signup$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Sign Up'
  String get title => 'Sign Up';

  /// en: 'Confirm Password'
  String get labelConfirmPassword => 'Confirm Password';

  /// en: 'Sign Up'
  String get buttonSubmit => 'Sign Up';

  Map<String, String> get emailErrors => {'invalid': 'Email is invalid'};
  Map<String, String> get passwordErrors => {
    'weak': 'Password must be at least 8 characters long and contain at least one letter and one number',
  };
  Map<String, String> get confirmPasswordErrors => {'invalid': 'Passwords do not match'};
  Map<String, String> get errors => {
    'user_already_registered': 'This email is already registered',
    'user_already_exists': 'This email is already registered',
    'weak_password': 'Password must be stronger',
    'email_address_invalid': 'Email is invalid',
    'other': _root.common.genericError,
  };
}

// Path: authentication.forgotPassword
class Translations$authentication$forgotPassword$en {
  Translations$authentication$forgotPassword$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Recover Password'
  String get title => 'Recover Password';

  /// en: 'Enter your email address and we'll send you a link to reset your password.'
  String get description =>
      'Enter your email address and we\'ll send you a link to reset your password.';

  /// en: 'We've sent you an email with a link to reset your password.'
  String get messageSuccess => 'We\'ve sent you an email with a link to reset your password.';

  Map<String, String> get emailErrors => {'invalid': 'Invalid email'};
  Map<String, String> get errors => {'other': _root.common.genericError};
}

// Path: onboarding.pages.0
class Translations$onboarding$pages$0$en with OnboardingPageData {
  Translations$onboarding$pages$0$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Welcome!'
  @override
  String get title => 'Welcome!';

  /// en: 'Welcome to QuickStart Flutter'
  @override
  String get message => 'Welcome to QuickStart Flutter';
}

// Path: onboarding.pages.1
class Translations$onboarding$pages$1$en with OnboardingPageData {
  Translations$onboarding$pages$1$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'What is QuickStart Flutter?'
  @override
  String get title => 'What is QuickStart Flutter?';

  /// en: 'QuickStart Flutter is a project to speed up the bootstrapping of new Flutter projects. It already comes with a series of features ready to use, such as internationalization, themes, routes, state management, among others.'
  @override
  String get message =>
      'QuickStart Flutter is a project to speed up the bootstrapping of new Flutter projects. It already comes with a series of features ready to use, such as internationalization, themes, routes, state management, among others.';
}

// Path: onboarding.pages.2
class Translations$onboarding$pages$2$en with OnboardingPageData {
  Translations$onboarding$pages$2$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Let's get started?'
  @override
  String get title => 'Let\'s get started?';

  /// en: 'Ready to explore everything QuickStart Flutter has to offer? Let's get started!'
  @override
  String get message =>
      'Ready to explore everything QuickStart Flutter has to offer? Let\'s get started!';
}

// Path: post.list
class Translations$post$list$en {
  Translations$post$list$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Feed'
  String get title => 'Feed';

  /// en: 'Failed to load feed.'
  String get textFailure => 'Failed to load feed.';

  late final Translations$post$list$emptyIndicator$en emptyIndicator =
      Translations$post$list$emptyIndicator$en.internal(_root);
}

// Path: terms.list
class Translations$terms$list$en {
  Translations$terms$list$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Terms'
  String get title => 'Terms';
}

// Path: post.list.emptyIndicator
class Translations$post$list$emptyIndicator$en {
  Translations$post$list$emptyIndicator$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'No posts found'
  String get title => 'No posts found';

  /// en: 'New posts will appear here.'
  String get text => 'New posts will appear here.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'account.profile.title' => 'Profile',
      'account.profile.buttonEditProfile' => 'Edit Profile',
      'account.profile.buttonChangePassword' => 'Change Password',
      'account.profile.buttonSettings' => 'Settings',
      'account.profile.buttonPrivacyPolicy' => 'Privacy Policy',
      'account.profile.buttonTerms' => 'Terms',
      'account.profile.buttonLogout' => 'Logout',
      'account.profile.buttonChangePicture' => 'Change Picture',
      'account.profile.buttonPickImageFromCamera' => 'Camera',
      'account.profile.buttonPickImageFromGallery' => 'Gallery',
      'account.editProfile.title' => 'Edit Profile',
      'account.editProfile.messageSuccess' => 'Profile updated successfully',
      'account.editProfile.firstNameErrors.empty' => 'First name is required',
      'account.editProfile.lastNameErrors.empty' => 'Last name is required',
      'account.editProfile.emailErrors.invalid' => 'Email is invalid',
      'account.editProfile.errors.invalid_email' => 'Email is invalid',
      'account.editProfile.errors.email_address_invalid' => 'Email is invalid',
      'account.editProfile.errors.email_already_in_use' => 'This email is already in use',
      'account.editProfile.errors.email_exists' => 'This email is already in use',
      'account.editProfile.errors.user_sso_managed' =>
        'This account is managed by your company login and profile details cannot be changed here',
      'account.editProfile.errors.validation_failed' =>
        'Some fields are invalid. Please review and try again',
      'account.editProfile.errors.over_request_rate_limit' =>
        'Too many requests. Please wait a moment and try again',
      'account.editProfile.errors.request_timeout' => 'Request timed out. Please try again',
      'account.editProfile.errors.unexpected_failure' =>
        'Service is temporarily unavailable. Please try again',
      'account.editProfile.errors.other' => _root.common.genericError,
      'account.changePassword.title' => 'Change Password',
      'account.changePassword.labelCurrentPassword' => 'Current Password',
      'account.changePassword.labelNewPassword' => 'New Password',
      'account.changePassword.labelConfirmPassword' => 'Confirm Password',
      'account.changePassword.messageSuccess' => 'Password changed successfully',
      'account.changePassword.currentPasswordErrors.empty' => 'Current password is required',
      'account.changePassword.newPasswordErrors.weak' => 'New password must be at least 8 characters long and contain at least one letter and one number',
      'account.changePassword.confirmPasswordErrors.invalid' => 'Passwords do not match',
      'account.changePassword.errors.wrong_current_password' => 'Current password is incorrect',
      'account.changePassword.errors.invalid_credentials' => 'Current password is incorrect',
      'account.changePassword.errors.same_password' =>
        'New password must be different from your current password',
      'account.changePassword.errors.weak_password' => 'New password is too weak',
      'account.changePassword.errors.reauthentication_needed' =>
        'Please reauthenticate before changing your password',
      'account.changePassword.errors.user_not_found' =>
        'Your user session is no longer valid. Please sign in again',
      'account.changePassword.errors.over_request_rate_limit' =>
        'Too many requests. Please wait a moment and try again',
      'account.changePassword.errors.request_timeout' => 'Request timed out. Please try again',
      'account.changePassword.errors.unexpected_failure' =>
        'Service is temporarily unavailable. Please try again',
      'account.changePassword.errors.other' => _root.common.genericError,
      'account.deleteAccount.title' => 'Delete Account',
      'account.deleteAccount.warning' =>
        'This permanently deletes your account and its data. This action cannot be undone.',
      'account.deleteAccount.buttonDelete' => 'Delete Account',
      'account.deleteAccount.buttonCancel' => 'Cancel',
      'account.deleteAccount.messageSuccess' => 'Your account has been deleted.',
      'account.deleteAccount.errors.account_deletion_failed' =>
        'We couldn\'t delete your account. Try again.',
      'account.deleteAccount.errors.deletion_failed' =>
        'We couldn\'t delete your account. Try again.',
      'account.deleteAccount.errors.not_authenticated' => 'Your session expired. Sign in again.',
      'account.deleteAccount.errors.other' => _root.common.genericError,
      'authentication.login.title' => 'Login',
      'authentication.login.buttonLogin' => 'Login',
      'authentication.login.buttonForgotPassword' => 'Forgot password?',
      'authentication.login.buttonSignInWith' => ({
        required Object provider,
      }) => 'Sign in with ${provider}',
      'authentication.login.buttonNewAccount' => 'Don\'t have an account? Sign up',
      'authentication.login.buttonDevMenu' => 'Open DevMenu',
      'authentication.login.dividerOr' => 'OR',
      'authentication.login.emailErrors.invalid' => 'Email is invalid',
      'authentication.login.passwordErrors.empty' => 'Password is required',
      'authentication.login.errors.invalid_credentials' => 'Email or password is incorrect',
      'authentication.login.errors.email_not_confirmed' =>
        'Please confirm your email before signing in',
      'authentication.login.errors.user_banned' => 'Your account is temporarily unavailable',
      'authentication.login.errors.other' => _root.common.genericError,
      'authentication.signup.title' => 'Sign Up',
      'authentication.signup.labelConfirmPassword' => 'Confirm Password',
      'authentication.signup.buttonSubmit' => 'Sign Up',
      'authentication.signup.emailErrors.invalid' => 'Email is invalid',
      'authentication.signup.passwordErrors.weak' => 'Password must be at least 8 characters long and contain at least one letter and one number',
      'authentication.signup.confirmPasswordErrors.invalid' => 'Passwords do not match',
      'authentication.signup.errors.user_already_registered' => 'This email is already registered',
      'authentication.signup.errors.user_already_exists' => 'This email is already registered',
      'authentication.signup.errors.weak_password' => 'Password must be stronger',
      'authentication.signup.errors.email_address_invalid' => 'Email is invalid',
      'authentication.signup.errors.other' => _root.common.genericError,
      'authentication.forgotPassword.title' => 'Recover Password',
      'authentication.forgotPassword.description' =>
        'Enter your email address and we\'ll send you a link to reset your password.',
      'authentication.forgotPassword.messageSuccess' =>
        'We\'ve sent you an email with a link to reset your password.',
      'authentication.forgotPassword.emailErrors.invalid' => 'Invalid email',
      'authentication.forgotPassword.errors.other' => _root.common.genericError,
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
      'notifications.title' => 'Notifications',
      'notifications.markAllRead' => 'Mark all as read',
      'notifications.textFailure' => 'Failed to load notifications.',
      'notifications.emptyTitle' => 'No notifications yet',
      'notifications.emptyDescription' => 'Updates and activity will appear here.',
      'notifications.semanticsUnread' => 'Unread',
      'notifications.badgeTooltip' => 'Notifications',
      'notifications.errors.serverError' => 'Something went wrong. Try again.',
      'notifications.errors.other' => _root.common.genericError,
      'onboarding.pages.0.title' => 'Welcome!',
      'onboarding.pages.0.message' => 'Welcome to QuickStart Flutter',
      'onboarding.pages.1.title' => 'What is QuickStart Flutter?',
      'onboarding.pages.1.message' => 'QuickStart Flutter is a project to speed up the bootstrapping of new Flutter projects. It already comes with a series of features ready to use, such as internationalization, themes, routes, state management, among others.',
      'onboarding.pages.2.title' => 'Let\'s get started?',
      'onboarding.pages.2.message' =>
        'Ready to explore everything QuickStart Flutter has to offer? Let\'s get started!',
      'onboarding.doneButton' => 'Get started',
      'post.list.title' => 'Feed',
      'post.list.textFailure' => 'Failed to load feed.',
      'post.list.emptyIndicator.title' => 'No posts found',
      'post.list.emptyIndicator.text' => 'New posts will appear here.',
      'privacyPolicy.title' => 'Privacy Policy',
      'search.title' => 'Search',
      'search.fieldSearchHint' => 'Search',
      'settings.title' => 'Settings',
      'settings.sectionAccount' => 'Account',
      'settings.optionBiometrics' => 'Biometrics',
      'terms.list.title' => 'Terms',
      _ => null,
    };
  }
}
