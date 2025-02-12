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
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsChangePasswordEn changePassword = TranslationsChangePasswordEn.internal(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsEditProfileEn editProfile = TranslationsEditProfileEn.internal(_root);
	late final TranslationsForgotPasswordEn forgotPassword = TranslationsForgotPasswordEn.internal(_root);
	late final TranslationsLoginEn login = TranslationsLoginEn.internal(_root);
	late final TranslationsNotFoundEn notFound = TranslationsNotFoundEn.internal(_root);
	late final TranslationsOnboardingEn onboarding = TranslationsOnboardingEn.internal(_root);
	late final TranslationsPostEn post = TranslationsPostEn.internal(_root);
	late final TranslationsPrivacyPolicyEn privacyPolicy = TranslationsPrivacyPolicyEn.internal(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn.internal(_root);
	late final TranslationsSearchEn search = TranslationsSearchEn.internal(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
	late final TranslationsSignupEn signup = TranslationsSignupEn.internal(_root);
	late final TranslationsTermsEn terms = TranslationsTermsEn.internal(_root);
}

// Path: changePassword
class TranslationsChangePasswordEn {
	TranslationsChangePasswordEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Change Password';
	String get labelCurrentPassword => 'Current Password';
	String get labelNewPassword => 'New Password';
	String get labelConfirmPassword => 'Confirm Password';
	String get messageSuccess => 'Password changed successfully';
	Map<String, String> get currentPasswordErrors => {
		'empty': 'Current password is required',
	};
	Map<String, String> get newPasswordErrors => {
		'weak': 'New password must be at least 8 characters long and contain at least one letter and one number',
	};
	Map<String, String> get confirmPasswordErrors => {
		'invalid': 'Passwords do not match',
	};
	Map<String, String> get errors => {
		'other': _root.common.genericError,
	};
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appName => 'Flutter Bloc Starter';
	String get send => 'Send';
	String get save => 'Save';
	String get retry => 'Retry';
	String get username => 'Username';
	String get email => 'Email';
	String get password => 'Password';
	String get firstName => 'First Name';
	String get lastName => 'Last Name';
	String get genericError => 'Something went wrong';
}

// Path: editProfile
class TranslationsEditProfileEn {
	TranslationsEditProfileEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Edit Profile';
	String get messageSuccess => 'Profile updated successfully';
	Map<String, String> get firstNameErrors => {
		'empty': 'First name is required',
	};
	Map<String, String> get lastNameErrors => {
		'empty': 'Last name is required',
	};
	Map<String, String> get emailErrors => {
		'invalid': 'Email is invalid',
	};
	Map<String, String> get errors => {
		'other': _root.common.genericError,
	};
}

// Path: forgotPassword
class TranslationsForgotPasswordEn {
	TranslationsForgotPasswordEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Recover Password';
	String get description => 'Enter your email address and we\'ll send you a link to reset your password.';
	String get messageSuccess => 'We\'ve sent you an email with a link to reset your password.';
	Map<String, String> get emailErrors => {
		'invalid': 'Invalid email',
	};
	Map<String, String> get errors => {
		'other': _root.common.genericError,
	};
}

// Path: login
class TranslationsLoginEn {
	TranslationsLoginEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Login';
	String get buttonLogin => 'Login';
	String get buttonForgotPassword => 'Forgot password?';
	String buttonSignInWith({required Object provider}) => 'Sign in with ${provider}';
	TextSpan buttonNewAccount({required InlineSpanBuilder signUp}) => TextSpan(children: [
		const TextSpan(text: 'Don\'t have an account? '),
		signUp('Sign up'),
	]);
	String get dividerOr => 'OR';
	Map<String, String> get usernameErrors => {
		'empty': 'Username is required',
	};
	Map<String, String> get passwordErrors => {
		'empty': 'Password is required',
	};
	Map<String, String> get errors => {
		'BAD_USER_INPUT': 'Username or password is incorrect',
		'other': _root.common.genericError,
	};
}

// Path: notFound
class TranslationsNotFoundEn {
	TranslationsNotFoundEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '404';
	String get description => 'Page not found';
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
	String get doneButton => 'Get started';
}

// Path: post
class TranslationsPostEn {
	TranslationsPostEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Feed';
	String get textFailure => 'Failed to load feed.';
}

// Path: privacyPolicy
class TranslationsPrivacyPolicyEn {
	TranslationsPrivacyPolicyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Privacy Policy';
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Profile';
	String get buttonEditProfile => 'Edit Profile';
	String get buttonChangePassword => 'Change Password';
	String get buttonSettings => 'Settings';
	String get buttonPrivacyPolicy => 'Privacy Policy';
	String get buttonTerms => 'Terms';
	String get buttonLogout => 'Logout';
	String get buttonChangePicture => 'Change Picture';
	String get buttonPickImageFromCamera => 'Camera';
	String get buttonPickImageFromGallery => 'Gallery';
}

// Path: search
class TranslationsSearchEn {
	TranslationsSearchEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Search';
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get optionBiometrics => 'Biometrics';
}

// Path: signup
class TranslationsSignupEn {
	TranslationsSignupEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sign Up';
	String get labelConfirmPassword => 'Confirm Password';
	String get buttonSubmit => 'Sign Up';
	Map<String, String> get usernameErrors => {
		'empty': 'Username is required',
	};
	Map<String, String> get emailErrors => {
		'invalid': 'Email is invalid',
	};
	Map<String, String> get passwordErrors => {
		'weak': 'Password must be at least 8 characters long and contain at least one letter and one number',
	};
	Map<String, String> get confirmPasswordErrors => {
		'invalid': 'Passwords do not match',
	};
	Map<String, String> get errors => {
		'other': _root.common.genericError,
	};
}

// Path: terms
class TranslationsTermsEn {
	TranslationsTermsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Terms';
}

// Path: onboarding.pages.0
class TranslationsOnboarding$pages$0i0$En with OnboardingPageData {
	TranslationsOnboarding$pages$0i0$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	@override String get title => 'Welcome!';
	@override String get message => 'Welcome to QuickStart Flutter';
}

// Path: onboarding.pages.1
class TranslationsOnboarding$pages$0i1$En with OnboardingPageData {
	TranslationsOnboarding$pages$0i1$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	@override String get title => 'What is QuickStart Flutter?';
	@override String get message => 'QuickStart Flutter is a project to speed up the bootstrapping of new Flutter projects. It already comes with a series of features ready to use, such as internationalization, themes, routes, state management, among others.';
}

// Path: onboarding.pages.2
class TranslationsOnboarding$pages$0i2$En with OnboardingPageData {
	TranslationsOnboarding$pages$0i2$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	@override String get title => 'Let\'s get started?';
	@override String get message => 'Ready to explore everything QuickStart Flutter has to offer? Let\'s get started!';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'changePassword.title': return 'Change Password';
			case 'changePassword.labelCurrentPassword': return 'Current Password';
			case 'changePassword.labelNewPassword': return 'New Password';
			case 'changePassword.labelConfirmPassword': return 'Confirm Password';
			case 'changePassword.messageSuccess': return 'Password changed successfully';
			case 'changePassword.currentPasswordErrors.empty': return 'Current password is required';
			case 'changePassword.newPasswordErrors.weak': return 'New password must be at least 8 characters long and contain at least one letter and one number';
			case 'changePassword.confirmPasswordErrors.invalid': return 'Passwords do not match';
			case 'changePassword.errors.other': return _root.common.genericError;
			case 'common.appName': return 'Flutter Bloc Starter';
			case 'common.send': return 'Send';
			case 'common.save': return 'Save';
			case 'common.retry': return 'Retry';
			case 'common.username': return 'Username';
			case 'common.email': return 'Email';
			case 'common.password': return 'Password';
			case 'common.firstName': return 'First Name';
			case 'common.lastName': return 'Last Name';
			case 'common.genericError': return 'Something went wrong';
			case 'editProfile.title': return 'Edit Profile';
			case 'editProfile.messageSuccess': return 'Profile updated successfully';
			case 'editProfile.firstNameErrors.empty': return 'First name is required';
			case 'editProfile.lastNameErrors.empty': return 'Last name is required';
			case 'editProfile.emailErrors.invalid': return 'Email is invalid';
			case 'editProfile.errors.other': return _root.common.genericError;
			case 'forgotPassword.title': return 'Recover Password';
			case 'forgotPassword.description': return 'Enter your email address and we\'ll send you a link to reset your password.';
			case 'forgotPassword.messageSuccess': return 'We\'ve sent you an email with a link to reset your password.';
			case 'forgotPassword.emailErrors.invalid': return 'Invalid email';
			case 'forgotPassword.errors.other': return _root.common.genericError;
			case 'login.title': return 'Login';
			case 'login.buttonLogin': return 'Login';
			case 'login.buttonForgotPassword': return 'Forgot password?';
			case 'login.buttonSignInWith': return ({required Object provider}) => 'Sign in with ${provider}';
			case 'login.buttonNewAccount': return ({required InlineSpanBuilder signUp}) => TextSpan(children: [
				const TextSpan(text: 'Don\'t have an account? '),
				signUp('Sign up'),
			]);
			case 'login.dividerOr': return 'OR';
			case 'login.usernameErrors.empty': return 'Username is required';
			case 'login.passwordErrors.empty': return 'Password is required';
			case 'login.errors.BAD_USER_INPUT': return 'Username or password is incorrect';
			case 'login.errors.other': return _root.common.genericError;
			case 'notFound.title': return '404';
			case 'notFound.description': return 'Page not found';
			case 'notFound.buttonBack': return 'Go back home';
			case 'onboarding.pages.0.title': return 'Welcome!';
			case 'onboarding.pages.0.message': return 'Welcome to QuickStart Flutter';
			case 'onboarding.pages.1.title': return 'What is QuickStart Flutter?';
			case 'onboarding.pages.1.message': return 'QuickStart Flutter is a project to speed up the bootstrapping of new Flutter projects. It already comes with a series of features ready to use, such as internationalization, themes, routes, state management, among others.';
			case 'onboarding.pages.2.title': return 'Let\'s get started?';
			case 'onboarding.pages.2.message': return 'Ready to explore everything QuickStart Flutter has to offer? Let\'s get started!';
			case 'onboarding.doneButton': return 'Get started';
			case 'post.title': return 'Feed';
			case 'post.textFailure': return 'Failed to load feed.';
			case 'privacyPolicy.title': return 'Privacy Policy';
			case 'profile.title': return 'Profile';
			case 'profile.buttonEditProfile': return 'Edit Profile';
			case 'profile.buttonChangePassword': return 'Change Password';
			case 'profile.buttonSettings': return 'Settings';
			case 'profile.buttonPrivacyPolicy': return 'Privacy Policy';
			case 'profile.buttonTerms': return 'Terms';
			case 'profile.buttonLogout': return 'Logout';
			case 'profile.buttonChangePicture': return 'Change Picture';
			case 'profile.buttonPickImageFromCamera': return 'Camera';
			case 'profile.buttonPickImageFromGallery': return 'Gallery';
			case 'search.title': return 'Search';
			case 'settings.title': return 'Settings';
			case 'settings.optionBiometrics': return 'Biometrics';
			case 'signup.title': return 'Sign Up';
			case 'signup.labelConfirmPassword': return 'Confirm Password';
			case 'signup.buttonSubmit': return 'Sign Up';
			case 'signup.usernameErrors.empty': return 'Username is required';
			case 'signup.emailErrors.invalid': return 'Email is invalid';
			case 'signup.passwordErrors.weak': return 'Password must be at least 8 characters long and contain at least one letter and one number';
			case 'signup.confirmPasswordErrors.invalid': return 'Passwords do not match';
			case 'signup.errors.other': return _root.common.genericError;
			case 'terms.title': return 'Terms';
			default: return null;
		}
	}
}

