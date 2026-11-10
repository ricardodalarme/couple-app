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
  late final Translations$dateNight$pt dateNight = Translations$dateNight$pt.internal(_root);
  late final Translations$firstSlip$pt firstSlip = Translations$firstSlip$pt.internal(_root);
  late final Translations$ideaDetail$pt ideaDetail = Translations$ideaDetail$pt.internal(_root);
  late final Translations$intro$pt intro = Translations$intro$pt.internal(_root);
  late final Translations$invite$pt invite = Translations$invite$pt.internal(_root);
  late final Translations$logistics$pt logistics = Translations$logistics$pt.internal(_root);
  late final Translations$need$pt need = Translations$need$pt.internal(_root);
  late final Translations$notFound$pt notFound = Translations$notFound$pt.internal(_root);
  late final Translations$notificationPermission$pt notificationPermission =
      Translations$notificationPermission$pt.internal(_root);
  late final Translations$notificationPreferences$pt notificationPreferences =
      Translations$notificationPreferences$pt.internal(_root);
  late final Translations$partnerStep$pt partnerStep = Translations$partnerStep$pt.internal(_root);
  late final Translations$pause$pt pause = Translations$pause$pt.internal(_root);
  late final Translations$profileSetup$pt profileSetup = Translations$profileSetup$pt.internal(
    _root,
  );
  late final Translations$quickSlip$pt quickSlip = Translations$quickSlip$pt.internal(_root);
  late final Translations$received$pt received = Translations$received$pt.internal(_root);
  late final Translations$reminders$pt reminders = Translations$reminders$pt.internal(_root);
  late final Translations$repair$pt repair = Translations$repair$pt.internal(_root);
  late final Translations$rituals$pt rituals = Translations$rituals$pt.internal(_root);
  late final Translations$slipDetail$pt slipDetail = Translations$slipDetail$pt.internal(_root);
  late final Translations$slipKind$pt slipKind = Translations$slipKind$pt.internal(_root);
  late final Translations$slipsList$pt slipsList = Translations$slipsList$pt.internal(_root);
  late final Translations$sundayCard$pt sundayCard = Translations$sundayCard$pt.internal(_root);
  late final Translations$tabs$pt tabs = Translations$tabs$pt.internal(_root);
  late final Translations$temperature$pt temperature = Translations$temperature$pt.internal(_root);
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

// Path: dateNight
class Translations$dateNight$pt {
  Translations$dateNight$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Date night'
  String get title => 'Date night';

  /// pt: 'Ideias para vocês dois, escolhidas juntos.'
  String get subtitle => 'Ideias para vocês dois, escolhidas juntos.';

  /// pt: 'Ex.: piquenique no parque'
  String get hint => 'Ex.: piquenique no parque';

  /// pt: 'Adicionar'
  String get add => 'Adicionar';

  /// pt: 'Guardar'
  String get save => 'Guardar';

  /// pt: 'Próximo encontro'
  String get nextTitle => 'Próximo encontro';

  /// pt: 'Ideias'
  String get ideasTitle => 'Ideias';

  /// pt: 'Para começar'
  String get suggestionsTitle => 'Para começar';

  /// pt: '{day} {month}'
  String plannedFor({required Object day, required Object month}) => '${day} ${month}';

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
  Map<String, String> get planChoices => {
    'today': 'Planejar para hoje',
    'tomorrow': 'Planejar para amanhã',
    'saturday': 'Planejar para sábado',
    'sunday': 'Planejar para domingo',
    'other': '',
  };

  /// pt: 'Já fizemos'
  String get markDone => 'Já fizemos';

  /// pt: 'Voltar para as ideias'
  String get reopen => 'Voltar para as ideias';

  /// pt: 'Feito'
  String get done => 'Feito';

  /// pt: 'Apagar'
  String get delete => 'Apagar';

  /// pt: 'Nenhuma ideia ainda'
  String get emptyTitle => 'Nenhuma ideia ainda';

  /// pt: 'Escreva uma ideia de encontro. Vocês dois veem.'
  String get emptyText => 'Escreva uma ideia de encontro. Vocês dois veem.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Suas ideias continuam salvas. Tente de novo.'
  String get errorText => 'Suas ideias continuam salvas. Tente de novo.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };
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

// Path: ideaDetail
class Translations$ideaDetail$pt {
  Translations$ideaDetail$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Ideia do dia'
  String get label => 'Ideia do dia';

  /// pt: 'Por que esta ideia'
  String get whyTitle => 'Por que esta ideia';

  /// pt: 'Sua fase'
  String get yourPhase => 'Sua fase';

  /// pt: 'Seu objetivo'
  String get yourGoal => 'Seu objetivo';

  /// pt: 'Eu vou fazer'
  String get willDo => 'Eu vou fazer';

  /// pt: 'Anotado. Que bom!'
  String get done => 'Anotado. Que bom!';

  /// pt: 'Outra ideia'
  String get another => 'Outra ideia';

  /// pt: 'Mais tarde'
  String get later => 'Mais tarde';

  /// pt: 'Quando lembrar?'
  String get laterTitle => 'Quando lembrar?';

  /// pt: 'Hoje à noite'
  String get tonight => 'Hoje à noite';

  /// pt: 'Amanhã de manhã'
  String get tomorrow => 'Amanhã de manhã';

  /// pt: 'No fim de semana'
  String get weekend => 'No fim de semana';

  /// pt: 'Combinado. Vamos lembrar com um aviso gentil.'
  String get reminderSet => 'Combinado. Vamos lembrar com um aviso gentil.';

  /// pt: 'Guardamos o lembrete. Ligue as notificações nas configurações para recebê-lo.'
  String get reminderSetNotificationsOff =>
      'Guardamos o lembrete. Ligue as notificações nas configurações para recebê-lo.';

  /// pt: 'Não deu para guardar o lembrete. Tente de novo.'
  String get reminderError => 'Não deu para guardar o lembrete. Tente de novo.';

  /// pt: 'Sem ideias agora'
  String get emptyTitle => 'Sem ideias agora';

  /// pt: 'Volte mais tarde. Enquanto isso, anote um slip.'
  String get emptyText => 'Volte mais tarde. Enquanto isso, anote um slip.';

  /// pt: 'Não deu para carregar a ideia'
  String get errorTitle => 'Não deu para carregar a ideia';

  /// pt: 'Tente de novo em instantes.'
  String get errorText => 'Tente de novo em instantes.';
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

// Path: logistics
class Translations$logistics$pt {
  Translations$logistics$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Logística'
  String get title => 'Logística';

  /// pt: 'As coisas práticas, sem ninguém carregar sozinho.'
  String get subtitle => 'As coisas práticas, sem ninguém carregar sozinho.';

  /// pt: 'Ex.: ligar para o encanador'
  String get hint => 'Ex.: ligar para o encanador';

  /// pt: 'Adicionar'
  String get add => 'Adicionar';

  /// pt: 'Eu'
  String get me => 'Eu';

  /// pt: 'Meu par'
  String get partner => 'Meu par';

  /// pt: 'Nós dois'
  String get both => 'Nós dois';

  /// pt: 'Eu cuido'
  String get assignMe => 'Eu cuido';

  /// pt: 'Apagar'
  String get delete => 'Apagar';

  /// pt: 'Feitas'
  String get doneTitle => 'Feitas';

  /// pt: 'Nada por aqui'
  String get emptyTitle => 'Nada por aqui';

  /// pt: 'Adicione algo prático que vocês precisam resolver.'
  String get emptyText => 'Adicione algo prático que vocês precisam resolver.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'A lista continua salva. Tente de novo.'
  String get errorText => 'A lista continua salva. Tente de novo.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };
}

// Path: need
class Translations$need$pt {
  Translations$need$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Preciso de…'
  String get title => 'Preciso de…';

  /// pt: 'Preciso'
  String get titleHighlight => 'Preciso';

  /// pt: 'Escolha uma coisa. Seu par recebe um aviso gentil, sem cobrança.'
  String get subtitle => 'Escolha uma coisa. Seu par recebe um aviso gentil, sem cobrança.';

  Map<String, String> get options => {
    'hug': 'Um abraço',
    'talk': 'Conversar',
    'help_home': 'Ajuda em casa',
    'quiet': 'Um tempo quieta',
    'time_together': 'Tempo juntos',
    'rest': 'Descansar',
    'other': '',
  };

  /// pt: 'Não é uma exigência. É só um jeito simples de pedir.'
  String get note => 'Não é uma exigência. É só um jeito simples de pedir.';

  /// pt: 'Enviar'
  String get send => 'Enviar';

  late final Translations$need$sent$pt sent = Translations$need$sent$pt.internal(_root);
  Map<String, String> get errors => {
    'NOT_PAIRED': 'Para enviar, você precisa estar com seu par no app.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para enviar agora. Tente de novo.',
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

// Path: notificationPreferences
class Translations$notificationPreferences$pt {
  Translations$notificationPreferences$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Notificações'
  String get title => 'Notificações';

  /// pt: 'Escolha o que chega e quando. Nada de cobrança.'
  String get subtitle => 'Escolha o que chega e quando. Nada de cobrança.';

  /// pt: 'As notificações estão desligadas neste celular. Suas escolhas valem quando você ligar.'
  String get systemOff =>
      'As notificações estão desligadas neste celular. Suas escolhas valem quando você ligar.';

  /// pt: 'Abrir configurações'
  String get openSystem => 'Abrir configurações';

  /// pt: 'Receber notificações'
  String get all => 'Receber notificações';

  /// pt: 'Desligue para pausar tudo.'
  String get allText => 'Desligue para pausar tudo.';

  /// pt: 'O que você quer receber'
  String get typesTitle => 'O que você quer receber';

  Map<String, String> get types => {
    'card_ready': 'Cartão pronto',
    'card_received': 'Cartão recebido',
    'card_reaction': 'Resposta ao seu cartão',
    'daily_idea': 'Ideia do dia',
    'date_coming': 'Datas chegando',
    'other': '',
  };

  /// pt: 'Horas de silêncio'
  String get quietTitle => 'Horas de silêncio';

  /// pt: 'Lembretes esperam até o silêncio acabar.'
  String get quietText => 'Lembretes esperam até o silêncio acabar.';

  /// pt: 'Começa às'
  String get quietStart => 'Começa às';

  /// pt: 'Termina às'
  String get quietEnd => 'Termina às';

  /// pt: 'O silêncio atravessa a madrugada.'
  String get quietOvernight => 'O silêncio atravessa a madrugada.';

  /// pt: 'Cartão de domingo'
  String get cardTitle => 'Cartão de domingo';

  /// pt: 'Dia'
  String get cardDay => 'Dia';

  /// pt: 'Horário'
  String get cardHour => 'Horário';

  List<String> get days => ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'];

  /// pt: '{hour}:00'
  String hourFormat({required Object hour}) => '${hour}:00';

  /// pt: 'Como a notificação aparece'
  String get previewTitle => 'Como a notificação aparece';

  /// pt: 'Sempre curta e sem detalhes pessoais.'
  String get previewText => 'Sempre curta e sem detalhes pessoais.';

  /// pt: 'Não deu para abrir suas preferências'
  String get loadErrorTitle => 'Não deu para abrir suas preferências';

  /// pt: 'Elas continuam salvas. Tente de novo.'
  String get loadErrorText => 'Elas continuam salvas. Tente de novo.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para salvar agora. Sua escolha anterior foi mantida.',
  };
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

// Path: pause
class Translations$pause$pt {
  Translations$pause$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Pedir um tempo'
  String get title => 'Pedir um tempo';

  /// pt: 'tempo'
  String get titleHighlight => 'tempo';

  /// pt: 'Uma mensagem curta e gentil. Seu par vê só o que você escrever.'
  String get subtitle => 'Uma mensagem curta e gentil. Seu par vê só o que você escrever.';

  Map<String, String> get presets => {
    'space': 'Preciso de um tempo para respirar. Volto logo.',
    'later': 'Vamos conversar mais tarde, com calma?',
    'calm': 'Quero te ouvir bem. Preciso me acalmar antes.',
    'other': '',
  };

  /// pt: 'Escrever a minha'
  String get hint => 'Escrever a minha';

  /// pt: 'Volto em'
  String get returnTitle => 'Volto em';

  Map<String, String> get returns => {
    'oneHour': '1 hora',
    'threeHours': '3 horas',
    'eightHours': '8 horas',
    'tomorrow': 'Amanhã',
    'other': '',
  };

  /// pt: 'Os dois veem o Hoje em pausa. Você pode voltar quando quiser.'
  String get note => 'Os dois veem o Hoje em pausa. Você pode voltar quando quiser.';

  /// pt: 'Enviar e pausar'
  String get send => 'Enviar e pausar';

  /// pt: 'Pausa enviada'
  String get sentTitle => 'Pausa enviada';

  /// pt: 'O Hoje fica em pausa para os dois. Quando estiver pronto(a), volte por lá.'
  String get sentText =>
      'O Hoje fica em pausa para os dois. Quando estiver pronto(a), volte por lá.';

  /// pt: 'Pronto'
  String get done => 'Pronto';

  Map<String, String> get errors => {
    'INVALID_RETURN_TIME': 'Esse horário de volta não vale. Escolha outro.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para enviar agora. Sua mensagem continua aqui.',
  };
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

// Path: received
class Translations$received$pt {
  Translations$received$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  Map<String, String> get kinds => {
    'repair': 'Cartão de reparo',
    'need': 'Preciso de…',
    'miss_us': 'Saudade',
    'hug': 'Um abraço',
    'distance': 'Um pouco de distância',
    'heavy_day': 'Um dia pesado',
    'good_news': 'Boa notícia',
    'other': '',
  };

  /// pt: 'Do seu par'
  String get fromPartner => 'Do seu par';

  /// pt: 'Sua resposta é privada primeiro. Não tem certo nem errado.'
  String get privateFirst => 'Sua resposta é privada primeiro. Não tem certo nem errado.';

  Map<String, String> get responses => {
    'talk': 'Sim, vamos conversar',
    'more_time': 'Preciso de mais um tempo',
    'later': 'Respondo depois',
    'other': '',
  };

  /// pt: 'Entendi'
  String get seen => 'Entendi';

  /// pt: 'Tudo certo'
  String get doneTitle => 'Tudo certo';

  /// pt: 'Obrigado por ler com calma.'
  String get doneText => 'Obrigado por ler com calma.';

  /// pt: 'Nada novo'
  String get emptyTitle => 'Nada novo';

  /// pt: 'Quando seu par mandar algo, aparece aqui.'
  String get emptyText => 'Quando seu par mandar algo, aparece aqui.';

  /// pt: 'Fechar'
  String get close => 'Fechar';

  /// pt: 'Não deu para abrir'
  String get errorTitle => 'Não deu para abrir';

  /// pt: 'Nada se perdeu. Tente de novo.'
  String get errorText => 'Nada se perdeu. Tente de novo.';

  Map<String, String> get errors => {
    'NOT_FOUND': 'Essa mensagem não está mais aqui.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para responder agora. Tente de novo.',
  };
}

// Path: reminders
class Translations$reminders$pt {
  Translations$reminders$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Repara'
  String get title => 'Repara';

  /// pt: 'Uma ideia pequena para hoje.'
  String get dailyIdea => 'Uma ideia pequena para hoje.';

  /// pt: 'Uma data está chegando.'
  String get dates => 'Uma data está chegando.';

  /// pt: 'Seu cartão está pronto.'
  String get weeklyCard => 'Seu cartão está pronto.';

  /// pt: 'Abra o app para ver.'
  String get discreet => 'Abra o app para ver.';
}

// Path: repair
class Translations$repair$pt {
  Translations$repair$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$repair$calm$pt calm = Translations$repair$calm$pt.internal(_root);
  late final Translations$repair$softStart$pt softStart = Translations$repair$softStart$pt.internal(
    _root,
  );
  late final Translations$repair$quick$pt quick = Translations$repair$quick$pt.internal(_root);
  late final Translations$repair$guided$pt guided = Translations$repair$guided$pt.internal(_root);
  late final Translations$repair$learning$pt learning = Translations$repair$learning$pt.internal(
    _root,
  );
  late final Translations$repair$next$pt next = Translations$repair$next$pt.internal(_root);
}

// Path: rituals
class Translations$rituals$pt {
  Translations$rituals$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Rituais'
  String get title => 'Rituais';

  /// pt: 'Pequenos hábitos que vocês querem proteger. Sem sequências, sem cobrança.'
  String get subtitle =>
      'Pequenos hábitos que vocês querem proteger. Sem sequências, sem cobrança.';

  /// pt: 'Nenhum ritual ainda'
  String get emptyTitle => 'Nenhum ritual ainda';

  /// pt: 'Um jantar de sexta, uma caminhada de domingo. O que vocês querem proteger?'
  String get emptyText =>
      'Um jantar de sexta, uma caminhada de domingo. O que vocês querem proteger?';

  /// pt: 'Criar um ritual'
  String get create => 'Criar um ritual';

  /// pt: 'Fizemos'
  String get didIt => 'Fizemos';

  /// pt: 'Que bom. Um momento de vocês.'
  String get warm => 'Que bom. Um momento de vocês.';

  Map<String, String> get cadences => {
    'daily': 'Todo dia',
    'weekly': 'Toda semana',
    'biweekly': 'A cada duas semanas',
    'monthly': 'Todo mês',
    'other': '',
  };

  /// pt: '{cadence}, {weekday}'
  String cadenceOn({required Object cadence, required Object weekday}) => '${cadence}, ${weekday}';

  List<String> get weekdays => [
    'domingo',
    'segunda',
    'terça',
    'quarta',
    'quinta',
    'sexta',
    'sábado',
  ];

  /// pt: 'Novo ritual'
  String get createTitle => 'Novo ritual';

  /// pt: 'Seu ritual'
  String get editTitle => 'Seu ritual';

  /// pt: 'Nome'
  String get nameLabel => 'Nome';

  /// pt: 'Ex.: jantar de sexta'
  String get nameHint => 'Ex.: jantar de sexta';

  /// pt: 'Com que frequência'
  String get cadenceLabel => 'Com que frequência';

  /// pt: 'Em que dia'
  String get weekdayLabel => 'Em que dia';

  /// pt: 'Que horas'
  String get hourLabel => 'Que horas';

  /// pt: '{hour}:00'
  String hourFormat({required Object hour}) => '${hour}:00';

  /// pt: 'Lembrete'
  String get reminderTitle => 'Lembrete';

  /// pt: 'Um aviso curto neste celular, sem detalhes.'
  String get reminderText => 'Um aviso curto neste celular, sem detalhes.';

  /// pt: 'Salvar'
  String get save => 'Salvar';

  /// pt: 'Arquivar'
  String get archive => 'Arquivar';

  /// pt: 'Arquivar este ritual?'
  String get archiveTitle => 'Arquivar este ritual?';

  /// pt: 'Ele some da lista. O histórico fica guardado.'
  String get archiveText => 'Ele some da lista. O histórico fica guardado.';

  /// pt: 'Não deu para abrir'
  String get errorTitle => 'Não deu para abrir';

  /// pt: 'Nada se perdeu. Tente de novo.'
  String get errorText => 'Nada se perdeu. Tente de novo.';

  Map<String, String> get errors => {
    'NOT_FOUND': 'Esse ritual não está mais aqui.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };
}

// Path: slipDetail
class Translations$slipDetail$pt {
  Translations$slipDetail$pt.internal(this._root);

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
  Map<String, String> get kinds => {
    'quick': 'Rápido',
    'specific': 'Específico',
    'if_then': 'Se… então',
    'invisible': 'Invisível',
    'other': '',
  };

  /// pt: 'Só você vê este slip.'
  String get private => 'Só você vê este slip.';

  /// pt: 'Arquivado'
  String get archived => 'Arquivado';

  /// pt: 'Como você se sentiu'
  String get feeling => 'Como você se sentiu';

  /// pt: 'Então eu…'
  String get plan => 'Então eu…';

  /// pt: 'Quem vê isto'
  String get cardTitle => 'Quem vê isto';

  /// pt: 'Só eu'
  String get cardOff => 'Só eu';

  /// pt: 'Fica na sua semana e não entra no cartão.'
  String get cardOffText => 'Fica na sua semana e não entra no cartão.';

  /// pt: 'Pode entrar no cartão'
  String get cardOn => 'Pode entrar no cartão';

  /// pt: 'No domingo você escolhe se ele vai.'
  String get cardOnText => 'No domingo você escolhe se ele vai.';

  /// pt: 'Slips invisíveis nunca entram em um cartão.'
  String get cardInvisible => 'Slips invisíveis nunca entram em um cartão.';

  /// pt: 'O que seu par leria'
  String get previewTitle => 'O que seu par leria';

  /// pt: 'Se este slip entrar no cartão, é este texto que aparece.'
  String get previewText => 'Se este slip entrar no cartão, é este texto que aparece.';

  /// pt: 'Este slip já foi em um cartão. O cartão enviado guarda a cópia de antes, mesmo que você edite ou apague aqui.'
  String get sentNote =>
      'Este slip já foi em um cartão. O cartão enviado guarda a cópia de antes, mesmo que você edite ou apague aqui.';

  /// pt: 'Editar'
  String get edit => 'Editar';

  /// pt: 'Salvar'
  String get editSave => 'Salvar';

  /// pt: 'Cancelar'
  String get editCancel => 'Cancelar';

  /// pt: 'Arquivar'
  String get archive => 'Arquivar';

  /// pt: 'Restaurar'
  String get restore => 'Restaurar';

  /// pt: 'Apagar'
  String get delete => 'Apagar';

  /// pt: 'Apagar este slip?'
  String get deleteTitle => 'Apagar este slip?';

  /// pt: 'Será removido da sua semana e da linha do tempo.'
  String get deleteText => 'Será removido da sua semana e da linha do tempo.';

  /// pt: 'Apagar'
  String get deleteConfirm => 'Apagar';

  /// pt: 'Salvo'
  String get saved => 'Salvo';

  /// pt: 'Arquivado'
  String get archivedToast => 'Arquivado';

  /// pt: 'Slip apagado'
  String get deleted => 'Slip apagado';

  /// pt: 'Este slip não existe mais'
  String get notFoundTitle => 'Este slip não existe mais';

  /// pt: 'Ele pode ter sido apagado.'
  String get notFoundText => 'Ele pode ter sido apagado.';

  /// pt: 'Não deu para abrir este slip'
  String get errorTitle => 'Não deu para abrir este slip';

  /// pt: 'Ele continua salvo. Tente de novo.'
  String get errorText => 'Ele continua salvo. Tente de novo.';

  Map<String, String> get errors => {
    'SLIP_NOT_FOUND': 'Este slip não existe mais.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };
}

// Path: slipKind
class Translations$slipKind$pt {
  Translations$slipKind$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Outras formas de registrar'
  String get switcherTitle => 'Outras formas de registrar';

  /// pt: 'Preciso de…'
  String get needEntry => 'Preciso de…';

  Map<String, String> get kinds => {
    'specific': 'Específico',
    'if_then': 'Se… então',
    'invisible': 'Invisível',
    'other': '',
  };
  late final Translations$slipKind$specific$pt specific =
      Translations$slipKind$specific$pt.internal(_root);
  late final Translations$slipKind$ifThen$pt ifThen = Translations$slipKind$ifThen$pt.internal(
    _root,
  );
  late final Translations$slipKind$invisible$pt invisible =
      Translations$slipKind$invisible$pt.internal(_root);
  Map<String, String> get workAreas => {
    'planning': 'Planejar',
    'dates': 'Datas',
    'kitchen': 'Cozinha',
    'cleaning': 'Limpeza',
    'kids': 'Filhos',
    'emotional': 'Emocional',
    'finances': 'Finanças',
    'other': 'Outro',
  };

  /// pt: 'Salvar'
  String get save => 'Salvar';

  late final Translations$slipKind$saved$pt saved = Translations$slipKind$saved$pt.internal(_root);
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

  /// pt: 'Juntos'
  String get segmentTogether => 'Juntos';

  /// pt: 'Para mim'
  String get segmentForMe => 'Para mim';

  /// pt: 'PRÁTICO'
  String get logisticsLabel => 'PRÁTICO';

  /// pt: 'Logística'
  String get logisticsTitle => 'Logística';

  /// pt: 'As coisas práticas, sem ninguém carregar sozinho.'
  String get logisticsText => 'As coisas práticas, sem ninguém carregar sozinho.';

  /// pt: 'Quando seu par entrar, as coisas compartilhadas aparecem aqui.'
  String get soloNote => 'Quando seu par entrar, as coisas compartilhadas aparecem aqui.';

  /// pt: 'ROTINA'
  String get ritualsLabel => 'ROTINA';

  /// pt: 'Rituais'
  String get ritualsTitle => 'Rituais';

  /// pt: 'Pequenos hábitos que vocês querem proteger.'
  String get ritualsText => 'Pequenos hábitos que vocês querem proteger.';

  /// pt: 'ENCONTRO'
  String get dateNightLabel => 'ENCONTRO';

  /// pt: 'Date night'
  String get dateNightTitle => 'Date night';

  /// pt: 'Ideias para vocês dois, escolhidas juntos.'
  String get dateNightText => 'Ideias para vocês dois, escolhidas juntos.';

  /// pt: 'ENTRE VOCÊS'
  String get temperatureLabel => 'ENTRE VOCÊS';

  /// pt: 'Como está entre vocês?'
  String get temperatureTitle => 'Como está entre vocês?';

  /// pt: 'Um registro privado, sem nota.'
  String get temperatureText => 'Um registro privado, sem nota.';

  /// pt: 'SÓ PARA VOCÊ'
  String get learningLabel => 'SÓ PARA VOCÊ';

  /// pt: 'O que você aprendeu'
  String get learningTitle => 'O que você aprendeu';

  /// pt: 'Anotações privadas que você pode apagar.'
  String get learningText => 'Anotações privadas que você pode apagar.';
}

// Path: temperature
class Translations$temperature$pt {
  Translations$temperature$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Como está entre vocês?'
  String get levelTitle => 'Como está entre vocês?';

  /// pt: 'entre vocês'
  String get levelHighlight => 'entre vocês';

  /// pt: 'Privado. Nunca vira nota.'
  String get levelNote => 'Privado. Nunca vira nota.';

  Map<String, String> get levels => {
    'good': 'Bem',
    'so_so': 'Mais ou menos',
    'turbulent': 'Turbulento',
    'fight': 'Uma briga',
    'other': '',
  };

  /// pt: 'Continuar'
  String get continueAction => 'Continuar';

  /// pt: 'Voltar'
  String get back => 'Voltar';

  /// pt: 'Agora não'
  String get skip => 'Agora não';

  /// pt: 'Qual a intensidade?'
  String get intensityTitle => 'Qual a intensidade?';

  /// pt: 'intensidade'
  String get intensityHighlight => 'intensidade';

  /// pt: 'Abaixo de 7 dá para conversar. Acima de 7, faça uma pausa primeiro.'
  String get intensityHint => 'Abaixo de 7 dá para conversar. Acima de 7, faça uma pausa primeiro.';

  /// pt: 'Valor alto: que tal uma pausa antes?'
  String get intensityHigh => 'Valor alto: que tal uma pausa antes?';

  /// pt: 'Fraca'
  String get intensityLow => 'Fraca';

  /// pt: 'Muito forte'
  String get intensityTop => 'Muito forte';

  /// pt: 'Intensidade'
  String get intensityLabel => 'Intensidade';

  late final Translations$temperature$result$pt result =
      Translations$temperature$result$pt.internal(_root);
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para salvar agora. Suas respostas continuam aqui.',
  };
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

  /// pt: 'Você pediu um tempo'
  String get pauseOwnTitle => 'Você pediu um tempo';

  /// pt: 'Você volta por volta das {time}. Nada para fazer agora.'
  String pauseOwnText({required Object time}) =>
      'Você volta por volta das ${time}. Nada para fazer agora.';

  /// pt: 'Seu par pediu um tempo'
  String get pausePartnerTitle => 'Seu par pediu um tempo';

  /// pt: 'Sem pressa. Não tem nada para fazer agora.'
  String get pausePartnerText => 'Sem pressa. Não tem nada para fazer agora.';

  /// pt: 'Seu par te mandou uma mensagem'
  String get signalReceived => 'Seu par te mandou uma mensagem';

  /// pt: 'Ver'
  String get signalReceivedAction => 'Ver';

  /// pt: 'Voltar agora'
  String get pauseBack => 'Voltar agora';

  /// pt: 'Voltar e fazer um reparo'
  String get pauseBackRepair => 'Voltar e fazer um reparo';

  /// pt: 'Anotar um slip'
  String get pauseWriteSlip => 'Anotar um slip';
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

// Path: need.sent
class Translations$need$sent$pt {
  Translations$need$sent$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Enviado'
  String get title => 'Enviado';

  /// pt: 'Seu par vai ver quando abrir o app.'
  String get text => 'Seu par vai ver quando abrir o app.';

  /// pt: 'Pronto'
  String get done => 'Pronto';
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

// Path: repair.calm
class Translations$repair$calm$pt {
  Translations$repair$calm$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Um momento para respirar'
  String get title => 'Um momento para respirar';

  /// pt: 'respirar'
  String get titleHighlight => 'respirar';

  /// pt: 'Inspire devagar por 4. Solte devagar por 6. Repita no seu ritmo.'
  String get cadence => 'Inspire devagar por 4. Solte devagar por 6. Repita no seu ritmo.';

  /// pt: 'Não tem pressa e não tem tempo contado. Saia quando quiser.'
  String get text => 'Não tem pressa e não tem tempo contado. Saia quando quiser.';

  /// pt: 'Estou mais calmo(a)'
  String get ready => 'Estou mais calmo(a)';

  /// pt: 'Sair'
  String get leave => 'Sair';

  /// pt: 'Pedir um tempo ao meu par'
  String get askPause => 'Pedir um tempo ao meu par';
}

// Path: repair.softStart
class Translations$repair$softStart$pt {
  Translations$repair$softStart$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Comece com suavidade'
  String get title => 'Comece com suavidade';

  /// pt: 'suavidade'
  String get titleHighlight => 'suavidade';

  /// pt: 'Um modelo sem culpa para abrir a conversa.'
  String get subtitle => 'Um modelo sem culpa para abrir a conversa.';

  /// pt: 'Eu sinto…'
  String get feeling => 'Eu sinto…';

  /// pt: 'Ex.: cansado(a)'
  String get feelingHint => 'Ex.: cansado(a)';

  /// pt: 'Quando…'
  String get situation => 'Quando…';

  /// pt: 'Ex.: a louça fica para depois'
  String get situationHint => 'Ex.: a louça fica para depois';

  /// pt: 'Eu preciso de…'
  String get need => 'Eu preciso de…';

  /// pt: 'Ex.: um pouco de ajuda'
  String get needHint => 'Ex.: um pouco de ajuda';

  /// pt: 'Eu sinto {feeling} quando {situation}. Eu preciso de {need}.'
  String template({required Object feeling, required Object situation, required Object need}) =>
      'Eu sinto ${feeling} quando ${situation}. Eu preciso de ${need}.';

  /// pt: 'Usar este modelo'
  String get use => 'Usar este modelo';
}

// Path: repair.quick
class Translations$repair$quick$pt {
  Translations$repair$quick$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Um pequeno reparo'
  String get title => 'Um pequeno reparo';

  /// pt: 'reparo'
  String get titleHighlight => 'reparo';

  /// pt: 'Um toque envia. Você pode mudar o texto antes.'
  String get subtitle => 'Um toque envia. Você pode mudar o texto antes.';

  Map<String, String> get presets => {
    'tone': 'Desculpa pelo meu tom.',
    'restart': 'Podemos recomeçar?',
    'five_minutes': 'Preciso de cinco minutos.',
    'love': 'Eu te amo, mesmo agora.',
    'other': '',
  };

  /// pt: 'Escrever o meu'
  String get hint => 'Escrever o meu';

  /// pt: 'Enviar'
  String get send => 'Enviar';

  /// pt: 'Enviado'
  String get sentTitle => 'Enviado';

  /// pt: 'Seu par vai ver quando abrir o app.'
  String get sentText => 'Seu par vai ver quando abrir o app.';

  /// pt: 'Pronto'
  String get done => 'Pronto';

  Map<String, String> get errors => {
    'NOT_PAIRED': 'Para enviar, você precisa estar com seu par no app.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para enviar agora. Sua mensagem continua aqui.',
  };
}

// Path: repair.guided
class Translations$repair$guided$pt {
  Translations$repair$guided$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Passo {current} de {total}'
  String stepOf({required Object current, required Object total}) => 'Passo ${current} de ${total}';

  List<String> get stepTitles => [
    'O que aconteceu?',
    'Do que você precisa?',
    'O que você pode oferecer?',
  ];
  List<String> get stepHighlights => ['aconteceu', 'precisa', 'oferecer'];
  List<String> get stepHints => [
    'Do seu jeito, sem culpar ninguém.',
    'Uma coisa que ajudaria agora.',
    'Algo pequeno e sincero.',
  ];

  /// pt: 'Só você vê isto. Nada é enviado ao seu par.'
  String get private => 'Só você vê isto. Nada é enviado ao seu par.';

  /// pt: 'Continuar'
  String get next => 'Continuar';

  /// pt: 'Voltar'
  String get back => 'Voltar';

  /// pt: 'Guardar para depois'
  String get later => 'Guardar para depois';

  /// pt: 'Guardado. Você continua de onde parou.'
  String get savedLater => 'Guardado. Você continua de onde parou.';

  /// pt: 'Como você está agora?'
  String get finalTitle => 'Como você está agora?';

  /// pt: 'agora'
  String get finalHighlight => 'agora';

  Map<String, String> get feelings => {
    'calmer': 'Mais calmo(a)',
    'still_tense': 'Ainda tenso(a)',
    'need_more_time': 'Preciso de mais tempo',
    'other': '',
  };

  /// pt: 'Quer um lembrete para ver como estão?'
  String get followUpTitle => 'Quer um lembrete para ver como estão?';

  Map<String, String> get followUps => {
    'none': 'Não precisa',
    'tomorrow': 'Amanhã',
    'inThreeDays': 'Em 3 dias',
    'other': '',
  };

  /// pt: 'O lembrete é curto e não diz nada sobre o que aconteceu.'
  String get followUpNote => 'O lembrete é curto e não diz nada sobre o que aconteceu.';

  /// pt: 'Concluir'
  String get finish => 'Concluir';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para salvar agora. Suas respostas continuam aqui.',
  };

  /// pt: 'Não deu para abrir'
  String get loadErrorTitle => 'Não deu para abrir';

  /// pt: 'Nada se perdeu. Tente de novo.'
  String get loadErrorText => 'Nada se perdeu. Tente de novo.';
}

// Path: repair.learning
class Translations$repair$learning$pt {
  Translations$repair$learning$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'O que você aprendeu?'
  String get title => 'O que você aprendeu?';

  /// pt: 'aprendeu'
  String get titleHighlight => 'aprendeu';

  /// pt: 'Fica só com você e pode ser apagado quando quiser.'
  String get subtitle => 'Fica só com você e pode ser apagado quando quiser.';

  Map<String, String> get kinds => {
    'trigger': 'O que me incomoda',
    'need': 'O que eu preciso',
    'good_fix': 'O que ajudou',
    'other': '',
  };

  /// pt: 'Escreva em uma ou duas frases'
  String get hint => 'Escreva em uma ou duas frases';

  /// pt: 'Salvar'
  String get save => 'Salvar';

  /// pt: 'Seus aprendizados'
  String get listTitle => 'Seus aprendizados';

  /// pt: 'Apagar'
  String get delete => 'Apagar';

  /// pt: 'Nada ainda'
  String get emptyTitle => 'Nada ainda';

  /// pt: 'Quando você escrever um aprendizado, ele aparece aqui.'
  String get emptyText => 'Quando você escrever um aprendizado, ele aparece aqui.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Seus aprendizados continuam salvos. Tente de novo.'
  String get errorText => 'Seus aprendizados continuam salvos. Tente de novo.';

  /// pt: 'Pronto'
  String get done => 'Pronto';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para salvar agora. Seu texto continua aqui.',
  };
}

// Path: repair.next
class Translations$repair$next$pt {
  Translations$repair$next$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Respirar um pouco'
  String get pause => 'Respirar um pouco';

  /// pt: 'Começar o reparo guiado'
  String get guided => 'Começar o reparo guiado';

  /// pt: 'Enviar um reparo'
  String get quick => 'Enviar um reparo';
}

// Path: slipKind.specific
class Translations$slipKind$specific$pt {
  Translations$slipKind$specific$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'O que exatamente ele fez?'
  String get title => 'O que exatamente ele fez?';

  /// pt: 'exatamente'
  String get titleHighlight => 'exatamente';

  /// pt: 'Detalhes ajudam a lembrar por que importou.'
  String get subtitle => 'Detalhes ajudam a lembrar por que importou.';

  /// pt: 'Ex.: levou o lixo sem eu pedir'
  String get hint => 'Ex.: levou o lixo sem eu pedir';

  /// pt: 'Como você se sentiu?'
  String get feelingLabel => 'Como você se sentiu?';

  /// pt: 'Opcional'
  String get feelingHint => 'Opcional';
}

// Path: slipKind.ifThen
class Translations$slipKind$ifThen$pt {
  Translations$slipKind$ifThen$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Quer contar a ele?'
  String get title => 'Quer contar a ele?';

  /// pt: 'contar'
  String get titleHighlight => 'contar';

  /// pt: 'Um plano pequeno: quando acontecer isto, você faz aquilo.'
  String get subtitle => 'Um plano pequeno: quando acontecer isto, você faz aquilo.';

  /// pt: 'Se…'
  String get ifLabel => 'Se…';

  /// pt: 'Ex.: eu me sentir sobrecarregada'
  String get ifHint => 'Ex.: eu me sentir sobrecarregada';

  /// pt: 'Então…'
  String get thenLabel => 'Então…';

  /// pt: 'Ex.: peço um tempo de 10 minutos'
  String get thenHint => 'Ex.: peço um tempo de 10 minutos';
}

// Path: slipKind.invisible
class Translations$slipKind$invisible$pt {
  Translations$slipKind$invisible$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Coisas que ninguém percebe'
  String get title => 'Coisas que ninguém percebe';

  /// pt: 'ninguém percebe'
  String get titleHighlight => 'ninguém percebe';

  /// pt: 'Só para você. Isto nunca vai para o cartão.'
  String get subtitle => 'Só para você. Isto nunca vai para o cartão.';

  /// pt: 'Ex.: lembrei da consulta das crianças'
  String get hint => 'Ex.: lembrei da consulta das crianças';

  /// pt: 'Que tipo de trabalho?'
  String get areaLabel => 'Que tipo de trabalho?';

  /// pt: 'Fica só com você, não entra em nenhum cartão.'
  String get private => 'Fica só com você, não entra em nenhum cartão.';
}

// Path: slipKind.saved
class Translations$slipKind$saved$pt {
  Translations$slipKind$saved$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Salvo'
  String get title => 'Salvo';

  /// pt: 'Registrado.'
  String get added => 'Registrado.';

  /// pt: 'Salvo neste celular. Enviamos quando a conexão voltar.'
  String get queued => 'Salvo neste celular. Enviamos quando a conexão voltar.';

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

// Path: temperature.result
class Translations$temperature$result$pt {
  Translations$temperature$result$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$temperature$result$good$pt good =
      Translations$temperature$result$good$pt.internal(_root);
  late final Translations$temperature$result$pause$pt pause =
      Translations$temperature$result$pause$pt.internal(_root);
  late final Translations$temperature$result$guided$pt guided =
      Translations$temperature$result$guided$pt.internal(_root);
  late final Translations$temperature$result$quick$pt quick =
      Translations$temperature$result$quick$pt.internal(_root);

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

// Path: temperature.result.good
class Translations$temperature$result$good$pt {
  Translations$temperature$result$good$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Que bom'
  String get title => 'Que bom';

  /// pt: 'Registrado só para você. Siga o seu dia.'
  String get text => 'Registrado só para você. Siga o seu dia.';
}

// Path: temperature.result.pause
class Translations$temperature$result$pause$pt {
  Translations$temperature$result$pause$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Primeiro, respirar'
  String get title => 'Primeiro, respirar';

  /// pt: 'Quando está muito quente, esperar ajuda. Vale um tempo longe antes de qualquer conversa.'
  String get text =>
      'Quando está muito quente, esperar ajuda. Vale um tempo longe antes de qualquer conversa.';
}

// Path: temperature.result.guided
class Translations$temperature$result$guided$pt {
  Translations$temperature$result$guided$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Dá para conversar com cuidado'
  String get title => 'Dá para conversar com cuidado';

  /// pt: 'Um passo de cada vez, no seu ritmo.'
  String get text => 'Um passo de cada vez, no seu ritmo.';
}

// Path: temperature.result.quick
class Translations$temperature$result$quick$pt {
  Translations$temperature$result$quick$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Um ajuste pequeno basta'
  String get title => 'Um ajuste pequeno basta';

  /// pt: 'Algo leve e rápido pode resolver.'
  String get text => 'Algo leve e rápido pode resolver.';
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
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
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
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
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
          'dateNight.title' => 'Date night',
          'dateNight.subtitle' => 'Ideias para vocês dois, escolhidas juntos.',
          'dateNight.hint' => 'Ex.: piquenique no parque',
          'dateNight.add' => 'Adicionar',
          'dateNight.save' => 'Guardar',
          'dateNight.nextTitle' => 'Próximo encontro',
          'dateNight.ideasTitle' => 'Ideias',
          'dateNight.suggestionsTitle' => 'Para começar',
          'dateNight.plannedFor' => ({
            required Object day,
            required Object month,
          }) => '${day} ${month}',
          'dateNight.monthsShort.0' => 'jan',
          'dateNight.monthsShort.1' => 'fev',
          'dateNight.monthsShort.2' => 'mar',
          'dateNight.monthsShort.3' => 'abr',
          'dateNight.monthsShort.4' => 'mai',
          'dateNight.monthsShort.5' => 'jun',
          'dateNight.monthsShort.6' => 'jul',
          'dateNight.monthsShort.7' => 'ago',
          'dateNight.monthsShort.8' => 'set',
          'dateNight.monthsShort.9' => 'out',
          'dateNight.monthsShort.10' => 'nov',
          'dateNight.monthsShort.11' => 'dez',
          'dateNight.planChoices.today' => 'Planejar para hoje',
          'dateNight.planChoices.tomorrow' => 'Planejar para amanhã',
          'dateNight.planChoices.saturday' => 'Planejar para sábado',
          'dateNight.planChoices.sunday' => 'Planejar para domingo',
          'dateNight.planChoices.other' => '',
          'dateNight.markDone' => 'Já fizemos',
          'dateNight.reopen' => 'Voltar para as ideias',
          'dateNight.done' => 'Feito',
          'dateNight.delete' => 'Apagar',
          'dateNight.emptyTitle' => 'Nenhuma ideia ainda',
          'dateNight.emptyText' => 'Escreva uma ideia de encontro. Vocês dois veem.',
          'dateNight.errorTitle' => 'Não deu para carregar',
          'dateNight.errorText' => 'Suas ideias continuam salvas. Tente de novo.',
          'dateNight.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'dateNight.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'firstSlip.title' => 'Comece com uma coisa boa',
          'firstSlip.titleHighlight' => 'uma coisa boa',
          'firstSlip.subtitle' => 'O que seu parceiro fez ultimamente que te fez sorrir? 30 segundos bastam. Ainda sem conta.',
          'firstSlip.hint' => 'Ex.: fez café antes de eu acordar',
          'firstSlip.localNote' => 'Fica salvo só neste celular.',
          'firstSlip.save' => 'Salvar',
          'firstSlip.saveError' => 'Não deu para guardar agora. Tente de novo.',
          'ideaDetail.label' => 'Ideia do dia',
          'ideaDetail.whyTitle' => 'Por que esta ideia',
          'ideaDetail.yourPhase' => 'Sua fase',
          'ideaDetail.yourGoal' => 'Seu objetivo',
          'ideaDetail.willDo' => 'Eu vou fazer',
          'ideaDetail.done' => 'Anotado. Que bom!',
          'ideaDetail.another' => 'Outra ideia',
          'ideaDetail.later' => 'Mais tarde',
          'ideaDetail.laterTitle' => 'Quando lembrar?',
          'ideaDetail.tonight' => 'Hoje à noite',
          'ideaDetail.tomorrow' => 'Amanhã de manhã',
          'ideaDetail.weekend' => 'No fim de semana',
          'ideaDetail.reminderSet' => 'Combinado. Vamos lembrar com um aviso gentil.',
          'ideaDetail.reminderSetNotificationsOff' =>
            'Guardamos o lembrete. Ligue as notificações nas configurações para recebê-lo.',
          'ideaDetail.reminderError' => 'Não deu para guardar o lembrete. Tente de novo.',
          'ideaDetail.emptyTitle' => 'Sem ideias agora',
          'ideaDetail.emptyText' => 'Volte mais tarde. Enquanto isso, anote um slip.',
          'ideaDetail.errorTitle' => 'Não deu para carregar a ideia',
          'ideaDetail.errorText' => 'Tente de novo em instantes.',
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
          'logistics.title' => 'Logística',
          'logistics.subtitle' => 'As coisas práticas, sem ninguém carregar sozinho.',
          'logistics.hint' => 'Ex.: ligar para o encanador',
          'logistics.add' => 'Adicionar',
          'logistics.me' => 'Eu',
          'logistics.partner' => 'Meu par',
          'logistics.both' => 'Nós dois',
          'logistics.assignMe' => 'Eu cuido',
          'logistics.delete' => 'Apagar',
          'logistics.doneTitle' => 'Feitas',
          'logistics.emptyTitle' => 'Nada por aqui',
          'logistics.emptyText' => 'Adicione algo prático que vocês precisam resolver.',
          'logistics.errorTitle' => 'Não deu para carregar',
          'logistics.errorText' => 'A lista continua salva. Tente de novo.',
          'logistics.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'logistics.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'need.title' => 'Preciso de…',
          'need.titleHighlight' => 'Preciso',
          'need.subtitle' => 'Escolha uma coisa. Seu par recebe um aviso gentil, sem cobrança.',
          'need.options.hug' => 'Um abraço',
          'need.options.talk' => 'Conversar',
          'need.options.help_home' => 'Ajuda em casa',
          'need.options.quiet' => 'Um tempo quieta',
          'need.options.time_together' => 'Tempo juntos',
          'need.options.rest' => 'Descansar',
          'need.options.other' => '',
          'need.note' => 'Não é uma exigência. É só um jeito simples de pedir.',
          'need.send' => 'Enviar',
          'need.sent.title' => 'Enviado',
          'need.sent.text' => 'Seu par vai ver quando abrir o app.',
          'need.sent.done' => 'Pronto',
          'need.errors.NOT_PAIRED' => 'Para enviar, você precisa estar com seu par no app.',
          'need.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'need.errors.other' => 'Não deu para enviar agora. Tente de novo.',
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
          'notificationPreferences.title' => 'Notificações',
          'notificationPreferences.subtitle' => 'Escolha o que chega e quando. Nada de cobrança.',
          'notificationPreferences.systemOff' => 'As notificações estão desligadas neste celular. Suas escolhas valem quando você ligar.',
          'notificationPreferences.openSystem' => 'Abrir configurações',
          'notificationPreferences.all' => 'Receber notificações',
          'notificationPreferences.allText' => 'Desligue para pausar tudo.',
          'notificationPreferences.typesTitle' => 'O que você quer receber',
          'notificationPreferences.types.card_ready' => 'Cartão pronto',
          'notificationPreferences.types.card_received' => 'Cartão recebido',
          'notificationPreferences.types.card_reaction' => 'Resposta ao seu cartão',
          'notificationPreferences.types.daily_idea' => 'Ideia do dia',
          'notificationPreferences.types.date_coming' => 'Datas chegando',
          'notificationPreferences.types.other' => '',
          'notificationPreferences.quietTitle' => 'Horas de silêncio',
          'notificationPreferences.quietText' => 'Lembretes esperam até o silêncio acabar.',
          'notificationPreferences.quietStart' => 'Começa às',
          'notificationPreferences.quietEnd' => 'Termina às',
          'notificationPreferences.quietOvernight' => 'O silêncio atravessa a madrugada.',
          'notificationPreferences.cardTitle' => 'Cartão de domingo',
          'notificationPreferences.cardDay' => 'Dia',
          'notificationPreferences.cardHour' => 'Horário',
          'notificationPreferences.days.0' => 'Domingo',
          'notificationPreferences.days.1' => 'Segunda',
          'notificationPreferences.days.2' => 'Terça',
          'notificationPreferences.days.3' => 'Quarta',
          'notificationPreferences.days.4' => 'Quinta',
          'notificationPreferences.days.5' => 'Sexta',
          'notificationPreferences.days.6' => 'Sábado',
          'notificationPreferences.hourFormat' => ({required Object hour}) => '${hour}:00',
          'notificationPreferences.previewTitle' => 'Como a notificação aparece',
          'notificationPreferences.previewText' => 'Sempre curta e sem detalhes pessoais.',
          'notificationPreferences.loadErrorTitle' => 'Não deu para abrir suas preferências',
          'notificationPreferences.loadErrorText' => 'Elas continuam salvas. Tente de novo.',
          'notificationPreferences.errors.RATE_LIMITED' =>
            'Muitas tentativas seguidas. Espere um instante.',
          'notificationPreferences.errors.other' =>
            'Não deu para salvar agora. Sua escolha anterior foi mantida.',
          'partnerStep.title' => 'Quer trazer seu parceiro?',
          'partnerStep.titleHighlight' => 'parceiro',
          'partnerStep.subtitle' => 'O app funciona sozinho. Você convida quando quiser.',
          'partnerStep.inviteTitle' => 'Enviar um convite',
          'partnerStep.inviteSupport' => 'Sua pessoa entra com um código',
          'partnerStep.aloneTitle' => 'Depois, começar sozinho',
          'partnerStep.aloneSupport' => 'Seus slips ficam só com você',
          'partnerStep.haveCode' => 'Tenho um código de convite',
          'partnerStep.continueButton' => 'Continuar',
          'pause.title' => 'Pedir um tempo',
          'pause.titleHighlight' => 'tempo',
          'pause.subtitle' => 'Uma mensagem curta e gentil. Seu par vê só o que você escrever.',
          'pause.presets.space' => 'Preciso de um tempo para respirar. Volto logo.',
          'pause.presets.later' => 'Vamos conversar mais tarde, com calma?',
          'pause.presets.calm' => 'Quero te ouvir bem. Preciso me acalmar antes.',
          'pause.presets.other' => '',
          'pause.hint' => 'Escrever a minha',
          'pause.returnTitle' => 'Volto em',
          'pause.returns.oneHour' => '1 hora',
          'pause.returns.threeHours' => '3 horas',
          'pause.returns.eightHours' => '8 horas',
          'pause.returns.tomorrow' => 'Amanhã',
          'pause.returns.other' => '',
          'pause.note' => 'Os dois veem o Hoje em pausa. Você pode voltar quando quiser.',
          'pause.send' => 'Enviar e pausar',
          'pause.sentTitle' => 'Pausa enviada',
          'pause.sentText' =>
            'O Hoje fica em pausa para os dois. Quando estiver pronto(a), volte por lá.',
          'pause.done' => 'Pronto',
          'pause.errors.INVALID_RETURN_TIME' => 'Esse horário de volta não vale. Escolha outro.',
          'pause.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'pause.errors.other' => 'Não deu para enviar agora. Sua mensagem continua aqui.',
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
          'quickSlip.privacyNote' =>
            'Fica privado. No domingo você escolhe o que vai para o cartão.',
          'quickSlip.save' => 'Salvar',
          'quickSlip.saved.title' => 'Salvo',
          'quickSlip.saved.added' => 'Slip adicionado a esta semana.',
          'quickSlip.saved.queued' => 'Salvo neste celular. Enviamos quando a conexão voltar.',
          'quickSlip.saved.undoHint' => 'Desfazer por 30 segundos.',
          'quickSlip.saved.undo' => 'Desfazer',
          'quickSlip.saved.done' => 'Pronto',
          'quickSlip.errors.FREE_LIMIT_REACHED' =>
            'Você chegou ao limite de slips do plano grátis.',
          'quickSlip.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'quickSlip.errors.other' =>
            'Não deu para salvar agora. Seu texto continua aqui, tente de novo.',
          'received.kinds.repair' => 'Cartão de reparo',
          'received.kinds.need' => 'Preciso de…',
          'received.kinds.miss_us' => 'Saudade',
          'received.kinds.hug' => 'Um abraço',
          'received.kinds.distance' => 'Um pouco de distância',
          'received.kinds.heavy_day' => 'Um dia pesado',
          'received.kinds.good_news' => 'Boa notícia',
          'received.kinds.other' => '',
          'received.fromPartner' => 'Do seu par',
          'received.privateFirst' => 'Sua resposta é privada primeiro. Não tem certo nem errado.',
          'received.responses.talk' => 'Sim, vamos conversar',
          'received.responses.more_time' => 'Preciso de mais um tempo',
          'received.responses.later' => 'Respondo depois',
          'received.responses.other' => '',
          'received.seen' => 'Entendi',
          'received.doneTitle' => 'Tudo certo',
          'received.doneText' => 'Obrigado por ler com calma.',
          'received.emptyTitle' => 'Nada novo',
          'received.emptyText' => 'Quando seu par mandar algo, aparece aqui.',
          'received.close' => 'Fechar',
          'received.errorTitle' => 'Não deu para abrir',
          'received.errorText' => 'Nada se perdeu. Tente de novo.',
          'received.errors.NOT_FOUND' => 'Essa mensagem não está mais aqui.',
          'received.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'received.errors.other' => 'Não deu para responder agora. Tente de novo.',
          'reminders.title' => 'Repara',
          'reminders.dailyIdea' => 'Uma ideia pequena para hoje.',
          'reminders.dates' => 'Uma data está chegando.',
          'reminders.weeklyCard' => 'Seu cartão está pronto.',
          'reminders.discreet' => 'Abra o app para ver.',
          'repair.calm.title' => 'Um momento para respirar',
          'repair.calm.titleHighlight' => 'respirar',
          'repair.calm.cadence' =>
            'Inspire devagar por 4. Solte devagar por 6. Repita no seu ritmo.',
          'repair.calm.text' => 'Não tem pressa e não tem tempo contado. Saia quando quiser.',
          'repair.calm.ready' => 'Estou mais calmo(a)',
          'repair.calm.leave' => 'Sair',
          'repair.calm.askPause' => 'Pedir um tempo ao meu par',
          'repair.softStart.title' => 'Comece com suavidade',
          'repair.softStart.titleHighlight' => 'suavidade',
          'repair.softStart.subtitle' => 'Um modelo sem culpa para abrir a conversa.',
          'repair.softStart.feeling' => 'Eu sinto…',
          'repair.softStart.feelingHint' => 'Ex.: cansado(a)',
          'repair.softStart.situation' => 'Quando…',
          'repair.softStart.situationHint' => 'Ex.: a louça fica para depois',
          'repair.softStart.need' => 'Eu preciso de…',
          'repair.softStart.needHint' => 'Ex.: um pouco de ajuda',
          'repair.softStart.template' => ({
            required Object feeling,
            required Object situation,
            required Object need,
          }) => 'Eu sinto ${feeling} quando ${situation}. Eu preciso de ${need}.',
          'repair.softStart.use' => 'Usar este modelo',
          'repair.quick.title' => 'Um pequeno reparo',
          'repair.quick.titleHighlight' => 'reparo',
          'repair.quick.subtitle' => 'Um toque envia. Você pode mudar o texto antes.',
          'repair.quick.presets.tone' => 'Desculpa pelo meu tom.',
          'repair.quick.presets.restart' => 'Podemos recomeçar?',
          'repair.quick.presets.five_minutes' => 'Preciso de cinco minutos.',
          'repair.quick.presets.love' => 'Eu te amo, mesmo agora.',
          'repair.quick.presets.other' => '',
          'repair.quick.hint' => 'Escrever o meu',
          'repair.quick.send' => 'Enviar',
          'repair.quick.sentTitle' => 'Enviado',
          'repair.quick.sentText' => 'Seu par vai ver quando abrir o app.',
          'repair.quick.done' => 'Pronto',
          'repair.quick.errors.NOT_PAIRED' => 'Para enviar, você precisa estar com seu par no app.',
          'repair.quick.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'repair.quick.errors.other' => 'Não deu para enviar agora. Sua mensagem continua aqui.',
          'repair.guided.stepOf' => ({
            required Object current,
            required Object total,
          }) => 'Passo ${current} de ${total}',
          'repair.guided.stepTitles.0' => 'O que aconteceu?',
          'repair.guided.stepTitles.1' => 'Do que você precisa?',
          'repair.guided.stepTitles.2' => 'O que você pode oferecer?',
          'repair.guided.stepHighlights.0' => 'aconteceu',
          'repair.guided.stepHighlights.1' => 'precisa',
          'repair.guided.stepHighlights.2' => 'oferecer',
          'repair.guided.stepHints.0' => 'Do seu jeito, sem culpar ninguém.',
          'repair.guided.stepHints.1' => 'Uma coisa que ajudaria agora.',
          'repair.guided.stepHints.2' => 'Algo pequeno e sincero.',
          'repair.guided.private' => 'Só você vê isto. Nada é enviado ao seu par.',
          'repair.guided.next' => 'Continuar',
          'repair.guided.back' => 'Voltar',
          'repair.guided.later' => 'Guardar para depois',
          'repair.guided.savedLater' => 'Guardado. Você continua de onde parou.',
          'repair.guided.finalTitle' => 'Como você está agora?',
          'repair.guided.finalHighlight' => 'agora',
          'repair.guided.feelings.calmer' => 'Mais calmo(a)',
          'repair.guided.feelings.still_tense' => 'Ainda tenso(a)',
          'repair.guided.feelings.need_more_time' => 'Preciso de mais tempo',
          'repair.guided.feelings.other' => '',
          'repair.guided.followUpTitle' => 'Quer um lembrete para ver como estão?',
          'repair.guided.followUps.none' => 'Não precisa',
          'repair.guided.followUps.tomorrow' => 'Amanhã',
          'repair.guided.followUps.inThreeDays' => 'Em 3 dias',
          'repair.guided.followUps.other' => '',
          'repair.guided.followUpNote' =>
            'O lembrete é curto e não diz nada sobre o que aconteceu.',
          'repair.guided.finish' => 'Concluir',
          'repair.guided.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'repair.guided.errors.other' =>
            'Não deu para salvar agora. Suas respostas continuam aqui.',
          'repair.guided.loadErrorTitle' => 'Não deu para abrir',
          'repair.guided.loadErrorText' => 'Nada se perdeu. Tente de novo.',
          'repair.learning.title' => 'O que você aprendeu?',
          'repair.learning.titleHighlight' => 'aprendeu',
          'repair.learning.subtitle' => 'Fica só com você e pode ser apagado quando quiser.',
          'repair.learning.kinds.trigger' => 'O que me incomoda',
          'repair.learning.kinds.need' => 'O que eu preciso',
          'repair.learning.kinds.good_fix' => 'O que ajudou',
          'repair.learning.kinds.other' => '',
          'repair.learning.hint' => 'Escreva em uma ou duas frases',
          'repair.learning.save' => 'Salvar',
          'repair.learning.listTitle' => 'Seus aprendizados',
          'repair.learning.delete' => 'Apagar',
          'repair.learning.emptyTitle' => 'Nada ainda',
          'repair.learning.emptyText' => 'Quando você escrever um aprendizado, ele aparece aqui.',
          'repair.learning.errorTitle' => 'Não deu para carregar',
          'repair.learning.errorText' => 'Seus aprendizados continuam salvos. Tente de novo.',
          'repair.learning.done' => 'Pronto',
          'repair.learning.errors.RATE_LIMITED' =>
            'Muitas tentativas seguidas. Espere um instante.',
          'repair.learning.errors.other' => 'Não deu para salvar agora. Seu texto continua aqui.',
          'repair.next.pause' => 'Respirar um pouco',
          'repair.next.guided' => 'Começar o reparo guiado',
          'repair.next.quick' => 'Enviar um reparo',
          _ => null,
        } ??
        switch (path) {
          'rituals.title' => 'Rituais',
          'rituals.subtitle' =>
            'Pequenos hábitos que vocês querem proteger. Sem sequências, sem cobrança.',
          'rituals.emptyTitle' => 'Nenhum ritual ainda',
          'rituals.emptyText' =>
            'Um jantar de sexta, uma caminhada de domingo. O que vocês querem proteger?',
          'rituals.create' => 'Criar um ritual',
          'rituals.didIt' => 'Fizemos',
          'rituals.warm' => 'Que bom. Um momento de vocês.',
          'rituals.cadences.daily' => 'Todo dia',
          'rituals.cadences.weekly' => 'Toda semana',
          'rituals.cadences.biweekly' => 'A cada duas semanas',
          'rituals.cadences.monthly' => 'Todo mês',
          'rituals.cadences.other' => '',
          'rituals.cadenceOn' => ({
            required Object cadence,
            required Object weekday,
          }) => '${cadence}, ${weekday}',
          'rituals.weekdays.0' => 'domingo',
          'rituals.weekdays.1' => 'segunda',
          'rituals.weekdays.2' => 'terça',
          'rituals.weekdays.3' => 'quarta',
          'rituals.weekdays.4' => 'quinta',
          'rituals.weekdays.5' => 'sexta',
          'rituals.weekdays.6' => 'sábado',
          'rituals.createTitle' => 'Novo ritual',
          'rituals.editTitle' => 'Seu ritual',
          'rituals.nameLabel' => 'Nome',
          'rituals.nameHint' => 'Ex.: jantar de sexta',
          'rituals.cadenceLabel' => 'Com que frequência',
          'rituals.weekdayLabel' => 'Em que dia',
          'rituals.hourLabel' => 'Que horas',
          'rituals.hourFormat' => ({required Object hour}) => '${hour}:00',
          'rituals.reminderTitle' => 'Lembrete',
          'rituals.reminderText' => 'Um aviso curto neste celular, sem detalhes.',
          'rituals.save' => 'Salvar',
          'rituals.archive' => 'Arquivar',
          'rituals.archiveTitle' => 'Arquivar este ritual?',
          'rituals.archiveText' => 'Ele some da lista. O histórico fica guardado.',
          'rituals.errorTitle' => 'Não deu para abrir',
          'rituals.errorText' => 'Nada se perdeu. Tente de novo.',
          'rituals.errors.NOT_FOUND' => 'Esse ritual não está mais aqui.',
          'rituals.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'rituals.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'slipDetail.dateLine' => ({
            required Object weekday,
            required Object day,
            required Object month,
          }) => '${weekday}, ${day} de ${month}',
          'slipDetail.weekdays.0' => 'segunda',
          'slipDetail.weekdays.1' => 'terça',
          'slipDetail.weekdays.2' => 'quarta',
          'slipDetail.weekdays.3' => 'quinta',
          'slipDetail.weekdays.4' => 'sexta',
          'slipDetail.weekdays.5' => 'sábado',
          'slipDetail.weekdays.6' => 'domingo',
          'slipDetail.monthsShort.0' => 'jan',
          'slipDetail.monthsShort.1' => 'fev',
          'slipDetail.monthsShort.2' => 'mar',
          'slipDetail.monthsShort.3' => 'abr',
          'slipDetail.monthsShort.4' => 'mai',
          'slipDetail.monthsShort.5' => 'jun',
          'slipDetail.monthsShort.6' => 'jul',
          'slipDetail.monthsShort.7' => 'ago',
          'slipDetail.monthsShort.8' => 'set',
          'slipDetail.monthsShort.9' => 'out',
          'slipDetail.monthsShort.10' => 'nov',
          'slipDetail.monthsShort.11' => 'dez',
          'slipDetail.kinds.quick' => 'Rápido',
          'slipDetail.kinds.specific' => 'Específico',
          'slipDetail.kinds.if_then' => 'Se… então',
          'slipDetail.kinds.invisible' => 'Invisível',
          'slipDetail.kinds.other' => '',
          'slipDetail.private' => 'Só você vê este slip.',
          'slipDetail.archived' => 'Arquivado',
          'slipDetail.feeling' => 'Como você se sentiu',
          'slipDetail.plan' => 'Então eu…',
          'slipDetail.cardTitle' => 'Quem vê isto',
          'slipDetail.cardOff' => 'Só eu',
          'slipDetail.cardOffText' => 'Fica na sua semana e não entra no cartão.',
          'slipDetail.cardOn' => 'Pode entrar no cartão',
          'slipDetail.cardOnText' => 'No domingo você escolhe se ele vai.',
          'slipDetail.cardInvisible' => 'Slips invisíveis nunca entram em um cartão.',
          'slipDetail.previewTitle' => 'O que seu par leria',
          'slipDetail.previewText' => 'Se este slip entrar no cartão, é este texto que aparece.',
          'slipDetail.sentNote' => 'Este slip já foi em um cartão. O cartão enviado guarda a cópia de antes, mesmo que você edite ou apague aqui.',
          'slipDetail.edit' => 'Editar',
          'slipDetail.editSave' => 'Salvar',
          'slipDetail.editCancel' => 'Cancelar',
          'slipDetail.archive' => 'Arquivar',
          'slipDetail.restore' => 'Restaurar',
          'slipDetail.delete' => 'Apagar',
          'slipDetail.deleteTitle' => 'Apagar este slip?',
          'slipDetail.deleteText' => 'Será removido da sua semana e da linha do tempo.',
          'slipDetail.deleteConfirm' => 'Apagar',
          'slipDetail.saved' => 'Salvo',
          'slipDetail.archivedToast' => 'Arquivado',
          'slipDetail.deleted' => 'Slip apagado',
          'slipDetail.notFoundTitle' => 'Este slip não existe mais',
          'slipDetail.notFoundText' => 'Ele pode ter sido apagado.',
          'slipDetail.errorTitle' => 'Não deu para abrir este slip',
          'slipDetail.errorText' => 'Ele continua salvo. Tente de novo.',
          'slipDetail.errors.SLIP_NOT_FOUND' => 'Este slip não existe mais.',
          'slipDetail.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'slipDetail.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'slipKind.switcherTitle' => 'Outras formas de registrar',
          'slipKind.needEntry' => 'Preciso de…',
          'slipKind.kinds.specific' => 'Específico',
          'slipKind.kinds.if_then' => 'Se… então',
          'slipKind.kinds.invisible' => 'Invisível',
          'slipKind.kinds.other' => '',
          'slipKind.specific.title' => 'O que exatamente ele fez?',
          'slipKind.specific.titleHighlight' => 'exatamente',
          'slipKind.specific.subtitle' => 'Detalhes ajudam a lembrar por que importou.',
          'slipKind.specific.hint' => 'Ex.: levou o lixo sem eu pedir',
          'slipKind.specific.feelingLabel' => 'Como você se sentiu?',
          'slipKind.specific.feelingHint' => 'Opcional',
          'slipKind.ifThen.title' => 'Quer contar a ele?',
          'slipKind.ifThen.titleHighlight' => 'contar',
          'slipKind.ifThen.subtitle' => 'Um plano pequeno: quando acontecer isto, você faz aquilo.',
          'slipKind.ifThen.ifLabel' => 'Se…',
          'slipKind.ifThen.ifHint' => 'Ex.: eu me sentir sobrecarregada',
          'slipKind.ifThen.thenLabel' => 'Então…',
          'slipKind.ifThen.thenHint' => 'Ex.: peço um tempo de 10 minutos',
          'slipKind.invisible.title' => 'Coisas que ninguém percebe',
          'slipKind.invisible.titleHighlight' => 'ninguém percebe',
          'slipKind.invisible.subtitle' => 'Só para você. Isto nunca vai para o cartão.',
          'slipKind.invisible.hint' => 'Ex.: lembrei da consulta das crianças',
          'slipKind.invisible.areaLabel' => 'Que tipo de trabalho?',
          'slipKind.invisible.private' => 'Fica só com você, não entra em nenhum cartão.',
          'slipKind.workAreas.planning' => 'Planejar',
          'slipKind.workAreas.dates' => 'Datas',
          'slipKind.workAreas.kitchen' => 'Cozinha',
          'slipKind.workAreas.cleaning' => 'Limpeza',
          'slipKind.workAreas.kids' => 'Filhos',
          'slipKind.workAreas.emotional' => 'Emocional',
          'slipKind.workAreas.finances' => 'Finanças',
          'slipKind.workAreas.other' => 'Outro',
          'slipKind.save' => 'Salvar',
          'slipKind.saved.title' => 'Salvo',
          'slipKind.saved.added' => 'Registrado.',
          'slipKind.saved.queued' => 'Salvo neste celular. Enviamos quando a conexão voltar.',
          'slipKind.saved.done' => 'Pronto',
          'slipKind.errors.FREE_LIMIT_REACHED' => 'Você chegou ao limite de slips do plano grátis.',
          'slipKind.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'slipKind.errors.other' =>
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
          'slipsList.dateShort' => ({
            required Object day,
            required Object month,
          }) => '${day} ${month}',
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
          'sundayCard.held.text' =>
            'Seu cartão espera. Envie quando estiver pronto. Nada se perde.',
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
          'tabs.segmentTogether' => 'Juntos',
          'tabs.segmentForMe' => 'Para mim',
          'tabs.logisticsLabel' => 'PRÁTICO',
          'tabs.logisticsTitle' => 'Logística',
          'tabs.logisticsText' => 'As coisas práticas, sem ninguém carregar sozinho.',
          'tabs.soloNote' => 'Quando seu par entrar, as coisas compartilhadas aparecem aqui.',
          'tabs.ritualsLabel' => 'ROTINA',
          'tabs.ritualsTitle' => 'Rituais',
          'tabs.ritualsText' => 'Pequenos hábitos que vocês querem proteger.',
          'tabs.dateNightLabel' => 'ENCONTRO',
          'tabs.dateNightTitle' => 'Date night',
          'tabs.dateNightText' => 'Ideias para vocês dois, escolhidas juntos.',
          'tabs.temperatureLabel' => 'ENTRE VOCÊS',
          'tabs.temperatureTitle' => 'Como está entre vocês?',
          'tabs.temperatureText' => 'Um registro privado, sem nota.',
          'tabs.learningLabel' => 'SÓ PARA VOCÊ',
          'tabs.learningTitle' => 'O que você aprendeu',
          'tabs.learningText' => 'Anotações privadas que você pode apagar.',
          'temperature.levelTitle' => 'Como está entre vocês?',
          'temperature.levelHighlight' => 'entre vocês',
          'temperature.levelNote' => 'Privado. Nunca vira nota.',
          'temperature.levels.good' => 'Bem',
          'temperature.levels.so_so' => 'Mais ou menos',
          'temperature.levels.turbulent' => 'Turbulento',
          'temperature.levels.fight' => 'Uma briga',
          'temperature.levels.other' => '',
          'temperature.continueAction' => 'Continuar',
          'temperature.back' => 'Voltar',
          'temperature.skip' => 'Agora não',
          'temperature.intensityTitle' => 'Qual a intensidade?',
          'temperature.intensityHighlight' => 'intensidade',
          'temperature.intensityHint' =>
            'Abaixo de 7 dá para conversar. Acima de 7, faça uma pausa primeiro.',
          'temperature.intensityHigh' => 'Valor alto: que tal uma pausa antes?',
          'temperature.intensityLow' => 'Fraca',
          'temperature.intensityTop' => 'Muito forte',
          'temperature.intensityLabel' => 'Intensidade',
          'temperature.result.good.title' => 'Que bom',
          'temperature.result.good.text' => 'Registrado só para você. Siga o seu dia.',
          'temperature.result.pause.title' => 'Primeiro, respirar',
          'temperature.result.pause.text' => 'Quando está muito quente, esperar ajuda. Vale um tempo longe antes de qualquer conversa.',
          'temperature.result.guided.title' => 'Dá para conversar com cuidado',
          'temperature.result.guided.text' => 'Um passo de cada vez, no seu ritmo.',
          'temperature.result.quick.title' => 'Um ajuste pequeno basta',
          'temperature.result.quick.text' => 'Algo leve e rápido pode resolver.',
          'temperature.result.done' => 'Pronto',
          'temperature.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'temperature.errors.other' => 'Não deu para salvar agora. Suas respostas continuam aqui.',
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
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 ano',
                  other: '${count} anos',
                ),
          'today.togetherMonths' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 mês',
                  other: '${count} meses',
                ),
          'today.togetherDays' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
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
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
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
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
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
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Você tem 1 slip.',
                  other: 'Você tem ${count} slips.',
                ),
          'today.firstDayHighlight' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
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
          'today.pauseOwnTitle' => 'Você pediu um tempo',
          'today.pauseOwnText' => ({
            required Object time,
          }) => 'Você volta por volta das ${time}. Nada para fazer agora.',
          'today.pausePartnerTitle' => 'Seu par pediu um tempo',
          'today.pausePartnerText' => 'Sem pressa. Não tem nada para fazer agora.',
          'today.signalReceived' => 'Seu par te mandou uma mensagem',
          'today.signalReceivedAction' => 'Ver',
          'today.pauseBack' => 'Voltar agora',
          'today.pauseBackRepair' => 'Voltar e fazer um reparo',
          'today.pauseWriteSlip' => 'Anotar um slip',
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
          'unpair.partnerNotice.text' =>
            'Seus dados continuam seus. Cartões compartilhados pararam.',
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
