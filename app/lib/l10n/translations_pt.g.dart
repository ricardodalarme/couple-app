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
  late final _TranslationsAuthenticationPt authentication = _TranslationsAuthenticationPt._(_root);
  @override
  late final _TranslationsChangePasswordPt changePassword = _TranslationsChangePasswordPt._(_root);
  @override
  late final _TranslationsCommonPt common = _TranslationsCommonPt._(_root);
  @override
  late final _TranslationsEditProfilePt editProfile = _TranslationsEditProfilePt._(_root);
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
  late final _TranslationsTermsPt terms = _TranslationsTermsPt._(_root);
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

// Path: terms
class _TranslationsTermsPt extends TranslationsTermsEn {
  _TranslationsTermsPt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Termos';
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

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
/// Note: We use a HashMap because Dart seems to be unable to compile large switch statements.
Map<String, dynamic>? _map;

extension on TranslationsPt {
  dynamic _flatMapFunction(String path) {
    final map = _map ?? _initFlatMap();
    return map[path];
  }

  /// Initializes the flat map and returns it.
  Map<String, dynamic> _initFlatMap() {
    final map = <String, dynamic>{};
    map['authentication.login.title'] = 'Entrar';
    map['authentication.login.buttonLogin'] = 'Entrar';
    map['authentication.login.buttonForgotPassword'] = 'Esqueceu a senha?';
    map['authentication.login.buttonSignInWith'] = ({required Object provider}) =>
        'Continue com ${provider}';
    map['authentication.login.buttonNewAccount'] = ({required InlineSpanBuilder signUp}) =>
        TextSpan(
          children: [
            const TextSpan(text: 'Não tem uma conta? '),
            signUp('Cadastre-se'),
          ],
        );
    map['authentication.login.dividerOr'] = 'OU';
    map['authentication.login.usernameErrors.empty'] = 'O nome de usuário é obrigatório';
    map['authentication.login.passwordErrors.empty'] = 'A senha é obrigatória';
    map['authentication.login.errors.BAD_USER_INPUT'] = 'Usuário ou senha inválidos';
    map['authentication.login.errors.other'] = _root.common.genericError;
    map['authentication.signup.title'] = 'Registrar';
    map['authentication.signup.labelConfirmPassword'] = 'Confirmar Senha';
    map['authentication.signup.buttonSubmit'] = 'Registrar';
    map['authentication.signup.usernameErrors.empty'] = 'Nome de usuário é obrigatório';
    map['authentication.signup.emailErrors.invalid'] = 'Email é inválido';
    map['authentication.signup.passwordErrors.weak'] =
        'Senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número';
    map['authentication.signup.confirmPasswordErrors.invalid'] = 'Senhas não coincidem';
    map['authentication.signup.errors.other'] = _root.common.genericError;
    map['authentication.forgotPassword.title'] = 'Recuperar Senha';
    map['authentication.forgotPassword.description'] =
        'Digite seu email e enviaremos um link para você redefinir a sua senha.';
    map['authentication.forgotPassword.messageSuccess'] =
        'Enviamos um email com um link para você redefinir a sua senha.';
    map['authentication.forgotPassword.emailErrors.invalid'] = 'Email inválido';
    map['authentication.forgotPassword.errors.other'] = _root.common.genericError;
    map['changePassword.title'] = 'Alterar Senha';
    map['changePassword.labelCurrentPassword'] = 'Senha Atual';
    map['changePassword.labelNewPassword'] = 'Nova Senha';
    map['changePassword.labelConfirmPassword'] = 'Confirmar Senha';
    map['changePassword.messageSuccess'] = 'Senha alterada com sucesso!';
    map['changePassword.currentPasswordErrors.empty'] = 'Senha atual é obrigatória';
    map['changePassword.newPasswordErrors.weak'] =
        'A nova senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número';
    map['changePassword.confirmPasswordErrors.invalid'] = 'As senhas não coincidem';
    map['changePassword.errors.other'] = _root.common.genericError;
    map['common.appName'] = 'Flutter Bloc Starter';
    map['common.send'] = 'Enviar';
    map['common.save'] = 'Salvar';
    map['common.retry'] = 'Tentar novamente';
    map['common.email'] = 'Email';
    map['common.username'] = 'Usuário';
    map['common.password'] = 'Senha';
    map['common.firstName'] = 'Nome';
    map['common.lastName'] = 'Sobrenome';
    map['common.genericError'] = 'Algo deu errado';
    map['editProfile.title'] = 'Editar Perfil';
    map['editProfile.messageSuccess'] = 'Perfil editado com sucesso!';
    map['editProfile.firstNameErrors.empty'] = 'Nome é obrigatório';
    map['editProfile.lastNameErrors.empty'] = 'Sobrenome é obrigatório';
    map['editProfile.emailErrors.invalid'] = 'Email inválido';
    map['editProfile.errors.other'] = _root.common.genericError;
    map['notFound.title'] = '404';
    map['notFound.description'] = 'Página não encontrada';
    map['notFound.buttonBack'] = 'Voltar para página inicial';
    map['onboarding.pages.0.title'] = 'Bem vindo!';
    map['onboarding.pages.0.message'] = 'Seja muito bem vindo ao QuickStart Flutter';
    map['onboarding.pages.1.title'] = 'O que é o QuickStart Flutter?';
    map['onboarding.pages.1.message'] =
        'O QuickStart Flutter é um projeto para agilizar o bootstrapping de novos projetos Flutter. Ele já vem com uma série de funcionalidades prontas para uso, como internacionalização, temas, rotas, gerenciamento de estado, entre outros.';
    map['onboarding.pages.2.title'] = 'Vamos começar?';
    map['onboarding.pages.2.message'] =
        'Pronto para explorar tudo o que o QuickStart Flutter tem a oferecer? Vamos começar!';
    map['onboarding.doneButton'] = 'Começar';
    map['post.title'] = 'Feed';
    map['post.textFailure'] = 'Falha ao carregar o feed.';
    map['privacyPolicy.title'] = 'Politíca de Privacidade';
    map['profile.title'] = 'Perfil';
    map['profile.buttonEditProfile'] = 'Editar Perfil';
    map['profile.buttonChangePassword'] = 'Alterar Senha';
    map['profile.buttonSettings'] = 'Configurações';
    map['profile.buttonPrivacyPolicy'] = 'Política de Privacidade';
    map['profile.buttonTerms'] = 'Termos';
    map['profile.buttonLogout'] = 'Sair';
    map['profile.buttonChangePicture'] = 'Alterar Foto';
    map['profile.buttonPickImageFromCamera'] = 'Câmera';
    map['profile.buttonPickImageFromGallery'] = 'Galeria';
    map['search.title'] = 'Pesquisar';
    map['settings.title'] = 'Configurações';
    map['settings.optionBiometrics'] = 'Biometria';
    map['terms.title'] = 'Termos';

    _map = map;
    return map;
  }
}
