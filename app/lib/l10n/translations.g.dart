/// Generated file. Do not edit.
///
/// Original: lib/l10n
/// To regenerate, run: `dart run slang`

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  en(languageCode: 'en', build: Translations.build),
  pt(languageCode: 'pt', build: _TranslationsPt.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, Translations> build;

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of l10n).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = l10n.someKey.anotherKey;
/// String b = l10n['someKey.anotherKey']; // Only for edge cases!
Translations get l10n => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final l10n = Translations.of(context); // Get l10n variable.
/// String a = l10n.someKey.anotherKey; // Use l10n variable.
/// String b = l10n['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.l10n.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get l10n => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// interfaces generated as mixins

mixin OnboardingPageData {
  String get title;
  String get message;

  @override
  bool operator ==(Object other) =>
      other is OnboardingPageData &&
      title == other.title &&
      message == other.message;

  @override
  int get hashCode => title.hashCode * message.hashCode;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final l10n = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
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

  // Translations
  late final _TranslationsMissingTranslationsEn missingTranslations =
      _TranslationsMissingTranslationsEn._(_root);
  late final _TranslationsUnusedTranslationsEn unusedTranslations =
      _TranslationsUnusedTranslationsEn._(_root);
  late final _TranslationsChangePasswordEn changePassword =
      _TranslationsChangePasswordEn._(_root);
  late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
  late final _TranslationsEditProfileEn editProfile =
      _TranslationsEditProfileEn._(_root);
  late final _TranslationsForgotPasswordEn forgotPassword =
      _TranslationsForgotPasswordEn._(_root);
  late final _TranslationsLoginEn login = _TranslationsLoginEn._(_root);
  late final _TranslationsNotFoundEn notFound =
      _TranslationsNotFoundEn._(_root);
  late final _TranslationsOnboardingEn onboarding =
      _TranslationsOnboardingEn._(_root);
  late final _TranslationsPostEn post = _TranslationsPostEn._(_root);
  late final _TranslationsPrivacyPolicyEn privacyPolicy =
      _TranslationsPrivacyPolicyEn._(_root);
  late final _TranslationsProfileEn profile = _TranslationsProfileEn._(_root);
  late final _TranslationsSearchEn search = _TranslationsSearchEn._(_root);
  late final _TranslationsSettingsEn settings =
      _TranslationsSettingsEn._(_root);
  late final _TranslationsSignupEn signup = _TranslationsSignupEn._(_root);
  late final _TranslationsTermsEn terms = _TranslationsTermsEn._(_root);
}

// Path: missingTranslations
class _TranslationsMissingTranslationsEn {
  _TranslationsMissingTranslationsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _TranslationsMissingTranslationsPtEn pt =
      _TranslationsMissingTranslationsPtEn._(_root);
}

// Path: unusedTranslations
class _TranslationsUnusedTranslationsEn {
  _TranslationsUnusedTranslationsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _TranslationsUnusedTranslationsEnEn en =
      _TranslationsUnusedTranslationsEnEn._(_root);
  late final _TranslationsUnusedTranslationsPtEn pt =
      _TranslationsUnusedTranslationsPtEn._(_root);
}

// Path: changePassword
class _TranslationsChangePasswordEn {
  _TranslationsChangePasswordEn._(this._root);

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
        'weak':
            'New password must be at least 8 characters long and contain at least one letter and one number',
      };
  Map<String, String> get confirmPasswordErrors => {
        'invalid': 'Passwords do not match',
      };
  Map<String, String> get errors => {
        'other': _root.common.genericError,
      };
}

// Path: common
class _TranslationsCommonEn {
  _TranslationsCommonEn._(this._root);

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
class _TranslationsEditProfileEn {
  _TranslationsEditProfileEn._(this._root);

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
class _TranslationsForgotPasswordEn {
  _TranslationsForgotPasswordEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Recover Password';
  String get description =>
      'Enter your email address and we\'ll send you a link to reset your password.';
  String get messageSuccess =>
      'We\'ve sent you an email with a link to reset your password.';
  Map<String, String> get emailErrors => {
        'invalid': 'Invalid email',
      };
  Map<String, String> get errors => {
        'other': _root.common.genericError,
      };
}

// Path: login
class _TranslationsLoginEn {
  _TranslationsLoginEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Login';
  String get buttonLogin => 'Login';
  String get buttonForgotPassword => 'Forgot password?';
  String buttonSignInWith({required Object provider}) =>
      'Sign in with ${provider}';
  TextSpan buttonNewAccount({required InlineSpanBuilder signUp}) =>
      TextSpan(children: [
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
        'other': _root.common.genericError,
      };
}

// Path: notFound
class _TranslationsNotFoundEn {
  _TranslationsNotFoundEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => '404';
  String get description => 'Page not found';
  String get buttonBack => 'Go back home';
}

// Path: onboarding
class _TranslationsOnboardingEn {
  _TranslationsOnboardingEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  List<OnboardingPageData> get pages => [
        _TranslationsOnboarding$pages$0i0$En._(_root),
        _TranslationsOnboarding$pages$0i1$En._(_root),
        _TranslationsOnboarding$pages$0i2$En._(_root),
      ];
  String get doneButton => 'Get started';
}

// Path: post
class _TranslationsPostEn {
  _TranslationsPostEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Feed';
  String get textFailure => 'Failed to load feed.';
}

// Path: privacyPolicy
class _TranslationsPrivacyPolicyEn {
  _TranslationsPrivacyPolicyEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Privacy Policy';
}

// Path: profile
class _TranslationsProfileEn {
  _TranslationsProfileEn._(this._root);

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
class _TranslationsSearchEn {
  _TranslationsSearchEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Search';
}

// Path: settings
class _TranslationsSettingsEn {
  _TranslationsSettingsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Settings';
  String get optionBiometrics => 'Biometrics';
}

// Path: signup
class _TranslationsSignupEn {
  _TranslationsSignupEn._(this._root);

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
        'weak':
            'Password must be at least 8 characters long and contain at least one letter and one number',
      };
  Map<String, String> get confirmPasswordErrors => {
        'invalid': 'Passwords do not match',
      };
  Map<String, String> get errors => {
        'other': _root.common.genericError,
      };
}

// Path: terms
class _TranslationsTermsEn {
  _TranslationsTermsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Terms';
}

// Path: missingTranslations.pt
class _TranslationsMissingTranslationsPtEn {
  _TranslationsMissingTranslationsPtEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
}

// Path: unusedTranslations.en
class _TranslationsUnusedTranslationsEnEn {
  _TranslationsUnusedTranslationsEnEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
}

// Path: unusedTranslations.pt
class _TranslationsUnusedTranslationsPtEn {
  _TranslationsUnusedTranslationsPtEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
}

// Path: onboarding.pages.0
class _TranslationsOnboarding$pages$0i0$En with OnboardingPageData {
  _TranslationsOnboarding$pages$0i0$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Welcome!';
  @override
  String get message => 'Welcome to QuickStart Flutter';
}

// Path: onboarding.pages.1
class _TranslationsOnboarding$pages$0i1$En with OnboardingPageData {
  _TranslationsOnboarding$pages$0i1$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'What is QuickStart Flutter?';
  @override
  String get message =>
      'QuickStart Flutter is a project to speed up the bootstrapping of new Flutter projects. It already comes with a series of features ready to use, such as internationalization, themes, routes, state management, among others.';
}

// Path: onboarding.pages.2
class _TranslationsOnboarding$pages$0i2$En with OnboardingPageData {
  _TranslationsOnboarding$pages$0i2$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Let\'s get started?';
  @override
  String get message =>
      'Ready to explore everything QuickStart Flutter has to offer? Let\'s get started!';
}

// Path: <root>
class _TranslationsPt extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsPt.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.pt,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ),
        super.build(
            cardinalResolver: cardinalResolver,
            ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction(
        $meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <pt>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  @override
  late final _TranslationsPt _root = this; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsChangePasswordPt changePassword =
      _TranslationsChangePasswordPt._(_root);
  @override
  late final _TranslationsCommonPt common = _TranslationsCommonPt._(_root);
  @override
  late final _TranslationsEditProfilePt editProfile =
      _TranslationsEditProfilePt._(_root);
  @override
  late final _TranslationsForgotPasswordPt forgotPassword =
      _TranslationsForgotPasswordPt._(_root);
  @override
  late final _TranslationsLoginPt login = _TranslationsLoginPt._(_root);
  @override
  late final _TranslationsNotFoundPt notFound =
      _TranslationsNotFoundPt._(_root);
  @override
  late final _TranslationsOnboardingPt onboarding =
      _TranslationsOnboardingPt._(_root);
  @override
  late final _TranslationsPostPt post = _TranslationsPostPt._(_root);
  @override
  late final _TranslationsPrivacyPolicyPt privacyPolicy =
      _TranslationsPrivacyPolicyPt._(_root);
  @override
  late final _TranslationsProfilePt profile = _TranslationsProfilePt._(_root);
  @override
  late final _TranslationsSearchPt search = _TranslationsSearchPt._(_root);
  @override
  late final _TranslationsSettingsPt settings =
      _TranslationsSettingsPt._(_root);
  @override
  late final _TranslationsSignupPt signup = _TranslationsSignupPt._(_root);
  @override
  late final _TranslationsTermsPt terms = _TranslationsTermsPt._(_root);
}

// Path: changePassword
class _TranslationsChangePasswordPt extends _TranslationsChangePasswordEn {
  _TranslationsChangePasswordPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Alterar Senha';
  @override
  String get labelCurrentPassword => 'Senha Atual';
  @override
  String get labelNewPassword => 'Nova Senha';
  @override
  String get labelConfirmPassword => 'Confirmar Senha';
  @override
  String get messageSuccess => 'Senha alterada com sucesso!';
  @override
  Map<String, String> get currentPasswordErrors => {
        'empty': 'Senha atual é obrigatória',
      };
  @override
  Map<String, String> get newPasswordErrors => {
        'weak':
            'A nova senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número',
      };
  @override
  Map<String, String> get confirmPasswordErrors => {
        'invalid': 'As senhas não coincidem',
      };
  @override
  Map<String, String> get errors => {
        'other': _root.common.genericError,
      };
}

// Path: common
class _TranslationsCommonPt extends _TranslationsCommonEn {
  _TranslationsCommonPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get appName => 'Flutter Bloc Starter';
  @override
  String get send => 'Enviar';
  @override
  String get save => 'Salvar';
  @override
  String get retry => 'Tentar novamente';
  @override
  String get email => 'Email';
  @override
  String get username => 'Usuário';
  @override
  String get password => 'Senha';
  @override
  String get firstName => 'Nome';
  @override
  String get lastName => 'Sobrenome';
  @override
  String get genericError => 'Algo deu errado';
}

// Path: editProfile
class _TranslationsEditProfilePt extends _TranslationsEditProfileEn {
  _TranslationsEditProfilePt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Editar Perfil';
  @override
  String get messageSuccess => 'Perfil editado com sucesso!';
  @override
  Map<String, String> get firstNameErrors => {
        'empty': 'Nome é obrigatório',
      };
  @override
  Map<String, String> get lastNameErrors => {
        'empty': 'Sobrenome é obrigatório',
      };
  @override
  Map<String, String> get emailErrors => {
        'invalid': 'Email inválido',
      };
  @override
  Map<String, String> get errors => {
        'other': _root.common.genericError,
      };
}

// Path: forgotPassword
class _TranslationsForgotPasswordPt extends _TranslationsForgotPasswordEn {
  _TranslationsForgotPasswordPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recuperar Senha';
  @override
  String get description =>
      'Digite seu email e enviaremos um link para você redefinir a sua senha.';
  @override
  String get messageSuccess =>
      'Enviamos um email com um link para você redefinir a sua senha.';
  @override
  Map<String, String> get emailErrors => {
        'invalid': 'Email inválido',
      };
  @override
  Map<String, String> get errors => {
        'other': _root.common.genericError,
      };
}

// Path: login
class _TranslationsLoginPt extends _TranslationsLoginEn {
  _TranslationsLoginPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Entrar';
  @override
  String get buttonLogin => 'Entrar';
  @override
  String get buttonForgotPassword => 'Esqueceu a senha?';
  @override
  String buttonSignInWith({required Object provider}) =>
      'Continue com ${provider}';
  @override
  TextSpan buttonNewAccount({required InlineSpanBuilder signUp}) =>
      TextSpan(children: [
        const TextSpan(text: 'Não tem uma conta? '),
        signUp('Cadastre-se'),
      ]);
  @override
  String get dividerOr => 'OU';
  @override
  Map<String, String> get usernameErrors => {
        'empty': 'O nome de usuário é obrigatório',
      };
  @override
  Map<String, String> get passwordErrors => {
        'empty': 'A senha é obrigatória',
      };
  @override
  Map<String, String> get errors => {
        'other': _root.common.genericError,
      };
}

// Path: notFound
class _TranslationsNotFoundPt extends _TranslationsNotFoundEn {
  _TranslationsNotFoundPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => '404';
  @override
  String get description => 'Página não encontrada';
  @override
  String get buttonBack => 'Voltar para página inicial';
}

// Path: onboarding
class _TranslationsOnboardingPt extends _TranslationsOnboardingEn {
  _TranslationsOnboardingPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  List<OnboardingPageData> get pages => [
        _TranslationsOnboarding$pages$0i0$Pt._(_root),
        _TranslationsOnboarding$pages$0i1$Pt._(_root),
        _TranslationsOnboarding$pages$0i2$Pt._(_root),
      ];
  @override
  String get doneButton => 'Começar';
}

// Path: post
class _TranslationsPostPt extends _TranslationsPostEn {
  _TranslationsPostPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Feed';
  @override
  String get textFailure => 'Falha ao carregar o feed.';
}

// Path: privacyPolicy
class _TranslationsPrivacyPolicyPt extends _TranslationsPrivacyPolicyEn {
  _TranslationsPrivacyPolicyPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Politíca de Privacidade';
}

// Path: profile
class _TranslationsProfilePt extends _TranslationsProfileEn {
  _TranslationsProfilePt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Perfil';
  @override
  String get buttonEditProfile => 'Editar Perfil';
  @override
  String get buttonChangePassword => 'Alterar Senha';
  @override
  String get buttonSettings => 'Configurações';
  @override
  String get buttonPrivacyPolicy => 'Política de Privacidade';
  @override
  String get buttonTerms => 'Termos';
  @override
  String get buttonLogout => 'Sair';
  @override
  String get buttonChangePicture => 'Alterar Foto';
  @override
  String get buttonPickImageFromCamera => 'Câmera';
  @override
  String get buttonPickImageFromGallery => 'Galeria';
}

// Path: search
class _TranslationsSearchPt extends _TranslationsSearchEn {
  _TranslationsSearchPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pesquisar';
}

// Path: settings
class _TranslationsSettingsPt extends _TranslationsSettingsEn {
  _TranslationsSettingsPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Configurações';
  @override
  String get optionBiometrics => 'Biometria';
}

// Path: signup
class _TranslationsSignupPt extends _TranslationsSignupEn {
  _TranslationsSignupPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Registrar';
  @override
  String get labelConfirmPassword => 'Confirmar Senha';
  @override
  String get buttonSubmit => 'Registrar';
  @override
  Map<String, String> get usernameErrors => {
        'empty': 'Nome de usuário é obrigatório',
      };
  @override
  Map<String, String> get emailErrors => {
        'invalid': 'Email é inválido',
      };
  @override
  Map<String, String> get passwordErrors => {
        'weak':
            'Senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número',
      };
  @override
  Map<String, String> get confirmPasswordErrors => {
        'invalid': 'Senhas não coincidem',
      };
  @override
  Map<String, String> get errors => {
        'other': _root.common.genericError,
      };
}

// Path: terms
class _TranslationsTermsPt extends _TranslationsTermsEn {
  _TranslationsTermsPt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Termos';
}

// Path: onboarding.pages.0
class _TranslationsOnboarding$pages$0i0$Pt
    extends _TranslationsOnboarding$pages$0i0$En with OnboardingPageData {
  _TranslationsOnboarding$pages$0i0$Pt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bem vindo!';
  @override
  String get message => 'Seja muito bem vindo ao QuickStart Flutter';
}

// Path: onboarding.pages.1
class _TranslationsOnboarding$pages$0i1$Pt
    extends _TranslationsOnboarding$pages$0i1$En with OnboardingPageData {
  _TranslationsOnboarding$pages$0i1$Pt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'O que é o QuickStart Flutter?';
  @override
  String get message =>
      'O QuickStart Flutter é um projeto para agilizar o bootstrapping de novos projetos Flutter. Ele já vem com uma série de funcionalidades prontas para uso, como internacionalização, temas, rotas, gerenciamento de estado, entre outros.';
}

// Path: onboarding.pages.2
class _TranslationsOnboarding$pages$0i2$Pt
    extends _TranslationsOnboarding$pages$0i2$En with OnboardingPageData {
  _TranslationsOnboarding$pages$0i2$Pt._(_TranslationsPt root)
      : this._root = root,
        super._(root);

  @override
  final _TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vamos começar?';
  @override
  String get message =>
      'Pronto para explorar tudo o que o QuickStart Flutter tem a oferecer? Vamos começar!';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'changePassword.title':
        return 'Change Password';
      case 'changePassword.labelCurrentPassword':
        return 'Current Password';
      case 'changePassword.labelNewPassword':
        return 'New Password';
      case 'changePassword.labelConfirmPassword':
        return 'Confirm Password';
      case 'changePassword.messageSuccess':
        return 'Password changed successfully';
      case 'changePassword.currentPasswordErrors.empty':
        return 'Current password is required';
      case 'changePassword.newPasswordErrors.weak':
        return 'New password must be at least 8 characters long and contain at least one letter and one number';
      case 'changePassword.confirmPasswordErrors.invalid':
        return 'Passwords do not match';
      case 'changePassword.errors.other':
        return _root.common.genericError;
      case 'common.appName':
        return 'Flutter Bloc Starter';
      case 'common.send':
        return 'Send';
      case 'common.save':
        return 'Save';
      case 'common.retry':
        return 'Retry';
      case 'common.username':
        return 'Username';
      case 'common.email':
        return 'Email';
      case 'common.password':
        return 'Password';
      case 'common.firstName':
        return 'First Name';
      case 'common.lastName':
        return 'Last Name';
      case 'common.genericError':
        return 'Something went wrong';
      case 'editProfile.title':
        return 'Edit Profile';
      case 'editProfile.messageSuccess':
        return 'Profile updated successfully';
      case 'editProfile.firstNameErrors.empty':
        return 'First name is required';
      case 'editProfile.lastNameErrors.empty':
        return 'Last name is required';
      case 'editProfile.emailErrors.invalid':
        return 'Email is invalid';
      case 'editProfile.errors.other':
        return _root.common.genericError;
      case 'forgotPassword.title':
        return 'Recover Password';
      case 'forgotPassword.description':
        return 'Enter your email address and we\'ll send you a link to reset your password.';
      case 'forgotPassword.messageSuccess':
        return 'We\'ve sent you an email with a link to reset your password.';
      case 'forgotPassword.emailErrors.invalid':
        return 'Invalid email';
      case 'forgotPassword.errors.other':
        return _root.common.genericError;
      case 'login.title':
        return 'Login';
      case 'login.buttonLogin':
        return 'Login';
      case 'login.buttonForgotPassword':
        return 'Forgot password?';
      case 'login.buttonSignInWith':
        return ({required Object provider}) => 'Sign in with ${provider}';
      case 'login.buttonNewAccount':
        return ({required InlineSpanBuilder signUp}) => TextSpan(children: [
              const TextSpan(text: 'Don\'t have an account? '),
              signUp('Sign up'),
            ]);
      case 'login.dividerOr':
        return 'OR';
      case 'login.usernameErrors.empty':
        return 'Username is required';
      case 'login.passwordErrors.empty':
        return 'Password is required';
      case 'login.errors.other':
        return _root.common.genericError;
      case 'notFound.title':
        return '404';
      case 'notFound.description':
        return 'Page not found';
      case 'notFound.buttonBack':
        return 'Go back home';
      case 'onboarding.pages.0.title':
        return 'Welcome!';
      case 'onboarding.pages.0.message':
        return 'Welcome to QuickStart Flutter';
      case 'onboarding.pages.1.title':
        return 'What is QuickStart Flutter?';
      case 'onboarding.pages.1.message':
        return 'QuickStart Flutter is a project to speed up the bootstrapping of new Flutter projects. It already comes with a series of features ready to use, such as internationalization, themes, routes, state management, among others.';
      case 'onboarding.pages.2.title':
        return 'Let\'s get started?';
      case 'onboarding.pages.2.message':
        return 'Ready to explore everything QuickStart Flutter has to offer? Let\'s get started!';
      case 'onboarding.doneButton':
        return 'Get started';
      case 'post.title':
        return 'Feed';
      case 'post.textFailure':
        return 'Failed to load feed.';
      case 'privacyPolicy.title':
        return 'Privacy Policy';
      case 'profile.title':
        return 'Profile';
      case 'profile.buttonEditProfile':
        return 'Edit Profile';
      case 'profile.buttonChangePassword':
        return 'Change Password';
      case 'profile.buttonSettings':
        return 'Settings';
      case 'profile.buttonPrivacyPolicy':
        return 'Privacy Policy';
      case 'profile.buttonTerms':
        return 'Terms';
      case 'profile.buttonLogout':
        return 'Logout';
      case 'profile.buttonChangePicture':
        return 'Change Picture';
      case 'profile.buttonPickImageFromCamera':
        return 'Camera';
      case 'profile.buttonPickImageFromGallery':
        return 'Gallery';
      case 'search.title':
        return 'Search';
      case 'settings.title':
        return 'Settings';
      case 'settings.optionBiometrics':
        return 'Biometrics';
      case 'signup.title':
        return 'Sign Up';
      case 'signup.labelConfirmPassword':
        return 'Confirm Password';
      case 'signup.buttonSubmit':
        return 'Sign Up';
      case 'signup.usernameErrors.empty':
        return 'Username is required';
      case 'signup.emailErrors.invalid':
        return 'Email is invalid';
      case 'signup.passwordErrors.weak':
        return 'Password must be at least 8 characters long and contain at least one letter and one number';
      case 'signup.confirmPasswordErrors.invalid':
        return 'Passwords do not match';
      case 'signup.errors.other':
        return _root.common.genericError;
      case 'terms.title':
        return 'Terms';
      default:
        return null;
    }
  }
}

extension on _TranslationsPt {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'changePassword.title':
        return 'Alterar Senha';
      case 'changePassword.labelCurrentPassword':
        return 'Senha Atual';
      case 'changePassword.labelNewPassword':
        return 'Nova Senha';
      case 'changePassword.labelConfirmPassword':
        return 'Confirmar Senha';
      case 'changePassword.messageSuccess':
        return 'Senha alterada com sucesso!';
      case 'changePassword.currentPasswordErrors.empty':
        return 'Senha atual é obrigatória';
      case 'changePassword.newPasswordErrors.weak':
        return 'A nova senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número';
      case 'changePassword.confirmPasswordErrors.invalid':
        return 'As senhas não coincidem';
      case 'changePassword.errors.other':
        return _root.common.genericError;
      case 'common.appName':
        return 'Flutter Bloc Starter';
      case 'common.send':
        return 'Enviar';
      case 'common.save':
        return 'Salvar';
      case 'common.retry':
        return 'Tentar novamente';
      case 'common.email':
        return 'Email';
      case 'common.username':
        return 'Usuário';
      case 'common.password':
        return 'Senha';
      case 'common.firstName':
        return 'Nome';
      case 'common.lastName':
        return 'Sobrenome';
      case 'common.genericError':
        return 'Algo deu errado';
      case 'editProfile.title':
        return 'Editar Perfil';
      case 'editProfile.messageSuccess':
        return 'Perfil editado com sucesso!';
      case 'editProfile.firstNameErrors.empty':
        return 'Nome é obrigatório';
      case 'editProfile.lastNameErrors.empty':
        return 'Sobrenome é obrigatório';
      case 'editProfile.emailErrors.invalid':
        return 'Email inválido';
      case 'editProfile.errors.other':
        return _root.common.genericError;
      case 'forgotPassword.title':
        return 'Recuperar Senha';
      case 'forgotPassword.description':
        return 'Digite seu email e enviaremos um link para você redefinir a sua senha.';
      case 'forgotPassword.messageSuccess':
        return 'Enviamos um email com um link para você redefinir a sua senha.';
      case 'forgotPassword.emailErrors.invalid':
        return 'Email inválido';
      case 'forgotPassword.errors.other':
        return _root.common.genericError;
      case 'login.title':
        return 'Entrar';
      case 'login.buttonLogin':
        return 'Entrar';
      case 'login.buttonForgotPassword':
        return 'Esqueceu a senha?';
      case 'login.buttonSignInWith':
        return ({required Object provider}) => 'Continue com ${provider}';
      case 'login.buttonNewAccount':
        return ({required InlineSpanBuilder signUp}) => TextSpan(children: [
              const TextSpan(text: 'Não tem uma conta? '),
              signUp('Cadastre-se'),
            ]);
      case 'login.dividerOr':
        return 'OU';
      case 'login.usernameErrors.empty':
        return 'O nome de usuário é obrigatório';
      case 'login.passwordErrors.empty':
        return 'A senha é obrigatória';
      case 'login.errors.other':
        return _root.common.genericError;
      case 'notFound.title':
        return '404';
      case 'notFound.description':
        return 'Página não encontrada';
      case 'notFound.buttonBack':
        return 'Voltar para página inicial';
      case 'onboarding.pages.0.title':
        return 'Bem vindo!';
      case 'onboarding.pages.0.message':
        return 'Seja muito bem vindo ao QuickStart Flutter';
      case 'onboarding.pages.1.title':
        return 'O que é o QuickStart Flutter?';
      case 'onboarding.pages.1.message':
        return 'O QuickStart Flutter é um projeto para agilizar o bootstrapping de novos projetos Flutter. Ele já vem com uma série de funcionalidades prontas para uso, como internacionalização, temas, rotas, gerenciamento de estado, entre outros.';
      case 'onboarding.pages.2.title':
        return 'Vamos começar?';
      case 'onboarding.pages.2.message':
        return 'Pronto para explorar tudo o que o QuickStart Flutter tem a oferecer? Vamos começar!';
      case 'onboarding.doneButton':
        return 'Começar';
      case 'post.title':
        return 'Feed';
      case 'post.textFailure':
        return 'Falha ao carregar o feed.';
      case 'privacyPolicy.title':
        return 'Politíca de Privacidade';
      case 'profile.title':
        return 'Perfil';
      case 'profile.buttonEditProfile':
        return 'Editar Perfil';
      case 'profile.buttonChangePassword':
        return 'Alterar Senha';
      case 'profile.buttonSettings':
        return 'Configurações';
      case 'profile.buttonPrivacyPolicy':
        return 'Política de Privacidade';
      case 'profile.buttonTerms':
        return 'Termos';
      case 'profile.buttonLogout':
        return 'Sair';
      case 'profile.buttonChangePicture':
        return 'Alterar Foto';
      case 'profile.buttonPickImageFromCamera':
        return 'Câmera';
      case 'profile.buttonPickImageFromGallery':
        return 'Galeria';
      case 'search.title':
        return 'Pesquisar';
      case 'settings.title':
        return 'Configurações';
      case 'settings.optionBiometrics':
        return 'Biometria';
      case 'signup.title':
        return 'Registrar';
      case 'signup.labelConfirmPassword':
        return 'Confirmar Senha';
      case 'signup.buttonSubmit':
        return 'Registrar';
      case 'signup.usernameErrors.empty':
        return 'Nome de usuário é obrigatório';
      case 'signup.emailErrors.invalid':
        return 'Email é inválido';
      case 'signup.passwordErrors.weak':
        return 'Senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número';
      case 'signup.confirmPasswordErrors.invalid':
        return 'Senhas não coincidem';
      case 'signup.errors.other':
        return _root.common.genericError;
      case 'terms.title':
        return 'Termos';
      default:
        return null;
    }
  }
}
