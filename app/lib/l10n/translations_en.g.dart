///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations implements BaseTranslations<AppLocale, Translations> {
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
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      Translations(meta: meta ?? this.$meta);

  // Translations
  late final TranslationsAccountEn account = TranslationsAccountEn.internal(_root);
  late final TranslationsAuthenticationEn authentication = TranslationsAuthenticationEn.internal(
    _root,
  );
  late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
  late final TranslationsNotFoundEn notFound = TranslationsNotFoundEn.internal(_root);
  late final TranslationsOnboardingEn onboarding = TranslationsOnboardingEn.internal(_root);
  late final TranslationsPostEn post = TranslationsPostEn.internal(_root);
  late final TranslationsPrivacyPolicyEn privacyPolicy = TranslationsPrivacyPolicyEn.internal(
    _root,
  );
  late final TranslationsSearchEn search = TranslationsSearchEn.internal(_root);
  late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
  late final TranslationsTermsEn terms = TranslationsTermsEn.internal(_root);
}

// Path: account
class TranslationsAccountEn {
  TranslationsAccountEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsAccountProfileEn profile = TranslationsAccountProfileEn.internal(_root);
  late final TranslationsAccountEditProfileEn editProfile =
      TranslationsAccountEditProfileEn.internal(_root);
  late final TranslationsAccountChangePasswordEn changePassword =
      TranslationsAccountChangePasswordEn.internal(_root);
}

// Path: authentication
class TranslationsAuthenticationEn {
  TranslationsAuthenticationEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsAuthenticationLoginEn login = TranslationsAuthenticationLoginEn.internal(
    _root,
  );
  late final TranslationsAuthenticationSignupEn signup =
      TranslationsAuthenticationSignupEn.internal(_root);
  late final TranslationsAuthenticationForgotPasswordEn forgotPassword =
      TranslationsAuthenticationForgotPasswordEn.internal(_root);
}

// Path: common
class TranslationsCommonEn {
  TranslationsCommonEn.internal(this._root);

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
class TranslationsNotFoundEn {
  TranslationsNotFoundEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: '404'
  String get title => '404';

  /// en: 'Page not found'
  String get description => 'Page not found';

  /// en: 'Go back home'
  String get buttonBack => 'Go back home';
}

// Path: onboarding
class TranslationsOnboardingEn {
  TranslationsOnboardingEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  List<OnboardingPageData> get pages => [
    TranslationsOnboarding$pages$0i0$En.internal(_root),
    TranslationsOnboarding$pages$0i1$En.internal(_root),
    TranslationsOnboarding$pages$0i2$En.internal(_root),
  ];

  /// en: 'Get started'
  String get doneButton => 'Get started';
}

// Path: post
class TranslationsPostEn {
  TranslationsPostEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsPostListEn list = TranslationsPostListEn.internal(_root);
}

// Path: privacyPolicy
class TranslationsPrivacyPolicyEn {
  TranslationsPrivacyPolicyEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Privacy Policy'
  String get title => 'Privacy Policy';
}

// Path: search
class TranslationsSearchEn {
  TranslationsSearchEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Search'
  String get title => 'Search';
}

// Path: settings
class TranslationsSettingsEn {
  TranslationsSettingsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Settings'
  String get title => 'Settings';

  /// en: 'Biometrics'
  String get optionBiometrics => 'Biometrics';
}

// Path: terms
class TranslationsTermsEn {
  TranslationsTermsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Terms'
  String get title => 'Terms';
}

// Path: account.profile
class TranslationsAccountProfileEn {
  TranslationsAccountProfileEn.internal(this._root);

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
class TranslationsAccountEditProfileEn {
  TranslationsAccountEditProfileEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Edit Profile'
  String get title => 'Edit Profile';

  /// en: 'Profile updated successfully'
  String get messageSuccess => 'Profile updated successfully';

  Map<String, String> get firstNameErrors => {'empty': 'First name is required'};
  Map<String, String> get lastNameErrors => {'empty': 'Last name is required'};
  Map<String, String> get emailErrors => {'invalid': 'Email is invalid'};
  Map<String, String> get errors => {'other': _root.common.genericError};
}

// Path: account.changePassword
class TranslationsAccountChangePasswordEn {
  TranslationsAccountChangePasswordEn.internal(this._root);

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
    'weak':
        'New password must be at least 8 characters long and contain at least one letter and one number',
  };
  Map<String, String> get confirmPasswordErrors => {'invalid': 'Passwords do not match'};
  Map<String, String> get errors => {'other': _root.common.genericError};
}

// Path: authentication.login
class TranslationsAuthenticationLoginEn {
  TranslationsAuthenticationLoginEn.internal(this._root);

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

  /// en: 'Don't have an account? {signUp(Sign up)}'
  TextSpan buttonNewAccount({required InlineSpanBuilder signUp}) => TextSpan(
    children: [
      const TextSpan(text: 'Don\'t have an account? '),
      signUp('Sign up'),
    ],
  );

  /// en: 'OR'
  String get dividerOr => 'OR';

  Map<String, String> get usernameErrors => {'empty': 'Username is required'};
  Map<String, String> get passwordErrors => {'empty': 'Password is required'};
  Map<String, String> get errors => {
    'BAD_USER_INPUT': 'Username or password is incorrect',
    'other': _root.common.genericError,
  };
}

// Path: authentication.signup
class TranslationsAuthenticationSignupEn {
  TranslationsAuthenticationSignupEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Sign Up'
  String get title => 'Sign Up';

  /// en: 'Confirm Password'
  String get labelConfirmPassword => 'Confirm Password';

  /// en: 'Sign Up'
  String get buttonSubmit => 'Sign Up';

  Map<String, String> get usernameErrors => {'empty': 'Username is required'};
  Map<String, String> get emailErrors => {'invalid': 'Email is invalid'};
  Map<String, String> get passwordErrors => {
    'weak':
        'Password must be at least 8 characters long and contain at least one letter and one number',
  };
  Map<String, String> get confirmPasswordErrors => {'invalid': 'Passwords do not match'};
  Map<String, String> get errors => {'other': _root.common.genericError};
}

// Path: authentication.forgotPassword
class TranslationsAuthenticationForgotPasswordEn {
  TranslationsAuthenticationForgotPasswordEn.internal(this._root);

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
class TranslationsOnboarding$pages$0i0$En with OnboardingPageData {
  TranslationsOnboarding$pages$0i0$En.internal(this._root);

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
class TranslationsOnboarding$pages$0i1$En with OnboardingPageData {
  TranslationsOnboarding$pages$0i1$En.internal(this._root);

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
class TranslationsOnboarding$pages$0i2$En with OnboardingPageData {
  TranslationsOnboarding$pages$0i2$En.internal(this._root);

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
class TranslationsPostListEn {
  TranslationsPostListEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Feed'
  String get title => 'Feed';

  /// en: 'Failed to load feed.'
  String get textFailure => 'Failed to load feed.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
/// Note: We use a HashMap because Dart seems to be unable to compile large switch statements.
Map<String, dynamic>? _map;

extension on Translations {
  dynamic _flatMapFunction(String path) {
    final map = _map ?? _initFlatMap();
    return map[path];
  }

  /// Initializes the flat map and returns it.
  Map<String, dynamic> _initFlatMap() {
    final map = <String, dynamic>{};
    map['account.profile.title'] = 'Profile';
    map['account.profile.buttonEditProfile'] = 'Edit Profile';
    map['account.profile.buttonChangePassword'] = 'Change Password';
    map['account.profile.buttonSettings'] = 'Settings';
    map['account.profile.buttonPrivacyPolicy'] = 'Privacy Policy';
    map['account.profile.buttonTerms'] = 'Terms';
    map['account.profile.buttonLogout'] = 'Logout';
    map['account.profile.buttonChangePicture'] = 'Change Picture';
    map['account.profile.buttonPickImageFromCamera'] = 'Camera';
    map['account.profile.buttonPickImageFromGallery'] = 'Gallery';
    map['account.editProfile.title'] = 'Edit Profile';
    map['account.editProfile.messageSuccess'] = 'Profile updated successfully';
    map['account.editProfile.firstNameErrors.empty'] = 'First name is required';
    map['account.editProfile.lastNameErrors.empty'] = 'Last name is required';
    map['account.editProfile.emailErrors.invalid'] = 'Email is invalid';
    map['account.editProfile.errors.other'] = _root.common.genericError;
    map['account.changePassword.title'] = 'Change Password';
    map['account.changePassword.labelCurrentPassword'] = 'Current Password';
    map['account.changePassword.labelNewPassword'] = 'New Password';
    map['account.changePassword.labelConfirmPassword'] = 'Confirm Password';
    map['account.changePassword.messageSuccess'] = 'Password changed successfully';
    map['account.changePassword.currentPasswordErrors.empty'] = 'Current password is required';
    map['account.changePassword.newPasswordErrors.weak'] =
        'New password must be at least 8 characters long and contain at least one letter and one number';
    map['account.changePassword.confirmPasswordErrors.invalid'] = 'Passwords do not match';
    map['account.changePassword.errors.other'] = _root.common.genericError;
    map['authentication.login.title'] = 'Login';
    map['authentication.login.buttonLogin'] = 'Login';
    map['authentication.login.buttonForgotPassword'] = 'Forgot password?';
    map['authentication.login.buttonSignInWith'] = ({required Object provider}) =>
        'Sign in with ${provider}';
    map['authentication.login.buttonNewAccount'] = ({required InlineSpanBuilder signUp}) =>
        TextSpan(
          children: [
            const TextSpan(text: 'Don\'t have an account? '),
            signUp('Sign up'),
          ],
        );
    map['authentication.login.dividerOr'] = 'OR';
    map['authentication.login.usernameErrors.empty'] = 'Username is required';
    map['authentication.login.passwordErrors.empty'] = 'Password is required';
    map['authentication.login.errors.BAD_USER_INPUT'] = 'Username or password is incorrect';
    map['authentication.login.errors.other'] = _root.common.genericError;
    map['authentication.signup.title'] = 'Sign Up';
    map['authentication.signup.labelConfirmPassword'] = 'Confirm Password';
    map['authentication.signup.buttonSubmit'] = 'Sign Up';
    map['authentication.signup.usernameErrors.empty'] = 'Username is required';
    map['authentication.signup.emailErrors.invalid'] = 'Email is invalid';
    map['authentication.signup.passwordErrors.weak'] =
        'Password must be at least 8 characters long and contain at least one letter and one number';
    map['authentication.signup.confirmPasswordErrors.invalid'] = 'Passwords do not match';
    map['authentication.signup.errors.other'] = _root.common.genericError;
    map['authentication.forgotPassword.title'] = 'Recover Password';
    map['authentication.forgotPassword.description'] =
        'Enter your email address and we\'ll send you a link to reset your password.';
    map['authentication.forgotPassword.messageSuccess'] =
        'We\'ve sent you an email with a link to reset your password.';
    map['authentication.forgotPassword.emailErrors.invalid'] = 'Invalid email';
    map['authentication.forgotPassword.errors.other'] = _root.common.genericError;
    map['common.appName'] = 'Flutter Bloc Starter';
    map['common.send'] = 'Send';
    map['common.save'] = 'Save';
    map['common.retry'] = 'Retry';
    map['common.username'] = 'Username';
    map['common.email'] = 'Email';
    map['common.password'] = 'Password';
    map['common.firstName'] = 'First Name';
    map['common.lastName'] = 'Last Name';
    map['common.genericError'] = 'Something went wrong';
    map['notFound.title'] = '404';
    map['notFound.description'] = 'Page not found';
    map['notFound.buttonBack'] = 'Go back home';
    map['onboarding.pages.0.title'] = 'Welcome!';
    map['onboarding.pages.0.message'] = 'Welcome to QuickStart Flutter';
    map['onboarding.pages.1.title'] = 'What is QuickStart Flutter?';
    map['onboarding.pages.1.message'] =
        'QuickStart Flutter is a project to speed up the bootstrapping of new Flutter projects. It already comes with a series of features ready to use, such as internationalization, themes, routes, state management, among others.';
    map['onboarding.pages.2.title'] = 'Let\'s get started?';
    map['onboarding.pages.2.message'] =
        'Ready to explore everything QuickStart Flutter has to offer? Let\'s get started!';
    map['onboarding.doneButton'] = 'Get started';
    map['post.list.title'] = 'Feed';
    map['post.list.textFailure'] = 'Failed to load feed.';
    map['privacyPolicy.title'] = 'Privacy Policy';
    map['search.title'] = 'Search';
    map['settings.title'] = 'Settings';
    map['settings.optionBiometrics'] = 'Biometrics';
    map['terms.title'] = 'Terms';

    _map = map;
    return map;
  }
}
