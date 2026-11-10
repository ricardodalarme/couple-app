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
  late final Translations$acceptInvite$pt acceptInvite = Translations$acceptInvite$pt.internal(
    _root,
  );
  late final Translations$authentication$pt authentication =
      Translations$authentication$pt.internal(_root);
  late final Translations$cardView$pt cardView = Translations$cardView$pt.internal(_root);
  late final Translations$cardsList$pt cardsList = Translations$cardsList$pt.internal(_root);
  late final Translations$common$pt common = Translations$common$pt.internal(_root);
  late final Translations$firstSlip$pt firstSlip = Translations$firstSlip$pt.internal(_root);
  late final Translations$intro$pt intro = Translations$intro$pt.internal(_root);
  late final Translations$invite$pt invite = Translations$invite$pt.internal(_root);
  late final Translations$notFound$pt notFound = Translations$notFound$pt.internal(_root);
  late final Translations$notificationPermission$pt notificationPermission =
      Translations$notificationPermission$pt.internal(_root);
  late final Translations$partnerStep$pt partnerStep = Translations$partnerStep$pt.internal(_root);
  late final Translations$profileSetup$pt profileSetup = Translations$profileSetup$pt.internal(
    _root,
  );
  late final Translations$quickSlip$pt quickSlip = Translations$quickSlip$pt.internal(_root);
  late final Translations$slipsList$pt slipsList = Translations$slipsList$pt.internal(_root);
  late final Translations$sundayCard$pt sundayCard = Translations$sundayCard$pt.internal(_root);
  late final Translations$tabs$pt tabs = Translations$tabs$pt.internal(_root);
  late final Translations$today$pt today = Translations$today$pt.internal(_root);
  late final Translations$unpair$pt unpair = Translations$unpair$pt.internal(_root);
  late final Translations$welcome$pt welcome = Translations$welcome$pt.internal(_root);
}

// Path: acceptInvite
class Translations$acceptInvite$pt {
  Translations$acceptInvite$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Tem um convite?'
  String get title => 'Tem um convite?';

  /// pt: 'convite'
  String get titleHighlight => 'convite';

  /// pt: 'Digite o código que a outra pessoa enviou para vocês se conectarem.'
  String get subtitle => 'Digite o código que a outra pessoa enviou para vocês se conectarem.';

  /// pt: 'Código do convite'
  String get codeLabel => 'Código do convite';

  /// pt: 'ABCD2345'
  String get codeHint => 'ABCD2345';

  /// pt: 'Aceitar compartilha cartões e ferramentas. Suas notas privadas continuam privadas.'
  String get privacyNote =>
      'Aceitar compartilha cartões e ferramentas. Suas notas privadas continuam privadas.';

  /// pt: 'Aceitar'
  String get accept => 'Aceitar';

  late final Translations$acceptInvite$connected$pt connected =
      Translations$acceptInvite$connected$pt.internal(_root);
  late final Translations$acceptInvite$unusable$pt unusable =
      Translations$acceptInvite$unusable$pt.internal(_root);
  Map<String, String> get errors => {
    'ALREADY_PAIRED': 'Você já está conectado com alguém.',
    'COUPLE_FULL': 'Esse espaço já tem duas pessoas.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um pouco e tente de novo.',
    'NETWORK': 'Sem conexão. Confira a internet e tente de novo.',
    'other': 'Não deu para conectar agora. Tente de novo.',
  };
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

// Path: cardView
class Translations$cardView$pt {
  Translations$cardView$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Para {name}'
  String forPartner({required Object name}) => 'Para ${name}';

  /// pt: 'Para sua pessoa'
  String get forPartnerNoName => 'Para sua pessoa';

  /// pt: '(zero) {Nenhuma coisa boa ainda} (one) {1 coisa boa desta semana} (other) {{count} coisas boas desta semana}'
  String goodThings({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        zero: 'Nenhuma coisa boa ainda',
        one: '1 coisa boa desta semana',
        other: '${count} coisas boas desta semana',
      );

  List<String> get weekdays => ['seg', 'ter', 'qua', 'qui', 'sex', 'sáb', 'dom'];
  Map<String, String> get categories => {
    'said': 'disse algo',
    'did': 'fez algo',
    'noticed': 'me notou',
    'helped': 'me ajudou',
    'other': '',
  };
}

// Path: cardsList
class Translations$cardsList$pt {
  Translations$cardsList$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Cartões anteriores'
  String get title => 'Cartões anteriores';

  /// pt: '{day} de {month}'
  String dateShort({required Object day, required Object month}) => '${day} de ${month}';

  List<String> get monthsShort => [
    'jan',
    'fev',
    'mar',
    'abr',
    'mai',
    'jun',
    'jul',
    'ago',
    'set',
    'out',
    'nov',
    'dez',
  ];

  /// pt: '(zero) {sem slips} (one) {1 slip} (other) {{count} slips}'
  String slipCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        zero: 'sem slips',
        one: '1 slip',
        other: '${count} slips',
      );

  /// pt: 'Enviado'
  String get sent => 'Enviado';

  /// pt: 'Recebido'
  String get received => 'Recebido';

  /// pt: 'aberto'
  String get opened => 'aberto';

  /// pt: 'reação'
  String get reacted => 'reação';

  /// pt: 'respondido'
  String get replied => 'respondido';

  /// pt: 'Nenhum cartão ainda'
  String get emptyTitle => 'Nenhum cartão ainda';

  /// pt: 'Quando um cartão for enviado ou chegar, ele aparece aqui. Sem pressa.'
  String get emptyText => 'Quando um cartão for enviado ou chegar, ele aparece aqui. Sem pressa.';

  /// pt: 'Não deu para carregar os cartões'
  String get errorTitle => 'Não deu para carregar os cartões';

  /// pt: 'Eles continuam salvos. Tente de novo.'
  String get errorText => 'Eles continuam salvos. Tente de novo.';

  /// pt: 'Cartão'
  String get detailTitle => 'Cartão';

  /// pt: 'Não deu para abrir o cartão'
  String get detailErrorTitle => 'Não deu para abrir o cartão';

  Map<String, String> get errors => {
    'CARD_NOT_FOUND': 'Esse cartão não está mais disponível.',
    'other': 'Ele continua salvo. Tente de novo.',
  };

  /// pt: 'Como você quer responder?'
  String get reactionPrompt => 'Como você quer responder?';

  /// pt: 'Obrigado'
  String get reactionThankYou => 'Obrigado';

  /// pt: 'Abraço'
  String get reactionHug => 'Abraço';

  /// pt: 'Fez minha semana'
  String get reactionMadeMyDay => 'Fez minha semana';

  /// pt: 'Anotado'
  String get reactionNoted => 'Anotado';

  /// pt: 'Não deu para responder agora. Tente de novo.'
  String get reactionError => 'Não deu para responder agora. Tente de novo.';

  /// pt: '{name}'
  String responseReceivedName({required Object name}) => '${name}';

  /// pt: 'Sua pessoa respondeu'
  String get responseReceivedNoName => 'Sua pessoa respondeu';

  /// pt: 'respondeu'
  String get responseReceivedVerb => 'respondeu';

  /// pt: '“{label}”'
  String responseQuote({required Object label}) => '“${label}”';

  /// pt: 'Esse cartão não está mais disponível.'
  String get notFound => 'Esse cartão não está mais disponível.';

  /// pt: 'Isso fez a minha semana.'
  String get reactionQuoteMadeMyDay => 'Isso fez a minha semana.';
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

// Path: firstSlip
class Translations$firstSlip$pt {
  Translations$firstSlip$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Comece com uma coisa boa'
  String get title => 'Comece com uma coisa boa';

  /// pt: 'uma coisa boa'
  String get titleHighlight => 'uma coisa boa';

  /// pt: 'O que seu parceiro fez ultimamente que te fez sorrir? 30 segundos bastam. Ainda sem conta.'
  String get subtitle =>
      'O que seu parceiro fez ultimamente que te fez sorrir? 30 segundos bastam. Ainda sem conta.';

  /// pt: 'Ex.: fez café antes de eu acordar'
  String get hint => 'Ex.: fez café antes de eu acordar';

  /// pt: 'Fica salvo só neste celular.'
  String get localNote => 'Fica salvo só neste celular.';

  /// pt: 'Salvar'
  String get save => 'Salvar';

  /// pt: 'Não deu para guardar agora. Tente de novo.'
  String get saveError => 'Não deu para guardar agora. Tente de novo.';
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

// Path: invite
class Translations$invite$pt {
  Translations$invite$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Convidar {name}'
  String title({required Object name}) => 'Convidar ${name}';

  /// pt: 'Convidar sua pessoa'
  String get titleNoName => 'Convidar sua pessoa';

  /// pt: 'Esta mensagem será enviada:'
  String get messageIntro => 'Esta mensagem será enviada:';

  /// pt: 'Comecei uma coisa pequena para nós. Para nos conectar no app, use o código {code}.'
  String message({required Object code}) =>
      'Comecei uma coisa pequena para nós. Para nos conectar no app, use o código ${code}.';

  /// pt: 'O convite vale por {days} dias. Só o último convite criado funciona.'
  String expiryNote({required Object days}) =>
      'O convite vale por ${days} dias. Só o último convite criado funciona.';

  /// pt: 'Compartilhar convite'
  String get share => 'Compartilhar convite';

  /// pt: 'Copiar convite'
  String get copy => 'Copiar convite';

  /// pt: 'Convite enviado'
  String get sentTitle => 'Convite enviado';

  /// pt: 'enviado'
  String get sentHighlight => 'enviado';

  /// pt: '{name} ainda não entrou. Enquanto isso, você pode usar o app sozinho.'
  String sentText({required Object name}) =>
      '${name} ainda não entrou. Enquanto isso, você pode usar o app sozinho.';

  /// pt: 'Sua pessoa ainda não entrou. Enquanto isso, você pode usar o app sozinho.'
  String get sentTextNoName =>
      'Sua pessoa ainda não entrou. Enquanto isso, você pode usar o app sozinho.';

  /// pt: 'Reenviar'
  String get resend => 'Reenviar';

  /// pt: 'Revogar'
  String get revoke => 'Revogar';

  /// pt: 'Não deu para criar o convite'
  String get errorTitle => 'Não deu para criar o convite';

  Map<String, String> get errors => {
    'ALREADY_PAIRED': 'Você já está conectado com alguém.',
    'RATE_LIMITED': 'Você criou muitos convites hoje. Tente de novo amanhã.',
    'NETWORK': 'Sem conexão. Confira a internet e tente de novo.',
    'other': 'Algo deu errado. Tente de novo.',
  };
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

// Path: notificationPermission
class Translations$notificationPermission$pt {
  Translations$notificationPermission$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Lembretes'
  String get label => 'Lembretes';

  /// pt: 'Lembretes gentis?'
  String get title => 'Lembretes gentis?';

  /// pt: 'gentis'
  String get titleHighlight => 'gentis';

  /// pt: 'No máximo 1 a 2 por dia.'
  String get pointLimit => 'No máximo 1 a 2 por dia.';

  /// pt: 'Nunca mostram nomes na tela bloqueada.'
  String get pointPrivate => 'Nunca mostram nomes na tela bloqueada.';

  /// pt: 'Você escolhe o que chega e quando.'
  String get pointChoice => 'Você escolhe o que chega e quando.';

  /// pt: 'Você pode mudar isso quando quiser.'
  String get changeLater => 'Você pode mudar isso quando quiser.';

  /// pt: 'Agora não'
  String get notNow => 'Agora não';

  /// pt: 'Permitir'
  String get allow => 'Permitir';

  /// pt: 'Os lembretes estão desligados. Ligue nas configurações.'
  String get offBanner => 'Os lembretes estão desligados. Ligue nas configurações.';

  /// pt: 'Abrir configurações'
  String get openSettings => 'Abrir configurações';

  /// pt: 'Fechar'
  String get close => 'Fechar';
}

// Path: partnerStep
class Translations$partnerStep$pt {
  Translations$partnerStep$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Quer trazer seu parceiro?'
  String get title => 'Quer trazer seu parceiro?';

  /// pt: 'parceiro'
  String get titleHighlight => 'parceiro';

  /// pt: 'O app funciona sozinho. Você convida quando quiser.'
  String get subtitle => 'O app funciona sozinho. Você convida quando quiser.';

  /// pt: 'Enviar um convite'
  String get inviteTitle => 'Enviar um convite';

  /// pt: 'Sua pessoa entra com um código'
  String get inviteSupport => 'Sua pessoa entra com um código';

  /// pt: 'Depois, começar sozinho'
  String get aloneTitle => 'Depois, começar sozinho';

  /// pt: 'Seus slips ficam só com você'
  String get aloneSupport => 'Seus slips ficam só com você';

  /// pt: 'Tenho um código de convite'
  String get haveCode => 'Tenho um código de convite';

  /// pt: 'Continuar'
  String get continueButton => 'Continuar';
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

// Path: quickSlip
class Translations$quickSlip$pt {
  Translations$quickSlip$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: '{weekday}, {day} de {month}'
  String dateLine({required Object weekday, required Object day, required Object month}) =>
      '${weekday}, ${day} de ${month}';

  List<String> get weekdays => [
    'segunda',
    'terça',
    'quarta',
    'quinta',
    'sexta',
    'sábado',
    'domingo',
  ];
  List<String> get monthsShort => [
    'jan',
    'fev',
    'mar',
    'abr',
    'mai',
    'jun',
    'jul',
    'ago',
    'set',
    'out',
    'nov',
    'dez',
  ];

  /// pt: 'O que te deixou feliz?'
  String get title => 'O que te deixou feliz?';

  /// pt: 'feliz'
  String get titleHighlight => 'feliz';

  /// pt: 'Uma linha basta. 30 segundos.'
  String get subtitle => 'Uma linha basta. 30 segundos.';

  /// pt: 'Ex.: fez café antes de eu acordar'
  String get hint => 'Ex.: fez café antes de eu acordar';

  Map<String, String> get categories => {
    'said': 'Disse algo',
    'did': 'Fez algo',
    'noticed': 'Me notou',
    'helped': 'Me ajudou',
    'other': '',
  };

  /// pt: 'Fica privado. No domingo você escolhe o que vai para o cartão.'
  String get privacyNote => 'Fica privado. No domingo você escolhe o que vai para o cartão.';

  /// pt: 'Salvar'
  String get save => 'Salvar';

  late final Translations$quickSlip$saved$pt saved = Translations$quickSlip$saved$pt.internal(
    _root,
  );
  Map<String, String> get errors => {
    'FREE_LIMIT_REACHED': 'Você chegou ao limite de slips do plano grátis.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para salvar agora. Seu texto continua aqui, tente de novo.',
  };
}

// Path: slipsList
class Translations$slipsList$pt {
  Translations$slipsList$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Slips'
  String get title => 'Slips';

  /// pt: 'Esta semana'
  String get scopeWeek => 'Esta semana';

  /// pt: 'Todos'
  String get scopeAll => 'Todos';

  /// pt: 'Privado'
  String get private => 'Privado';

  /// pt: 'Esta semana'
  String get thisWeek => 'Esta semana';

  /// pt: 'Semana passada'
  String get lastWeek => 'Semana passada';

  /// pt: '{start} – {end}'
  String weekRange({required Object start, required Object end}) => '${start} – ${end}';

  /// pt: '{day} {month}'
  String dateShort({required Object day, required Object month}) => '${day} ${month}';

  /// pt: '{weekday} · {category}'
  String dayLine({required Object weekday, required Object category}) => '${weekday} · ${category}';

  List<String> get weekdaysShort => ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];
  List<String> get monthsShort => [
    'jan',
    'fev',
    'mar',
    'abr',
    'mai',
    'jun',
    'jul',
    'ago',
    'set',
    'out',
    'nov',
    'dez',
  ];
  Map<String, String> get categories => {
    'said': 'Disse algo',
    'did': 'Fez algo',
    'noticed': 'Me notou',
    'helped': 'Ajudou',
    'other': '',
  };

  /// pt: 'Cartões anteriores'
  String get pastCards => 'Cartões anteriores';

  /// pt: 'Nada ainda'
  String get emptyTitle => 'Nada ainda';

  /// pt: 'Um slip é uma coisa boa, em uma linha.'
  String get emptyText => 'Um slip é uma coisa boa, em uma linha.';

  /// pt: 'Adicionar um slip'
  String get emptyAction => 'Adicionar um slip';

  /// pt: 'Não deu para carregar seus slips'
  String get errorTitle => 'Não deu para carregar seus slips';

  /// pt: 'Eles continuam salvos. Tente de novo.'
  String get errorText => 'Eles continuam salvos. Tente de novo.';
}

// Path: sundayCard
class Translations$sundayCard$pt {
  Translations$sundayCard$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Seu cartão'
  String get title => 'Seu cartão';

  /// pt: 'Editar'
  String get edit => 'Editar';

  /// pt: 'Salvar'
  String get save => 'Salvar';

  /// pt: 'Cancelar'
  String get cancel => 'Cancelar';

  /// pt: 'Mensagem final'
  String get noteLabel => 'Mensagem final';

  /// pt: 'Obrigada por essa semana.'
  String get noteHint => 'Obrigada por essa semana.';

  /// pt: 'Subir'
  String get moveUp => 'Subir';

  /// pt: 'Descer'
  String get moveDown => 'Descer';

  /// pt: 'Tirar do cartão'
  String get remove => 'Tirar do cartão';

  /// pt: 'Semana sem slips'
  String get emptyTitle => 'Semana sem slips';

  /// pt: 'Anote uma coisa boa e ela entra no cartão de domingo.'
  String get emptyText => 'Anote uma coisa boa e ela entra no cartão de domingo.';

  /// pt: 'Anotar um slip'
  String get emptyAction => 'Anotar um slip';

  /// pt: 'Não deu para carregar o cartão'
  String get errorTitle => 'Não deu para carregar o cartão';

  /// pt: 'Seus slips continuam salvos. Tente de novo.'
  String get errorText => 'Seus slips continuam salvos. Tente de novo.';

  /// pt: 'Não deu para salvar o cartão. Tente de novo.'
  String get saveError => 'Não deu para salvar o cartão. Tente de novo.';

  /// pt: 'Ver o rascunho'
  String get openFromToday => 'Ver o rascunho';

  /// pt: 'Não deu para enviar agora. O cartão continua aqui, tente de novo.'
  String get deliverError => 'Não deu para enviar agora. O cartão continua aqui, tente de novo.';

  late final Translations$sundayCard$send$pt send = Translations$sundayCard$send$pt.internal(_root);
  late final Translations$sundayCard$hold$pt hold = Translations$sundayCard$hold$pt.internal(_root);
  late final Translations$sundayCard$held$pt held = Translations$sundayCard$held$pt.internal(_root);
  late final Translations$sundayCard$sent$pt sent = Translations$sundayCard$sent$pt.internal(_root);
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

// Path: today
class Translations$today$pt {
  Translations$today$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Bom dia, {name}'
  String greetingMorning({required Object name}) => 'Bom dia, ${name}';

  /// pt: 'Boa tarde, {name}'
  String greetingAfternoon({required Object name}) => 'Boa tarde, ${name}';

  /// pt: 'Boa noite, {name}'
  String greetingEvening({required Object name}) => 'Boa noite, ${name}';

  /// pt: 'Olá'
  String get greetingNoName => 'Olá';

  /// pt: '{weekday}, {day} de {month}'
  String dateLine({required Object weekday, required Object day, required Object month}) =>
      '${weekday}, ${day} de ${month}';

  List<String> get weekdays => [
    'segunda',
    'terça',
    'quarta',
    'quinta',
    'sexta',
    'sábado',
    'domingo',
  ];
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

  /// pt: '(one) {1 ano} (other) {{count} anos}'
  String togetherYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 ano',
        other: '${count} anos',
      );

  /// pt: '(one) {1 mês} (other) {{count} meses}'
  String togetherMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 mês',
        other: '${count} meses',
      );

  /// pt: '(one) {1 dia} (other) {{count} dias}'
  String togetherDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 dia',
        other: '${count} dias',
      );

  /// pt: '{first} e {second}'
  String togetherJoin({required Object first, required Object second}) => '${first} e ${second}';

  /// pt: 'Convidar sua pessoa'
  String get invitePerson => 'Convidar sua pessoa';

  /// pt: 'Sem conexão. Mostrando o que foi salvo.'
  String get offline => 'Sem conexão. Mostrando o que foi salvo.';

  /// pt: 'Convite enviado'
  String get pendingInviteTitle => 'Convite enviado';

  /// pt: 'A pessoa ainda não entrou. Reenviar ou revogar.'
  String get pendingInviteText => 'A pessoa ainda não entrou. Reenviar ou revogar.';

  /// pt: 'Ver convite'
  String get pendingInviteAction => 'Ver convite';

  /// pt: 'Responder'
  String get answer => 'Responder';

  /// pt: '(zero) {Nenhum slip esta semana} (one) {1 slip esta semana} (other) {{count} slips esta semana}'
  String slipsThisWeek({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        zero: 'Nenhum slip esta semana',
        one: '1 slip esta semana',
        other: '${count} slips esta semana',
      );

  /// pt: 'Anote uma coisa boa quando lembrar.'
  String get weekHintEmpty => 'Anote uma coisa boa quando lembrar.';

  /// pt: 'Seu cartão de domingo vem desses slips.'
  String get weekHint => 'Seu cartão de domingo vem desses slips.';

  /// pt: 'Para hoje'
  String get forToday => 'Para hoje';

  /// pt: 'Ideia do dia'
  String get ideaLabel => 'Ideia do dia';

  /// pt: '(zero) {Seus slips privados: nenhum esta semana} (one) {Seus slips privados: 1 esta semana} (other) {Seus slips privados: {count} esta semana}'
  String slipsThisWeekPrivate({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        zero: 'Seus slips privados: nenhum esta semana',
        one: 'Seus slips privados: 1 esta semana',
        other: 'Seus slips privados: ${count} esta semana',
      );

  /// pt: 'Cartão de domingo'
  String get sundayCardLabel => 'Cartão de domingo';

  /// pt: 'Seu cartão desta semana'
  String get sundayCardTitle => 'Seu cartão desta semana';

  /// pt: 'Convite'
  String get inviteCardLabel => 'Convite';

  /// pt: 'Convidar {name}'
  String inviteCardTitle({required Object name}) => 'Convidar ${name}';

  /// pt: 'Convidar sua pessoa'
  String get inviteCardTitleNoName => 'Convidar sua pessoa';

  /// pt: 'Cartões e ferramentas compartilhadas precisam dos dois.'
  String get inviteCardText => 'Cartões e ferramentas compartilhadas precisam dos dois.';

  /// pt: 'Só seu'
  String get privateTag => 'Só seu';

  /// pt: 'Como foi o seu dia, de verdade?'
  String get privateQuestion => 'Como foi o seu dia, de verdade?';

  /// pt: 'dia'
  String get privateHighlight => 'dia';

  /// pt: 'Anotar um slip'
  String get privateAction => 'Anotar um slip';

  /// pt: 'Sem pressa'
  String get emptyWeekTag => 'Sem pressa';

  /// pt: 'Qual foi uma coisa boa hoje?'
  String get emptyWeekQuestion => 'Qual foi uma coisa boa hoje?';

  /// pt: 'boa'
  String get emptyWeekHighlight => 'boa';

  /// pt: 'Anotar um slip'
  String get emptyWeekAction => 'Anotar um slip';

  /// pt: 'Nenhum cartão novo. Sem pressa.'
  String get nothingReceived => 'Nenhum cartão novo. Sem pressa.';

  /// pt: 'Você recebeu um cartão'
  String get cardReceived => 'Você recebeu um cartão';

  /// pt: 'Ver cartão'
  String get cardReceivedAction => 'Ver cartão';

  /// pt: 'Começando'
  String get firstDayLabel => 'Começando';

  /// pt: 'Oi, {name}'
  String firstDayGreeting({required Object name}) => 'Oi, ${name}';

  /// pt: 'que bom ter você por aqui'
  String get firstDaySubtitle => 'que bom ter você por aqui';

  /// pt: 'Bom começo'
  String get firstDayTag => 'Bom começo';

  /// pt: '(one) {Você tem 1 slip.} (other) {Você tem {count} slips.}'
  String firstDayTitle({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Você tem 1 slip.',
        other: 'Você tem ${count} slips.',
      );

  /// pt: '(one) {1 slip} (other) {{count} slips}'
  String firstDayHighlight({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 slip',
        other: '${count} slips',
      );

  /// pt: 'Um slip é uma coisa boa, em uma linha. No domingo eles viram um cartão.'
  String get firstDayText =>
      'Um slip é uma coisa boa, em uma linha. No domingo eles viram um cartão.';

  /// pt: 'Anotar mais um'
  String get firstDayAction => 'Anotar mais um';

  /// pt: 'Não deu para carregar o Hoje'
  String get errorTitle => 'Não deu para carregar o Hoje';

  /// pt: 'Seus slips estão seguros. Tente de novo.'
  String get errorText => 'Seus slips estão seguros. Tente de novo.';

  /// pt: '{name} te mandou um cartão'
  String cardReceivedNamed({required Object name}) => '${name} te mandou um cartão';
}

// Path: unpair
class Translations$unpair$pt {
  Translations$unpair$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Desvincular'
  String get appBarTitle => 'Desvincular';

  /// pt: 'Desvincular da {name}?'
  String title({required Object name}) => 'Desvincular da ${name}?';

  /// pt: 'Cartões e listas compartilhados param. Suas notas continuam com você.'
  String get text => 'Cartões e listas compartilhados param. Suas notas continuam com você.';

  /// pt: 'Desvincular'
  String get confirm => 'Desvincular';

  /// pt: 'Cancelar'
  String get cancel => 'Cancelar';

  /// pt: 'sua pessoa'
  String get unnamedPartner => 'sua pessoa';

  late final Translations$unpair$done$pt done = Translations$unpair$done$pt.internal(_root);
  late final Translations$unpair$relationship$pt relationship =
      Translations$unpair$relationship$pt.internal(_root);
  late final Translations$unpair$breakup$pt breakup = Translations$unpair$breakup$pt.internal(
    _root,
  );
  late final Translations$unpair$partnerNotice$pt partnerNotice =
      Translations$unpair$partnerNotice$pt.internal(_root);
  Map<String, String> get errors => {
    'NETWORK': 'Sem conexão. Confira a internet e tente de novo.',
    'STILL_PAIRED': 'A relação ainda está ativa. Tente de novo.',
    'other': 'Não deu para desvincular agora. Tente de novo.',
  };
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

// Path: acceptInvite.connected
class Translations$acceptInvite$connected$pt {
  Translations$acceptInvite$connected$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Vocês estão conectados'
  String get title => 'Vocês estão conectados';

  /// pt: 'conectados'
  String get titleHighlight => 'conectados';

  /// pt: 'Cartões e ferramentas compartilhadas ativos. Tudo que é privado continua privado.'
  String get text =>
      'Cartões e ferramentas compartilhadas ativos. Tudo que é privado continua privado.';

  /// pt: 'Ir para Hoje'
  String get goToToday => 'Ir para Hoje';
}

// Path: acceptInvite.unusable
class Translations$acceptInvite$unusable$pt {
  Translations$acceptInvite$unusable$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Esse convite é antigo'
  String get title => 'Esse convite é antigo';

  /// pt: 'antigo'
  String get titleHighlight => 'antigo';

  /// pt: 'Confira o código ou peça um novo convite para quem convidou.'
  String get text => 'Confira o código ou peça um novo convite para quem convidou.';

  /// pt: 'Digitar de novo'
  String get tryAgain => 'Digitar de novo';

  /// pt: 'Fechar'
  String get close => 'Fechar';
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

// Path: quickSlip.saved
class Translations$quickSlip$saved$pt {
  Translations$quickSlip$saved$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Salvo'
  String get title => 'Salvo';

  /// pt: 'Slip adicionado a esta semana.'
  String get added => 'Slip adicionado a esta semana.';

  /// pt: 'Salvo neste celular. Enviamos quando a conexão voltar.'
  String get queued => 'Salvo neste celular. Enviamos quando a conexão voltar.';

  /// pt: 'Desfazer por 30 segundos.'
  String get undoHint => 'Desfazer por 30 segundos.';

  /// pt: 'Desfazer'
  String get undo => 'Desfazer';

  /// pt: 'Pronto'
  String get done => 'Pronto';
}

// Path: sundayCard.send
class Translations$sundayCard$send$pt {
  Translations$sundayCard$send$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Enviar'
  String get action => 'Enviar';

  /// pt: 'Convidar para enviar'
  String get invite => 'Convidar para enviar';

  /// pt: 'Para enviar o cartão no app, sua pessoa precisa estar conectada.'
  String get needsPartner => 'Para enviar o cartão no app, sua pessoa precisa estar conectada.';

  /// pt: 'Enviar o cartão?'
  String get title => 'Enviar o cartão?';

  /// pt: '{name} recebe agora. Depois de enviado, o cartão não muda.'
  String text({required Object name}) =>
      '${name} recebe agora. Depois de enviado, o cartão não muda.';

  /// pt: 'Sua pessoa recebe agora. Depois de enviado, o cartão não muda.'
  String get textNoName => 'Sua pessoa recebe agora. Depois de enviado, o cartão não muda.';

  /// pt: 'Enviar'
  String get confirm => 'Enviar';
}

// Path: sundayCard.hold
class Translations$sundayCard$hold$pt {
  Translations$sundayCard$hold$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Segurar esta semana'
  String get action => 'Segurar esta semana';

  /// pt: 'Segurar esta semana?'
  String get title => 'Segurar esta semana?';

  /// pt: 'O cartão fica guardado e nada se perde. Você pode enviar quando quiser.'
  String get text => 'O cartão fica guardado e nada se perde. Você pode enviar quando quiser.';

  /// pt: 'Segurar'
  String get confirm => 'Segurar';
}

// Path: sundayCard.held
class Translations$sundayCard$held$pt {
  Translations$sundayCard$held$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Retido nesta semana'
  String get title => 'Retido nesta semana';

  /// pt: 'Retido'
  String get titleHighlight => 'Retido';

  /// pt: 'Seu cartão espera. Envie quando estiver pronto. Nada se perde.'
  String get text => 'Seu cartão espera. Envie quando estiver pronto. Nada se perde.';

  /// pt: 'Continuar retendo'
  String get keepHolding => 'Continuar retendo';

  /// pt: 'Enviar mesmo assim'
  String get sendAnyway => 'Enviar mesmo assim';
}

// Path: sundayCard.sent
class Translations$sundayCard$sent$pt {
  Translations$sundayCard$sent$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Enviado'
  String get title => 'Enviado';

  /// pt: 'O cartão foi para {name}.'
  String text({required Object name}) => 'O cartão foi para ${name}.';

  /// pt: 'O cartão foi para sua pessoa.'
  String get textNoName => 'O cartão foi para sua pessoa.';

  /// pt: 'Pronto'
  String get done => 'Pronto';
}

// Path: unpair.done
class Translations$unpair$done$pt {
  Translations$unpair$done$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Desvinculado'
  String get title => 'Desvinculado';

  /// pt: 'Desvinculado'
  String get highlight => 'Desvinculado';

  /// pt: 'Seus próprios dados continuam seus.'
  String get text => 'Seus próprios dados continuam seus.';

  /// pt: 'Guardar uma cópia dos itens compartilhados'
  String get keepOption => 'Guardar uma cópia dos itens compartilhados';

  /// pt: 'Apagar itens compartilhados'
  String get deleteOption => 'Apagar itens compartilhados';

  /// pt: 'O Plus que cobria o parceiro termina.'
  String get plusNote => 'O Plus que cobria o parceiro termina.';

  /// pt: 'Continuar'
  String get continueLabel => 'Continuar';
}

// Path: unpair.relationship
class Translations$unpair$relationship$pt {
  Translations$unpair$relationship$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Relacionamento'
  String get title => 'Relacionamento';

  /// pt: 'Desvincular da {name}'
  String unpair({required Object name}) => 'Desvincular da ${name}';

  /// pt: 'A relação terminou'
  String get ended => 'A relação terminou';
}

// Path: unpair.breakup
class Translations$unpair$breakup$pt {
  Translations$unpair$breakup$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Terminamos'
  String get appBarTitle => 'Terminamos';

  /// pt: 'Sinto muito'
  String get title => 'Sinto muito';

  /// pt: 'muito'
  String get highlight => 'muito';

  /// pt: 'Você decide o que guardar. Nada é apagado sem você querer.'
  String get text => 'Você decide o que guardar. Nada é apagado sem você querer.';

  /// pt: 'Cancelar'
  String get cancel => 'Cancelar';

  /// pt: 'Continuar'
  String get continueLabel => 'Continuar';
}

// Path: unpair.partnerNotice
class Translations$unpair$partnerNotice$pt {
  Translations$unpair$partnerNotice$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'A {name} desvinculou'
  String title({required Object name}) => 'A ${name} desvinculou';

  /// pt: 'Seu par desvinculou'
  String get titleNoName => 'Seu par desvinculou';

  /// pt: 'desvinculou'
  String get highlight => 'desvinculou';

  /// pt: 'Seus dados continuam seus. Cartões compartilhados pararam.'
  String get text => 'Seus dados continuam seus. Cartões compartilhados pararam.';

  /// pt: 'Ok'
  String get ok => 'Ok';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'acceptInvite.title' => 'Tem um convite?',
      'acceptInvite.titleHighlight' => 'convite',
      'acceptInvite.subtitle' =>
        'Digite o código que a outra pessoa enviou para vocês se conectarem.',
      'acceptInvite.codeLabel' => 'Código do convite',
      'acceptInvite.codeHint' => 'ABCD2345',
      'acceptInvite.privacyNote' =>
        'Aceitar compartilha cartões e ferramentas. Suas notas privadas continuam privadas.',
      'acceptInvite.accept' => 'Aceitar',
      'acceptInvite.connected.title' => 'Vocês estão conectados',
      'acceptInvite.connected.titleHighlight' => 'conectados',
      'acceptInvite.connected.text' =>
        'Cartões e ferramentas compartilhadas ativos. Tudo que é privado continua privado.',
      'acceptInvite.connected.goToToday' => 'Ir para Hoje',
      'acceptInvite.unusable.title' => 'Esse convite é antigo',
      'acceptInvite.unusable.titleHighlight' => 'antigo',
      'acceptInvite.unusable.text' =>
        'Confira o código ou peça um novo convite para quem convidou.',
      'acceptInvite.unusable.tryAgain' => 'Digitar de novo',
      'acceptInvite.unusable.close' => 'Fechar',
      'acceptInvite.errors.ALREADY_PAIRED' => 'Você já está conectado com alguém.',
      'acceptInvite.errors.COUPLE_FULL' => 'Esse espaço já tem duas pessoas.',
      'acceptInvite.errors.RATE_LIMITED' =>
        'Muitas tentativas seguidas. Espere um pouco e tente de novo.',
      'acceptInvite.errors.NETWORK' => 'Sem conexão. Confira a internet e tente de novo.',
      'acceptInvite.errors.other' => 'Não deu para conectar agora. Tente de novo.',
      'authentication.signInTitle' => 'Entrar',
      'authentication.signInSubtitle' => 'Sem e-mail e senha. Só Apple ou Google.',
      'authentication.signInNote' => 'Entrar leva direto para o seu Hoje.',
      'authentication.existingAccountTitle' => 'Você já tem uma conta',
      'authentication.existingAccountSubtitle' => 'Entre para continuar de onde parou.',
      'authentication.continueWithApple' => 'Continuar com a Apple',
      'authentication.continueWithGoogle' => 'Continuar com o Google',
      'authentication.errors.NETWORK' => 'Sem conexão. Confira a internet e tente de novo.',
      'authentication.errors.other' => 'Não deu para entrar agora. Tente de novo.',
      'cardView.forPartner' => ({required Object name}) => 'Para ${name}',
      'cardView.forPartnerNoName' => 'Para sua pessoa',
      'cardView.goodThings' =>
        ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
          count,
          zero: 'Nenhuma coisa boa ainda',
          one: '1 coisa boa desta semana',
          other: '${count} coisas boas desta semana',
        ),
      'cardView.weekdays.0' => 'seg',
      'cardView.weekdays.1' => 'ter',
      'cardView.weekdays.2' => 'qua',
      'cardView.weekdays.3' => 'qui',
      'cardView.weekdays.4' => 'sex',
      'cardView.weekdays.5' => 'sáb',
      'cardView.weekdays.6' => 'dom',
      'cardView.categories.said' => 'disse algo',
      'cardView.categories.did' => 'fez algo',
      'cardView.categories.noticed' => 'me notou',
      'cardView.categories.helped' => 'me ajudou',
      'cardView.categories.other' => '',
      'cardsList.title' => 'Cartões anteriores',
      'cardsList.dateShort' => ({
        required Object day,
        required Object month,
      }) => '${day} de ${month}',
      'cardsList.monthsShort.0' => 'jan',
      'cardsList.monthsShort.1' => 'fev',
      'cardsList.monthsShort.2' => 'mar',
      'cardsList.monthsShort.3' => 'abr',
      'cardsList.monthsShort.4' => 'mai',
      'cardsList.monthsShort.5' => 'jun',
      'cardsList.monthsShort.6' => 'jul',
      'cardsList.monthsShort.7' => 'ago',
      'cardsList.monthsShort.8' => 'set',
      'cardsList.monthsShort.9' => 'out',
      'cardsList.monthsShort.10' => 'nov',
      'cardsList.monthsShort.11' => 'dez',
      'cardsList.slipCount' =>
        ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
          count,
          zero: 'sem slips',
          one: '1 slip',
          other: '${count} slips',
        ),
      'cardsList.sent' => 'Enviado',
      'cardsList.received' => 'Recebido',
      'cardsList.opened' => 'aberto',
      'cardsList.reacted' => 'reação',
      'cardsList.replied' => 'respondido',
      'cardsList.emptyTitle' => 'Nenhum cartão ainda',
      'cardsList.emptyText' =>
        'Quando um cartão for enviado ou chegar, ele aparece aqui. Sem pressa.',
      'cardsList.errorTitle' => 'Não deu para carregar os cartões',
      'cardsList.errorText' => 'Eles continuam salvos. Tente de novo.',
      'cardsList.detailTitle' => 'Cartão',
      'cardsList.detailErrorTitle' => 'Não deu para abrir o cartão',
      'cardsList.errors.CARD_NOT_FOUND' => 'Esse cartão não está mais disponível.',
      'cardsList.errors.other' => 'Ele continua salvo. Tente de novo.',
      'cardsList.reactionPrompt' => 'Como você quer responder?',
      'cardsList.reactionThankYou' => 'Obrigado',
      'cardsList.reactionHug' => 'Abraço',
      'cardsList.reactionMadeMyDay' => 'Fez minha semana',
      'cardsList.reactionNoted' => 'Anotado',
      'cardsList.reactionError' => 'Não deu para responder agora. Tente de novo.',
      'cardsList.responseReceivedName' => ({required Object name}) => '${name}',
      'cardsList.responseReceivedNoName' => 'Sua pessoa respondeu',
      'cardsList.responseReceivedVerb' => 'respondeu',
      'cardsList.responseQuote' => ({required Object label}) => '“${label}”',
      'cardsList.notFound' => 'Esse cartão não está mais disponível.',
      'cardsList.reactionQuoteMadeMyDay' => 'Isso fez a minha semana.',
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
      'firstSlip.title' => 'Comece com uma coisa boa',
      'firstSlip.titleHighlight' => 'uma coisa boa',
      'firstSlip.subtitle' => 'O que seu parceiro fez ultimamente que te fez sorrir? 30 segundos bastam. Ainda sem conta.',
      'firstSlip.hint' => 'Ex.: fez café antes de eu acordar',
      'firstSlip.localNote' => 'Fica salvo só neste celular.',
      'firstSlip.save' => 'Salvar',
      'firstSlip.saveError' => 'Não deu para guardar agora. Tente de novo.',
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
      'invite.title' => ({required Object name}) => 'Convidar ${name}',
      'invite.titleNoName' => 'Convidar sua pessoa',
      'invite.messageIntro' => 'Esta mensagem será enviada:',
      'invite.message' => ({
        required Object code,
      }) => 'Comecei uma coisa pequena para nós. Para nos conectar no app, use o código ${code}.',
      'invite.expiryNote' => ({
        required Object days,
      }) => 'O convite vale por ${days} dias. Só o último convite criado funciona.',
      'invite.share' => 'Compartilhar convite',
      'invite.copy' => 'Copiar convite',
      'invite.sentTitle' => 'Convite enviado',
      'invite.sentHighlight' => 'enviado',
      'invite.sentText' => ({
        required Object name,
      }) => '${name} ainda não entrou. Enquanto isso, você pode usar o app sozinho.',
      'invite.sentTextNoName' =>
        'Sua pessoa ainda não entrou. Enquanto isso, você pode usar o app sozinho.',
      'invite.resend' => 'Reenviar',
      'invite.revoke' => 'Revogar',
      'invite.errorTitle' => 'Não deu para criar o convite',
      'invite.errors.ALREADY_PAIRED' => 'Você já está conectado com alguém.',
      'invite.errors.RATE_LIMITED' => 'Você criou muitos convites hoje. Tente de novo amanhã.',
      'invite.errors.NETWORK' => 'Sem conexão. Confira a internet e tente de novo.',
      'invite.errors.other' => 'Algo deu errado. Tente de novo.',
      'notFound.title' => '404',
      'notFound.description' => 'Página não encontrada',
      'notFound.buttonBack' => 'Voltar para página inicial',
      'notificationPermission.label' => 'Lembretes',
      'notificationPermission.title' => 'Lembretes gentis?',
      'notificationPermission.titleHighlight' => 'gentis',
      'notificationPermission.pointLimit' => 'No máximo 1 a 2 por dia.',
      'notificationPermission.pointPrivate' => 'Nunca mostram nomes na tela bloqueada.',
      'notificationPermission.pointChoice' => 'Você escolhe o que chega e quando.',
      'notificationPermission.changeLater' => 'Você pode mudar isso quando quiser.',
      'notificationPermission.notNow' => 'Agora não',
      'notificationPermission.allow' => 'Permitir',
      'notificationPermission.offBanner' =>
        'Os lembretes estão desligados. Ligue nas configurações.',
      'notificationPermission.openSettings' => 'Abrir configurações',
      'notificationPermission.close' => 'Fechar',
      'partnerStep.title' => 'Quer trazer seu parceiro?',
      'partnerStep.titleHighlight' => 'parceiro',
      'partnerStep.subtitle' => 'O app funciona sozinho. Você convida quando quiser.',
      'partnerStep.inviteTitle' => 'Enviar um convite',
      'partnerStep.inviteSupport' => 'Sua pessoa entra com um código',
      'partnerStep.aloneTitle' => 'Depois, começar sozinho',
      'partnerStep.aloneSupport' => 'Seus slips ficam só com você',
      'partnerStep.haveCode' => 'Tenho um código de convite',
      'partnerStep.continueButton' => 'Continuar',
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
      'quickSlip.dateLine' => ({
        required Object weekday,
        required Object day,
        required Object month,
      }) => '${weekday}, ${day} de ${month}',
      'quickSlip.weekdays.0' => 'segunda',
      'quickSlip.weekdays.1' => 'terça',
      'quickSlip.weekdays.2' => 'quarta',
      'quickSlip.weekdays.3' => 'quinta',
      'quickSlip.weekdays.4' => 'sexta',
      'quickSlip.weekdays.5' => 'sábado',
      'quickSlip.weekdays.6' => 'domingo',
      'quickSlip.monthsShort.0' => 'jan',
      'quickSlip.monthsShort.1' => 'fev',
      'quickSlip.monthsShort.2' => 'mar',
      'quickSlip.monthsShort.3' => 'abr',
      'quickSlip.monthsShort.4' => 'mai',
      'quickSlip.monthsShort.5' => 'jun',
      'quickSlip.monthsShort.6' => 'jul',
      'quickSlip.monthsShort.7' => 'ago',
      'quickSlip.monthsShort.8' => 'set',
      'quickSlip.monthsShort.9' => 'out',
      'quickSlip.monthsShort.10' => 'nov',
      'quickSlip.monthsShort.11' => 'dez',
      'quickSlip.title' => 'O que te deixou feliz?',
      'quickSlip.titleHighlight' => 'feliz',
      'quickSlip.subtitle' => 'Uma linha basta. 30 segundos.',
      'quickSlip.hint' => 'Ex.: fez café antes de eu acordar',
      'quickSlip.categories.said' => 'Disse algo',
      'quickSlip.categories.did' => 'Fez algo',
      'quickSlip.categories.noticed' => 'Me notou',
      'quickSlip.categories.helped' => 'Me ajudou',
      'quickSlip.categories.other' => '',
      'quickSlip.privacyNote' => 'Fica privado. No domingo você escolhe o que vai para o cartão.',
      'quickSlip.save' => 'Salvar',
      'quickSlip.saved.title' => 'Salvo',
      'quickSlip.saved.added' => 'Slip adicionado a esta semana.',
      'quickSlip.saved.queued' => 'Salvo neste celular. Enviamos quando a conexão voltar.',
      'quickSlip.saved.undoHint' => 'Desfazer por 30 segundos.',
      'quickSlip.saved.undo' => 'Desfazer',
      'quickSlip.saved.done' => 'Pronto',
      'quickSlip.errors.FREE_LIMIT_REACHED' => 'Você chegou ao limite de slips do plano grátis.',
      'quickSlip.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
      'quickSlip.errors.other' =>
        'Não deu para salvar agora. Seu texto continua aqui, tente de novo.',
      'slipsList.title' => 'Slips',
      'slipsList.scopeWeek' => 'Esta semana',
      'slipsList.scopeAll' => 'Todos',
      'slipsList.private' => 'Privado',
      'slipsList.thisWeek' => 'Esta semana',
      'slipsList.lastWeek' => 'Semana passada',
      'slipsList.weekRange' => ({
        required Object start,
        required Object end,
      }) => '${start} – ${end}',
      'slipsList.dateShort' => ({required Object day, required Object month}) => '${day} ${month}',
      'slipsList.dayLine' => ({
        required Object weekday,
        required Object category,
      }) => '${weekday} · ${category}',
      'slipsList.weekdaysShort.0' => 'Seg',
      'slipsList.weekdaysShort.1' => 'Ter',
      'slipsList.weekdaysShort.2' => 'Qua',
      'slipsList.weekdaysShort.3' => 'Qui',
      'slipsList.weekdaysShort.4' => 'Sex',
      'slipsList.weekdaysShort.5' => 'Sáb',
      'slipsList.weekdaysShort.6' => 'Dom',
      'slipsList.monthsShort.0' => 'jan',
      'slipsList.monthsShort.1' => 'fev',
      'slipsList.monthsShort.2' => 'mar',
      'slipsList.monthsShort.3' => 'abr',
      'slipsList.monthsShort.4' => 'mai',
      'slipsList.monthsShort.5' => 'jun',
      'slipsList.monthsShort.6' => 'jul',
      'slipsList.monthsShort.7' => 'ago',
      'slipsList.monthsShort.8' => 'set',
      'slipsList.monthsShort.9' => 'out',
      'slipsList.monthsShort.10' => 'nov',
      'slipsList.monthsShort.11' => 'dez',
      'slipsList.categories.said' => 'Disse algo',
      'slipsList.categories.did' => 'Fez algo',
      'slipsList.categories.noticed' => 'Me notou',
      'slipsList.categories.helped' => 'Ajudou',
      'slipsList.categories.other' => '',
      'slipsList.pastCards' => 'Cartões anteriores',
      'slipsList.emptyTitle' => 'Nada ainda',
      'slipsList.emptyText' => 'Um slip é uma coisa boa, em uma linha.',
      'slipsList.emptyAction' => 'Adicionar um slip',
      'slipsList.errorTitle' => 'Não deu para carregar seus slips',
      'slipsList.errorText' => 'Eles continuam salvos. Tente de novo.',
      'sundayCard.title' => 'Seu cartão',
      'sundayCard.edit' => 'Editar',
      'sundayCard.save' => 'Salvar',
      'sundayCard.cancel' => 'Cancelar',
      'sundayCard.noteLabel' => 'Mensagem final',
      'sundayCard.noteHint' => 'Obrigada por essa semana.',
      'sundayCard.moveUp' => 'Subir',
      'sundayCard.moveDown' => 'Descer',
      'sundayCard.remove' => 'Tirar do cartão',
      'sundayCard.emptyTitle' => 'Semana sem slips',
      'sundayCard.emptyText' => 'Anote uma coisa boa e ela entra no cartão de domingo.',
      'sundayCard.emptyAction' => 'Anotar um slip',
      'sundayCard.errorTitle' => 'Não deu para carregar o cartão',
      'sundayCard.errorText' => 'Seus slips continuam salvos. Tente de novo.',
      'sundayCard.saveError' => 'Não deu para salvar o cartão. Tente de novo.',
      'sundayCard.openFromToday' => 'Ver o rascunho',
      'sundayCard.deliverError' =>
        'Não deu para enviar agora. O cartão continua aqui, tente de novo.',
      'sundayCard.send.action' => 'Enviar',
      'sundayCard.send.invite' => 'Convidar para enviar',
      'sundayCard.send.needsPartner' =>
        'Para enviar o cartão no app, sua pessoa precisa estar conectada.',
      'sundayCard.send.title' => 'Enviar o cartão?',
      'sundayCard.send.text' => ({
        required Object name,
      }) => '${name} recebe agora. Depois de enviado, o cartão não muda.',
      'sundayCard.send.textNoName' =>
        'Sua pessoa recebe agora. Depois de enviado, o cartão não muda.',
      'sundayCard.send.confirm' => 'Enviar',
      'sundayCard.hold.action' => 'Segurar esta semana',
      'sundayCard.hold.title' => 'Segurar esta semana?',
      'sundayCard.hold.text' =>
        'O cartão fica guardado e nada se perde. Você pode enviar quando quiser.',
      'sundayCard.hold.confirm' => 'Segurar',
      'sundayCard.held.title' => 'Retido nesta semana',
      'sundayCard.held.titleHighlight' => 'Retido',
      'sundayCard.held.text' => 'Seu cartão espera. Envie quando estiver pronto. Nada se perde.',
      'sundayCard.held.keepHolding' => 'Continuar retendo',
      'sundayCard.held.sendAnyway' => 'Enviar mesmo assim',
      'sundayCard.sent.title' => 'Enviado',
      'sundayCard.sent.text' => ({required Object name}) => 'O cartão foi para ${name}.',
      'sundayCard.sent.textNoName' => 'O cartão foi para sua pessoa.',
      'sundayCard.sent.done' => 'Pronto',
      'tabs.today' => 'Hoje',
      'tabs.slips' => 'Slips',
      'tabs.together' => 'Juntos',
      'tabs.memories' => 'Memórias',
      'tabs.capture' => 'Novo slip',
      'tabs.soonTitle' => 'Em construção',
      'tabs.soonText' => 'Esta parte do app ainda está sendo preparada.',
      'today.greetingMorning' => ({required Object name}) => 'Bom dia, ${name}',
      'today.greetingAfternoon' => ({required Object name}) => 'Boa tarde, ${name}',
      'today.greetingEvening' => ({required Object name}) => 'Boa noite, ${name}',
      'today.greetingNoName' => 'Olá',
      'today.dateLine' => ({
        required Object weekday,
        required Object day,
        required Object month,
      }) => '${weekday}, ${day} de ${month}',
      'today.weekdays.0' => 'segunda',
      'today.weekdays.1' => 'terça',
      'today.weekdays.2' => 'quarta',
      'today.weekdays.3' => 'quinta',
      'today.weekdays.4' => 'sexta',
      'today.weekdays.5' => 'sábado',
      'today.weekdays.6' => 'domingo',
      'today.months.0' => 'janeiro',
      'today.months.1' => 'fevereiro',
      'today.months.2' => 'março',
      'today.months.3' => 'abril',
      'today.months.4' => 'maio',
      'today.months.5' => 'junho',
      'today.months.6' => 'julho',
      'today.months.7' => 'agosto',
      'today.months.8' => 'setembro',
      'today.months.9' => 'outubro',
      'today.months.10' => 'novembro',
      'today.months.11' => 'dezembro',
      'today.togetherYears' =>
        ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
          count,
          one: '1 ano',
          other: '${count} anos',
        ),
      'today.togetherMonths' =>
        ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
          count,
          one: '1 mês',
          other: '${count} meses',
        ),
      'today.togetherDays' =>
        ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
          count,
          one: '1 dia',
          other: '${count} dias',
        ),
      'today.togetherJoin' => ({
        required Object first,
        required Object second,
      }) => '${first} e ${second}',
      'today.invitePerson' => 'Convidar sua pessoa',
      'today.offline' => 'Sem conexão. Mostrando o que foi salvo.',
      'today.pendingInviteTitle' => 'Convite enviado',
      'today.pendingInviteText' => 'A pessoa ainda não entrou. Reenviar ou revogar.',
      'today.pendingInviteAction' => 'Ver convite',
      'today.answer' => 'Responder',
      'today.slipsThisWeek' =>
        ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
          count,
          zero: 'Nenhum slip esta semana',
          one: '1 slip esta semana',
          other: '${count} slips esta semana',
        ),
      'today.weekHintEmpty' => 'Anote uma coisa boa quando lembrar.',
      'today.weekHint' => 'Seu cartão de domingo vem desses slips.',
      'today.forToday' => 'Para hoje',
      'today.ideaLabel' => 'Ideia do dia',
      'today.slipsThisWeekPrivate' =>
        ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
          count,
          zero: 'Seus slips privados: nenhum esta semana',
          one: 'Seus slips privados: 1 esta semana',
          other: 'Seus slips privados: ${count} esta semana',
        ),
      'today.sundayCardLabel' => 'Cartão de domingo',
      'today.sundayCardTitle' => 'Seu cartão desta semana',
      'today.inviteCardLabel' => 'Convite',
      'today.inviteCardTitle' => ({required Object name}) => 'Convidar ${name}',
      'today.inviteCardTitleNoName' => 'Convidar sua pessoa',
      'today.inviteCardText' => 'Cartões e ferramentas compartilhadas precisam dos dois.',
      'today.privateTag' => 'Só seu',
      'today.privateQuestion' => 'Como foi o seu dia, de verdade?',
      'today.privateHighlight' => 'dia',
      'today.privateAction' => 'Anotar um slip',
      'today.emptyWeekTag' => 'Sem pressa',
      'today.emptyWeekQuestion' => 'Qual foi uma coisa boa hoje?',
      'today.emptyWeekHighlight' => 'boa',
      'today.emptyWeekAction' => 'Anotar um slip',
      'today.nothingReceived' => 'Nenhum cartão novo. Sem pressa.',
      'today.cardReceived' => 'Você recebeu um cartão',
      'today.cardReceivedAction' => 'Ver cartão',
      'today.firstDayLabel' => 'Começando',
      'today.firstDayGreeting' => ({required Object name}) => 'Oi, ${name}',
      'today.firstDaySubtitle' => 'que bom ter você por aqui',
      'today.firstDayTag' => 'Bom começo',
      'today.firstDayTitle' =>
        ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
          count,
          one: 'Você tem 1 slip.',
          other: 'Você tem ${count} slips.',
        ),
      'today.firstDayHighlight' =>
        ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
          count,
          one: '1 slip',
          other: '${count} slips',
        ),
      'today.firstDayText' =>
        'Um slip é uma coisa boa, em uma linha. No domingo eles viram um cartão.',
      'today.firstDayAction' => 'Anotar mais um',
      'today.errorTitle' => 'Não deu para carregar o Hoje',
      'today.errorText' => 'Seus slips estão seguros. Tente de novo.',
      'today.cardReceivedNamed' => ({required Object name}) => '${name} te mandou um cartão',
      'unpair.appBarTitle' => 'Desvincular',
      'unpair.title' => ({required Object name}) => 'Desvincular da ${name}?',
      'unpair.text' => 'Cartões e listas compartilhados param. Suas notas continuam com você.',
      'unpair.confirm' => 'Desvincular',
      'unpair.cancel' => 'Cancelar',
      'unpair.unnamedPartner' => 'sua pessoa',
      'unpair.done.title' => 'Desvinculado',
      'unpair.done.highlight' => 'Desvinculado',
      'unpair.done.text' => 'Seus próprios dados continuam seus.',
      'unpair.done.keepOption' => 'Guardar uma cópia dos itens compartilhados',
      'unpair.done.deleteOption' => 'Apagar itens compartilhados',
      'unpair.done.plusNote' => 'O Plus que cobria o parceiro termina.',
      'unpair.done.continueLabel' => 'Continuar',
      'unpair.relationship.title' => 'Relacionamento',
      'unpair.relationship.unpair' => ({required Object name}) => 'Desvincular da ${name}',
      'unpair.relationship.ended' => 'A relação terminou',
      'unpair.breakup.appBarTitle' => 'Terminamos',
      'unpair.breakup.title' => 'Sinto muito',
      'unpair.breakup.highlight' => 'muito',
      'unpair.breakup.text' => 'Você decide o que guardar. Nada é apagado sem você querer.',
      'unpair.breakup.cancel' => 'Cancelar',
      'unpair.breakup.continueLabel' => 'Continuar',
      'unpair.partnerNotice.title' => ({required Object name}) => 'A ${name} desvinculou',
      'unpair.partnerNotice.titleNoName' => 'Seu par desvinculou',
      'unpair.partnerNotice.highlight' => 'desvinculou',
      'unpair.partnerNotice.text' => 'Seus dados continuam seus. Cartões compartilhados pararam.',
      'unpair.partnerNotice.ok' => 'Ok',
      'unpair.errors.NETWORK' => 'Sem conexão. Confira a internet e tente de novo.',
      'unpair.errors.STILL_PAIRED' => 'A relação ainda está ativa. Tente de novo.',
      'unpair.errors.other' => 'Não deu para desvincular agora. Tente de novo.',
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
