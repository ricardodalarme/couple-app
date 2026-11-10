///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsPt = Translations; // ignore: unused_element

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
             locale: AppLocale.pt,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <pt>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  dynamic operator [](String key) => _meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      Translations(meta: meta ?? this.$meta);

  // Translations
  late final Translations$authentication$pt authentication =
      Translations$authentication$pt.internal(_root);
  late final Translations$common$pt common = Translations$common$pt.internal(_root);
  late final Translations$notFound$pt notFound = Translations$notFound$pt.internal(_root);
  late final Translations$profileSetup$pt profileSetup = Translations$profileSetup$pt.internal(
    _root,
  );
  late final Translations$tabs$pt tabs = Translations$tabs$pt.internal(_root);
  late final Translations$welcome$pt welcome = Translations$welcome$pt.internal(_root);
}

// Path: authentication
class Translations$authentication$pt {
  Translations$authentication$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Entrar'
  String get signInTitle => 'Entrar';

  /// pt: 'Sem e-mail e senha. Só Apple ou Google.'
  String get signInSubtitle => 'Sem e-mail e senha. Só Apple ou Google.';

  /// pt: 'Entrar leva direto para o seu Hoje.'
  String get signInNote => 'Entrar leva direto para o seu Hoje.';

  /// pt: 'Você já tem uma conta'
  String get existingAccountTitle => 'Você já tem uma conta';

  /// pt: 'Entre para continuar de onde parou.'
  String get existingAccountSubtitle => 'Entre para continuar de onde parou.';

  /// pt: 'Continuar com a Apple'
  String get continueWithApple => 'Continuar com a Apple';

  /// pt: 'Continuar com o Google'
  String get continueWithGoogle => 'Continuar com o Google';

  Map<String, String> get errors => {
    'NETWORK': 'Sem conexão. Confira a internet e tente de novo.',
    'other': 'Não deu para entrar agora. Tente de novo.',
  };
}

// Path: common
class Translations$common$pt {
  Translations$common$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Flutter Bloc Starter'
  String get appName => 'Flutter Bloc Starter';

  /// pt: 'Enviar'
  String get send => 'Enviar';

  /// pt: 'Salvar'
  String get save => 'Salvar';

  /// pt: 'Tentar novamente'
  String get retry => 'Tentar novamente';

  /// pt: 'Carregando'
  String get loading => 'Carregando';

  /// pt: 'Email'
  String get email => 'Email';

  /// pt: 'Usuário'
  String get username => 'Usuário';

  /// pt: 'Senha'
  String get password => 'Senha';

  /// pt: 'Nome'
  String get firstName => 'Nome';

  /// pt: 'Sobrenome'
  String get lastName => 'Sobrenome';

  /// pt: 'Algo deu errado'
  String get genericError => 'Algo deu errado';
}

// Path: notFound
class Translations$notFound$pt {
  Translations$notFound$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: '404'
  String get title => '404';

  /// pt: 'Página não encontrada'
  String get description => 'Página não encontrada';

  /// pt: 'Voltar para página inicial'
  String get buttonBack => 'Voltar para página inicial';
}

// Path: profileSetup
class Translations$profileSetup$pt {
  Translations$profileSetup$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'O básico'
  String get title => 'O básico';

  /// pt: 'básico'
  String get titleHighlight => 'básico';

  /// pt: 'Usado para as palavras do app e para a primeira data da sua história.'
  String get subtitle => 'Usado para as palavras do app e para a primeira data da sua história.';

  /// pt: 'Seu nome'
  String get nameLabel => 'Seu nome';

  /// pt: 'Marina'
  String get nameHint => 'Marina';

  /// pt: 'Nome do parceiro'
  String get partnerNameLabel => 'Nome do parceiro';

  /// pt: 'Ricardo'
  String get partnerNameHint => 'Ricardo';

  /// pt: 'O nome do parceiro fica só na sua conta.'
  String get partnerNameNote => 'O nome do parceiro fica só na sua conta.';

  /// pt: 'Cor do seu app'
  String get themeLabel => 'Cor do seu app';

  /// pt: 'Rosa'
  String get themeRose => 'Rosa';

  /// pt: 'Azul'
  String get themeBlue => 'Azul';

  /// pt: 'Neutro'
  String get themeNeutral => 'Neutro';

  /// pt: 'Quando começaram?'
  String get dateLabel => 'Quando começaram?';

  /// pt: 'Escolha uma data'
  String get dateHint => 'Escolha uma data';

  /// pt: '{day} de {month} de {year}'
  String dateFormat({required Object day, required Object month, required Object year}) =>
      '${day} de ${month} de ${year}';

  List<String> get months => [
    'janeiro',
    'fevereiro',
    'março',
    'abril',
    'maio',
    'junho',
    'julho',
    'agosto',
    'setembro',
    'outubro',
    'novembro',
    'dezembro',
  ];

  /// pt: 'Continuar'
  String get continueButton => 'Continuar';

  Map<String, String> get errors => {
    'INVALID_DATE': 'Essa data não parece certa. Escolha uma entre 1950 e hoje.',
    'NETWORK': 'Sem conexão. Seus dados continuam aqui, tente de novo.',
    'other': 'Não deu para salvar agora. Tente de novo.',
  };
}

// Path: tabs
class Translations$tabs$pt {
  Translations$tabs$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Hoje'
  String get today => 'Hoje';

  /// pt: 'Slips'
  String get slips => 'Slips';

  /// pt: 'Juntos'
  String get together => 'Juntos';

  /// pt: 'Memórias'
  String get memories => 'Memórias';

  /// pt: 'Novo slip'
  String get capture => 'Novo slip';

  /// pt: 'Em construção'
  String get soonTitle => 'Em construção';

  /// pt: 'Esta parte do app ainda está sendo preparada.'
  String get soonText => 'Esta parte do app ainda está sendo preparada.';
}

// Path: welcome
class Translations$welcome$pt {
  Translations$welcome$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Pequenas coisas boas, ditas em voz alta.'
  String get headline => 'Pequenas coisas boas, ditas em voz alta.';

  /// pt: 'ditas em voz alta'
  String get headlineHighlight => 'ditas em voz alta';

  /// pt: 'Um jeito leve de notar o que o outro faz de bom, a cada semana.'
  String get subtitle => 'Um jeito leve de notar o que o outro faz de bom, a cada semana.';

  /// pt: 'Começar'
  String get start => 'Começar';

  /// pt: 'Já tenho conta'
  String get haveAccount => 'Já tenho conta';

  /// pt: 'Entrar (debug)'
  String get debugSignIn => 'Entrar (debug)';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'authentication.signInTitle' => 'Entrar',
      'authentication.signInSubtitle' => 'Sem e-mail e senha. Só Apple ou Google.',
      'authentication.signInNote' => 'Entrar leva direto para o seu Hoje.',
      'authentication.existingAccountTitle' => 'Você já tem uma conta',
      'authentication.existingAccountSubtitle' => 'Entre para continuar de onde parou.',
      'authentication.continueWithApple' => 'Continuar com a Apple',
      'authentication.continueWithGoogle' => 'Continuar com o Google',
      'authentication.errors.NETWORK' => 'Sem conexão. Confira a internet e tente de novo.',
      'authentication.errors.other' => 'Não deu para entrar agora. Tente de novo.',
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
      'profileSetup.title' => 'O básico',
      'profileSetup.titleHighlight' => 'básico',
      'profileSetup.subtitle' =>
        'Usado para as palavras do app e para a primeira data da sua história.',
      'profileSetup.nameLabel' => 'Seu nome',
      'profileSetup.nameHint' => 'Marina',
      'profileSetup.partnerNameLabel' => 'Nome do parceiro',
      'profileSetup.partnerNameHint' => 'Ricardo',
      'profileSetup.partnerNameNote' => 'O nome do parceiro fica só na sua conta.',
      'profileSetup.themeLabel' => 'Cor do seu app',
      'profileSetup.themeRose' => 'Rosa',
      'profileSetup.themeBlue' => 'Azul',
      'profileSetup.themeNeutral' => 'Neutro',
      'profileSetup.dateLabel' => 'Quando começaram?',
      'profileSetup.dateHint' => 'Escolha uma data',
      'profileSetup.dateFormat' => ({
        required Object day,
        required Object month,
        required Object year,
      }) => '${day} de ${month} de ${year}',
      'profileSetup.months.0' => 'janeiro',
      'profileSetup.months.1' => 'fevereiro',
      'profileSetup.months.2' => 'março',
      'profileSetup.months.3' => 'abril',
      'profileSetup.months.4' => 'maio',
      'profileSetup.months.5' => 'junho',
      'profileSetup.months.6' => 'julho',
      'profileSetup.months.7' => 'agosto',
      'profileSetup.months.8' => 'setembro',
      'profileSetup.months.9' => 'outubro',
      'profileSetup.months.10' => 'novembro',
      'profileSetup.months.11' => 'dezembro',
      'profileSetup.continueButton' => 'Continuar',
      'profileSetup.errors.INVALID_DATE' =>
        'Essa data não parece certa. Escolha uma entre 1950 e hoje.',
      'profileSetup.errors.NETWORK' => 'Sem conexão. Seus dados continuam aqui, tente de novo.',
      'profileSetup.errors.other' => 'Não deu para salvar agora. Tente de novo.',
      'tabs.today' => 'Hoje',
      'tabs.slips' => 'Slips',
      'tabs.together' => 'Juntos',
      'tabs.memories' => 'Memórias',
      'tabs.capture' => 'Novo slip',
      'tabs.soonTitle' => 'Em construção',
      'tabs.soonText' => 'Esta parte do app ainda está sendo preparada.',
      'welcome.headline' => 'Pequenas coisas boas, ditas em voz alta.',
      'welcome.headlineHighlight' => 'ditas em voz alta',
      'welcome.subtitle' => 'Um jeito leve de notar o que o outro faz de bom, a cada semana.',
      'welcome.start' => 'Começar',
      'welcome.haveAccount' => 'Já tenho conta',
      'welcome.debugSignIn' => 'Entrar (debug)',
      _ => null,
    };
  }
}
