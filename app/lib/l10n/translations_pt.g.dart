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
  late final Translations$intro$pt intro = Translations$intro$pt.internal(_root);
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

// Path: intro
class Translations$intro$pt {
  Translations$intro$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Pular'
  String get skip => 'Pular';

  /// pt: 'Continuar'
  String get continueButton => 'Continuar';

  late final Translations$intro$phase$pt phase = Translations$intro$phase$pt.internal(_root);
  late final Translations$intro$goals$pt goals = Translations$intro$goals$pt.internal(_root);
  late final Translations$intro$theme$pt theme = Translations$intro$theme$pt.internal(_root);
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

// Path: intro.phase
class Translations$intro$phase$pt {
  Translations$intro$phase$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Onde vocês estão agora?'
  String get title => 'Onde vocês estão agora?';

  /// pt: 'agora'
  String get titleHighlight => 'agora';

  /// pt: 'Escolha o mais próximo. Você pode mudar depois.'
  String get subtitle => 'Escolha o mais próximo. Você pode mudar depois.';

  Map<String, String> get options => {
    'dating': 'Namorando',
    'living_together': 'Moramos juntos',
    'engaged': 'Noivos',
    'married': 'Casados',
    'with_kids': 'Com filhos',
    'long_distance': 'Namoro à distância',
    'restarting': 'Recomeçando',
    'other': '',
  };
}

// Path: intro.goals
class Translations$intro$goals$pt {
  Translations$intro$goals$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'O que você quer do app?'
  String get title => 'O que você quer do app?';

  /// pt: 'app'
  String get titleHighlight => 'app';

  /// pt: 'Escolha quantos quiser.'
  String get subtitle => 'Escolha quantos quiser.';

  Map<String, String> get options => {
    'reconnect': 'Reconectar',
    'fight_less': 'Brigar menos',
    'keep_romance': 'Manter o romance',
    'remember_dates': 'Lembrar de datas',
    'organize_routine': 'Organizar a rotina',
    'just_record': 'Só registrar coisas boas',
    'other': '',
  };
}

// Path: intro.theme
class Translations$intro$theme$pt {
  Translations$intro$theme$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Qual cor combina com você?'
  String get title => 'Qual cor combina com você?';

  /// pt: 'cor'
  String get titleHighlight => 'cor';

  /// pt: 'Você escolhe a cor, não o gênero. Os recursos são os mesmos.'
  String get subtitle => 'Você escolhe a cor, não o gênero. Os recursos são os mesmos.';

  /// pt: 'Rosa suave'
  String get rose => 'Rosa suave';

  /// pt: 'Delicado e quente'
  String get roseSupport => 'Delicado e quente';

  /// pt: 'Azul suave'
  String get blue => 'Azul suave';

  /// pt: 'Calmo e leve'
  String get blueSupport => 'Calmo e leve';

  /// pt: 'Neutro'
  String get neutral => 'Neutro';

  /// pt: 'Papel e verde'
  String get neutralSupport => 'Papel e verde';

  /// pt: 'Dá para trocar depois em Configurações, Aparência.'
  String get footnote => 'Dá para trocar depois em Configurações, Aparência.';
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
      'intro.skip' => 'Pular',
      'intro.continueButton' => 'Continuar',
      'intro.phase.title' => 'Onde vocês estão agora?',
      'intro.phase.titleHighlight' => 'agora',
      'intro.phase.subtitle' => 'Escolha o mais próximo. Você pode mudar depois.',
      'intro.phase.options.dating' => 'Namorando',
      'intro.phase.options.living_together' => 'Moramos juntos',
      'intro.phase.options.engaged' => 'Noivos',
      'intro.phase.options.married' => 'Casados',
      'intro.phase.options.with_kids' => 'Com filhos',
      'intro.phase.options.long_distance' => 'Namoro à distância',
      'intro.phase.options.restarting' => 'Recomeçando',
      'intro.phase.options.other' => '',
      'intro.goals.title' => 'O que você quer do app?',
      'intro.goals.titleHighlight' => 'app',
      'intro.goals.subtitle' => 'Escolha quantos quiser.',
      'intro.goals.options.reconnect' => 'Reconectar',
      'intro.goals.options.fight_less' => 'Brigar menos',
      'intro.goals.options.keep_romance' => 'Manter o romance',
      'intro.goals.options.remember_dates' => 'Lembrar de datas',
      'intro.goals.options.organize_routine' => 'Organizar a rotina',
      'intro.goals.options.just_record' => 'Só registrar coisas boas',
      'intro.goals.options.other' => '',
      'intro.theme.title' => 'Qual cor combina com você?',
      'intro.theme.titleHighlight' => 'cor',
      'intro.theme.subtitle' => 'Você escolhe a cor, não o gênero. Os recursos são os mesmos.',
      'intro.theme.rose' => 'Rosa suave',
      'intro.theme.roseSupport' => 'Delicado e quente',
      'intro.theme.blue' => 'Azul suave',
      'intro.theme.blueSupport' => 'Calmo e leve',
      'intro.theme.neutral' => 'Neutro',
      'intro.theme.neutralSupport' => 'Papel e verde',
      'intro.theme.footnote' => 'Dá para trocar depois em Configurações, Aparência.',
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
