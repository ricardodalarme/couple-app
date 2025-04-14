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
class TranslationsPt extends Translations {
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
  late final _TranslationsChangePasswordPt changePassword = _TranslationsChangePasswordPt._(_root);
  @override
  late final _TranslationsCommonPt common = _TranslationsCommonPt._(_root);
  @override
  late final _TranslationsEditProfilePt editProfile = _TranslationsEditProfilePt._(_root);
  @override
  late final _TranslationsForgotPasswordPt forgotPassword = _TranslationsForgotPasswordPt._(_root);
  @override
  late final _TranslationsLoginPt login = _TranslationsLoginPt._(_root);
  @override
  late final _TranslationsNotFoundPt notFound = _TranslationsNotFoundPt._(_root);
  @override
  late final _TranslationsOnboardingPt onboarding = _TranslationsOnboardingPt._(_root);
  @override
  late final _TranslationsPostPt post = _TranslationsPostPt._(_root);
  @override
  late final _TranslationsPrivacyPolicyPt privacyPolicy = _TranslationsPrivacyPolicyPt._(_root);
  @override
  late final _TranslationsProfilePt profile = _TranslationsProfilePt._(_root);
  @override
  late final _TranslationsSearchPt search = _TranslationsSearchPt._(_root);
  @override
  late final _TranslationsSettingsPt settings = _TranslationsSettingsPt._(_root);
  @override
  late final _TranslationsSignupPt signup = _TranslationsSignupPt._(_root);
  @override
  late final _TranslationsTermsPt terms = _TranslationsTermsPt._(_root);
}

// Path: changePassword
class _TranslationsChangePasswordPt extends TranslationsChangePasswordEn {
  _TranslationsChangePasswordPt._(TranslationsPt root) : this._root = root, super.internal(root);

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

// Path: editProfile
class _TranslationsEditProfilePt extends TranslationsEditProfileEn {
  _TranslationsEditProfilePt._(TranslationsPt root) : this._root = root, super.internal(root);

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

// Path: forgotPassword
class _TranslationsForgotPasswordPt extends TranslationsForgotPasswordEn {
  _TranslationsForgotPasswordPt._(TranslationsPt root) : this._root = root, super.internal(root);

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

// Path: login
class _TranslationsLoginPt extends TranslationsLoginEn {
  _TranslationsLoginPt._(TranslationsPt root) : this._root = root, super.internal(root);

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
  TextSpan buttonNewAccount({required InlineSpanBuilder signUp}) =>
      TextSpan(children: [const TextSpan(text: 'Não tem uma conta? '), signUp('Cadastre-se')]);
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
  String get title => 'Feed';
  @override
  String get textFailure => 'Falha ao carregar o feed.';
}

// Path: privacyPolicy
class _TranslationsPrivacyPolicyPt extends TranslationsPrivacyPolicyEn {
  _TranslationsPrivacyPolicyPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Politíca de Privacidade';
}

// Path: profile
class _TranslationsProfilePt extends TranslationsProfileEn {
  _TranslationsProfilePt._(TranslationsPt root) : this._root = root, super.internal(root);

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

// Path: signup
class _TranslationsSignupPt extends TranslationsSignupEn {
  _TranslationsSignupPt._(TranslationsPt root) : this._root = root, super.internal(root);

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

// Path: terms
class _TranslationsTermsPt extends TranslationsTermsEn {
  _TranslationsTermsPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Termos';
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsPt {
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
        return ({required InlineSpanBuilder signUp}) => TextSpan(
          children: [const TextSpan(text: 'Não tem uma conta? '), signUp('Cadastre-se')],
        );
      case 'login.dividerOr':
        return 'OU';
      case 'login.usernameErrors.empty':
        return 'O nome de usuário é obrigatório';
      case 'login.passwordErrors.empty':
        return 'A senha é obrigatória';
      case 'login.errors.BAD_USER_INPUT':
        return 'Usuário ou senha inválidos';
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
