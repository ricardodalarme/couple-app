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
       _meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.pt,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <pt>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsPt _root = this; // ignore: unused_field

  @override
  TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsPt(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _Translations$account$pt account = _Translations$account$pt._(_root);
  @override
  late final _Translations$authentication$pt authentication = _Translations$authentication$pt._(
    _root,
  );
  @override
  late final _Translations$common$pt common = _Translations$common$pt._(_root);
  @override
  late final _Translations$notFound$pt notFound = _Translations$notFound$pt._(_root);
  @override
  late final _Translations$notifications$pt notifications = _Translations$notifications$pt._(_root);
  @override
  late final _Translations$onboarding$pt onboarding = _Translations$onboarding$pt._(_root);
  @override
  late final _Translations$post$pt post = _Translations$post$pt._(_root);
  @override
  late final _Translations$privacyPolicy$pt privacyPolicy = _Translations$privacyPolicy$pt._(_root);
  @override
  late final _Translations$search$pt search = _Translations$search$pt._(_root);
  @override
  late final _Translations$settings$pt settings = _Translations$settings$pt._(_root);
  @override
  late final _Translations$terms$pt terms = _Translations$terms$pt._(_root);
}

// Path: account
class _Translations$account$pt extends Translations$account$en {
  _Translations$account$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$account$profile$pt profile = _Translations$account$profile$pt._(_root);
  @override
  late final _Translations$account$editProfile$pt editProfile =
      _Translations$account$editProfile$pt._(_root);
  @override
  late final _Translations$account$changePassword$pt changePassword =
      _Translations$account$changePassword$pt._(_root);
  @override
  late final _Translations$account$deleteAccount$pt deleteAccount =
      _Translations$account$deleteAccount$pt._(_root);
}

// Path: authentication
class _Translations$authentication$pt extends Translations$authentication$en {
  _Translations$authentication$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$authentication$login$pt login = _Translations$authentication$login$pt._(
    _root,
  );
  @override
  late final _Translations$authentication$signup$pt signup =
      _Translations$authentication$signup$pt._(_root);
  @override
  late final _Translations$authentication$forgotPassword$pt forgotPassword =
      _Translations$authentication$forgotPassword$pt._(_root);
}

// Path: common
class _Translations$common$pt extends Translations$common$en {
  _Translations$common$pt._(TranslationsPt root) : this._root = root, super.internal(root);

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
  String get loading => 'Carregando';
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
class _Translations$notFound$pt extends Translations$notFound$en {
  _Translations$notFound$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => '404';
  @override
  String get description => 'Página não encontrada';
  @override
  String get buttonBack => 'Voltar para página inicial';
}

// Path: notifications
class _Translations$notifications$pt extends Translations$notifications$en {
  _Translations$notifications$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Notificações';
  @override
  String get markAllRead => 'Marcar todas como lidas';
  @override
  String get textFailure => 'Falha ao carregar as notificações.';
  @override
  String get emptyTitle => 'Nenhuma notificação ainda';
  @override
  String get emptyDescription => 'Atualizações e atividades aparecerão aqui.';
  @override
  String get semanticsUnread => 'Não lida';
  @override
  String get badgeTooltip => 'Notificações';
  @override
  Map<String, String> get errors => {
    'serverError': 'Algo deu errado. Tente novamente.',
    'other': _root.common.genericError,
  };
}

// Path: onboarding
class _Translations$onboarding$pt extends Translations$onboarding$en {
  _Translations$onboarding$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  List<OnboardingPageData> get pages => [
    _Translations$onboarding$pages$0$pt._(_root),
    _Translations$onboarding$pages$1$pt._(_root),
    _Translations$onboarding$pages$2$pt._(_root),
  ];
  @override
  String get doneButton => 'Começar';
}

// Path: post
class _Translations$post$pt extends Translations$post$en {
  _Translations$post$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$post$list$pt list = _Translations$post$list$pt._(_root);
}

// Path: privacyPolicy
class _Translations$privacyPolicy$pt extends Translations$privacyPolicy$en {
  _Translations$privacyPolicy$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Politíca de Privacidade';
}

// Path: search
class _Translations$search$pt extends Translations$search$en {
  _Translations$search$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pesquisar';
  @override
  String get fieldSearchHint => 'Pesquisar';
}

// Path: settings
class _Translations$settings$pt extends Translations$settings$en {
  _Translations$settings$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Configurações';
  @override
  String get sectionAccount => 'Conta';
  @override
  String get optionBiometrics => 'Biometria';
}

// Path: terms
class _Translations$terms$pt extends Translations$terms$en {
  _Translations$terms$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$terms$list$pt list = _Translations$terms$list$pt._(_root);
}

// Path: account.profile
class _Translations$account$profile$pt extends Translations$account$profile$en {
  _Translations$account$profile$pt._(TranslationsPt root) : this._root = root, super.internal(root);

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
class _Translations$account$editProfile$pt extends Translations$account$editProfile$en {
  _Translations$account$editProfile$pt._(TranslationsPt root)
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
  Map<String, String> get errors => {
    'invalid_email': 'Email inválido',
    'email_address_invalid': 'Email inválido',
    'email_already_in_use': 'Este email já está em uso',
    'email_exists': 'Este email já está em uso',
    'other': _root.common.genericError,
  };
}

// Path: account.changePassword
class _Translations$account$changePassword$pt extends Translations$account$changePassword$en {
  _Translations$account$changePassword$pt._(TranslationsPt root)
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
  Map<String, String> get errors => {
    'wrong_current_password': 'A senha atual está incorreta',
    'invalid_credentials': 'A senha atual está incorreta',
    'same_password': 'A nova senha deve ser diferente da senha atual',
    'weak_password': 'A nova senha é muito fraca',
    'other': _root.common.genericError,
  };
}

// Path: account.deleteAccount
class _Translations$account$deleteAccount$pt extends Translations$account$deleteAccount$en {
  _Translations$account$deleteAccount$pt._(TranslationsPt root)
    : this._root = root,
      super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Excluir conta';
  @override
  String get warning =>
      'Isso exclui permanentemente sua conta e seus dados. Esta ação não pode ser desfeita.';
  @override
  String get buttonDelete => 'Excluir conta';
  @override
  String get buttonCancel => 'Cancelar';
  @override
  String get messageSuccess => 'Sua conta foi excluída.';
  @override
  Map<String, String> get errors => {
    'account_deletion_failed': 'Não foi possível excluir sua conta. Tente novamente.',
    'deletion_failed': 'Não foi possível excluir sua conta. Tente novamente.',
    'not_authenticated': 'Sua sessão expirou. Entre novamente.',
    'other': _root.common.genericError,
  };
}

// Path: authentication.login
class _Translations$authentication$login$pt extends Translations$authentication$login$en {
  _Translations$authentication$login$pt._(TranslationsPt root)
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
  String get buttonNewAccount => 'Não tem uma conta? Cadastre-se';
  @override
  String get buttonDevMenu => 'Abrir DevMenu';
  @override
  String get dividerOr => 'OU';
  @override
  Map<String, String> get emailErrors => {'invalid': 'Email é inválido'};
  @override
  Map<String, String> get passwordErrors => {'empty': 'A senha é obrigatória'};
  @override
  Map<String, String> get errors => {
    'invalid_credentials': 'Email ou senha inválidos',
    'email_not_confirmed': 'Confirme seu email antes de entrar',
    'user_banned': 'Sua conta está temporariamente indisponível',
    'other': _root.common.genericError,
  };
}

// Path: authentication.signup
class _Translations$authentication$signup$pt extends Translations$authentication$signup$en {
  _Translations$authentication$signup$pt._(TranslationsPt root)
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
  Map<String, String> get emailErrors => {'invalid': 'Email é inválido'};
  @override
  Map<String, String> get passwordErrors => {
    'weak': 'Senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número',
  };
  @override
  Map<String, String> get confirmPasswordErrors => {'invalid': 'Senhas não coincidem'};
  @override
  Map<String, String> get errors => {
    'user_already_registered': 'Este email já está cadastrado',
    'user_already_exists': 'Este email já está cadastrado',
    'weak_password': 'Senha muito fraca',
    'email_address_invalid': 'Email é inválido',
    'other': _root.common.genericError,
  };
}

// Path: authentication.forgotPassword
class _Translations$authentication$forgotPassword$pt
    extends Translations$authentication$forgotPassword$en {
  _Translations$authentication$forgotPassword$pt._(TranslationsPt root)
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
class _Translations$onboarding$pages$0$pt extends Translations$onboarding$pages$0$en
    with OnboardingPageData {
  _Translations$onboarding$pages$0$pt._(TranslationsPt root)
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
class _Translations$onboarding$pages$1$pt extends Translations$onboarding$pages$1$en
    with OnboardingPageData {
  _Translations$onboarding$pages$1$pt._(TranslationsPt root)
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
class _Translations$onboarding$pages$2$pt extends Translations$onboarding$pages$2$en
    with OnboardingPageData {
  _Translations$onboarding$pages$2$pt._(TranslationsPt root)
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
class _Translations$post$list$pt extends Translations$post$list$en {
  _Translations$post$list$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Feed';
  @override
  String get textFailure => 'Falha ao carregar o feed.';
  @override
  late final _Translations$post$list$emptyIndicator$pt emptyIndicator =
      _Translations$post$list$emptyIndicator$pt._(_root);
}

// Path: terms.list
class _Translations$terms$list$pt extends Translations$terms$list$en {
  _Translations$terms$list$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Termos';
}

// Path: post.list.emptyIndicator
class _Translations$post$list$emptyIndicator$pt extends Translations$post$list$emptyIndicator$en {
  _Translations$post$list$emptyIndicator$pt._(TranslationsPt root)
    : this._root = root,
      super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Nenhum post encontrado';
  @override
  String get text => 'Novos posts aparecerão aqui.';
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
      'account.editProfile.errors.invalid_email' => 'Email inválido',
      'account.editProfile.errors.email_address_invalid' => 'Email inválido',
      'account.editProfile.errors.email_already_in_use' => 'Este email já está em uso',
      'account.editProfile.errors.email_exists' => 'Este email já está em uso',
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
      'account.changePassword.errors.wrong_current_password' => 'A senha atual está incorreta',
      'account.changePassword.errors.invalid_credentials' => 'A senha atual está incorreta',
      'account.changePassword.errors.same_password' =>
        'A nova senha deve ser diferente da senha atual',
      'account.changePassword.errors.weak_password' => 'A nova senha é muito fraca',
      'account.changePassword.errors.other' => _root.common.genericError,
      'account.deleteAccount.title' => 'Excluir conta',
      'account.deleteAccount.warning' =>
        'Isso exclui permanentemente sua conta e seus dados. Esta ação não pode ser desfeita.',
      'account.deleteAccount.buttonDelete' => 'Excluir conta',
      'account.deleteAccount.buttonCancel' => 'Cancelar',
      'account.deleteAccount.messageSuccess' => 'Sua conta foi excluída.',
      'account.deleteAccount.errors.account_deletion_failed' =>
        'Não foi possível excluir sua conta. Tente novamente.',
      'account.deleteAccount.errors.deletion_failed' =>
        'Não foi possível excluir sua conta. Tente novamente.',
      'account.deleteAccount.errors.not_authenticated' => 'Sua sessão expirou. Entre novamente.',
      'account.deleteAccount.errors.other' => _root.common.genericError,
      'authentication.login.title' => 'Entrar',
      'authentication.login.buttonLogin' => 'Entrar',
      'authentication.login.buttonForgotPassword' => 'Esqueceu a senha?',
      'authentication.login.buttonSignInWith' => ({
        required Object provider,
      }) => 'Continue com ${provider}',
      'authentication.login.buttonNewAccount' => 'Não tem uma conta? Cadastre-se',
      'authentication.login.buttonDevMenu' => 'Abrir DevMenu',
      'authentication.login.dividerOr' => 'OU',
      'authentication.login.emailErrors.invalid' => 'Email é inválido',
      'authentication.login.passwordErrors.empty' => 'A senha é obrigatória',
      'authentication.login.errors.invalid_credentials' => 'Email ou senha inválidos',
      'authentication.login.errors.email_not_confirmed' => 'Confirme seu email antes de entrar',
      'authentication.login.errors.user_banned' => 'Sua conta está temporariamente indisponível',
      'authentication.login.errors.other' => _root.common.genericError,
      'authentication.signup.title' => 'Registrar',
      'authentication.signup.labelConfirmPassword' => 'Confirmar Senha',
      'authentication.signup.buttonSubmit' => 'Registrar',
      'authentication.signup.emailErrors.invalid' => 'Email é inválido',
      'authentication.signup.passwordErrors.weak' =>
        'Senha deve ter pelo menos 8 caracteres e conter pelo menos uma letra e um número',
      'authentication.signup.confirmPasswordErrors.invalid' => 'Senhas não coincidem',
      'authentication.signup.errors.user_already_registered' => 'Este email já está cadastrado',
      'authentication.signup.errors.user_already_exists' => 'Este email já está cadastrado',
      'authentication.signup.errors.weak_password' => 'Senha muito fraca',
      'authentication.signup.errors.email_address_invalid' => 'Email é inválido',
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
      'common.loading' => 'Carregando',
      'common.email' => 'Email',
      'common.username' => 'Usuário',
      'common.password' => 'Senha',
      'common.firstName' => 'Nome',
      'common.lastName' => 'Sobrenome',
      'common.genericError' => 'Algo deu errado',
      'notFound.title' => '404',
      'notFound.description' => 'Página não encontrada',
      'notFound.buttonBack' => 'Voltar para página inicial',
      'notifications.title' => 'Notificações',
      'notifications.markAllRead' => 'Marcar todas como lidas',
      'notifications.textFailure' => 'Falha ao carregar as notificações.',
      'notifications.emptyTitle' => 'Nenhuma notificação ainda',
      'notifications.emptyDescription' => 'Atualizações e atividades aparecerão aqui.',
      'notifications.semanticsUnread' => 'Não lida',
      'notifications.badgeTooltip' => 'Notificações',
      'notifications.errors.serverError' => 'Algo deu errado. Tente novamente.',
      'notifications.errors.other' => _root.common.genericError,
      'onboarding.pages.0.title' => 'Bem vindo!',
      'onboarding.pages.0.message' => 'Seja muito bem vindo ao QuickStart Flutter',
      'onboarding.pages.1.title' => 'O que é o QuickStart Flutter?',
      'onboarding.pages.1.message' => 'O QuickStart Flutter é um projeto para agilizar o bootstrapping de novos projetos Flutter. Ele já vem com uma série de funcionalidades prontas para uso, como internacionalização, temas, rotas, gerenciamento de estado, entre outros.',
      'onboarding.pages.2.title' => 'Vamos começar?',
      'onboarding.pages.2.message' =>
        'Pronto para explorar tudo o que o QuickStart Flutter tem a oferecer? Vamos começar!',
      'onboarding.doneButton' => 'Começar',
      'post.list.title' => 'Feed',
      'post.list.textFailure' => 'Falha ao carregar o feed.',
      'post.list.emptyIndicator.title' => 'Nenhum post encontrado',
      'post.list.emptyIndicator.text' => 'Novos posts aparecerão aqui.',
      'privacyPolicy.title' => 'Politíca de Privacidade',
      'search.title' => 'Pesquisar',
      'search.fieldSearchHint' => 'Pesquisar',
      'settings.title' => 'Configurações',
      'settings.sectionAccount' => 'Conta',
      'settings.optionBiometrics' => 'Biometria',
      'terms.list.title' => 'Termos',
      _ => null,
    };
  }
}
