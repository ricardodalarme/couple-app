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
class TranslationsPt extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsPt({
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
             locale: AppLocale.pt,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <pt>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsPt _root = this; // ignore: unused_field

  @override
  TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsPt(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _TranslationsAccountPt account = _TranslationsAccountPt._(_root);
  @override
  late final _TranslationsAuthenticationPt authentication = _TranslationsAuthenticationPt._(_root);
  @override
  late final _TranslationsCommonPt common = _TranslationsCommonPt._(_root);
  @override
  late final _TranslationsNotFoundPt notFound = _TranslationsNotFoundPt._(_root);
  @override
  late final _TranslationsOnboardingPt onboarding = _TranslationsOnboardingPt._(_root);
  @override
  late final _TranslationsPostPt post = _TranslationsPostPt._(_root);
  @override
  late final _TranslationsPrivacyPolicyPt privacyPolicy = _TranslationsPrivacyPolicyPt._(_root);
  @override
  late final _TranslationsSearchPt search = _TranslationsSearchPt._(_root);
  @override
  late final _TranslationsSettingsPt settings = _TranslationsSettingsPt._(_root);
  @override
  late final _TranslationsTermsPt terms = _TranslationsTermsPt._(_root);
}

// Path: account
class _TranslationsAccountPt extends TranslationsAccountEn {
  _TranslationsAccountPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsAccountProfilePt profile = _TranslationsAccountProfilePt._(_root);
  @override
  late final _TranslationsAccountEditProfilePt editProfile = _TranslationsAccountEditProfilePt._(
    _root,
  );
  @override
  late final _TranslationsAccountChangePasswordPt changePassword =
      _TranslationsAccountChangePasswordPt._(_root);
}

// Path: authentication
class _TranslationsAuthenticationPt extends TranslationsAuthenticationEn {
  _TranslationsAuthenticationPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsAuthenticationLoginPt login = _TranslationsAuthenticationLoginPt._(_root);
  @override
  late final _TranslationsAuthenticationSignupPt signup = _TranslationsAuthenticationSignupPt._(
    _root,
  );
  @override
  late final _TranslationsAuthenticationForgotPasswordPt forgotPassword =
      _TranslationsAuthenticationForgotPasswordPt._(_root);
}

// Path: common
class _TranslationsCommonPt extends TranslationsCommonEn {
  _TranslationsCommonPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

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

// Path: notFound
class _TranslationsNotFoundPt extends TranslationsNotFoundEn {
  _TranslationsNotFoundPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => '404';
  @override
  String get description => 'Página não encontrada';
  @override
  String get buttonBack => 'Voltar para página inicial';
}

// Path: onboarding
class _TranslationsOnboardingPt extends TranslationsOnboardingEn {
  _TranslationsOnboardingPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsPostPt extends TranslationsPostEn {
  _TranslationsPostPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsPostListPt list = _TranslationsPostListPt._(_root);
}

// Path: privacyPolicy
class _TranslationsPrivacyPolicyPt extends TranslationsPrivacyPolicyEn {
  _TranslationsPrivacyPolicyPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Politíca de Privacidade';
}

// Path: search
class _TranslationsSearchPt extends TranslationsSearchEn {
  _TranslationsSearchPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pesquisar';
}

// Path: settings
class _TranslationsSettingsPt extends TranslationsSettingsEn {
  _TranslationsSettingsPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Configurações';
  @override
  String get optionBiometrics => 'Biometria';
}

// Path: terms
class _TranslationsTermsPt extends TranslationsTermsEn {
  _TranslationsTermsPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsTermsListPt list = _TranslationsTermsListPt._(_root);
}

// Path: account.profile
class _TranslationsAccountProfilePt extends TranslationsAccountProfileEn {
  _TranslationsAccountProfilePt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

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

// Path: account.editProfile
class _TranslationsAccountEditProfilePt extends TranslationsAccountEditProfileEn {
  _TranslationsAccountEditProfilePt._(TranslationsPt root)
    : this._root = root,
      super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Editar Perfil';
  @override
  String get messageSuccess => 'Perfil editado com sucesso!';
  @override
  Map<String, String> get firstNameErrors => {'empty': 'Nome é obrigatório'};
  @override
  Map<String, String> get lastNameErrors => {'empty': 'Sobrenome é obrigatório'};
  @override
  Map<String, String> get emailErrors => {'invalid': 'Email inválido'};
  @override
  Map<String, String> get errors => {'other': _root.common.genericError};
}

// Path: account.changePassword
class _TranslationsAccountChangePasswordPt extends TranslationsAccountChangePasswordEn {
  _TranslationsAccountChangePasswordPt._(TranslationsPt root)
    : this._root = root,
      super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

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
  Map<String, String> get currentPasswordErrors => {'empty': 'Senha atual é obrigatória'};
  @override
  Map<String, String> get newPasswordErrors => {
    'weak':
        'A nova senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número',
  };
  @override
  Map<String, String> get confirmPasswordErrors => {'invalid': 'As senhas não coincidem'};
  @override
  Map<String, String> get errors => {'other': _root.common.genericError};
}

// Path: authentication.login
class _TranslationsAuthenticationLoginPt extends TranslationsAuthenticationLoginEn {
  _TranslationsAuthenticationLoginPt._(TranslationsPt root)
    : this._root = root,
      super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Entrar';
  @override
  String get buttonLogin => 'Entrar';
  @override
  String get buttonForgotPassword => 'Esqueceu a senha?';
  @override
  String buttonSignInWith({required Object provider}) => 'Continue com ${provider}';
  @override
  TextSpan buttonNewAccount({required InlineSpanBuilder signUp}) => TextSpan(
    children: [
      const TextSpan(text: 'Não tem uma conta? '),
      signUp('Cadastre-se'),
    ],
  );
  @override
  String get buttonDevMenu => 'Abrir DevMenu';
  @override
  String get dividerOr => 'OU';
  @override
  Map<String, String> get usernameErrors => {'empty': 'O nome de usuário é obrigatório'};
  @override
  Map<String, String> get passwordErrors => {'empty': 'A senha é obrigatória'};
  @override
  Map<String, String> get errors => {
    'BAD_USER_INPUT': 'Usuário ou senha inválidos',
    'other': _root.common.genericError,
  };
}

// Path: authentication.signup
class _TranslationsAuthenticationSignupPt extends TranslationsAuthenticationSignupEn {
  _TranslationsAuthenticationSignupPt._(TranslationsPt root)
    : this._root = root,
      super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Registrar';
  @override
  String get labelConfirmPassword => 'Confirmar Senha';
  @override
  String get buttonSubmit => 'Registrar';
  @override
  Map<String, String> get usernameErrors => {'empty': 'Nome de usuário é obrigatório'};
  @override
  Map<String, String> get emailErrors => {'invalid': 'Email é inválido'};
  @override
  Map<String, String> get passwordErrors => {
    'weak': 'Senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número',
  };
  @override
  Map<String, String> get confirmPasswordErrors => {'invalid': 'Senhas não coincidem'};
  @override
  Map<String, String> get errors => {'other': _root.common.genericError};
}

// Path: authentication.forgotPassword
class _TranslationsAuthenticationForgotPasswordPt
    extends TranslationsAuthenticationForgotPasswordEn {
  _TranslationsAuthenticationForgotPasswordPt._(TranslationsPt root)
    : this._root = root,
      super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recuperar Senha';
  @override
  String get description =>
      'Digite seu email e enviaremos um link para você redefinir a sua senha.';
  @override
  String get messageSuccess => 'Enviamos um email com um link para você redefinir a sua senha.';
  @override
  Map<String, String> get emailErrors => {'invalid': 'Email inválido'};
  @override
  Map<String, String> get errors => {'other': _root.common.genericError};
}

// Path: onboarding.pages.0
class _TranslationsOnboarding$pages$0i0$Pt extends TranslationsOnboarding$pages$0i0$En
    with OnboardingPageData {
  _TranslationsOnboarding$pages$0i0$Pt._(TranslationsPt root)
    : this._root = root,
      super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Bem vindo!';
  @override
  String get message => 'Seja muito bem vindo ao QuickStart Flutter';
}

// Path: onboarding.pages.1
class _TranslationsOnboarding$pages$0i1$Pt extends TranslationsOnboarding$pages$0i1$En
    with OnboardingPageData {
  _TranslationsOnboarding$pages$0i1$Pt._(TranslationsPt root)
    : this._root = root,
      super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'O que é o QuickStart Flutter?';
  @override
  String get message =>
      'O QuickStart Flutter é um projeto para agilizar o bootstrapping de novos projetos Flutter. Ele já vem com uma série de funcionalidades prontas para uso, como internacionalização, temas, rotas, gerenciamento de estado, entre outros.';
}

// Path: onboarding.pages.2
class _TranslationsOnboarding$pages$0i2$Pt extends TranslationsOnboarding$pages$0i2$En
    with OnboardingPageData {
  _TranslationsOnboarding$pages$0i2$Pt._(TranslationsPt root)
    : this._root = root,
      super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Vamos começar?';
  @override
  String get message =>
      'Pronto para explorar tudo o que o QuickStart Flutter tem a oferecer? Vamos começar!';
}

// Path: post.list
class _TranslationsPostListPt extends TranslationsPostListEn {
  _TranslationsPostListPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Feed';
  @override
  String get textFailure => 'Falha ao carregar o feed.';
}

// Path: terms.list
class _TranslationsTermsListPt extends TranslationsTermsListEn {
  _TranslationsTermsListPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Termos';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'account.profile.title' => 'Perfil',
      'account.profile.buttonEditProfile' => 'Editar Perfil',
      'account.profile.buttonChangePassword' => 'Alterar Senha',
      'account.profile.buttonSettings' => 'Configurações',
      'account.profile.buttonPrivacyPolicy' => 'Política de Privacidade',
      'account.profile.buttonTerms' => 'Termos',
      'account.profile.buttonLogout' => 'Sair',
      'account.profile.buttonChangePicture' => 'Alterar Foto',
      'account.profile.buttonPickImageFromCamera' => 'Câmera',
      'account.profile.buttonPickImageFromGallery' => 'Galeria',
      'account.editProfile.title' => 'Editar Perfil',
      'account.editProfile.messageSuccess' => 'Perfil editado com sucesso!',
      'account.editProfile.firstNameErrors.empty' => 'Nome é obrigatório',
      'account.editProfile.lastNameErrors.empty' => 'Sobrenome é obrigatório',
      'account.editProfile.emailErrors.invalid' => 'Email inválido',
      'account.editProfile.errors.other' => _root.common.genericError,
      'account.changePassword.title' => 'Alterar Senha',
      'account.changePassword.labelCurrentPassword' => 'Senha Atual',
      'account.changePassword.labelNewPassword' => 'Nova Senha',
      'account.changePassword.labelConfirmPassword' => 'Confirmar Senha',
      'account.changePassword.messageSuccess' => 'Senha alterada com sucesso!',
      'account.changePassword.currentPasswordErrors.empty' => 'Senha atual é obrigatória',
      'account.changePassword.newPasswordErrors.weak' =>
        'A nova senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número',
      'account.changePassword.confirmPasswordErrors.invalid' => 'As senhas não coincidem',
      'account.changePassword.errors.other' => _root.common.genericError,
      'authentication.login.title' => 'Entrar',
      'authentication.login.buttonLogin' => 'Entrar',
      'authentication.login.buttonForgotPassword' => 'Esqueceu a senha?',
      'authentication.login.buttonSignInWith' =>
        ({required Object provider}) => 'Continue com ${provider}',
      'authentication.login.buttonNewAccount' => ({required InlineSpanBuilder signUp}) => TextSpan(
        children: [
          const TextSpan(text: 'Não tem uma conta? '),
          signUp('Cadastre-se'),
        ],
      ),
      'authentication.login.buttonDevMenu' => 'Abrir DevMenu',
      'authentication.login.dividerOr' => 'OU',
      'authentication.login.usernameErrors.empty' => 'O nome de usuário é obrigatório',
      'authentication.login.passwordErrors.empty' => 'A senha é obrigatória',
      'authentication.login.errors.BAD_USER_INPUT' => 'Usuário ou senha inválidos',
      'authentication.login.errors.other' => _root.common.genericError,
      'authentication.signup.title' => 'Registrar',
      'authentication.signup.labelConfirmPassword' => 'Confirmar Senha',
      'authentication.signup.buttonSubmit' => 'Registrar',
      'authentication.signup.usernameErrors.empty' => 'Nome de usuário é obrigatório',
      'authentication.signup.emailErrors.invalid' => 'Email é inválido',
      'authentication.signup.passwordErrors.weak' =>
        'Senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número',
      'authentication.signup.confirmPasswordErrors.invalid' => 'Senhas não coincidem',
      'authentication.signup.errors.other' => _root.common.genericError,
      'authentication.forgotPassword.title' => 'Recuperar Senha',
      'authentication.forgotPassword.description' =>
        'Digite seu email e enviaremos um link para você redefinir a sua senha.',
      'authentication.forgotPassword.messageSuccess' =>
        'Enviamos um email com um link para você redefinir a sua senha.',
      'authentication.forgotPassword.emailErrors.invalid' => 'Email inválido',
      'authentication.forgotPassword.errors.other' => _root.common.genericError,
      'common.appName' => 'Flutter Bloc Starter',
      'common.send' => 'Enviar',
      'common.save' => 'Salvar',
      'common.retry' => 'Tentar novamente',
      'common.email' => 'Email',
      'common.username' => 'Usuário',
      'common.password' => 'Senha',
      'common.firstName' => 'Nome',
      'common.lastName' => 'Sobrenome',
      'common.genericError' => 'Algo deu errado',
      'notFound.title' => '404',
      'notFound.description' => 'Página não encontrada',
      'notFound.buttonBack' => 'Voltar para página inicial',
      'onboarding.pages.0.title' => 'Bem vindo!',
      'onboarding.pages.0.message' => 'Seja muito bem vindo ao QuickStart Flutter',
      'onboarding.pages.1.title' => 'O que é o QuickStart Flutter?',
      'onboarding.pages.1.message' =>
        'O QuickStart Flutter é um projeto para agilizar o bootstrapping de novos projetos Flutter. Ele já vem com uma série de funcionalidades prontas para uso, como internacionalização, temas, rotas, gerenciamento de estado, entre outros.',
      'onboarding.pages.2.title' => 'Vamos começar?',
      'onboarding.pages.2.message' =>
        'Pronto para explorar tudo o que o QuickStart Flutter tem a oferecer? Vamos começar!',
      'onboarding.doneButton' => 'Começar',
      'post.list.title' => 'Feed',
      'post.list.textFailure' => 'Falha ao carregar o feed.',
      'privacyPolicy.title' => 'Politíca de Privacidade',
      'search.title' => 'Pesquisar',
      'settings.title' => 'Configurações',
      'settings.optionBiometrics' => 'Biometria',
      'terms.list.title' => 'Termos',
      _ => null,
    };
  }
}
