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
  late final Translations$account$pt account = Translations$account$pt.internal(_root);
  late final Translations$authentication$pt authentication =
      Translations$authentication$pt.internal(_root);
  late final Translations$capsules$pt capsules = Translations$capsules$pt.internal(_root);
  late final Translations$cardView$pt cardView = Translations$cardView$pt.internal(_root);
  late final Translations$cardsList$pt cardsList = Translations$cardsList$pt.internal(_root);
  late final Translations$chat$pt chat = Translations$chat$pt.internal(_root);
  late final Translations$checkin$pt checkin = Translations$checkin$pt.internal(_root);
  late final Translations$common$pt common = Translations$common$pt.internal(_root);
  late final Translations$connectTouch$pt connectTouch = Translations$connectTouch$pt.internal(
    _root,
  );
  late final Translations$connectUs$pt connectUs = Translations$connectUs$pt.internal(_root);
  late final Translations$dateNight$pt dateNight = Translations$dateNight$pt.internal(_root);
  late final Translations$dates$pt dates = Translations$dates$pt.internal(_root);
  late final Translations$day$pt day = Translations$day$pt.internal(_root);
  late final Translations$devices$pt devices = Translations$devices$pt.internal(_root);
  late final Translations$discreet$pt discreet = Translations$discreet$pt.internal(_root);
  late final Translations$distance$pt distance = Translations$distance$pt.internal(_root);
  late final Translations$fightStyle$pt fightStyle = Translations$fightStyle$pt.internal(_root);
  late final Translations$firstSlip$pt firstSlip = Translations$firstSlip$pt.internal(_root);
  late final Translations$games$pt games = Translations$games$pt.internal(_root);
  late final Translations$gifts$pt gifts = Translations$gifts$pt.internal(_root);
  late final Translations$globalErrors$pt globalErrors = Translations$globalErrors$pt.internal(
    _root,
  );
  late final Translations$griefSupport$pt griefSupport = Translations$griefSupport$pt.internal(
    _root,
  );
  late final Translations$guides$pt guides = Translations$guides$pt.internal(_root);
  late final Translations$hardConversation$pt hardConversation =
      Translations$hardConversation$pt.internal(_root);
  late final Translations$heavyDay$pt heavyDay = Translations$heavyDay$pt.internal(_root);
  late final Translations$help$pt help = Translations$help$pt.internal(_root);
  late final Translations$helpSupport$pt helpSupport = Translations$helpSupport$pt.internal(_root);
  late final Translations$history$pt history = Translations$history$pt.internal(_root);
  late final Translations$ideaDetail$pt ideaDetail = Translations$ideaDetail$pt.internal(_root);
  late final Translations$intro$pt intro = Translations$intro$pt.internal(_root);
  late final Translations$invite$pt invite = Translations$invite$pt.internal(_root);
  late final Translations$language$pt language = Translations$language$pt.internal(_root);
  late final Translations$learned$pt learned = Translations$learned$pt.internal(_root);
  late final Translations$lists$pt lists = Translations$lists$pt.internal(_root);
  late final Translations$logistics$pt logistics = Translations$logistics$pt.internal(_root);
  late final Translations$loveStyle$pt loveStyle = Translations$loveStyle$pt.internal(_root);
  late final Translations$memories$pt memories = Translations$memories$pt.internal(_root);
  late final Translations$mood$pt mood = Translations$mood$pt.internal(_root);
  late final Translations$need$pt need = Translations$need$pt.internal(_root);
  late final Translations$notFound$pt notFound = Translations$notFound$pt.internal(_root);
  late final Translations$notes$pt notes = Translations$notes$pt.internal(_root);
  late final Translations$notificationPermission$pt notificationPermission =
      Translations$notificationPermission$pt.internal(_root);
  late final Translations$notificationPreferences$pt notificationPreferences =
      Translations$notificationPreferences$pt.internal(_root);
  late final Translations$partnerProfile$pt partnerProfile =
      Translations$partnerProfile$pt.internal(_root);
  late final Translations$partnerStep$pt partnerStep = Translations$partnerStep$pt.internal(_root);
  late final Translations$pause$pt pause = Translations$pause$pt.internal(_root);
  late final Translations$places$pt places = Translations$places$pt.internal(_root);
  late final Translations$plus$pt plus = Translations$plus$pt.internal(_root);
  late final Translations$privacy$pt privacy = Translations$privacy$pt.internal(_root);
  late final Translations$profileDetails$pt profileDetails =
      Translations$profileDetails$pt.internal(_root);
  late final Translations$profileSetup$pt profileSetup = Translations$profileSetup$pt.internal(
    _root,
  );
  late final Translations$programs$pt programs = Translations$programs$pt.internal(_root);
  late final Translations$questions$pt questions = Translations$questions$pt.internal(_root);
  late final Translations$questionsEntry$pt questionsEntry =
      Translations$questionsEntry$pt.internal(_root);
  late final Translations$quickSlip$pt quickSlip = Translations$quickSlip$pt.internal(_root);
  late final Translations$received$pt received = Translations$received$pt.internal(_root);
  late final Translations$relationshipChanged$pt relationshipChanged =
      Translations$relationshipChanged$pt.internal(_root);
  late final Translations$relationshipSettings$pt relationshipSettings =
      Translations$relationshipSettings$pt.internal(_root);
  late final Translations$reminders$pt reminders = Translations$reminders$pt.internal(_root);
  late final Translations$repair$pt repair = Translations$repair$pt.internal(_root);
  late final Translations$rituals$pt rituals = Translations$rituals$pt.internal(_root);
  late final Translations$safeMode$pt safeMode = Translations$safeMode$pt.internal(_root);
  late final Translations$safety$pt safety = Translations$safety$pt.internal(_root);
  late final Translations$sessionExpired$pt sessionExpired =
      Translations$sessionExpired$pt.internal(_root);
  late final Translations$settingsHome$pt settingsHome = Translations$settingsHome$pt.internal(
    _root,
  );
  late final Translations$slipDetail$pt slipDetail = Translations$slipDetail$pt.internal(_root);
  late final Translations$slipKind$pt slipKind = Translations$slipKind$pt.internal(_root);
  late final Translations$slipsList$pt slipsList = Translations$slipsList$pt.internal(_root);
  late final Translations$spice$pt spice = Translations$spice$pt.internal(_root);
  late final Translations$story$pt story = Translations$story$pt.internal(_root);
  late final Translations$sundayCard$pt sundayCard = Translations$sundayCard$pt.internal(_root);
  late final Translations$tabs$pt tabs = Translations$tabs$pt.internal(_root);
  late final Translations$temperature$pt temperature = Translations$temperature$pt.internal(_root);
  late final Translations$timeInApp$pt timeInApp = Translations$timeInApp$pt.internal(_root);
  late final Translations$today$pt today = Translations$today$pt.internal(_root);
  late final Translations$unpair$pt unpair = Translations$unpair$pt.internal(_root);
  late final Translations$welcome$pt welcome = Translations$welcome$pt.internal(_root);
  late final Translations$widgets$pt widgets = Translations$widgets$pt.internal(_root);
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

  Map<String, String> get codeErrors => {
    'empty': 'Digite o código do convite.',
    'tooShort': 'O código tem 8 caracteres.',
    'tooLong': 'O código tem 8 caracteres.',
    'invalid': 'Use só letras e números.',
  };

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

// Path: account
class Translations$account$pt {
  Translations$account$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Apagar conta'
  String get deleteTitle => 'Apagar conta';

  /// pt: 'conta'
  String get deleteHighlight => 'conta';

  /// pt: 'Os dados são apagados após 14 dias. Precisa de nova autenticação.'
  String get deleteText => 'Os dados são apagados após 14 dias. Precisa de nova autenticação.';

  /// pt: 'Isso também desfaz o vínculo'
  String get deleteWarningTitle => 'Isso também desfaz o vínculo';

  /// pt: 'Isso também desfaz o vínculo com {name}.'
  String deleteWarning({required Object name}) => 'Isso também desfaz o vínculo com ${name}.';

  /// pt: 'Isso também desfaz o vínculo com seu par.'
  String get deleteWarningNoPartner => 'Isso também desfaz o vínculo com seu par.';

  /// pt: 'Apagar conta'
  String get deleteAction => 'Apagar conta';

  /// pt: 'Apagar sua conta?'
  String get deleteConfirmTitle => 'Apagar sua conta?';

  /// pt: 'Você terá 14 dias para mudar de ideia. Depois disso, nada pode ser recuperado.'
  String get deleteConfirmText =>
      'Você terá 14 dias para mudar de ideia. Depois disso, nada pode ser recuperado.';

  /// pt: 'Confirme para apagar sua conta.'
  String get reauthReason => 'Confirme para apagar sua conta.';

  /// pt: 'Exclusão em {day} de {month}'
  String pendingTitle({required Object day, required Object month}) =>
      'Exclusão em ${day} de ${month}';

  /// pt: '{day} de {month}'
  String pendingHighlight({required Object day, required Object month}) => '${day} de ${month}';

  /// pt: 'Você pode cancelar antes disso.'
  String get pendingText => 'Você pode cancelar antes disso.';

  /// pt: 'Cancelar exclusão'
  String get pendingCancel => 'Cancelar exclusão';

  /// pt: 'Sair?'
  String get signOutTitle => 'Sair?';

  /// pt: 'Remover também os dados locais?'
  String get signOutText => 'Remover também os dados locais?';

  /// pt: 'Você tem {count} slips que ainda não foram enviados. Sair e remover dados apaga esses slips.'
  String signOutPending({required Object count}) =>
      'Você tem ${count} slips que ainda não foram enviados. Sair e remover dados apaga esses slips.';

  /// pt: 'Sair'
  String get signOut => 'Sair';

  /// pt: 'Sair e remover dados'
  String get signOutRemove => 'Sair e remover dados';

  List<String> get months => [
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
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para concluir agora. Tente de novo.',
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

// Path: capsules
class Translations$capsules$pt {
  Translations$capsules$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Cápsula do tempo'
  String get title => 'Cápsula do tempo';

  /// pt: 'Escreva algo para ser aberto em uma data futura. Até lá, ninguém lê, nem você.'
  String get text =>
      'Escreva algo para ser aberto em uma data futura. Até lá, ninguém lê, nem você.';

  /// pt: 'O que você quer dizer para o futuro?'
  String get bodyHint => 'O que você quer dizer para o futuro?';

  Map<String, String> get bodyErrors => {
    'empty': 'Escreva a mensagem',
    'tooLong': 'A mensagem está muito longa',
  };

  /// pt: 'Abre em'
  String get dateLabel => 'Abre em';

  /// pt: 'Escolha uma data'
  String get dateHint => 'Escolha uma data';

  Map<String, String> get dateErrors => {
    'empty': 'Escolha o dia em que ela abre',
    'outOfRange': 'Escolha uma data entre uma semana e 50 anos à frente',
  };

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

  /// pt: 'Para nós dois'
  String get sharedLabel => 'Para nós dois';

  /// pt: 'Seu par também lê quando a data chegar. Desligado, só você lê.'
  String get sharedText => 'Seu par também lê quando a data chegar. Desligado, só você lê.';

  /// pt: 'Guardar cápsula'
  String get save => 'Guardar cápsula';

  /// pt: 'Cápsula guardada'
  String get saved => 'Cápsula guardada';

  /// pt: 'Fechada até {date}'
  String closedUntil({required Object date}) => 'Fechada até ${date}';

  /// pt: 'Sua, para os dois'
  String get ownerSharedBy => 'Sua, para os dois';

  /// pt: 'Só sua'
  String get ownerPrivate => 'Só sua';

  /// pt: 'Do seu par'
  String get fromPartner => 'Do seu par';

  /// pt: 'Apagar'
  String get delete => 'Apagar';

  /// pt: 'Apagar esta cápsula?'
  String get deleteTitle => 'Apagar esta cápsula?';

  /// pt: 'Ela some antes de qualquer pessoa ler. Não dá para desfazer.'
  String get deleteText => 'Ela some antes de qualquer pessoa ler. Não dá para desfazer.';

  /// pt: 'Apagar'
  String get deleteConfirm => 'Apagar';

  /// pt: 'Nenhuma cápsula ainda'
  String get emptyTitle => 'Nenhuma cápsula ainda';

  /// pt: 'Escreva uma e escolha o dia em que ela abre.'
  String get emptyText => 'Escreva uma e escolha o dia em que ela abre.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Suas cápsulas continuam guardadas. Tente de novo.'
  String get errorText => 'Suas cápsulas continuam guardadas. Tente de novo.';

  Map<String, String> get errors => {
    'CAPSULE_OPENS_TOO_SOON': 'Escolha uma data pelo menos uma semana à frente.',
    'CAPSULE_OPENS_TOO_FAR': 'Escolha uma data dentro dos próximos 50 anos.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para guardar agora. Seu texto continua aqui.',
  };
  Map<String, String> get deleteErrors => {
    'other': 'Não deu para apagar esta cápsula. Ela continua aqui.',
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

// Path: chat
class Translations$chat$pt {
  Translations$chat$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Mascote'
  String get title => 'Mascote';

  /// pt: 'Uma conversa calma com a mascote, para organizar o que você sente. Ela não substitui ajuda profissional e nunca toma partido.'
  String get consentText =>
      'Uma conversa calma com a mascote, para organizar o que você sente. Ela não substitui ajuda profissional e nunca toma partido.';

  /// pt: 'O que você escreve é enviado a um modelo de IA só para gerar a resposta. Nada da conversa é guardado, a menos que você transforme uma resposta em slip.'
  String get consentPrivacy =>
      'O que você escreve é enviado a um modelo de IA só para gerar a resposta. Nada da conversa é guardado, a menos que você transforme uma resposta em slip.';

  /// pt: 'Ligar a conversa'
  String get consentTurnOn => 'Ligar a conversa';

  /// pt: 'Diga como você está, ou comece por uma coisa pequena.'
  String get emptyHint => 'Diga como você está, ou comece por uma coisa pequena.';

  /// pt: 'Escreva aqui'
  String get inputHint => 'Escreva aqui';

  Map<String, String> get draftErrors => {
    'empty': 'Escreva algo para enviar',
    'tooLong': 'Esta mensagem está muito longa',
  };

  /// pt: 'Enviar'
  String get send => 'Enviar';

  /// pt: '(one) {Resta 1 mensagem hoje} (other) {Restam {count} mensagens hoje}'
  String messagesLeft({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Resta 1 mensagem hoje',
        other: 'Restam ${count} mensagens hoje',
      );

  /// pt: 'Virar slip'
  String get saveAsSlip => 'Virar slip';

  /// pt: 'Slip guardado'
  String get slipSaved => 'Slip guardado';

  /// pt: 'Salvar aprendizado'
  String get saveLearning => 'Salvar aprendizado';

  /// pt: 'Salvar aprendizado'
  String get learningSheetTitle => 'Salvar aprendizado';

  /// pt: 'Sobre o que é?'
  String get learningSheetTarget => 'Sobre o que é?';

  /// pt: 'Escolha sobre o que é.'
  String get learningTargetError => 'Escolha sobre o que é.';

  /// pt: 'O que você quer guardar'
  String get learningSheetHint => 'O que você quer guardar';

  Map<String, String> get learningTextErrors => {
    'empty': 'Escreva o que quer guardar',
    'tooLong': 'Isto está muito longo',
  };

  /// pt: 'Guardar'
  String get learningSave => 'Guardar';

  /// pt: 'Aprendizado guardado'
  String get learningSaved => 'Aprendizado guardado';

  /// pt: 'O que aprendi'
  String get learnedLink => 'O que aprendi';

  /// pt: 'Configurações da conversa'
  String get settingsTitle => 'Configurações da conversa';

  /// pt: 'Conversar com a mascote'
  String get toggleLabel => 'Conversar com a mascote';

  /// pt: 'Só você decide quando a conversa está ligada.'
  String get toggleSubtitle => 'Só você decide quando a conversa está ligada.';

  /// pt: 'Plano Plus'
  String get planPlus => 'Plano Plus';

  /// pt: 'Plano gratuito'
  String get planFree => 'Plano gratuito';

  /// pt: 'Restam {left} de {limit} mensagens hoje'
  String usagePlus({required Object left, required Object limit}) =>
      'Restam ${left} de ${limit} mensagens hoje';

  /// pt: 'A conversa faz parte do Plus. O plano gratuito não tem mensagens.'
  String get usageFree => 'A conversa faz parte do Plus. O plano gratuito não tem mensagens.';

  /// pt: 'O que é enviado'
  String get sendingTitle => 'O que é enviado';

  /// pt: 'Só o texto que você escreve e os últimos turnos da conversa vão para o modelo, para gerar a resposta. Nada é guardado, a menos que você salve como slip ou aprendizado.'
  String get sendingText =>
      'Só o texto que você escreve e os últimos turnos da conversa vão para o modelo, para gerar a resposta. Nada é guardado, a menos que você salve como slip ou aprendizado.';

  /// pt: 'Ao desligar, o passo de consentimento volta. A próxima mensagem só é enviada depois que você ligar de novo.'
  String get disableNote =>
      'Ao desligar, o passo de consentimento volta. A próxima mensagem só é enviada depois que você ligar de novo.';

  /// pt: 'Conversa ligada'
  String get settingsOn => 'Conversa ligada';

  /// pt: 'Conversa desligada'
  String get settingsOff => 'Conversa desligada';

  /// pt: 'Sem conexão. A conversa volta quando você reconectar.'
  String get offline => 'Sem conexão. A conversa volta quando você reconectar.';

  /// pt: 'A resposta foi interrompida.'
  String get interrupted => 'A resposta foi interrompida.';

  /// pt: 'Tentar de novo'
  String get retry => 'Tentar de novo';

  /// pt: 'As mensagens de hoje acabaram'
  String get limitTitle => 'As mensagens de hoje acabaram';

  /// pt: 'Volte amanhã, ou veja o Plus para conversar mais.'
  String get limitText => 'Volte amanhã, ou veja o Plus para conversar mais.';

  /// pt: 'A conversa faz parte do Plus'
  String get plusTitle => 'A conversa faz parte do Plus';

  /// pt: 'A mascote está disponível no Plus, com 20 mensagens por dia.'
  String get plusText => 'A mascote está disponível no Plus, com 20 mensagens por dia.';

  /// pt: 'Ver planos'
  String get plusCta => 'Ver planos';

  /// pt: 'Você não está sozinho'
  String get crisisTitle => 'Você não está sozinho';

  /// pt: 'Parece que você está passando por algo muito pesado. Se estiver em perigo agora, ligue para o serviço de emergência da sua região ou procure alguém de confiança. Eu não sou a ajuda certa para isso.'
  String get crisisText =>
      'Parece que você está passando por algo muito pesado. Se estiver em perigo agora, ligue para o serviço de emergência da sua região ou procure alguém de confiança. Eu não sou a ajuda certa para isso.';

  /// pt: 'Esconder o app (modo seguro)'
  String get crisisSafeMode => 'Esconder o app (modo seguro)';

  /// pt: 'A conversa não está disponível agora'
  String get unavailableTitle => 'A conversa não está disponível agora';

  /// pt: 'Tente de novo mais tarde.'
  String get unavailableText => 'Tente de novo mais tarde.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo em instantes.'
  String get errorText => 'Tente de novo em instantes.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };

  /// pt: 'Um momento difícil'
  String get starterHard => 'Um momento difícil';

  /// pt: 'Uma ideia'
  String get starterIdea => 'Uma ideia';

  /// pt: 'Um plano de encontro'
  String get starterPlan => 'Um plano de encontro';

  /// pt: 'Mais opções'
  String get menuLabel => 'Mais opções';
}

// Path: checkin
class Translations$checkin$pt {
  Translations$checkin$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Check-in semanal'
  String get title => 'Check-in semanal';

  /// pt: 'semanal'
  String get titleHighlight => 'semanal';

  /// pt: 'Dez minutos. Cada um responde em privado primeiro.'
  String get introSubtitle => 'Dez minutos. Cada um responde em privado primeiro.';

  /// pt: 'Começar'
  String get start => 'Começar';

  /// pt: 'Não nesta semana'
  String get notThisWeek => 'Não nesta semana';

  /// pt: 'Pergunta {current} de {total}'
  String questionOf({required Object current, required Object total}) =>
      'Pergunta ${current} de ${total}';

  List<String> get questions => [
    'O que foi bom nesta semana?',
    'O que você quer que a gente faça junto?',
    'Teve algo que pesou esta semana?',
    'O que você quer que eu saiba?',
  ];

  /// pt: 'Escreva o quanto quiser.'
  String get answerHint => 'Escreva o quanto quiser.';

  /// pt: 'As respostas ficam ocultas até os dois terminarem.'
  String get privateNote => 'As respostas ficam ocultas até os dois terminarem.';

  /// pt: 'Próximo'
  String get next => 'Próximo';

  /// pt: 'Concluir'
  String get finish => 'Concluir';

  /// pt: 'Pular esta pergunta'
  String get skip => 'Pular esta pergunta';

  /// pt: 'Pular deixa esta pergunta em branco. O check-in só aparece quando vocês dois responderem as quatro.'
  String get skipNote =>
      'Pular deixa esta pergunta em branco. O check-in só aparece quando vocês dois responderem as quatro.';

  /// pt: 'Suas respostas ficaram guardadas'
  String get waitingTitle => 'Suas respostas ficaram guardadas';

  /// pt: 'As respostas aparecem quando vocês dois tiverem respondido as quatro.'
  String get waitingText => 'As respostas aparecem quando vocês dois tiverem respondido as quatro.';

  /// pt: 'Ainda faltam perguntas. As respostas aparecem quando vocês dois responderem as quatro.'
  String get waitingIncomplete =>
      'Ainda faltam perguntas. As respostas aparecem quando vocês dois responderem as quatro.';

  /// pt: 'Responder as que faltam'
  String get answerMissing => 'Responder as que faltam';

  /// pt: 'Verificar de novo'
  String get checkAgain => 'Verificar de novo';

  /// pt: 'Rever minhas respostas'
  String get review => 'Rever minhas respostas';

  /// pt: 'Descartar esta resposta?'
  String get discardTitle => 'Descartar esta resposta?';

  /// pt: 'O texto que você escreveu não foi salvo.'
  String get discardText => 'O texto que você escreveu não foi salvo.';

  /// pt: 'Descartar'
  String get discard => 'Descartar';

  /// pt: 'Continuar escrevendo'
  String get keepWriting => 'Continuar escrevendo';

  /// pt: 'Suas respostas juntas'
  String get revealTitle => 'Suas respostas juntas';

  /// pt: 'juntas'
  String get revealHighlight => 'juntas';

  /// pt: 'Agora que os dois terminaram, aparecem as duas respostas de cada pergunta.'
  String get revealSubtitle =>
      'Agora que os dois terminaram, aparecem as duas respostas de cada pergunta.';

  /// pt: 'Sem notas. Só o que cada um escreveu.'
  String get revealNote => 'Sem notas. Só o que cada um escreveu.';

  /// pt: 'Você'
  String get you => 'Você';

  /// pt: 'Seu par'
  String get partnerFallback => 'Seu par';

  /// pt: 'Pulou esta pergunta'
  String get skippedAnswer => 'Pulou esta pergunta';

  /// pt: 'Fechar'
  String get close => 'Fechar';

  /// pt: 'O check-in é para vocês dois'
  String get soloTitle => 'O check-in é para vocês dois';

  /// pt: 'Quando sua pessoa entrar, o check-in semanal aparece aqui.'
  String get soloText => 'Quando sua pessoa entrar, o check-in semanal aparece aqui.';

  /// pt: 'Não deu para abrir o check-in'
  String get loadErrorTitle => 'Não deu para abrir o check-in';

  /// pt: 'Nada foi perdido. Tente de novo.'
  String get loadErrorText => 'Nada foi perdido. Tente de novo.';

  Map<String, String> get errors => {'other': 'Não deu para salvar agora. Tente de novo.'};
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

  /// pt: 'Descartar as alterações?'
  String get discardTitle => 'Descartar as alterações?';

  /// pt: 'O que você escreveu não será salvo.'
  String get discardText => 'O que você escreveu não será salvo.';

  /// pt: 'Descartar'
  String get discard => 'Descartar';

  /// pt: 'Continuar escrevendo'
  String get keepWriting => 'Continuar escrevendo';
}

// Path: connectTouch
class Translations$connectTouch$pt {
  Translations$connectTouch$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Toque'
  String get title => 'Toque';

  /// pt: 'Cartas neutras, sem tempero. Fazer ou pular, sem pressão.'
  String get text => 'Cartas neutras, sem tempero. Fazer ou pular, sem pressão.';

  /// pt: 'Temas de toque'
  String get switchTitle => 'Temas de toque';

  /// pt: 'Vale para vocês dois: se um desligar, some para os dois.'
  String get switchText => 'Vale para vocês dois: se um desligar, some para os dois.';

  /// pt: 'Temas de toque desligados'
  String get offTitle => 'Temas de toque desligados';

  /// pt: 'Você ou seu par desligou. Podem religar aqui quando quiserem.'
  String get offText => 'Você ou seu par desligou. Podem religar aqui quando quiserem.';

  /// pt: 'Nenhuma carta agora'
  String get emptyTitle => 'Nenhuma carta agora';

  /// pt: 'Volte mais tarde.'
  String get emptyText => 'Volte mais tarde.';

  /// pt: 'Pronto'
  String get done => 'Pronto';

  /// pt: 'Pular'
  String get skip => 'Pular';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo em instantes.'
  String get errorText => 'Tente de novo em instantes.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para mudar agora. Tente de novo.',
  };
}

// Path: connectUs
class Translations$connectUs$pt {
  Translations$connectUs$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Nós'
  String get title => 'Nós';

  /// pt: 'Envie “sinto saudade de nós” com um toque. Leve, sem culpa. Seu par não precisa responder.'
  String get text =>
      'Envie “sinto saudade de nós” com um toque. Leve, sem culpa. Seu par não precisa responder.';

  /// pt: 'Enviar com carinho'
  String get send => 'Enviar com carinho';

  /// pt: 'Sugerir um plano pequeno'
  String get plan => 'Sugerir um plano pequeno';

  /// pt: 'Enviado. Sem pressa de resposta.'
  String get sentNote => 'Enviado. Sem pressa de resposta.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para enviar agora. Tente de novo.',
  };
}

// Path: dateNight
class Translations$dateNight$pt {
  Translations$dateNight$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Encontro'
  String get title => 'Encontro';

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

// Path: dates
class Translations$dates$pt {
  Translations$dates$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Datas'
  String get title => 'Datas';

  /// pt: 'Datas'
  String get segmentDates => 'Datas';

  /// pt: 'Presentes'
  String get segmentGifts => 'Presentes';

  /// pt: 'Feriados'
  String get segmentHolidays => 'Feriados';

  /// pt: 'Nome'
  String get titleLabel => 'Nome';

  /// pt: 'Ex.: aniversário dele'
  String get titleHint => 'Ex.: aniversário dele';

  Map<String, String> get titleErrors => {
    'empty': 'Dê um nome a esta data',
    'tooLong': 'O nome está muito longo',
  };
  Map<String, String> get kinds => {
    'relationship': 'Namoro',
    'birthday': 'Aniversário',
    'first': 'Uma primeira vez',
    'trip': 'Viagem',
    'custom': 'Outra',
    'holiday': 'Feriado',
    'reunion': 'Reencontro',
    'other': '',
  };

  /// pt: 'Mês'
  String get monthLabel => 'Mês';

  /// pt: 'Dia'
  String get dayLabel => 'Dia';

  /// pt: 'Ano (opcional)'
  String get yearLabel => 'Ano (opcional)';

  /// pt: 'Ex.: 1994'
  String get yearHint => 'Ex.: 1994';

  /// pt: 'Sem o ano, a data só se repete, sem idade.'
  String get yearHelp => 'Sem o ano, a data só se repete, sem idade.';

  Map<String, String> get yearErrors => {'invalid': 'Use um ano entre 1900 e 2200'};
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

  /// pt: '{day} {month} · {kind}'
  String dayLine({required Object day, required Object month, required Object kind}) =>
      '${day} ${month} · ${kind}';

  /// pt: '{day} {month}'
  String dayOnly({required Object day, required Object month}) => '${day} ${month}';

  /// pt: 'Guardar data'
  String get saveDate => 'Guardar data';

  /// pt: 'Apagar'
  String get delete => 'Apagar';

  /// pt: 'Adicionar'
  String get add => 'Adicionar';

  /// pt: 'Nenhuma data ainda'
  String get emptyDatesTitle => 'Nenhuma data ainda';

  /// pt: 'Guarde aniversários e datas que importam. Avisamos antes.'
  String get emptyDatesText => 'Guarde aniversários e datas que importam. Avisamos antes.';

  /// pt: 'Ideias de presente só você vê.'
  String get giftsPrivate => 'Ideias de presente só você vê.';

  /// pt: 'Ex.: livro de poemas'
  String get giftHint => 'Ex.: livro de poemas';

  Map<String, String> get giftErrors => {
    'empty': 'Escreva a ideia de presente',
    'tooLong': 'A ideia de presente está muito longa',
  };

  /// pt: 'Já dei'
  String get given => 'Já dei';

  /// pt: 'Nenhuma ideia ainda'
  String get emptyGiftsTitle => 'Nenhuma ideia ainda';

  /// pt: 'Anote presentes quando pensar neles.'
  String get emptyGiftsText => 'Anote presentes quando pensar neles.';

  /// pt: 'Sem feriados por aqui'
  String get emptyHolidaysTitle => 'Sem feriados por aqui';

  /// pt: 'O calendário ainda não tem feriados para você.'
  String get emptyHolidaysText => 'O calendário ainda não tem feriados para você.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Seus dados continuam salvos. Tente de novo.'
  String get errorText => 'Seus dados continuam salvos. Tente de novo.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };
}

// Path: day
class Translations$day$pt {
  Translations$day$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: '{day} de {month} de {year}'
  String dateLine({required Object day, required Object month, required Object year}) =>
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

  /// pt: 'Dia anterior'
  String get previous => 'Dia anterior';

  /// pt: 'Próximo dia'
  String get next => 'Próximo dia';

  /// pt: 'Encontro planejado'
  String get planned => 'Encontro planejado';

  /// pt: 'Nada marcado neste dia'
  String get emptyTitle => 'Nada marcado neste dia';

  /// pt: 'Um dia livre também é bom.'
  String get emptyText => 'Um dia livre também é bom.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo daqui a pouco.'
  String get errorText => 'Tente de novo daqui a pouco.';
}

// Path: devices
class Translations$devices$pt {
  Translations$devices$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Dispositivos de notificação'
  String get title => 'Dispositivos de notificação';

  /// pt: 'Celulares que recebem notificações desta conta. Remover um para as notificações dele.'
  String get subtitle =>
      'Celulares que recebem notificações desta conta. Remover um para as notificações dele.';

  /// pt: 'Este dispositivo'
  String get current => 'Este dispositivo';

  /// pt: 'Registrado hoje às {time}'
  String registeredToday({required Object time}) => 'Registrado hoje às ${time}';

  /// pt: 'Registrado ontem às {time}'
  String registeredYesterday({required Object time}) => 'Registrado ontem às ${time}';

  /// pt: 'Registrado em {date}'
  String registeredOn({required Object date}) => 'Registrado em ${date}';

  /// pt: 'iPhone'
  String get platformIos => 'iPhone';

  /// pt: 'Android'
  String get platformAndroid => 'Android';

  /// pt: 'Parar notificações deste dispositivo?'
  String get revokeTitle => 'Parar notificações deste dispositivo?';

  /// pt: '{name} vai deixar de receber notificações desta conta.'
  String revokeText({required Object name}) =>
      '${name} vai deixar de receber notificações desta conta.';

  /// pt: 'Parar notificações'
  String get revokeConfirm => 'Parar notificações';

  /// pt: 'Notificações paradas nesse dispositivo.'
  String get revoked => 'Notificações paradas nesse dispositivo.';

  /// pt: 'Nenhum dispositivo de notificação'
  String get emptyTitle => 'Nenhum dispositivo de notificação';

  /// pt: 'Os dispositivos que recebem notificações desta conta aparecem aqui.'
  String get emptyText => 'Os dispositivos que recebem notificações desta conta aparecem aqui.';

  Map<String, String> get errors => {
    'NETWORK': 'Sem conexão. Tente de novo quando voltar a internet.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'DEVICE_REVOKE_FAILED': 'Não deu para parar as notificações nesse dispositivo. Tente de novo.',
    'other': 'Não deu para parar as notificações nesse dispositivo. Tente de novo.',
  };
}

// Path: discreet
class Translations$discreet$pt {
  Translations$discreet$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Modo discreto'
  String get title => 'Modo discreto';

  /// pt: 'Ícone neutro'
  String get neutralIcon => 'Ícone neutro';

  /// pt: 'Notificações neutras'
  String get neutralNotifications => 'Notificações neutras';

  /// pt: 'Ocultar texto do widget'
  String get hideWidgetText => 'Ocultar texto do widget';

  /// pt: 'Oculta nomes e conteúdo em notificações e widgets. Sem imagem do casal no ícone.'
  String get note =>
      'Oculta nomes e conteúdo em notificações e widgets. Sem imagem do casal no ícone.';

  /// pt: 'Não deu para salvar agora. Tente de novo.'
  String get saveError => 'Não deu para salvar agora. Tente de novo.';
}

// Path: distance
class Translations$distance$pt {
  Translations$distance$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Distância'
  String get title => 'Distância';

  /// pt: 'Dois relógios, cada um no seu fuso, sem confusão.'
  String get text => 'Dois relógios, cada um no seu fuso, sem confusão.';

  /// pt: 'Você'
  String get you => 'Você';

  /// pt: 'Seu par'
  String get partner => 'Seu par';

  /// pt: 'Quando seu par entrar, o relógio dele ou dela aparece aqui.'
  String get noPartner => 'Quando seu par entrar, o relógio dele ou dela aparece aqui.';

  /// pt: 'Vocês estão no mesmo fuso por enquanto.'
  String get sameZone => 'Vocês estão no mesmo fuso por enquanto.';

  /// pt: '{n} dias até vocês se verem'
  String reunionDays({required Object n}) => '${n} dias até vocês se verem';

  /// pt: 'Vocês se veem hoje'
  String get reunionToday => 'Vocês se veem hoje';

  /// pt: 'Vocês se veem amanhã'
  String get reunionTomorrow => 'Vocês se veem amanhã';

  /// pt: 'Sem data de reencontro'
  String get noReunionTitle => 'Sem data de reencontro';

  /// pt: 'Salve um “Reencontro” nas datas e a contagem aparece aqui.'
  String get noReunionText => 'Salve um “Reencontro” nas datas e a contagem aparece aqui.';

  /// pt: 'Salvar uma data'
  String get addReunion => 'Salvar uma data';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo em instantes.'
  String get errorText => 'Tente de novo em instantes.';
}

// Path: fightStyle
class Translations$fightStyle$pt {
  Translations$fightStyle$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Como eu reajo numa briga'
  String get exerciseTitle => 'Como eu reajo numa briga';

  /// pt: 'reajo'
  String get exerciseHighlight => 'reajo';

  /// pt: 'Seis perguntas rápidas, só para você.'
  String get exerciseSubtitle => 'Seis perguntas rápidas, só para você.';

  /// pt: 'Pergunta {current} de {total}'
  String questionOf({required Object current, required Object total}) =>
      'Pergunta ${current} de ${total}';

  List<String> get questions => [
    'Quando a conversa esquenta, o que você faz primeiro?',
    'Se o seu par se cala no meio da briga, você...',
    'Depois de uma discussão, o que costuma acontecer?',
    'O que mais te incomoda numa briga?',
    'Quando percebe que exagerou, você...',
    'O que te ajuda a voltar ao normal?',
  ];
  Map<String, String> get options1 => {
    'pursue': 'Continuo falando até resolver.',
    'withdraw': 'Preciso de um tempo antes de continuar.',
    'repair': 'Tento aliviar o clima com algo mais leve.',
    'avoid': 'Mudo de assunto para não piorar.',
    'other': '',
  };
  Map<String, String> get options2 => {
    'pursue': 'Insisto para ele falar.',
    'withdraw': 'Também me calo.',
    'repair': 'Pergunto com calma o que aconteceu.',
    'avoid': 'Deixo para depois.',
    'other': '',
  };
  Map<String, String> get options3 => {
    'pursue': 'Eu procuro a conversa logo.',
    'withdraw': 'Eu fico um tempo comigo.',
    'repair': 'Eu penso no que posso consertar.',
    'avoid': 'Eu prefiro não voltar ao assunto.',
    'other': '',
  };
  Map<String, String> get options4 => {
    'pursue': 'Ficar sem resposta.',
    'withdraw': 'Sentir pressão.',
    'repair': 'Ver que a gente não se entende.',
    'avoid': 'A conversa se arrastar.',
    'other': '',
  };
  Map<String, String> get options5 => {
    'pursue': 'Falo mais ainda para explicar.',
    'withdraw': 'Me fecho até me acalmar.',
    'repair': 'Peço desculpas ou proponho um jeito de resolver.',
    'avoid': 'Espero o assunto esfriar.',
    'other': '',
  };
  Map<String, String> get options6 => {
    'pursue': 'Terminar a conversa.',
    'withdraw': 'Um tempo quieto.',
    'repair': 'Um gesto pequeno de carinho.',
    'avoid': 'Seguir o dia como se nada tivesse acontecido.',
    'other': '',
  };

  /// pt: 'Continuar'
  String get continueAction => 'Continuar';

  /// pt: 'Ver resultado'
  String get finishAction => 'Ver resultado';

  /// pt: 'Voltar'
  String get back => 'Voltar';

  /// pt: 'Só você vê as respostas. Nada é enviado ao seu par.'
  String get privateNote => 'Só você vê as respostas. Nada é enviado ao seu par.';

  /// pt: 'Como você costuma reagir'
  String get resultTitle => 'Como você costuma reagir';

  /// pt: 'reagir'
  String get resultHighlight => 'reagir';

  /// pt: 'Seu padrão'
  String get patternTag => 'Seu padrão';

  Map<String, String> get descriptions => {
    'pursue': 'Você tende a buscar a conversa logo, mesmo quando o assunto ainda está quente.',
    'withdraw': 'Você tende a se afastar primeiro e voltar depois.',
    'repair': 'Você tende a procurar um jeito de consertar pouco depois da briga.',
    'avoid': 'Você tende a deixar o assunto de lado para não piorar na hora.',
    'other': '',
  };
  Map<String, String> get practices => {
    'pursue': 'Isso ajuda a resolver rápido. Vale pausar antes de piorar e ouvir até o fim.',
    'withdraw': 'Isso ajuda a pausar antes de piorar. Escolha um jeito combinado de voltar.',
    'repair': 'Isso ajuda a retomar depois da briga. Um pedido de desculpas curto costuma bastar.',
    'avoid': 'Isso ajuda a pausar antes de piorar. Marque um momento curto para retomar.',
    'other': '',
  };

  /// pt: 'Combine com {name} um sinal de volta.'
  String partnerSignal({required Object name}) => 'Combine com ${name} um sinal de volta.';

  /// pt: 'Adicionar às minhas ferramentas de reparo'
  String get addToTools => 'Adicionar às minhas ferramentas de reparo';

  /// pt: 'Já está nas suas ferramentas'
  String get addedToTools => 'Já está nas suas ferramentas';

  /// pt: 'Guardar só para mim'
  String get keepMine => 'Guardar só para mim';

  /// pt: 'Refazer o exercício'
  String get retake => 'Refazer o exercício';

  /// pt: 'Adicionado às suas ferramentas de reparo.'
  String get addedToast => 'Adicionado às suas ferramentas de reparo.';

  /// pt: 'Não deu para carregar'
  String get loadErrorTitle => 'Não deu para carregar';

  /// pt: 'Não deu para abrir seu resultado agora. Tente de novo.'
  String get loadErrorText => 'Não deu para abrir seu resultado agora. Tente de novo.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para salvar agora. Suas respostas continuam aqui.',
  };
  Map<String, String> get addErrors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para adicionar agora. Tente de novo.',
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

  Map<String, String> get textErrors => {
    'empty': 'Escreva uma coisa boa primeiro.',
    'tooLong': 'Use no máximo 140 caracteres.',
  };

  /// pt: 'Fica salvo só neste celular.'
  String get localNote => 'Fica salvo só neste celular.';

  /// pt: 'Salvar'
  String get save => 'Salvar';

  /// pt: 'Não deu para guardar agora. Tente de novo.'
  String get saveError => 'Não deu para guardar agora. Tente de novo.';
}

// Path: games
class Translations$games$pt {
  Translations$games$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$games$hub$pt hub = Translations$games$hub$pt.internal(_root);
  late final Translations$games$kinds$pt kinds = Translations$games$kinds$pt.internal(_root);
  late final Translations$games$start$pt start = Translations$games$start$pt.internal(_root);
  late final Translations$games$invitation$pt invitation =
      Translations$games$invitation$pt.internal(_root);
  late final Translations$games$waiting$pt waiting = Translations$games$waiting$pt.internal(_root);
  late final Translations$games$active$pt active = Translations$games$active$pt.internal(_root);
  late final Translations$games$playing$pt playing = Translations$games$playing$pt.internal(_root);
  late final Translations$games$date$pt date = Translations$games$date$pt.internal(_root);
  Map<String, String> get reflections => {
    'great': 'Foi ótimo',
    'ok': 'Foi bom',
    'did_not_happen': 'Não aconteceu',
    'other': 'Sem resposta',
  };
  late final Translations$games$waitingPartner$pt waitingPartner =
      Translations$games$waitingPartner$pt.internal(_root);
  late final Translations$games$finished$pt finished = Translations$games$finished$pt.internal(
    _root,
  );
  late final Translations$games$notFound$pt notFound = Translations$games$notFound$pt.internal(
    _root,
  );
  late final Translations$games$cancel$pt cancel = Translations$games$cancel$pt.internal(_root);
  late final Translations$games$noPartner$pt noPartner = Translations$games$noPartner$pt.internal(
    _root,
  );
  late final Translations$games$common$pt common = Translations$games$common$pt.internal(_root);

  /// pt: 'Não deu para abrir o jogo'
  String get loadErrorTitle => 'Não deu para abrir o jogo';

  /// pt: 'Nada foi perdido. Tente de novo.'
  String get loadErrorText => 'Nada foi perdido. Tente de novo.';

  Map<String, String> get errors => {
    'NOT_PAIRED': 'Os jogos precisam dos dois conectados.',
    'NOT_FOUND': 'Esse jogo não existe mais. Vamos atualizar.',
    'INVALID_GAME_ACTION': 'Esse jogo mudou. Vamos atualizar.',
    'GAME_ALREADY_OPEN': 'Já existe um jogo aberto. Termine ou cancele antes de chamar de novo.',
    'GAME_NOT_COMPLETE': 'Seu par ainda está respondendo. Tente de novo quando terminarem.',
    'INVALID_GAME_INDEX': 'Essa pergunta mudou. Vamos atualizar.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };
}

// Path: gifts
class Translations$gifts$pt {
  Translations$gifts$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Página de presentes'
  String get title => 'Página de presentes';

  /// pt: 'Uma página que seu par vê no app. Você escolhe o que compartilhar.'
  String get subtitle => 'Uma página que seu par vê no app. Você escolhe o que compartilhar.';

  /// pt: 'Meus desejos'
  String get myTitle => 'Meus desejos';

  /// pt: 'Do seu par'
  String get partnerTitle => 'Do seu par';

  /// pt: 'Nenhum desejo ainda'
  String get emptyPageTitle => 'Nenhum desejo ainda';

  /// pt: 'Adicione um desejo ou espere seu par compartilhar um.'
  String get emptyPageTextShared => 'Adicione um desejo ou espere seu par compartilhar um.';

  /// pt: 'Adicione o que você gostaria de ganhar. Fica privado até vocês se conectarem.'
  String get emptyPageTextSolo =>
      'Adicione o que você gostaria de ganhar. Fica privado até vocês se conectarem.';

  /// pt: 'Nenhum desejo ainda'
  String get emptyMineTitle => 'Nenhum desejo ainda';

  /// pt: 'Adicione o que você gostaria de ganhar.'
  String get emptyMineText => 'Adicione o que você gostaria de ganhar.';

  /// pt: 'Nada compartilhado ainda'
  String get emptyPartnerTitle => 'Nada compartilhado ainda';

  /// pt: 'Quando seu par compartilhar um desejo, ele aparece aqui.'
  String get emptyPartnerText => 'Quando seu par compartilhar um desejo, ele aparece aqui.';

  /// pt: 'Novo desejo'
  String get addTitle => 'Novo desejo';

  /// pt: 'Editar desejo'
  String get editTitle => 'Editar desejo';

  /// pt: 'Presente'
  String get titleLabel => 'Presente';

  /// pt: 'Ex.: livro de poemas'
  String get titleHint => 'Ex.: livro de poemas';

  Map<String, String> get titleErrors => {
    'empty': 'Dê um nome ao presente.',
    'tooLong': 'Use no máximo 120 caracteres.',
  };

  /// pt: 'Tamanho, cor, onde encontrar.'
  String get noteHint => 'Tamanho, cor, onde encontrar.';

  Map<String, String> get noteErrors => {'tooLong': 'Use no máximo 1000 caracteres na nota.'};

  /// pt: 'Orçamento (opcional)'
  String get budgetLabel => 'Orçamento (opcional)';

  Map<String, String> get budgets => {
    'free': 'Grátis',
    'low': 'Baixo',
    'medium': 'Médio',
    'high': 'Alto',
    'other': '',
  };

  /// pt: 'Sem orçamento'
  String get noBudget => 'Sem orçamento';

  /// pt: 'Compartilhado'
  String get shared => 'Compartilhado';

  /// pt: 'Privado'
  String get private => 'Privado';

  /// pt: 'Seu par pode ver este desejo.'
  String get sharedHint => 'Seu par pode ver este desejo.';

  /// pt: 'Só você vê este desejo.'
  String get privateHint => 'Só você vê este desejo.';

  /// pt: 'Conecte-se com seu par para compartilhar um desejo.'
  String get sharedNeedsPartner => 'Conecte-se com seu par para compartilhar um desejo.';

  /// pt: 'Salvar'
  String get save => 'Salvar';

  /// pt: 'Adicionar'
  String get add => 'Adicionar';

  /// pt: 'Excluir'
  String get delete => 'Excluir';

  /// pt: 'Excluir este desejo?'
  String get deleteTitle => 'Excluir este desejo?';

  /// pt: 'Ele desaparece para você e seu par.'
  String get deleteText => 'Ele desaparece para você e seu par.';

  /// pt: 'Excluir'
  String get deleteConfirm => 'Excluir';

  /// pt: 'PRESENTES'
  String get entryLabel => 'PRESENTES';

  /// pt: 'Página de presentes'
  String get entryTitle => 'Página de presentes';

  /// pt: 'Desejos que você escolhe compartilhar, ou guardar só para você.'
  String get entryText => 'Desejos que você escolhe compartilhar, ou guardar só para você.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um momento.',
    'other': 'Não foi possível agora. Tente de novo.',
  };
}

// Path: globalErrors
class Translations$globalErrors$pt {
  Translations$globalErrors$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Sem conexão. Suas anotações ficam salvas e sincronizam depois.'
  String get offline => 'Sem conexão. Suas anotações ficam salvas e sincronizam depois.';

  /// pt: 'Não deu certo'
  String get errorTitle => 'Não deu certo';

  /// pt: 'Tente de novo em instantes.'
  String get errorText => 'Tente de novo em instantes.';

  /// pt: 'Sem conexão'
  String get networkTitle => 'Sem conexão';

  /// pt: 'Verifique a conexão e tente de novo.'
  String get networkText => 'Verifique a conexão e tente de novo.';

  /// pt: 'A conexão demorou'
  String get timeoutTitle => 'A conexão demorou';

  /// pt: 'Tente de novo em instantes.'
  String get timeoutText => 'Tente de novo em instantes.';

  /// pt: 'Calma aí'
  String get rateTitle => 'Calma aí';

  /// pt: 'Muitas tentativas seguidas. Espere um pouco e tente de novo.'
  String get rateText => 'Muitas tentativas seguidas. Espere um pouco e tente de novo.';

  /// pt: 'Não encontramos'
  String get notFoundTitle => 'Não encontramos';

  /// pt: 'Talvez isso não esteja mais disponível.'
  String get notFoundText => 'Talvez isso não esteja mais disponível.';

  /// pt: 'Tentar de novo'
  String get retry => 'Tentar de novo';

  /// pt: 'Tentar em {seconds}s'
  String retryIn({required Object seconds}) => 'Tentar em ${seconds}s';

  /// pt: 'Atualize o app'
  String get updateTitle => 'Atualize o app';

  /// pt: 'app'
  String get updateHighlight => 'app';

  /// pt: 'Há uma versão nova. Atualize para continuar.'
  String get updateText => 'Há uma versão nova. Atualize para continuar.';

  /// pt: 'Atualizar'
  String get updateAction => 'Atualizar';

  /// pt: 'Não foi possível abrir a loja. Atualize por lá.'
  String get updateUnavailable => 'Não foi possível abrir a loja. Atualize por lá.';
}

// Path: griefSupport
class Translations$griefSupport$pt {
  Translations$griefSupport$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Estamos com você'
  String get title => 'Estamos com você';

  /// pt: 'você'
  String get highlight => 'você';

  /// pt: 'Suas lembranças continuam aqui, no seu ritmo.'
  String get text => 'Suas lembranças continuam aqui, no seu ritmo.';

  /// pt: 'Ver apoio'
  String get seeSupport => 'Ver apoio';

  /// pt: 'Voltar ao início'
  String get backHome => 'Voltar ao início';
}

// Path: guides
class Translations$guides$pt {
  Translations$guides$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$guides$hub$pt hub = Translations$guides$hub$pt.internal(_root);
  late final Translations$guides$viewer$pt viewer = Translations$guides$viewer$pt.internal(_root);
  late final Translations$guides$gate$pt gate = Translations$guides$gate$pt.internal(_root);
  late final Translations$guides$finish$pt finish = Translations$guides$finish$pt.internal(_root);
}

// Path: hardConversation
class Translations$hardConversation$pt {
  Translations$hardConversation$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Preparar uma conversa difícil'
  String get title => 'Preparar uma conversa difícil';

  /// pt: 'Passo {current} de {total}'
  String stepOf({required Object current, required Object total}) => 'Passo ${current} de ${total}';

  /// pt: 'O que aconteceu?'
  String get whatTitle => 'O que aconteceu?';

  /// pt: 'Se quiser, conte do seu jeito'
  String get whatHint => 'Se quiser, conte do seu jeito';

  /// pt: 'Ela se sentiu ignorada'
  String get whatIgnored => 'Ela se sentiu ignorada';

  /// pt: 'Brigamos por dinheiro'
  String get whatMoney => 'Brigamos por dinheiro';

  /// pt: 'Foi um mal-entendido'
  String get whatMisunderstanding => 'Foi um mal-entendido';

  /// pt: 'Outro: escrever'
  String get whatOther => 'Outro: escrever';

  /// pt: 'Do que eu preciso?'
  String get needTitle => 'Do que eu preciso?';

  /// pt: 'Se quiser, acrescente algo'
  String get needHint => 'Se quiser, acrescente algo';

  /// pt: 'Ser ouvido'
  String get needHeard => 'Ser ouvido';

  /// pt: 'Pedir desculpa'
  String get needApology => 'Pedir desculpa';

  /// pt: 'Combinar algo'
  String get needAgree => 'Combinar algo';

  /// pt: 'Como dizer'
  String get sayTitle => 'Como dizer';

  /// pt: 'Um ponto de partida para você editar antes de enviar.'
  String get sayIntro => 'Um ponto de partida para você editar antes de enviar.';

  /// pt: 'Sua frase de abertura'
  String get sayHint => 'Sua frase de abertura';

  Map<String, String> get messageErrors => {
    'empty': 'Escreva a frase primeiro',
    'tooLong': 'Esta frase está muito longa',
  };

  /// pt: 'Escrevendo uma abertura gentil…'
  String get generating => 'Escrevendo uma abertura gentil…';

  /// pt: 'Mais gentil'
  String get gentler => 'Mais gentil';

  /// pt: 'Mais direto'
  String get moreDirect => 'Mais direto';

  /// pt: 'Copiar'
  String get copy => 'Copiar';

  /// pt: 'Copiado'
  String get copied => 'Copiado';

  /// pt: 'Enviar como recado'
  String get sendAsNote => 'Enviar como recado';

  /// pt: 'Recado enviado'
  String get sent => 'Recado enviado';

  /// pt: 'Sair'
  String get exit => 'Sair';

  /// pt: 'Próximo'
  String get next => 'Próximo';

  /// pt: 'Voltar'
  String get back => 'Voltar';

  /// pt: 'Preciso de pausa'
  String get needPause => 'Preciso de pausa';

  /// pt: 'Tentar de novo'
  String get retry => 'Tentar de novo';

  /// pt: 'Não deu para escrever uma frase agora.'
  String get generationFailed => 'Não deu para escrever uma frase agora.';

  /// pt: 'A mascote só vê o que você escreve aqui. Os dados do seu par nunca são enviados.'
  String get privateNote =>
      'A mascote só vê o que você escreve aqui. Os dados do seu par nunca são enviados.';

  /// pt: 'Sem conexão. A frase de abertura precisa de internet.'
  String get offline => 'Sem conexão. A frase de abertura precisa de internet.';

  /// pt: 'Não deu para carregar'
  String get emptyTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo em instantes.'
  String get emptyText => 'Tente de novo em instantes.';

  Map<String, String> get errors => {
    'CHAT_LIMIT': 'As mensagens de hoje acabaram.',
    'CHAT_DISABLED': 'A conversa está desligada. Ligue para usar a mascote.',
    'CHAT_UNAVAILABLE': 'A conversa não está disponível agora.',
    'UPSTREAM': 'Não deu para escrever uma frase agora. Tente de novo.',
    'NOT_PAIRED': 'Para enviar, você precisa estar conectado com seu par no app.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };
}

// Path: heavyDay
class Translations$heavyDay$pt {
  Translations$heavyDay$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Aviso de dias pesados'
  String get title => 'Aviso de dias pesados';

  /// pt: 'Aviso de dias pesados'
  String get gateTitle => 'Aviso de dias pesados';

  /// pt: 'Às vezes um dia pesa. Você pode avisar seu par com uma frase curta, sem detalhes. Seu par não vê seus programas nem o que você escreve.'
  String get gateText =>
      'Às vezes um dia pesa. Você pode avisar seu par com uma frase curta, sem detalhes. Seu par não vê seus programas nem o que você escreve.';

  /// pt: 'Ligar'
  String get activate => 'Ligar';

  /// pt: 'Agora não'
  String get notNow => 'Agora não';

  /// pt: 'Um dia delicado. Um pouco mais de carinho ajuda.'
  String get noticeBody => 'Um dia delicado. Um pouco mais de carinho ajuda.';

  /// pt: '{name} veria: “Um dia delicado. Um pouco mais de carinho ajuda.”'
  String previewPartner({required Object name}) =>
      '${name} veria: “Um dia delicado. Um pouco mais de carinho ajuda.”';

  /// pt: 'Seu par veria: “Um dia delicado. Um pouco mais de carinho ajuda.”'
  String get previewGeneric => 'Seu par veria: “Um dia delicado. Um pouco mais de carinho ajuda.”';

  /// pt: 'A cada vez'
  String get frequencyAsk => 'A cada vez';

  /// pt: 'Sempre'
  String get frequencyAlways => 'Sempre';

  /// pt: 'Compartilhar'
  String get share => 'Compartilhar';

  /// pt: 'Não compartilhar'
  String get cancel => 'Não compartilhar';

  /// pt: 'Aviso enviado para {name}'
  String confirmationTitle({required Object name}) => 'Aviso enviado para ${name}';

  /// pt: 'Aviso enviado'
  String get confirmationGeneric => 'Aviso enviado';

  /// pt: 'Seu par vê no widget de recados, se estiver ativado.'
  String get confirmationHint => 'Seu par vê no widget de recados, se estiver ativado.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Não deu para fazer isso agora. Tente de novo.'
  String get errorText => 'Não deu para fazer isso agora. Tente de novo.';
}

// Path: help
class Translations$help$pt {
  Translations$help$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Um dia difícil'
  String get badDayTitle => 'Um dia difícil';

  /// pt: 'Três coisas pequenas que podem ajudar agora. Nada obrigatório.'
  String get badDayText => 'Três coisas pequenas que podem ajudar agora. Nada obrigatório.';

  /// pt: 'Começar uma conversa'
  String get starterTitle => 'Começar uma conversa';

  /// pt: 'Uma pergunta para abrir, sem pressa.'
  String get starterText => 'Uma pergunta para abrir, sem pressa.';

  /// pt: 'Outra'
  String get another => 'Outra';

  /// pt: 'Nada por aqui ainda'
  String get emptyTitle => 'Nada por aqui ainda';

  /// pt: 'Estamos preparando mais sugestões.'
  String get emptyText => 'Estamos preparando mais sugestões.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo daqui a pouco.'
  String get errorText => 'Tente de novo daqui a pouco.';
}

// Path: helpSupport
class Translations$helpSupport$pt {
  Translations$helpSupport$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Ajuda'
  String get title => 'Ajuda';

  /// pt: 'Falar com o suporte'
  String get contactTitle => 'Falar com o suporte';

  /// pt: 'Relatar um erro'
  String get reportBug => 'Relatar um erro';

  /// pt: 'Perguntas frequentes'
  String get faqTitle => 'Perguntas frequentes';

  Map<String, String> get faqQuestions => {
    'replyTime': 'Quando vou receber uma resposta?',
    'offline': 'E se eu enviar sem internet?',
    'privacy': 'Quem lê o que eu envio?',
    'reportBug': 'Como relato um erro?',
  };
  Map<String, String> get faqAnswers => {
    'replyTime': 'Respondemos em até 2 dias úteis.',
    'offline': 'A mensagem fica salva e sai quando você estiver online de novo.',
    'privacy': 'Só a equipe de suporte. Nada é compartilhado com seu parceiro.',
    'reportBug': 'Escolha Erro no formulário e conte o que aconteceu.',
  };

  /// pt: 'Uma mensagem está salva e será enviada quando você estiver online.'
  String get pendingNote => 'Uma mensagem está salva e será enviada quando você estiver online.';

  /// pt: 'Uma mensagem salva não pôde ser enviada e foi removida. Escreva de novo se ainda importar.'
  String get discardedNote =>
      'Uma mensagem salva não pôde ser enviada e foi removida. Escreva de novo se ainda importar.';

  /// pt: 'Suporte'
  String get supportTitle => 'Suporte';

  /// pt: 'Como podemos ajudar?'
  String get supportHeading => 'Como podemos ajudar?';

  /// pt: 'ajudar'
  String get supportHighlight => 'ajudar';

  Map<String, String> get topics => {
    'account': 'Conta',
    'billing': 'Cobrança',
    'bug': 'Erro',
    'other': 'Outro',
  };

  /// pt: 'Mensagem'
  String get messageLabel => 'Mensagem';

  /// pt: 'Conte o que aconteceu, com o máximo de detalhes que quiser.'
  String get messageHint => 'Conte o que aconteceu, com o máximo de detalhes que quiser.';

  Map<String, String> get messageErrors => {
    'empty': 'Escreva sua mensagem primeiro',
    'tooLong': 'A mensagem está muito longa',
  };

  /// pt: 'E-mail para resposta'
  String get replyEmailLabel => 'E-mail para resposta';

  /// pt: 'voce@email.com'
  String get replyEmailHint => 'voce@email.com';

  Map<String, String> get replyEmailErrors => {
    'invalid': 'Confira o e-mail.',
    'tooLong': 'Este e-mail é muito longo',
  };

  /// pt: 'Respondemos em até 2 dias úteis.'
  String get replyTime => 'Respondemos em até 2 dias úteis.';

  /// pt: 'Enviar'
  String get send => 'Enviar';

  /// pt: 'Mensagem enviada'
  String get sentTitle => 'Mensagem enviada';

  /// pt: 'Obrigado. Respondemos em até 2 dias úteis.'
  String get sentText => 'Obrigado. Respondemos em até 2 dias úteis.';

  /// pt: 'Mensagem salva'
  String get queuedTitle => 'Mensagem salva';

  /// pt: 'Vamos enviar quando você estiver online. Ainda não foi entregue.'
  String get queuedText => 'Vamos enviar quando você estiver online. Ainda não foi entregue.';

  /// pt: 'Pronto'
  String get done => 'Pronto';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Você enviou várias mensagens hoje. Tente de novo amanhã.',
    'noData': 'Não deu para enviar agora. Sua mensagem continua aqui.',
    'other': 'Não deu para enviar agora. Sua mensagem continua aqui.',
  };

  /// pt: 'Descartar esta mensagem?'
  String get discardTitle => 'Descartar esta mensagem?';

  /// pt: 'O que você escreveu não será salvo.'
  String get discardText => 'O que você escreveu não será salvo.';
}

// Path: history
class Translations$history$pt {
  Translations$history$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Nossa história'
  String get title => 'Nossa história';

  /// pt: 'Adicionar marco'
  String get addMilestoneTooltip => 'Adicionar marco';

  /// pt: 'juntos desde {date}'
  String togetherSinceLine({required Object date}) => 'juntos desde ${date}';

  /// pt: 'Definir início da história'
  String get setStartDate => 'Definir início da história';

  /// pt: 'Começando'
  String get beginningHeadline => 'Começando';

  /// pt: '(one) {Falta {days} dia} (other) {Faltam {days} dias}'
  String reunionCountdown({required num days}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        days,
        one: 'Falta ${days} dia',
        other: 'Faltam ${days} dias',
      );

  /// pt: '{years} {yearsUnit}, {months} {monthsUnit} e {days} {daysUnit}'
  String durationFull({
    required Object years,
    required Object yearsUnit,
    required Object months,
    required Object monthsUnit,
    required Object days,
    required Object daysUnit,
  }) => '${years} ${yearsUnit}, ${months} ${monthsUnit}\ne ${days} ${daysUnit}';

  /// pt: '{years} {yearsUnit}, {months} {monthsUnit} e {days} {daysUnit}'
  String durationFullInline({
    required Object years,
    required Object yearsUnit,
    required Object months,
    required Object monthsUnit,
    required Object days,
    required Object daysUnit,
  }) => '${years} ${yearsUnit}, ${months} ${monthsUnit} e ${days} ${daysUnit}';

  /// pt: '{months} {monthsUnit} e {days} {daysUnit}'
  String durationMonthsDays({
    required Object months,
    required Object monthsUnit,
    required Object days,
    required Object daysUnit,
  }) => '${months} ${monthsUnit} e ${days} ${daysUnit}';

  /// pt: '{days} {daysUnit}'
  String durationDaysOnly({required Object days, required Object daysUnit}) =>
      '${days} ${daysUnit}';

  /// pt: 'ano'
  String get yearOne => 'ano';

  /// pt: 'anos'
  String get yearMany => 'anos';

  /// pt: 'mês'
  String get monthOne => 'mês';

  /// pt: 'meses'
  String get monthMany => 'meses';

  /// pt: 'dia'
  String get dayOne => 'dia';

  /// pt: 'dias'
  String get dayMany => 'dias';

  /// pt: '(one) {dia} (other) {dias}'
  String statDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'dia',
        other: 'dias',
      );

  /// pt: '(one) {fim de semana} (other) {fins de semana}'
  String statWeekends({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'fim de semana',
        other: 'fins de semana',
      );

  /// pt: '(one) {Natal} (other) {Natais}'
  String statChristmases({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Natal',
        other: 'Natais',
      );

  /// pt: '(one) {lugar} (other) {lugares}'
  String statPlaces({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'lugar',
        other: 'lugares',
      );

  /// pt: 'Datas da história'
  String get storyDatesAction => 'Datas da história';

  /// pt: 'Em números'
  String get numbersAction => 'Em números';

  /// pt: 'Como o contador aparece'
  String get variationsAction => 'Como o contador aparece';

  /// pt: 'Seu avatar'
  String get avatarAction => 'Seu avatar';

  /// pt: 'Vocês escolheram datas diferentes para o início'
  String get differentDatesBanner => 'Vocês escolheram datas diferentes para o início';

  /// pt: 'Ver datas'
  String get differentDatesAction => 'Ver datas';

  /// pt: 'MARCOS E MEMÓRIAS'
  String get timelineSection => 'MARCOS E MEMÓRIAS';

  /// pt: 'Recentes'
  String get recentChip => 'Recentes';

  /// pt: 'Sem data'
  String get unknownYearChip => 'Sem data';

  /// pt: 'Mostrando os marcos mais recentes.'
  String get timelineRecentNote => 'Mostrando os marcos mais recentes.';

  /// pt: 'Ver {year}'
  String loadEarlierYear({required Object year}) => 'Ver ${year}';

  /// pt: 'Data desconhecida'
  String get unknownDateLabel => 'Data desconhecida';

  /// pt: 'Adicionar um marco'
  String get addMilestoneRow => 'Adicionar um marco';

  /// pt: 'Comece pelo primeiro marco'
  String get emptyTitle => 'Comece pelo primeiro marco';

  /// pt: 'Registre quando vocês se conheceram ou um momento especial.'
  String get emptyText => 'Registre quando vocês se conheceram ou um momento especial.';

  /// pt: 'Nos conhecemos'
  String get suggestedFirstTitle => 'Nos conhecemos';

  /// pt: 'Sugestão de primeiro marco · toque para adicionar'
  String get suggestedFirstSub => 'Sugestão de primeiro marco · toque para adicionar';

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
  List<String> get monthsLong => [
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

  /// pt: '{day} de {month} de {year}'
  String fullDate({required Object day, required Object month, required Object year}) =>
      '${day} de ${month} de ${year}';

  /// pt: '{day} {month} {year}'
  String shortDayMonthYear({required Object day, required Object month, required Object year}) =>
      '${day} ${month} ${year}';

  /// pt: '{month} {year}'
  String shortMonthYear({required Object month, required Object year}) => '${month} ${year}';

  /// pt: '{day} {month}'
  String shortDayMonth({required Object day, required Object month}) => '${day} ${month}';

  /// pt: 'Novo marco'
  String get milestoneNewTitle => 'Novo marco';

  /// pt: 'Detalhe do marco'
  String get milestoneDetailTitle => 'Detalhe do marco';

  /// pt: 'juntos'
  String get milestoneDefaultHighlight => 'juntos';

  /// pt: 'O que aconteceu'
  String get milestoneTitleLabel => 'O que aconteceu';

  /// pt: 'Ex.: Primeira viagem juntos'
  String get milestoneTitleHint => 'Ex.: Primeira viagem juntos';

  Map<String, String> get milestoneTitleErrors => {
    'empty': 'Conte o que aconteceu',
    'tooLong': 'O título está muito longo',
  };

  /// pt: 'Lugar (opcional)'
  String get milestonePlaceLabel => 'Lugar (opcional)';

  /// pt: 'Ex.: Paraty'
  String get milestonePlaceHint => 'Ex.: Paraty';

  Map<String, String> get milestonePlaceErrors => {'tooLong': 'O lugar está muito longo'};

  /// pt: 'Uma nota sobre esse momento (opcional)'
  String get milestoneBodyHint => 'Uma nota sobre esse momento (opcional)';

  Map<String, String> get milestoneBodyErrors => {'tooLong': 'A nota está muito longa'};

  /// pt: 'Tipo de marco'
  String get milestoneKindLabel => 'Tipo de marco';

  /// pt: 'Primeira vez'
  String get kindFirst => 'Primeira vez';

  /// pt: 'Viagem'
  String get kindTrip => 'Viagem';

  /// pt: 'Moramos juntos'
  String get kindHome => 'Moramos juntos';

  /// pt: 'Marco'
  String get kindCustom => 'Marco';

  /// pt: 'Data desconhecida'
  String get unknownDateToggle => 'Data desconhecida';

  /// pt: 'Dia exato'
  String get precisionDay => 'Dia exato';

  /// pt: 'Mês e ano'
  String get precisionMonth => 'Mês e ano';

  /// pt: 'Só o ano'
  String get precisionYear => 'Só o ano';

  /// pt: 'Data'
  String get dateRowLabel => 'Data';

  /// pt: 'Adicionado por'
  String get addedByRowLabel => 'Adicionado por';

  /// pt: 'Você'
  String get addedByYou => 'Você';

  /// pt: 'Quem vê'
  String get visibilityRowLabel => 'Quem vê';

  /// pt: 'Os dois'
  String get visibilityBoth => 'Os dois';

  /// pt: 'Só você'
  String get visibilityOnlyYou => 'Só você';

  /// pt: 'Apagar'
  String get deleteMilestone => 'Apagar';

  /// pt: 'Excluir este marco?'
  String get deleteMilestoneTitle => 'Excluir este marco?';

  /// pt: 'Ele será removido da história dos dois.'
  String get deleteMilestoneTextShared => 'Ele será removido da história dos dois.';

  /// pt: 'Ele será removido da sua história.'
  String get deleteMilestoneTextPrivate => 'Ele será removido da sua história.';

  /// pt: 'Excluir'
  String get deleteMilestoneConfirm => 'Excluir';

  /// pt: 'Salvar'
  String get saveMilestone => 'Salvar';

  /// pt: 'Datas da nossa história'
  String get storyDatesTitle => 'Datas da nossa história';

  /// pt: 'Nos conhecemos'
  String get storyMet => 'Nos conhecemos';

  /// pt: 'Começamos a namorar'
  String get storyDating => 'Começamos a namorar';

  /// pt: 'Noivamos'
  String get storyEngaged => 'Noivamos';

  /// pt: 'Casamos'
  String get storyMarried => 'Casamos';

  /// pt: 'Adicionar'
  String get storyAdd => 'Adicionar';

  /// pt: 'Adicionado por {name}'
  String storyDateAddedBy({required Object name}) => 'Adicionado por ${name}';

  /// pt: 'Tudo opcional. A data de início alimenta o contador.'
  String get storyDatesNote => 'Tudo opcional. A data de início alimenta o contador.';

  /// pt: 'Como o contador aparece'
  String get variationsTitle => 'Como o contador aparece';

  /// pt: 'Namoro'
  String get variationDating => 'Namoro';

  /// pt: 'Noivado'
  String get variationEngaged => 'Noivado';

  /// pt: 'Casados'
  String get variationMarried => 'Casados';

  /// pt: 'Começando'
  String get variationBeginning => 'Começando';

  /// pt: 'Distância'
  String get variationLongDistance => 'Distância';

  /// pt: 'Prévia de estilos. O tempo mostrado é o total real do casal; contagens por fase precisam de datas próprias.'
  String get variationsPreviewNote =>
      'Prévia de estilos. O tempo mostrado é o total real do casal; contagens por fase precisam de datas próprias.';

  /// pt: 'Como você aparece?'
  String get avatarHeadline => 'Como você aparece?';

  /// pt: 'aparece'
  String get avatarHighlight => 'aparece';

  /// pt: 'Iniciais'
  String get avatarInitials => 'Iniciais';

  /// pt: 'Seu avatar usa as suas iniciais.'
  String get avatarInitialsNote => 'Seu avatar usa as suas iniciais.';

  /// pt: 'Cada pessoa escolhe o seu. O app nunca puxa a foto do outro.'
  String get avatarNote => 'Cada pessoa escolhe o seu. O app nunca puxa a foto do outro.';

  /// pt: 'Continuar'
  String get avatarContinue => 'Continuar';

  /// pt: 'Em números'
  String get numbersTitle => 'Em números';

  /// pt: '{days} dias'
  String numbersHeroDays({required Object days}) => '${days} dias';

  /// pt: 'No seu tempo'
  String get numbersHeroEmpty => 'No seu tempo';

  /// pt: 'Defina uma data de início quando quiser acompanhar os dias.'
  String get numbersHeroEmptySub => 'Defina uma data de início quando quiser acompanhar os dias.';

  /// pt: '(one) {fim de semana juntos} (other) {fins de semana juntos}'
  String numbersWeekends({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'fim de semana juntos',
        other: 'fins de semana juntos',
      );

  /// pt: '(one) {lua cheia} (other) {luas cheias}'
  String numbersFullMoons({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'lua cheia',
        other: 'luas cheias',
      );

  /// pt: '(one) {Natal juntos} (other) {Natais juntos}'
  String numbersChristmases({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Natal juntos',
        other: 'Natais juntos',
      );

  /// pt: '(one) {para {years} ano {suffix}} (other) {para {years} anos {suffix}}'
  String numbersNextAnniversary({required num years, required Object suffix}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        years,
        one: 'para ${years} ano ${suffix}',
        other: 'para ${years} anos ${suffix}',
      );

  /// pt: 'de namoro'
  String get numbersSuffixDating => 'de namoro';

  /// pt: 'de noivado'
  String get numbersSuffixEngaged => 'de noivado';

  /// pt: 'casados'
  String get numbersSuffixMarried => 'casados';

  /// pt: 'juntos'
  String get numbersSuffixTogether => 'juntos';

  /// pt: '(one) {{months} mês} (other) {{months} meses}'
  String numbersMonthsCount({required num months}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        months,
        one: '${months} mês',
        other: '${months} meses',
      );

  /// pt: '(one) {{days} dia} (other) {{days} dias}'
  String numbersDaysCount({required num days}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        days,
        one: '${days} dia',
        other: '${days} dias',
      );

  /// pt: 'LUGARES QUE MARCARAM'
  String get numbersPlacesSection => 'LUGARES QUE MARCARAM';

  /// pt: 'SEU ANO ({year})'
  String numbersYearSection({required Object year}) => 'SEU ANO (${year})';

  /// pt: 'Só os seus registros deste ano.'
  String get numbersYearNote => 'Só os seus registros deste ano.';

  /// pt: '(one) {primeira vez} (other) {primeiras vezes}'
  String numbersFirstsCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'primeira vez',
        other: 'primeiras vezes',
      );

  /// pt: 'As datas diferem'
  String get differentHeadline => 'As datas diferem';

  /// pt: 'diferem'
  String get differentHighlight => 'diferem';

  /// pt: 'Você e {partner} escolheram datas diferentes para o início.'
  String differentSubtitle({required Object partner}) =>
      'Você e ${partner} escolheram datas diferentes para o início.';

  /// pt: 'Sua data'
  String get differentYourDate => 'Sua data';

  /// pt: 'Data de {partner}'
  String differentPartnerDate({required Object partner}) => 'Data de ${partner}';

  /// pt: 'Cada um vê a sua. Nada é trocado sem os dois.'
  String get differentNote => 'Cada um vê a sua. Nada é trocado sem os dois.';

  /// pt: 'Ainda não há datas de início para comparar.'
  String get differentNoDates => 'Ainda não há datas de início para comparar.';

  /// pt: 'Continuar'
  String get differentContinue => 'Continuar';

  /// pt: 'seu par'
  String get partnerFallback => 'seu par';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Sua história continua salva. Tente de novo.'
  String get errorText => 'Sua história continua salva. Tente de novo.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'NOT_OWNER': 'Só quem criou pode editar ou apagar.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };

  /// pt: '(one) {memória guardada} (other) {memórias guardadas}'
  String numbersMemoriesCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'memória guardada',
        other: 'memórias guardadas',
      );

  /// pt: '(one) {memória recente} (other) {memórias recentes}'
  String numbersMemoriesRecent({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'memória recente',
        other: 'memórias recentes',
      );

  /// pt: '(one) {lugar} (other) {lugares}'
  String numbersPlaces({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'lugar',
        other: 'lugares',
      );

  /// pt: 'Este marco foi adicionado por outra pessoa. Só quem criou pode editar.'
  String get readOnlyMilestone =>
      'Este marco foi adicionado por outra pessoa. Só quem criou pode editar.';

  /// pt: 'Adicionado por {name}. Só quem criou pode editar.'
  String readOnlyMilestoneBy({required Object name}) =>
      'Adicionado por ${name}. Só quem criou pode editar.';
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

// Path: language
class Translations$language$pt {
  Translations$language$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Idioma'
  String get language => 'Idioma';

  /// pt: 'Português (Brasil)'
  String get languagePortuguese => 'Português (Brasil)';

  /// pt: 'Inglês'
  String get languageEnglish => 'Inglês';

  /// pt: 'Em breve'
  String get comingSoon => 'Em breve';

  /// pt: 'O inglês fica completo depois.'
  String get languageNote => 'O inglês fica completo depois.';

  /// pt: 'Não foi possível salvar. Tente novamente.'
  String get saveError => 'Não foi possível salvar. Tente novamente.';
}

// Path: learned
class Translations$learned$pt {
  Translations$learned$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'O que aprendi'
  String get title => 'O que aprendi';

  /// pt: 'Coisas que você escolheu guardar da conversa. Só você vê.'
  String get intro => 'Coisas que você escolheu guardar da conversa. Só você vê.';

  /// pt: 'Para revisar'
  String get pendingTitle => 'Para revisar';

  /// pt: 'Confirmado'
  String get confirmedTitle => 'Confirmado';

  Map<String, String> get targets => {
    'partnerFact': 'Sobre meu par',
    'date': 'Um date',
    'memory': 'Uma memória',
    'commitment': 'Um combinado',
  };

  /// pt: 'Confirmar'
  String get confirm => 'Confirmar';

  /// pt: 'Editar'
  String get edit => 'Editar';

  /// pt: 'Descartar'
  String get discard => 'Descartar';

  /// pt: 'Confirmar este aprendizado?'
  String get confirmTitle => 'Confirmar este aprendizado?';

  /// pt: 'Ele passa a aparecer em O que aprendi. Só você vê.'
  String get confirmText => 'Ele passa a aparecer em O que aprendi. Só você vê.';

  /// pt: 'Descartar este aprendizado?'
  String get discardTitle => 'Descartar este aprendizado?';

  /// pt: 'Ele não será guardado.'
  String get discardText => 'Ele não será guardado.';

  /// pt: 'Descartar'
  String get discardConfirm => 'Descartar';

  /// pt: 'Editar aprendizado'
  String get editTitle => 'Editar aprendizado';

  /// pt: 'O que você quer guardar'
  String get editHint => 'O que você quer guardar';

  Map<String, String> get textErrors => {
    'empty': 'Escreva o que quer guardar',
    'tooLong': 'Isto está muito longo',
  };

  /// pt: 'Guardar'
  String get save => 'Guardar';

  /// pt: 'Da conversa'
  String get partnerFactLabel => 'Da conversa';

  /// pt: 'Aprendizado atualizado'
  String get updated => 'Aprendizado atualizado';

  /// pt: 'Nada guardado ainda'
  String get emptyTitle => 'Nada guardado ainda';

  /// pt: 'Quando quiser, salve uma resposta da conversa para lembrar depois.'
  String get emptyText => 'Quando quiser, salve uma resposta da conversa para lembrar depois.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo em instantes.'
  String get errorText => 'Tente de novo em instantes.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };
}

// Path: lists
class Translations$lists$pt {
  Translations$lists$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Listas'
  String get title => 'Listas';

  /// pt: 'Viagens, lugares e filmes, compartilhados ou só seus.'
  String get subtitle => 'Viagens, lugares e filmes, compartilhados ou só seus.';

  /// pt: 'Nova lista'
  String get newList => 'Nova lista';

  /// pt: 'Nova lista'
  String get createTitle => 'Nova lista';

  /// pt: 'Nome'
  String get titleLabel => 'Nome';

  /// pt: 'Ex.: Viagens dos nossos sonhos'
  String get titleHint => 'Ex.: Viagens dos nossos sonhos';

  Map<String, String> get titleErrors => {
    'empty': 'Dê um nome para a lista.',
    'tooLong': 'Use no máximo 80 caracteres.',
  };

  /// pt: 'Tipo'
  String get kindLabel => 'Tipo';

  /// pt: 'Quem pode ver'
  String get visibilityLabel => 'Quem pode ver';

  /// pt: 'Vocês dois podem ver e mudar esta lista.'
  String get sharedHint => 'Vocês dois podem ver e mudar esta lista.';

  /// pt: 'Só você vê esta lista.'
  String get privateHint => 'Só você vê esta lista.';

  Map<String, String> get kinds => {
    'travel': 'Viagem',
    'restaurants': 'Restaurantes',
    'movies': 'Filmes',
    'custom': 'Outra',
    'other': '',
  };

  /// pt: 'Compartilhada'
  String get shared => 'Compartilhada';

  /// pt: 'Privada'
  String get private => 'Privada';

  /// pt: 'Nenhuma lista ainda'
  String get emptyTitle => 'Nenhuma lista ainda';

  /// pt: 'Comece uma lista de coisas que vocês querem fazer juntos.'
  String get emptyTextShared => 'Comece uma lista de coisas que vocês querem fazer juntos.';

  /// pt: 'Comece uma lista de coisas para você guardar.'
  String get emptyTextPrivate => 'Comece uma lista de coisas para você guardar.';

  /// pt: 'Criar lista'
  String get create => 'Criar lista';

  /// pt: 'Renomear'
  String get rename => 'Renomear';

  /// pt: 'Apagar'
  String get delete => 'Apagar';

  /// pt: 'Renomear lista'
  String get renameTitle => 'Renomear lista';

  /// pt: 'Guardar'
  String get save => 'Guardar';

  /// pt: 'Apagar lista?'
  String get deleteTitle => 'Apagar lista?';

  /// pt: 'A lista e tudo o que está nela somem para vocês dois.'
  String get deleteTextShared => 'A lista e tudo o que está nela somem para vocês dois.';

  /// pt: 'A lista e tudo o que está nela somem de vez.'
  String get deleteTextPrivate => 'A lista e tudo o que está nela somem de vez.';

  /// pt: 'Apagar'
  String get deleteConfirm => 'Apagar';

  /// pt: 'Apagar item?'
  String get itemDeleteTitle => 'Apagar item?';

  /// pt: 'Este item some para vocês dois.'
  String get itemDeleteTextShared => 'Este item some para vocês dois.';

  /// pt: 'Este item some de vez.'
  String get itemDeleteTextPrivate => 'Este item some de vez.';

  /// pt: 'Apagar item'
  String get itemDeleteConfirm => 'Apagar item';

  /// pt: 'Tornar privada'
  String get makePrivate => 'Tornar privada';

  /// pt: 'Compartilhar com seu par'
  String get shareWithPartner => 'Compartilhar com seu par';

  /// pt: 'Adicionar item'
  String get addItem => 'Adicionar item';

  /// pt: 'Ex.: Lisboa'
  String get itemHint => 'Ex.: Lisboa';

  Map<String, String> get itemTitleErrors => {
    'empty': 'Escreva o nome do item.',
    'tooLong': 'Use no máximo 160 caracteres.',
  };

  /// pt: 'Adicionar'
  String get add => 'Adicionar';

  /// pt: 'Nada por aqui ainda'
  String get itemEmptyTitle => 'Nada por aqui ainda';

  /// pt: 'Adicione a primeira coisa que vocês querem fazer juntos.'
  String get itemEmptyTextShared => 'Adicione a primeira coisa que vocês querem fazer juntos.';

  /// pt: 'Adicione a primeira coisa a esta lista.'
  String get itemEmptyTextPrivate => 'Adicione a primeira coisa a esta lista.';

  Map<String, String> get statuses => {
    'dream': 'Sonho',
    'planned': 'Planejado',
    'done': 'Feito',
    'other': '',
  };

  /// pt: 'Voltar para sonhos'
  String get markDream => 'Voltar para sonhos';

  /// pt: 'Marcar como planejado'
  String get markPlanned => 'Marcar como planejado';

  /// pt: 'Marcar como feito'
  String get markDone => 'Marcar como feito';

  /// pt: 'Mover para cima'
  String get moveUp => 'Mover para cima';

  /// pt: 'Mover para baixo'
  String get moveDown => 'Mover para baixo';

  /// pt: 'Opções do item'
  String get itemOptions => 'Opções do item';

  /// pt: 'Opções da lista'
  String get listOptions => 'Opções da lista';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
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

// Path: loveStyle
class Translations$loveStyle$pt {
  Translations$loveStyle$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'SÓ PARA VOCÊ'
  String get entryLabel => 'SÓ PARA VOCÊ';

  /// pt: 'Como eu me sinto querido(a)'
  String get entryTitle => 'Como eu me sinto querido(a)';

  /// pt: 'Seis perguntas rápidas para notar o que te faz sentir querido(a).'
  String get entryText => 'Seis perguntas rápidas para notar o que te faz sentir querido(a).';

  /// pt: 'Como eu me sinto querido(a)'
  String get exerciseTitle => 'Como eu me sinto querido(a)';

  /// pt: 'querido(a)'
  String get exerciseHighlight => 'querido(a)';

  /// pt: 'Seis perguntas rápidas, só para você.'
  String get exerciseSubtitle => 'Seis perguntas rápidas, só para você.';

  /// pt: 'Pergunta {current} de {total}'
  String questionOf({required Object current, required Object total}) =>
      'Pergunta ${current} de ${total}';

  List<String> get questions => [
    'O que mais faz você se sentir querido(a)?',
    'Num dia difícil, o que mais te conforta?',
    'O que você nota primeiro quando seu par demonstra carinho?',
    'Qual desses gestos aquece seu coração?',
    'O que te faz sentir importante para alguém?',
    'Se pudesse escolher um gesto para hoje, qual seria?',
  ];
  Map<String, String> get options1 => {
    'time': 'Passar um tempo junto, sem pressa.',
    'words': 'Ouvir que sou importante.',
    'acts': 'Ver que a pessoa me ajuda com algo.',
    'gifts': 'Receber um presente pequeno, sem motivo.',
    'touch': 'Um abraço demorado.',
    'other': '',
  };
  Map<String, String> get options2 => {
    'time': 'Ter alguém por perto, sem pressa de resolver.',
    'words': 'Uma mensagem dizendo que estou no pensamento.',
    'acts': 'Alguém assumir uma tarefa minha.',
    'gifts': 'Um cuidado pequeno que chegou de surpresa.',
    'touch': 'Um abraço bem apertado.',
    'other': '',
  };
  Map<String, String> get options3 => {
    'time': 'Quando a pessoa larga o celular para ficar comigo.',
    'words': 'Quando a pessoa elogia algo que eu fiz.',
    'acts': 'Quando a pessoa percebe o que eu preciso e faz.',
    'gifts': 'Quando a pessoa lembra de algo que eu gosto.',
    'touch': 'Quando a pessoa me toca de leve ao passar.',
    'other': '',
  };
  Map<String, String> get options4 => {
    'time': 'Um encontro tranquilo, só nós dois.',
    'words': 'Uma conversa em que me sinto ouvido(a).',
    'acts': 'Uma ajuda pequena numa tarefa.',
    'gifts': 'Um presente simples que tem a ver comigo.',
    'touch': 'Um carinho no cabelo ou na mão.',
    'other': '',
  };
  Map<String, String> get options5 => {
    'time': 'Quando alguém escolhe passar tempo comigo.',
    'words': 'Quando alguém reconhece o que eu faço.',
    'acts': 'Quando alguém facilita o meu dia.',
    'gifts': 'Quando alguém lembra de mim com um detalhe.',
    'touch': 'Quando alguém me abraça sem precisar falar.',
    'other': '',
  };
  Map<String, String> get options6 => {
    'time': 'Reservar uma noite livre para nós.',
    'words': 'Escrever um recado de carinho.',
    'acts': 'Resolver juntos uma tarefa chata.',
    'gifts': 'Escolher um presente pequeno.',
    'touch': 'Ficar de mãos dadas.',
    'other': '',
  };

  /// pt: 'Próxima'
  String get continueAction => 'Próxima';

  /// pt: 'Ver resultado'
  String get finishAction => 'Ver resultado';

  /// pt: 'Voltar'
  String get back => 'Voltar';

  /// pt: 'Só você vê as respostas. Você escolhe se quer mostrar o resultado.'
  String get privateNote => 'Só você vê as respostas. Você escolhe se quer mostrar o resultado.';

  /// pt: 'O que faz você se sentir querido(a)'
  String get resultTitle => 'O que faz você se sentir querido(a)';

  /// pt: 'querido(a)'
  String get resultHighlight => 'querido(a)';

  /// pt: 'Uma descrição do que te faz sentir querido(a), do seu jeito.'
  String get resultSubtitle => 'Uma descrição do que te faz sentir querido(a), do seu jeito.';

  /// pt: 'O que mais combina com você'
  String get topTag => 'O que mais combina com você';

  Map<String, String> get descriptions => {
    'time': 'Você se sente querido(a) quando tem tempo de verdade com quem gosta: sem pressa, sem telas, só a presença.',
    'words': 'Você se sente querido(a) quando ouve, de forma sincera, o que a outra pessoa sente por você.',
    'acts': 'Você se sente querido(a) quando alguém percebe o que você precisa e ajuda sem que você peça.',
    'gifts': 'Você se sente querido(a) quando alguém lembra de você num detalhe pequeno, escolhido com carinho.',
    'touch': 'Você se sente querido(a) quando um abraço, uma mão dada ou um carinho dizem o que as palavras não dizem.',
    'other': '',
  };
  Map<String, String> get shareDescriptions => {
    'time': 'Eu me sinto querido(a) quando a gente passa um tempo junto, sem pressa e sem telas.',
    'words': 'Eu me sinto querido(a) quando ouço, com sinceridade, o que você sente por mim.',
    'acts': 'Eu me sinto querido(a) quando você percebe o que eu preciso e me ajuda sem eu pedir.',
    'gifts': 'Eu me sinto querido(a) quando você lembra de mim num detalhe pequeno, escolhido com carinho.',
    'touch': 'Eu me sinto querido(a) quando um abraço, uma mão dada ou um carinho dizem o que as palavras não dizem.',
    'other': '',
  };

  /// pt: 'Salvo só para você. Mostrar no widget do seu par é uma escolha sua, e você pode desfazer.'
  String get resultPrivacyNote =>
      'Salvo só para você. Mostrar no widget do seu par é uma escolha sua, e você pode desfazer.';

  /// pt: 'Salvar no Meu manual'
  String get saveManualAction => 'Salvar no Meu manual';

  /// pt: 'Salvo no Meu manual'
  String get savedManualAction => 'Salvo no Meu manual';

  /// pt: 'Salvo no Meu manual.'
  String get manualToast => 'Salvo no Meu manual.';

  /// pt: 'Mostrar para {name}'
  String shareAction({required Object name}) => 'Mostrar para ${name}';

  /// pt: 'Tirar do widget dele(a)'
  String get revokeAction => 'Tirar do widget dele(a)';

  /// pt: 'Aparece no widget dele(a) se ele(a) permitir recados.'
  String get shareToast => 'Aparece no widget dele(a) se ele(a) permitir recados.';

  /// pt: 'Não aparece mais no widget dele(a).'
  String get revokeToast => 'Não aparece mais no widget dele(a).';

  /// pt: 'Quando vocês estiverem conectados, você pode mostrar isso no widget do seu par.'
  String get shareSoloNote =>
      'Quando vocês estiverem conectados, você pode mostrar isso no widget do seu par.';

  /// pt: 'seu par'
  String get partnerFallback => 'seu par';

  /// pt: 'Não deu para verificar seu par agora.'
  String get pairingErrorNote => 'Não deu para verificar seu par agora.';

  /// pt: 'Tentar de novo'
  String get retryPairing => 'Tentar de novo';

  /// pt: 'Refazer o exercício'
  String get retake => 'Refazer o exercício';

  /// pt: 'Não deu para carregar'
  String get loadErrorTitle => 'Não deu para carregar';

  /// pt: 'Não deu para abrir seu resultado agora. Tente de novo.'
  String get loadErrorText => 'Não deu para abrir seu resultado agora. Tente de novo.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para salvar agora. Suas respostas continuam aqui.',
  };
  Map<String, String> get manualErrors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para salvar no Meu manual agora. Tente de novo.',
  };
  Map<String, String> get shareErrors => {
    'NOT_PAIRED': 'Você ainda não tem um par conectado.',
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para mostrar agora. Tente de novo.',
  };
  Map<String, String> get revokeErrors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para tirar do widget agora. Tente de novo.',
  };
}

// Path: memories
class Translations$memories$pt {
  Translations$memories$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Memórias'
  String get title => 'Memórias';

  /// pt: 'NOSSA HISTÓRIA'
  String get historyLabel => 'NOSSA HISTÓRIA';

  /// pt: 'Nossa história'
  String get historyTitle => 'Nossa história';

  /// pt: 'Marcos, datas, lugares e a nossa história em números.'
  String get historyText => 'Marcos, datas, lugares e a nossa história em números.';

  /// pt: 'COMPARTILHAR'
  String get storyLabel => 'COMPARTILHAR';

  /// pt: 'Imagem para compartilhar'
  String get storyTitle => 'Imagem para compartilhar';

  /// pt: 'Seus números em uma imagem, só com o que você escolher.'
  String get storyText => 'Seus números em uma imagem, só com o que você escolher.';

  /// pt: 'LUGARES'
  String get placesLabel => 'LUGARES';

  /// pt: 'Lugares onde vocês estiveram'
  String get placesTitle => 'Lugares onde vocês estiveram';

  /// pt: 'Só o nome do lugar, nunca a localização.'
  String get placesText => 'Só o nome do lugar, nunca a localização.';

  /// pt: 'Lugar (opcional)'
  String get placeLabel => 'Lugar (opcional)';

  /// pt: 'Ex.: Paraty'
  String get placeHint => 'Ex.: Paraty';

  /// pt: 'Prefira só o nome do lugar, sem endereço ou número.'
  String get placeAddressNote => 'Prefira só o nome do lugar, sem endereço ou número.';

  /// pt: 'Linha do tempo'
  String get segmentTimeline => 'Linha do tempo';

  /// pt: 'Potinho'
  String get segmentJar => 'Potinho';

  /// pt: 'Quando um slip te fizer bem, guarde-o no potinho pelos detalhes dele.'
  String get jarEmpty => 'Quando um slip te fizer bem, guarde-o no potinho pelos detalhes dele.';

  /// pt: 'Outro'
  String get jarAnother => 'Outro';

  /// pt: 'Fechar'
  String get jarClose => 'Fechar';

  /// pt: 'Uma memória'
  String get titleLabel => 'Uma memória';

  /// pt: 'Ex.: nosso primeiro jantar'
  String get titleHint => 'Ex.: nosso primeiro jantar';

  Map<String, String> get titleErrors => {
    'empty': 'Dê um título a esta memória',
    'tooLong': 'O título está muito longo',
  };
  Map<String, String> get placeErrors => {'tooLong': 'O lugar está muito longo'};
  Map<String, String> get bodyErrors => {'tooLong': 'A nota está muito longa'};

  /// pt: 'Conte como foi (opcional)'
  String get bodyHint => 'Conte como foi (opcional)';

  /// pt: 'Adicionar memória'
  String get add => 'Adicionar memória';

  /// pt: 'Guardar memória'
  String get save => 'Guardar memória';

  /// pt: 'Apagar'
  String get delete => 'Apagar';

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

  /// pt: '{day} {month} {year}'
  String dateLine({required Object day, required Object month, required Object year}) =>
      '${day} ${month} ${year}';

  /// pt: 'Nenhuma memória ainda'
  String get emptyTitle => 'Nenhuma memória ainda';

  /// pt: 'Guarde momentos que vocês querem rever.'
  String get emptyText => 'Guarde momentos que vocês querem rever.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Suas memórias continuam salvas. Tente de novo.'
  String get errorText => 'Suas memórias continuam salvas. Tente de novo.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para fazer isso agora. Seu texto continua aqui.',
  };

  /// pt: 'O potinho está vazio'
  String get jarEmptyTitle => 'O potinho está vazio';

  /// pt: 'Ver meus slips'
  String get jarEmptyAction => 'Ver meus slips';

  /// pt: 'Mais'
  String get moreTitle => 'Mais';
}

// Path: mood
class Translations$mood$pt {
  Translations$mood$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Como você está hoje?'
  String get title => 'Como você está hoje?';

  /// pt: 'hoje'
  String get titleHighlight => 'hoje';

  /// pt: 'Um toque. A etiqueta “Preciso de...” é opcional.'
  String get subtitle => 'Um toque. A etiqueta “Preciso de...” é opcional.';

  /// pt: 'só você vê'
  String get privateCue => 'só você vê';

  Map<String, String> get moods => {
    'happy': 'Feliz',
    'tired': 'Cansado(a)',
    'sad': 'Triste',
    'stressed': 'Estressado(a)',
    'loving': 'Carinhoso(a)',
    'playful': 'Brincalhão(ona)',
  };

  /// pt: 'Preciso de...'
  String get needTitle => 'Preciso de...';

  Map<String, String> get needs => {
    'listen': 'Ser ouvido',
    'opinion': 'Uma opinião',
    'hug': 'Um abraço',
    'space': 'Um tempo',
  };

  /// pt: 'O que seu par vê'
  String get shareTitle => 'O que seu par vê';

  /// pt: 'O que {name} vê'
  String shareTitleNamed({required Object name}) => 'O que ${name} vê';

  /// pt: 'Quem cria o dado decide. O padrão é privado.'
  String get shareSubtitle => 'Quem cria o dado decide. O padrão é privado.';

  Map<String, String> get share => {
    'none': 'Manter privado',
    'mood': 'Só meu humor',
    'mood_need': 'Humor e o que preciso',
  };
  Map<String, String> get shareSupport => {
    'none': 'Nada é compartilhado.',
    'mood': 'Seu par vê o humor, sem o que você precisa.',
    'mood_need': 'Seu par vê o humor e o que você precisa.',
  };

  /// pt: 'Nada é compartilhado por padrão. Seu par nunca vê gráfico nem nota.'
  String get privacyNote => 'Nada é compartilhado por padrão. Seu par nunca vê gráfico nem nota.';

  /// pt: 'Salvar'
  String get save => 'Salvar';

  /// pt: 'Humor salvo'
  String get saved => 'Humor salvo';

  Map<String, String> get errors => {
    'NETWORK': 'Não deu para salvar seu humor. Verifique a conexão e tente de novo.',
    'TIMEOUT': 'Não deu para salvar seu humor a tempo. Tente de novo.',
    'other': 'Não deu para salvar seu humor. Tente de novo.',
  };

  /// pt: 'Humor do dia'
  String get entryCategory => 'Humor do dia';

  /// pt: 'Como você está hoje?'
  String get entryTitle => 'Como você está hoje?';

  /// pt: 'Um toque. Só você vê até compartilhar.'
  String get entryText => 'Um toque. Só você vê até compartilhar.';

  /// pt: 'Humor do seu par'
  String get partnerLabel => 'Humor do seu par';

  /// pt: 'Seu par'
  String get partnerFallback => 'Seu par';

  /// pt: '{name} está feliz hoje'
  String partnerHappy({required Object name}) => '${name} está feliz hoje';

  /// pt: '{name} está sem energia hoje'
  String partnerTired({required Object name}) => '${name} está sem energia hoje';

  /// pt: '{name} está para baixo hoje'
  String partnerSad({required Object name}) => '${name} está para baixo hoje';

  /// pt: '{name} está com a cabeça cheia hoje'
  String partnerStressed({required Object name}) => '${name} está com a cabeça cheia hoje';

  /// pt: '{name} está com o coração quentinho hoje'
  String partnerLoving({required Object name}) => '${name} está com o coração quentinho hoje';

  /// pt: '{name} está com vontade de brincar hoje'
  String partnerPlayful({required Object name}) => '${name} está com vontade de brincar hoje';

  /// pt: 'O que ajuda: só ouvir.'
  String get partnerNeedListen => 'O que ajuda: só ouvir.';

  /// pt: 'O que ajuda: uma opinião.'
  String get partnerNeedOpinion => 'O que ajuda: uma opinião.';

  /// pt: 'O que ajuda: um abraço.'
  String get partnerNeedHug => 'O que ajuda: um abraço.';

  /// pt: 'O que ajuda: um pouco de espaço.'
  String get partnerNeedSpace => 'O que ajuda: um pouco de espaço.';

  /// pt: 'Como você está?'
  String get homeTitle => 'Como você está?';

  /// pt: 'Só você vê'
  String get homePrivacy => 'Só você vê';

  Map<String, String> get homeMoods => {
    'happy': 'Bem',
    'loving': 'Carinhoso',
    'tired': 'Cansado',
    'stressed': 'Tenso',
    'sad': 'Triste',
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

// Path: notes
class Translations$notes$pt {
  Translations$notes$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Bilhete ou desenho'
  String get title => 'Bilhete ou desenho';

  /// pt: 'Um recado curto para seu par, ou um desenho que fica na sua lista de enviados.'
  String get intro =>
      'Um recado curto para seu par, ou um desenho que fica na sua lista de enviados.';

  List<String> get kinds => ['Bilhete', 'Desenho'];

  /// pt: 'Ex.: boa sorte na reunião de hoje'
  String get noteHint => 'Ex.: boa sorte na reunião de hoje';

  Map<String, String> get textErrors => {
    'empty': 'Escreva o recado primeiro',
    'tooLong': 'Este recado está muito longo',
  };

  /// pt: 'Área do desenho'
  String get canvasLabel => 'Área do desenho';

  List<String> get pens => ['Preto', 'Laranja', 'Roxo', 'Verde'];

  /// pt: 'Borracha'
  String get eraser => 'Borracha';

  /// pt: 'Desfazer'
  String get undo => 'Desfazer';

  /// pt: 'Limpar'
  String get clear => 'Limpar';

  /// pt: 'Faça um traço para poder enviar.'
  String get emptyDrawing => 'Faça um traço para poder enviar.';

  /// pt: 'Enviar para o widget'
  String get widgetLabel => 'Enviar para o widget';

  /// pt: 'Aparece no widget dele se ele permitir recados.'
  String get widgetText => 'Aparece no widget dele se ele permitir recados.';

  /// pt: 'Desenhos ficam na sua lista de enviados. Recados no widget são só texto por enquanto.'
  String get drawingHint =>
      'Desenhos ficam na sua lista de enviados. Recados no widget são só texto por enquanto.';

  /// pt: 'Conecte-se com seu par'
  String get unpairedTitle => 'Conecte-se com seu par';

  /// pt: 'Você precisa estar conectado com seu par para enviar um bilhete ou desenho.'
  String get unpairedText =>
      'Você precisa estar conectado com seu par para enviar um bilhete ou desenho.';

  /// pt: 'Enviar'
  String get send => 'Enviar';

  /// pt: 'Enviado'
  String get sent => 'Enviado';

  /// pt: 'Enviados por você'
  String get sentTitle => 'Enviados por você';

  /// pt: 'Agora'
  String get justNow => 'Agora';

  /// pt: '(one) {1 min atrás} (other) {{count} min atrás}'
  String minutesAgo({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 min atrás',
        other: '${count} min atrás',
      );

  /// pt: '(one) {1 h atrás} (other) {{count} h atrás}'
  String hoursAgo({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 h atrás',
        other: '${count} h atrás',
      );

  /// pt: '(one) {1 dia atrás} (other) {{count} dias atrás}'
  String daysAgo({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 dia atrás',
        other: '${count} dias atrás',
      );

  /// pt: 'Desenho'
  String get drawingAlt => 'Desenho';

  /// pt: 'Apagar'
  String get delete => 'Apagar';

  /// pt: 'Apagar este envio?'
  String get deleteConfirmTitle => 'Apagar este envio?';

  /// pt: 'Ele sai da sua lista de enviados. Bilhetes também saem do widget do seu par.'
  String get deleteConfirmText =>
      'Ele sai da sua lista de enviados. Bilhetes também saem do widget do seu par.';

  /// pt: 'Apagar agora'
  String get deleteConfirm => 'Apagar agora';

  /// pt: 'Apagado'
  String get deleted => 'Apagado';

  /// pt: 'Não deu para apagar agora. Tente de novo.'
  String get deleteError => 'Não deu para apagar agora. Tente de novo.';

  /// pt: 'Nada enviado ainda'
  String get emptyTitle => 'Nada enviado ainda';

  /// pt: 'Quando você mandar um bilhete ou desenho, ele aparece aqui.'
  String get emptyText => 'Quando você mandar um bilhete ou desenho, ele aparece aqui.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo em instantes.'
  String get errorText => 'Tente de novo em instantes.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'NOT_PAIRED': 'Para enviar, você precisa estar com seu par no app.',
    'other': 'Não deu para enviar agora. O que você escreveu continua aqui.',
  };
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

// Path: partnerProfile
class Translations$partnerProfile$pt {
  Translations$partnerProfile$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Sobre seu par'
  String get title => 'Sobre seu par';

  /// pt: 'Só você vê estas notas. Elas nunca aparecem em avisos, widgets ou para seu par.'
  String get privateNote =>
      'Só você vê estas notas. Elas nunca aparecem em avisos, widgets ou para seu par.';

  Map<String, String> get categories => {
    'likes': 'Gosta',
    'dislikes': 'Não gosta',
    'sizes': 'Tamanhos',
    'health': 'Saúde',
    'comfort': 'Conforto',
    'people': 'Pessoas',
    'other': 'Outro',
  };

  /// pt: 'Assunto'
  String get labelLabel => 'Assunto';

  /// pt: 'Ex.: café'
  String get labelHint => 'Ex.: café';

  Map<String, String> get labelErrors => {
    'empty': 'Dê um assunto à nota.',
    'tooLong': 'Use no máximo 80 caracteres.',
  };

  /// pt: 'Ex.: sem açúcar, bem quente'
  String get valueHint => 'Ex.: sem açúcar, bem quente';

  Map<String, String> get valueErrors => {
    'empty': 'Escreva o que quer lembrar.',
    'tooLong': 'Use no máximo 500 caracteres.',
  };

  /// pt: 'Guardar nota'
  String get save => 'Guardar nota';

  /// pt: 'Apagar'
  String get delete => 'Apagar';

  /// pt: 'Nenhuma nota ainda'
  String get emptyTitle => 'Nenhuma nota ainda';

  /// pt: 'Pequenos detalhes ajudam a escolher um presente ou um gesto.'
  String get emptyText => 'Pequenos detalhes ajudam a escolher um presente ou um gesto.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Suas notas continuam salvas. Tente de novo.'
  String get errorText => 'Suas notas continuam salvas. Tente de novo.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para fazer isso agora. Seu texto continua aqui.',
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

  Map<String, String> get messageErrors => {
    'empty': 'Escreva uma mensagem curta',
    'tooLong': 'A mensagem está muito longa',
  };

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

// Path: places
class Translations$places$pt {
  Translations$places$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Lugares'
  String get title => 'Lugares';

  /// pt: 'Só o nome do lugar. O app nunca lê nem guarda sua localização.'
  String get privacyNote => 'Só o nome do lugar. O app nunca lê nem guarda sua localização.';

  /// pt: '1 memória'
  String get memoryOne => '1 memória';

  /// pt: '{count} memórias'
  String memoryMany({required Object count}) => '${count} memórias';

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

  /// pt: '{day} {month} {year}'
  String dateLine({required Object day, required Object month, required Object year}) =>
      '${day} ${month} ${year}';

  /// pt: 'Nenhum lugar ainda'
  String get emptyTitle => 'Nenhum lugar ainda';

  /// pt: 'Ao guardar uma memória, escreva o nome do lugar e ele aparece aqui.'
  String get emptyText => 'Ao guardar uma memória, escreva o nome do lugar e ele aparece aqui.';

  /// pt: 'Nada neste lugar'
  String get detailEmptyTitle => 'Nada neste lugar';

  /// pt: 'As memórias deste lugar não estão mais aqui.'
  String get detailEmptyText => 'As memórias deste lugar não estão mais aqui.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Suas memórias continuam salvas. Tente de novo.'
  String get errorText => 'Suas memórias continuam salvas. Tente de novo.';
}

// Path: plus
class Translations$plus$pt {
  Translations$plus$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Repara Plus'
  String get title => 'Repara Plus';

  /// pt: 'Compare com calma. O plano grátis continua inteiro para o essencial.'
  String get subtitle => 'Compare com calma. O plano grátis continua inteiro para o essencial.';

  /// pt: 'Você tem o Plus'
  String get activeTitle => 'Você tem o Plus';

  /// pt: 'Obrigado. Tudo está liberado para você e para seu par.'
  String get activeText => 'Obrigado. Tudo está liberado para você e para seu par.';

  /// pt: 'Seu par tem o Plus e ele vale para vocês dois.'
  String get paidByPartner => 'Seu par tem o Plus e ele vale para vocês dois.';

  /// pt: 'Neste mês restam {slips} slips e {cards} cartões enviados no plano grátis.'
  String freeLeft({required Object slips, required Object cards}) =>
      'Neste mês restam ${slips} slips e ${cards} cartões enviados no plano grátis.';

  /// pt: 'Grátis'
  String get freeName => 'Grátis';

  /// pt: 'Slips todo mês, um cartão enviado por mês, repair, pausa, segurança e tudo o que você já guardou.'
  String get freeFeatures =>
      'Slips todo mês, um cartão enviado por mês, repair, pausa, segurança e tudo o que você já guardou.';

  /// pt: 'Plus'
  String get plusName => 'Plus';

  /// pt: 'Mais slips e cartões por mês e mais recursos para os dois, cobrindo você e seu par.'
  String get plusFeatures =>
      'Mais slips e cartões por mês e mais recursos para os dois, cobrindo você e seu par.';

  /// pt: 'Mensal'
  String get monthly => 'Mensal';

  /// pt: 'Anual'
  String get yearly => 'Anual';

  /// pt: 'Presente'
  String get giftPlan => 'Presente';

  /// pt: 'Não deu para ver os preços'
  String get storeTitle => 'Não deu para ver os preços';

  /// pt: 'A loja não respondeu. Nada foi cobrado. Tente de novo.'
  String get storeText => 'A loja não respondeu. Nada foi cobrado. Tente de novo.';

  /// pt: 'Assinar'
  String get subscribe => 'Assinar';

  /// pt: 'Plus ativado. Obrigado.'
  String get started => 'Plus ativado. Obrigado.';

  /// pt: 'Compra recebida. Estamos confirmando, o Plus aparece em instantes.'
  String get pending => 'Compra recebida. Estamos confirmando, o Plus aparece em instantes.';

  /// pt: 'Não deu para concluir a compra. Nada foi cobrado.'
  String get purchaseError => 'Não deu para concluir a compra. Nada foi cobrado.';

  /// pt: 'Problema no pagamento'
  String get billingTitle => 'Problema no pagamento';

  /// pt: 'O último pagamento não passou. O Plus continua por enquanto. Abra suas assinaturas na loja e atualize a forma de pagamento.'
  String get billingText =>
      'O último pagamento não passou. O Plus continua por enquanto. Abra suas assinaturas na loja e atualize a forma de pagamento.';

  /// pt: 'Segurança, pausa e desparear nunca ficam trancados.'
  String get alwaysFree => 'Segurança, pausa e desparear nunca ficam trancados.';

  /// pt: 'PLUS'
  String get lockLabel => 'PLUS';

  /// pt: 'Disponível no Plus. Toque para ver os planos.'
  String get lockText => 'Disponível no Plus. Toque para ver os planos.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo daqui a pouco.'
  String get errorText => 'Tente de novo daqui a pouco.';

  /// pt: 'Gerenciar Plus'
  String get manageTitle => 'Gerenciar Plus';

  /// pt: 'Plano'
  String get planRow => 'Plano';

  /// pt: 'Status'
  String get statusRow => 'Status';

  /// pt: 'Cobre'
  String get coversRow => 'Cobre';

  /// pt: 'Você e seu par'
  String get coversBoth => 'Você e seu par';

  /// pt: 'Seu par'
  String get coveredByPartner => 'Seu par';

  /// pt: 'Plus ativo'
  String get plusActive => 'Plus ativo';

  /// pt: 'Ativo'
  String get statusActive => 'Ativo';

  /// pt: 'Período de teste'
  String get statusTrialing => 'Período de teste';

  /// pt: 'Pagamento pendente'
  String get statusGrace => 'Pagamento pendente';

  /// pt: 'Problema no pagamento'
  String get statusBillingIssue => 'Problema no pagamento';

  /// pt: 'Gerenciar na loja'
  String get manageInStore => 'Gerenciar na loja';

  /// pt: 'Ver o Plus'
  String get seePlus => 'Ver o Plus';

  /// pt: 'Gerenciar plano'
  String get managePlan => 'Gerenciar plano';

  /// pt: 'Restaurar compras'
  String get restorePurchases => 'Restaurar compras';

  /// pt: 'Seu par cuida desta assinatura.'
  String get partnerPays => 'Seu par cuida desta assinatura.';

  /// pt: 'Se um dos parceiros cancelar, o Plus termina para os dois, com aviso claro.'
  String get partnerCancel =>
      'Se um dos parceiros cancelar, o Plus termina para os dois, com aviso claro.';

  /// pt: 'A loja não abriu'
  String get storeIssueTitle => 'A loja não abriu';

  /// pt: 'Restaurando compras'
  String get restoreLoadingTitle => 'Restaurando compras';

  /// pt: 'Isso leva alguns segundos.'
  String get restoreLoadingText => 'Isso leva alguns segundos.';

  /// pt: 'Compras restauradas'
  String get restoredTitle => 'Compras restauradas';

  /// pt: 'restauradas'
  String get restoredHighlight => 'restauradas';

  /// pt: 'Encontramos o seu Plus na loja.'
  String get restoredText => 'Encontramos o seu Plus na loja.';

  /// pt: 'Encontramos uma compra'
  String get pendingRestoreTitle => 'Encontramos uma compra';

  /// pt: 'compra'
  String get pendingRestoreHighlight => 'compra';

  /// pt: 'Pode levar um instante, ou entre com a conta que comprou.'
  String get pendingRestoreText => 'Pode levar um instante, ou entre com a conta que comprou.';

  /// pt: 'Nada para restaurar'
  String get nothingTitle => 'Nada para restaurar';

  /// pt: 'restaurar'
  String get nothingHighlight => 'restaurar';

  /// pt: 'Não encontramos compras ativas nesta loja. Se você assinou com outra conta, entre com ela e tente de novo.'
  String get nothingText =>
      'Não encontramos compras ativas nesta loja. Se você assinou com outra conta, entre com ela e tente de novo.';

  /// pt: 'Não deu para restaurar'
  String get restoreFailedTitle => 'Não deu para restaurar';

  /// pt: 'restaurar'
  String get restoreFailedHighlight => 'restaurar';

  /// pt: 'Tentar de novo'
  String get tryAgain => 'Tentar de novo';

  /// pt: 'Pronto'
  String get done => 'Pronto';

  Map<String, String> get errors => {
    'storeUnavailable': 'A loja não está disponível neste aparelho agora.',
    'manageUnavailable': 'Não há uma página da loja para esta assinatura aqui.',
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };
}

// Path: privacy
class Translations$privacy$pt {
  Translations$privacy$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Privacidade e segurança'
  String get title => 'Privacidade e segurança';

  /// pt: 'Modo discreto'
  String get discreetMode => 'Modo discreto';

  /// pt: 'O que o parceiro vê'
  String get partnerTitle => 'O que o parceiro vê';

  /// pt: 'Slips enviados'
  String get partnerSlips => 'Slips enviados';

  /// pt: 'Só o que você envia'
  String get partnerSlipsText => 'Só o que você envia';

  /// pt: 'Slips privados'
  String get partnerPrivateSlips => 'Slips privados';

  /// pt: 'Temperatura'
  String get partnerTemperature => 'Temperatura';

  /// pt: 'Diário'
  String get partnerJournal => 'Diário';

  /// pt: 'Pausa'
  String get partnerPause => 'Pausa';

  /// pt: 'A mensagem que você escreveu'
  String get partnerPauseText => 'A mensagem que você escreveu';

  /// pt: 'Nunca'
  String get never => 'Nunca';

  /// pt: 'Quem produz o dado decide quem vê.'
  String get partnerNote => 'Quem produz o dado decide quem vê.';

  /// pt: 'O que podemos ver'
  String get ourTitle => 'O que podemos ver';

  /// pt: 'Seu conteúdo é criptografado em trânsito.'
  String get ourEncrypted => 'Seu conteúdo é criptografado em trânsito.';

  /// pt: 'A equipe não pode ler suas notas privadas.'
  String get ourPrivate => 'A equipe não pode ler suas notas privadas.';

  /// pt: 'Análises: só contagens.'
  String get ourAnalytics => 'Análises: só contagens.';

  /// pt: 'Página em linguagem simples.'
  String get ourPlain => 'Página em linguagem simples.';

  /// pt: 'Consentimentos'
  String get consents => 'Consentimentos';

  /// pt: 'Dados sensíveis'
  String get sensitiveData => 'Dados sensíveis';

  /// pt: 'Análises'
  String get analytics => 'Análises';

  /// pt: 'Marketing'
  String get marketing => 'Marketing';

  /// pt: 'IA (quando disponível)'
  String get ai => 'IA (quando disponível)';

  /// pt: 'Termos'
  String get terms => 'Termos';

  /// pt: 'Obrigatório'
  String get required => 'Obrigatório';

  /// pt: 'Dados sensíveis e Termos são obrigatórios para usar o app.'
  String get requiredNote => 'Dados sensíveis e Termos são obrigatórios para usar o app.';

  /// pt: 'Mudanças valem agora.'
  String get consentsNote => 'Mudanças valem agora.';

  /// pt: 'Não deu para salvar agora. Tente de novo.'
  String get saveError => 'Não deu para salvar agora. Tente de novo.';

  /// pt: 'Não deu para carregar os consentimentos'
  String get errorTitle => 'Não deu para carregar os consentimentos';

  /// pt: 'Tente de novo em instantes.'
  String get errorText => 'Tente de novo em instantes.';

  /// pt: 'Trilhas e avisos sensíveis'
  String get sensitiveTracks => 'Trilhas e avisos sensíveis';

  /// pt: 'Aviso de dias pesados'
  String get heavyDayNotice => 'Aviso de dias pesados';
}

// Path: profileDetails
class Translations$profileDetails$pt {
  Translations$profileDetails$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Perfil'
  String get title => 'Perfil';

  /// pt: 'Seu nome'
  String get nameLabel => 'Seu nome';

  /// pt: 'Marina'
  String get nameHint => 'Marina';

  Map<String, String> get nameErrors => {
    'empty': 'Seu nome não pode ficar vazio.',
    'tooLong': 'Use no máximo 30 caracteres.',
  };

  /// pt: 'Pronomes'
  String get pronounsLabel => 'Pronomes';

  /// pt: 'Opcional'
  String get pronounsHint => 'Opcional';

  Map<String, String> get pronounsErrors => {'tooLong': 'Use no máximo 30 caracteres.'};

  /// pt: 'Fuso horário'
  String get timeZoneLabel => 'Fuso horário';

  /// pt: 'Escolha um fuso'
  String get timeZonePlaceholder => 'Escolha um fuso';

  /// pt: 'Login'
  String get loginLabel => 'Login';

  /// pt: 'Conta'
  String get loginAccount => 'Conta';

  /// pt: 'E-mail'
  String get loginEmail => 'E-mail';

  /// pt: 'Apple'
  String get loginApple => 'Apple';

  /// pt: 'Google'
  String get loginGoogle => 'Google';

  /// pt: 'Ainda não dá para enviar foto.'
  String get photoNote => 'Ainda não dá para enviar foto.';

  /// pt: 'Salvo'
  String get saved => 'Salvo';

  /// pt: 'Não deu para carregar seu perfil'
  String get loadErrorTitle => 'Não deu para carregar seu perfil';

  /// pt: 'Confira a conexão e tente de novo.'
  String get loadErrorText => 'Confira a conexão e tente de novo.';

  Map<String, String> get timeZones => {
    'America/Sao_Paulo': 'São Paulo',
    'America/Argentina/Buenos_Aires': 'Buenos Aires',
    'America/Bogota': 'Bogotá',
    'America/Mexico_City': 'Cidade do México',
    'America/New_York': 'Nova York',
    'America/Los_Angeles': 'Los Angeles',
    'Europe/Lisbon': 'Lisboa',
    'Europe/London': 'Londres',
    'Europe/Madrid': 'Madri',
    'Europe/Paris': 'Paris',
    'Europe/Berlin': 'Berlim',
    'Africa/Luanda': 'Luanda',
    'Asia/Tokyo': 'Tóquio',
    'Australia/Sydney': 'Sydney',
    'UTC': 'UTC',
  };
  Map<String, String> get errors => {
    'NETWORK': 'Sem conexão. Tente de novo.',
    'other': 'Não deu para salvar agora. Tente de novo.',
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

  Map<String, String> get nameErrors => {
    'empty': 'Seu nome não pode ficar vazio.',
    'tooLong': 'Use no máximo 30 caracteres.',
  };

  /// pt: 'Nome do parceiro'
  String get partnerNameLabel => 'Nome do parceiro';

  /// pt: 'Ricardo'
  String get partnerNameHint => 'Ricardo';

  Map<String, String> get partnerNameErrors => {'tooLong': 'Use no máximo 30 caracteres.'};

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

  Map<String, String> get dateErrors => {'empty': 'Escolha a data de vocês.'};

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

// Path: programs
class Translations$programs$pt {
  Translations$programs$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'PROGRAMAS'
  String get label => 'PROGRAMAS';

  /// pt: 'Programas'
  String get title => 'Programas';

  /// pt: 'Programas curtos e guiados, no seu ritmo.'
  String get entryText => 'Programas curtos e guiados, no seu ritmo.';

  /// pt: 'Uma ideia por dia. Sem pressa, sem cobrança.'
  String get hubSubtitle => 'Uma ideia por dia. Sem pressa, sem cobrança.';

  /// pt: 'GRÁTIS'
  String get free => 'GRÁTIS';

  /// pt: 'PLUS'
  String get plus => 'PLUS';

  /// pt: '(one) {1 lição} (other) {{count} lições}'
  String lessonCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 lição',
        other: '${count} lições',
      );

  /// pt: 'Lições chegando'
  String get noLessons => 'Lições chegando';

  /// pt: 'Nenhum programa por aqui ainda'
  String get emptyTitle => 'Nenhum programa por aqui ainda';

  /// pt: 'Novos programas chegam em breve. Volte quando quiser.'
  String get emptyText => 'Novos programas chegam em breve. Volte quando quiser.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Os programas continuam aqui. Tente de novo.'
  String get errorText => 'Os programas continuam aqui. Tente de novo.';

  /// pt: 'SÓ EU'
  String get diaryLabel => 'SÓ EU';

  /// pt: 'Diário'
  String get diaryTitle => 'Diário';

  /// pt: 'Um lugar privado para escrever como você está.'
  String get diaryText => 'Um lugar privado para escrever como você está.';

  /// pt: 'Começar'
  String get start => 'Começar';

  /// pt: 'Continuar'
  String get kContinue => 'Continuar';

  /// pt: 'Começar de novo'
  String get restart => 'Começar de novo';

  /// pt: 'Começar de novo?'
  String get restartConfirmTitle => 'Começar de novo?';

  /// pt: 'Isto limpa suas marcações e volta à primeira lição.'
  String get restartConfirmText => 'Isto limpa suas marcações e volta à primeira lição.';

  /// pt: 'Começar de novo'
  String get restartConfirm => 'Começar de novo';

  /// pt: 'Concluído'
  String get completed => 'Concluído';

  /// pt: 'Lições'
  String get lessonsTitle => 'Lições';

  /// pt: 'Lições chegando'
  String get lessonsComingTitle => 'Lições chegando';

  /// pt: 'Este programa ainda está sendo preparado. Volte em breve.'
  String get lessonsComingText => 'Este programa ainda está sendo preparado. Volte em breve.';

  /// pt: 'Lição indisponível'
  String get lessonGoneTitle => 'Lição indisponível';

  /// pt: 'Este dia não faz mais parte do programa. Escolha outra lição.'
  String get lessonGoneText => 'Este dia não faz mais parte do programa. Escolha outra lição.';

  /// pt: 'A primeira lição é sempre aberta neste programa.'
  String get dayOneHint => 'A primeira lição é sempre aberta neste programa.';

  /// pt: 'Dia {day}'
  String dayLabel({required Object day}) => 'Dia ${day}';

  /// pt: 'Uma ideia curta para hoje.'
  String get shortRead => 'Uma ideia curta para hoje.';

  /// pt: 'Pronto'
  String get ready => 'Pronto';

  /// pt: 'Salvar para depois'
  String get saveForLater => 'Salvar para depois';

  /// pt: 'Guardado para depois.'
  String get saved => 'Guardado para depois.';

  /// pt: 'Guardado'
  String get savedTag => 'Guardado';

  /// pt: 'Lição do Plus'
  String get lockedTitle => 'Lição do Plus';

  /// pt: 'Esta lição faz parte do Plus.'
  String get lockedLessonText => 'Esta lição faz parte do Plus.';

  /// pt: 'Este programa faz parte do Plus.'
  String get lockedProgramText => 'Este programa faz parte do Plus.';

  /// pt: 'Muito bem'
  String get completeTitle => 'Muito bem';

  /// pt: 'Você concluiu {title}.'
  String completeText({required Object title}) => 'Você concluiu ${title}.';

  /// pt: 'Escolha outro quando quiser.'
  String get completeHint => 'Escolha outro quando quiser.';

  /// pt: 'Ver programas'
  String get seePrograms => 'Ver programas';

  /// pt: 'Só eu. Nunca é compartilhado.'
  String get diaryPrivacy => 'Só eu. Nunca é compartilhado.';

  /// pt: 'Hoje eu me senti...'
  String get diaryPrompt => 'Hoje eu me senti...';

  /// pt: 'Escreva sem pressa. Só você vê isto.'
  String get diaryHint => 'Escreva sem pressa. Só você vê isto.';

  Map<String, String> get diaryBodyErrors => {
    'empty': 'Escreva um pouco antes de salvar',
    'tooLong': 'A entrada está muito longa',
  };

  /// pt: 'Salvar'
  String get diarySave => 'Salvar';

  /// pt: 'Nova entrada'
  String get diaryNew => 'Nova entrada';

  /// pt: 'Editar'
  String get diaryEdit => 'Editar';

  /// pt: 'Apagar'
  String get diaryDelete => 'Apagar';

  /// pt: 'Apagar esta entrada?'
  String get diaryDeleteTitle => 'Apagar esta entrada?';

  /// pt: 'Isto não pode ser desfeito.'
  String get diaryDeleteText => 'Isto não pode ser desfeito.';

  /// pt: 'Apagar'
  String get diaryDeleteConfirm => 'Apagar';

  /// pt: 'Mostrando suas últimas 100 entradas.'
  String get diaryCapHint => 'Mostrando suas últimas 100 entradas.';

  /// pt: 'Nada escrito ainda'
  String get diaryEmptyTitle => 'Nada escrito ainda';

  /// pt: 'Quando quiser, escreva como você está. Só você vê.'
  String get diaryEmptyText => 'Quando quiser, escreva como você está. Só você vê.';

  /// pt: 'Não deu para carregar'
  String get diaryErrorTitle => 'Não deu para carregar';

  /// pt: 'Suas entradas continuam guardadas. Tente de novo.'
  String get diaryErrorText => 'Suas entradas continuam guardadas. Tente de novo.';

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

  /// pt: '{day} {month} {year}'
  String dateLine({required Object day, required Object month, required Object year}) =>
      '${day} ${month} ${year}';

  Map<String, String> get moods => {
    'calm': 'Em paz',
    'tender': 'Acolhido(a)',
    'tired': 'Cansado(a)',
    'heavy': 'Pesado',
    'other': 'Como estou',
  };
  Map<String, String> get lessonErrors => {
    'other': 'Não deu para fazer isso agora. Tente de novo.',
  };
  Map<String, String> get diaryErrors => {
    'other': 'Não deu para salvar agora. Seu texto continua aqui.',
  };

  /// pt: 'SENSÍVEL'
  String get sensitive => 'SENSÍVEL';

  /// pt: 'Uma trilha só sua'
  String get sensitiveGateTitle => 'Uma trilha só sua';

  /// pt: 'Estas lições falam de luto, doença e confiança. Seu par não vê que você entrou nem o que você lê. Você pode sair quando quiser.'
  String get sensitiveGateText =>
      'Estas lições falam de luto, doença e confiança. Seu par não vê que você entrou nem o que você lê. Você pode sair quando quiser.';

  /// pt: 'Entrar nesta trilha'
  String get sensitiveGateAction => 'Entrar nesta trilha';

  /// pt: 'Entrar nesta trilha?'
  String get sensitiveConsentTitle => 'Entrar nesta trilha?';

  /// pt: 'Estas lições falam de luto, doença e confiança. Elas ficam só para você: seu par não vê sua participação. Você pode retirar este consentimento em Privacidade e segurança.'
  String get sensitiveConsentText =>
      'Estas lições falam de luto, doença e confiança. Elas ficam só para você: seu par não vê sua participação. Você pode retirar este consentimento em Privacidade e segurança.';

  /// pt: 'Entrar'
  String get sensitiveConsentConfirm => 'Entrar';

  /// pt: 'Agora não'
  String get sensitiveConsentCancel => 'Agora não';

  /// pt: 'Trilha sensível'
  String get sensitiveLessonLockedTitle => 'Trilha sensível';

  /// pt: 'Para abrir esta lição, ative o consentimento das trilhas sensíveis.'
  String get sensitiveLessonLockedText =>
      'Para abrir esta lição, ative o consentimento das trilhas sensíveis.';

  /// pt: 'No grátis aparece só a primeira lição.'
  String get freeNote => 'No grátis aparece só a primeira lição.';
}

// Path: questions
class Translations$questions$pt {
  Translations$questions$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Pergunta para vocês dois'
  String get tag => 'Pergunta para vocês dois';

  /// pt: 'Pergunta do dia'
  String get eyebrow => 'Pergunta do dia';

  /// pt: 'Responder'
  String get answerCta => 'Responder';

  /// pt: 'Editar minha resposta'
  String get editCta => 'Editar minha resposta';

  /// pt: 'Escreva o quanto quiser.'
  String get answerHint => 'Escreva o quanto quiser.';

  Map<String, String> get answerErrors => {
    'empty': 'Escreva uma resposta',
    'tooLong': 'A resposta está muito longa',
  };

  /// pt: 'Só você vê isto até seu par responder também.'
  String get privateNote => 'Só você vê isto até seu par responder também.';

  /// pt: 'Seu par já respondeu. Envie a sua para ver as duas.'
  String get partnerAnsweredNote => 'Seu par já respondeu. Envie a sua para ver as duas.';

  /// pt: 'Sua resposta fica privada. Seu par vai ver depois que vocês se conectarem.'
  String get soloNote =>
      'Sua resposta fica privada. Seu par vai ver depois que vocês se conectarem.';

  /// pt: 'Enviar'
  String get save => 'Enviar';

  /// pt: 'Cancelar'
  String get cancel => 'Cancelar';

  /// pt: 'Sua resposta ficou guardada'
  String get waitingTitle => 'Sua resposta ficou guardada';

  /// pt: 'Ela aparece aqui quando seu par responder também.'
  String get waitingText => 'Ela aparece aqui quando seu par responder também.';

  /// pt: 'Quando seu par entrar, ele vê a sua resposta e você vê a dele.'
  String get waitingSoloText => 'Quando seu par entrar, ele vê a sua resposta e você vê a dele.';

  /// pt: 'Verificar de novo'
  String get checkAgain => 'Verificar de novo';

  /// pt: 'Recado de voz'
  String get voiceSoon => 'Recado de voz';

  /// pt: 'Por enquanto as respostas são escritas. A voz vem depois.'
  String get voiceSoonNote => 'Por enquanto as respostas são escritas. A voz vem depois.';

  /// pt: 'Suas respostas juntas'
  String get revealTitle => 'Suas respostas juntas';

  /// pt: 'juntas'
  String get revealHighlight => 'juntas';

  /// pt: 'Agora que os dois responderam, vocês veem as duas.'
  String get revealSubtitle => 'Agora que os dois responderam, vocês veem as duas.';

  /// pt: 'Sem notas. Só o que cada um escreveu.'
  String get revealNote => 'Sem notas. Só o que cada um escreveu.';

  /// pt: 'Você'
  String get you => 'Você';

  /// pt: 'Seu par'
  String get partnerFallback => 'Seu par';

  /// pt: 'Descartar esta resposta?'
  String get discardTitle => 'Descartar esta resposta?';

  /// pt: 'O texto que você escreveu não foi salvo.'
  String get discardText => 'O texto que você escreveu não foi salvo.';

  /// pt: 'Descartar'
  String get discard => 'Descartar';

  /// pt: 'Continuar escrevendo'
  String get keepWriting => 'Continuar escrevendo';

  /// pt: 'Não deu para abrir a pergunta'
  String get loadErrorTitle => 'Não deu para abrir a pergunta';

  /// pt: 'Nada foi perdido. Tente de novo.'
  String get loadErrorText => 'Nada foi perdido. Tente de novo.';

  /// pt: 'Fechar'
  String get close => 'Fechar';

  Map<String, String> get errors => {'other': 'Não deu para salvar agora. Tente de novo.'};
}

// Path: questionsEntry
class Translations$questionsEntry$pt {
  Translations$questionsEntry$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'PERGUNTA DO DIA'
  String get label => 'PERGUNTA DO DIA';

  /// pt: 'Pergunta do dia'
  String get title => 'Pergunta do dia';

  /// pt: 'Uma pergunta para os dois responderem.'
  String get text => 'Uma pergunta para os dois responderem.';
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

  Map<String, String> get textErrors => {
    'empty': 'Escreva o slip primeiro',
    'tooLong': 'Este slip está muito longo',
  };
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

// Path: relationshipChanged
class Translations$relationshipChanged$pt {
  Translations$relationshipChanged$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Algo mudou?'
  String get title => 'Algo mudou?';

  /// pt: 'mudou'
  String get highlight => 'mudou';

  /// pt: 'Conte com calma. Isso só muda o que o app mostra.'
  String get subtitle => 'Conte com calma. Isso só muda o que o app mostra.';

  /// pt: 'Terminamos'
  String get optionEnded => 'Terminamos';

  /// pt: 'Perdi a pessoa'
  String get optionBereaved => 'Perdi a pessoa';

  /// pt: 'Um tempo'
  String get optionOnBreak => 'Um tempo';

  /// pt: 'Está tudo bem'
  String get optionTogether => 'Está tudo bem';

  /// pt: 'Continuar'
  String get continueLabel => 'Continuar';

  /// pt: 'Salvo'
  String get saved => 'Salvo';

  Map<String, String> get errors => {
    'NETWORK': 'Sem conexão. Tente de novo.',
    'other': 'Não deu para salvar agora. Tente de novo.',
  };
}

// Path: relationshipSettings
class Translations$relationshipSettings$pt {
  Translations$relationshipSettings$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Relacionamento'
  String get title => 'Relacionamento';

  /// pt: 'Fase'
  String get phaseLabel => 'Fase';

  /// pt: 'Escolha uma fase'
  String get phasePlaceholder => 'Escolha uma fase';

  Map<String, String> get phases => {
    'beginning': 'Começando',
    'dating': 'Namorando',
    'living_together': 'Moramos juntos',
    'engaged': 'Noivos',
    'married': 'Casados',
    'with_kids': 'Com filhos',
    'long_distance': 'Namoro à distância',
    'with_parents': 'Moramos com os pais',
    'restarting': 'Recomeçando',
  };

  /// pt: 'Juntos desde'
  String get dateLabel => 'Juntos desde';

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

  /// pt: 'Pode escolher uma data futura; a contagem só começa depois.'
  String get futureDateNote => 'Pode escolher uma data futura; a contagem só começa depois.';

  /// pt: 'Parceiro'
  String get partnerLabel => 'Parceiro';

  /// pt: 'Convide seu par'
  String get invitePartner => 'Convide seu par';

  /// pt: 'Não deu para carregar seu par.'
  String get partnerError => 'Não deu para carregar seu par.';

  /// pt: 'Tentar de novo'
  String get partnerRetry => 'Tentar de novo';

  /// pt: 'A fase muda só as palavras.'
  String get phaseNote => 'A fase muda só as palavras.';

  /// pt: 'Salvo'
  String get saved => 'Salvo';

  /// pt: 'Não deu para carregar o relacionamento'
  String get loadErrorTitle => 'Não deu para carregar o relacionamento';

  /// pt: 'Confira a conexão e tente de novo.'
  String get loadErrorText => 'Confira a conexão e tente de novo.';

  Map<String, String> get errors => {
    'NETWORK': 'Sem conexão. Tente de novo.',
    'other': 'Não deu para salvar agora. Tente de novo.',
  };

  /// pt: 'Algo mudou entre vocês?'
  String get changedPrompt => 'Algo mudou entre vocês?';

  /// pt: 'Atualize o que o app mostra'
  String get changedSubtitle => 'Atualize o que o app mostra';
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

// Path: safeMode
class Translations$safeMode$pt {
  Translations$safeMode$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Modo seguro'
  String get title => 'Modo seguro';

  /// pt: 'Para quando o app precisa ficar discreto neste celular.'
  String get text => 'Para quando o app precisa ficar discreto neste celular.';

  /// pt: 'Esconder o app'
  String get toggle => 'Esconder o app';

  /// pt: 'Quando você troca de app, a tela fica em branco.'
  String get toggleText => 'Quando você troca de app, a tela fica em branco.';

  /// pt: 'Isto fica só neste celular. Nada é enviado nem registrado.'
  String get localOnly => 'Isto fica só neste celular. Nada é enviado nem registrado.';

  /// pt: 'Sair agora'
  String get quickExit => 'Sair agora';
}

// Path: safety
class Translations$safety$pt {
  Translations$safety$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Segurança e apoio'
  String get entry => 'Segurança e apoio';
}

// Path: sessionExpired
class Translations$sessionExpired$pt {
  Translations$sessionExpired$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Sua sessão terminou'
  String get title => 'Sua sessão terminou';

  /// pt: 'terminou'
  String get highlight => 'terminou';

  /// pt: 'Entre de novo para continuar. Seus dados estão seguros.'
  String get text => 'Entre de novo para continuar. Seus dados estão seguros.';

  /// pt: 'Entrar'
  String get action => 'Entrar';
}

// Path: settingsHome
class Translations$settingsHome$pt {
  Translations$settingsHome$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Configurações'
  String get title => 'Configurações';

  /// pt: 'Segurança e apoio'
  String get safety => 'Segurança e apoio';

  /// pt: 'Modo seguro'
  String get safetyStatus => 'Modo seguro';

  /// pt: 'Perfil'
  String get profile => 'Perfil';

  /// pt: 'Relacionamento'
  String get relationship => 'Relacionamento';

  /// pt: 'Vocês estão conectados'
  String get connected => 'Vocês estão conectados';

  /// pt: 'Convide seu par'
  String get invitePartner => 'Convide seu par';

  /// pt: 'Notificações'
  String get notifications => 'Notificações';

  /// pt: 'Dispositivos'
  String get devices => 'Dispositivos';

  /// pt: 'Ligadas no app'
  String get on => 'Ligadas no app';

  /// pt: 'Desligadas no app'
  String get off => 'Desligadas no app';

  /// pt: 'Plano'
  String get plan => 'Plano';

  /// pt: 'Grátis'
  String get planFree => 'Grátis';

  /// pt: 'Plus'
  String get planPlus => 'Plus';

  /// pt: 'Momentos a dois'
  String get spice => 'Momentos a dois';

  /// pt: 'Modo discreto'
  String get discreet => 'Modo discreto';

  /// pt: 'Ligado'
  String get discreetOn => 'Ligado';

  /// pt: 'Desligado'
  String get discreetOff => 'Desligado';

  /// pt: 'Privacidade e segurança'
  String get privacy => 'Privacidade e segurança';

  /// pt: 'Quem vê o quê'
  String get privacyStatus => 'Quem vê o quê';

  /// pt: 'Sair'
  String get signOut => 'Sair';

  /// pt: 'Apagar conta'
  String get deleteAccount => 'Apagar conta';

  /// pt: 'Sua conta será apagada em {date}.'
  String pendingBanner({required Object date}) => 'Sua conta será apagada em ${date}.';

  /// pt: 'Ver'
  String get pendingAction => 'Ver';

  /// pt: 'Sua conta será apagada em breve.'
  String get pendingBannerSimple => 'Sua conta será apagada em breve.';

  /// pt: 'Ajuda e suporte'
  String get help => 'Ajuda e suporte';

  /// pt: 'Perguntas e contato'
  String get helpStatus => 'Perguntas e contato';

  /// pt: 'Preferências do app'
  String get appPreferences => 'Preferências do app';

  /// pt: 'Aparência, texto e idioma'
  String get appPreferencesStatus => 'Aparência, texto e idioma';

  /// pt: 'Cartão semanal'
  String get weeklyCard => 'Cartão semanal';

  /// pt: 'Idioma'
  String get language => 'Idioma';

  /// pt: 'Conta'
  String get accountSection => 'Conta';

  /// pt: 'Preferências'
  String get preferencesSection => 'Preferências';

  /// pt: 'Privacidade e ajuda'
  String get privacySection => 'Privacidade e ajuda';

  /// pt: 'Conectado com {name}'
  String connectedWith({required Object name}) => 'Conectado com ${name}';
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

  /// pt: 'Guardar no potinho'
  String get jarTitle => 'Guardar no potinho';

  /// pt: 'Para abrir em um dia ruim. Só você vê.'
  String get jarText => 'Para abrir em um dia ruim. Só você vê.';

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

  Map<String, String> get draftBodyErrors => {
    'empty': 'Escreva o slip primeiro',
    'tooLong': 'Este slip está muito longo',
  };

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

  /// pt: 'Descartar este slip?'
  String get discardTitle => 'Descartar este slip?';
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
  Map<String, String> get textErrors => {
    'empty': 'Escreva o slip primeiro',
    'tooLong': 'Este slip está muito longo',
  };
  Map<String, String> get feelingErrors => {'tooLong': 'Isto está muito longo'};
  Map<String, String> get planErrors => {
    'empty': 'Diga o que você vai fazer',
    'tooLong': 'Isto está muito longo',
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

  /// pt: 'Buscar'
  String get search => 'Buscar';

  /// pt: 'Fechar busca'
  String get searchClose => 'Fechar busca';

  /// pt: 'Buscar nos seus slips'
  String get searchHint => 'Buscar nos seus slips';

  /// pt: 'Nada encontrado'
  String get searchEmptyTitle => 'Nada encontrado';

  /// pt: 'Tente outra palavra.'
  String get searchEmptyText => 'Tente outra palavra.';

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

// Path: spice
class Translations$spice$pt {
  Translations$spice$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Momentos a dois'
  String get title => 'Momentos a dois';

  /// pt: 'Esta seção fica oculta por padrão, atrás desta configuração. São cartas leves e brincalhonas, nada explícito. Só aparecem quando vocês dois ligam, e qualquer um pode desligar a qualquer momento, sem aviso.'
  String get offText =>
      'Esta seção fica oculta por padrão, atrás desta configuração. São cartas leves e brincalhonas, nada explícito. Só aparecem quando vocês dois ligam, e qualquer um pode desligar a qualquer momento, sem aviso.';

  /// pt: 'Ligar'
  String get turnOn => 'Ligar';

  /// pt: 'Agora não'
  String get notNow => 'Agora não';

  /// pt: 'Os dois precisam aceitar. Nada é avisado ao seu par; quando ele também ligar, as cartas aparecem aqui.'
  String get waitingText =>
      'Os dois precisam aceitar. Nada é avisado ao seu par; quando ele também ligar, as cartas aparecem aqui.';

  /// pt: 'Cartas leves para vocês dois. Fazer ou pular, sem pressão.'
  String get readyText => 'Cartas leves para vocês dois. Fazer ou pular, sem pressão.';

  /// pt: 'Tirar uma carta'
  String get drawCard => 'Tirar uma carta';

  /// pt: 'Desligar'
  String get turnOff => 'Desligar';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo em instantes.'
  String get errorText => 'Tente de novo em instantes.';

  Map<String, String> get errors => {
    'RATE_LIMITED': 'Muitas tentativas seguidas. Espere um instante.',
    'other': 'Não deu para mudar agora. Tente de novo.',
  };
}

// Path: story
class Translations$story$pt {
  Translations$story$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Imagem para compartilhar'
  String get title => 'Imagem para compartilhar';

  /// pt: 'A imagem é feita no seu aparelho e não leva nomes nem texto, a menos que você escolha.'
  String get privacyNote =>
      'A imagem é feita no seu aparelho e não leva nomes nem texto, a menos que você escolha.';

  /// pt: 'dias'
  String get days => 'dias';

  /// pt: 'juntos'
  String get together => 'juntos';

  /// pt: 'Incluir os nomes'
  String get namesLabel => 'Incluir os nomes';

  /// pt: 'Desligado por padrão.'
  String get namesText => 'Desligado por padrão.';

  /// pt: 'Uma frase (opcional)'
  String get phraseLabel => 'Uma frase (opcional)';

  /// pt: 'Ex.: ainda tem muito pela frente'
  String get phraseHint => 'Ex.: ainda tem muito pela frente';

  /// pt: 'Compartilhar imagem'
  String get share => 'Compartilhar imagem';

  /// pt: 'Falta a data de vocês'
  String get emptyTitle => 'Falta a data de vocês';

  /// pt: 'Defina desde quando vocês estão juntos em Nossa história para gerar a imagem.'
  String get emptyText =>
      'Defina desde quando vocês estão juntos em Nossa história para gerar a imagem.';

  /// pt: 'Não deu para carregar'
  String get errorTitle => 'Não deu para carregar';

  /// pt: 'Tente de novo em instantes.'
  String get errorText => 'Tente de novo em instantes.';

  Map<String, String> get errors => {'other': 'Não deu para compartilhar agora. Tente de novo.'};
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

  /// pt: 'Nós'
  String get segmentTogether => 'Nós';

  /// pt: 'Ferramentas privadas. Nunca compartilhadas.'
  String get forMeFooter => 'Ferramentas privadas. Nunca compartilhadas.';

  /// pt: 'Para mim'
  String get segmentForMe => 'Para mim';

  /// pt: 'CHECK-IN'
  String get checkinLabel => 'CHECK-IN';

  /// pt: 'Check-in da semana'
  String get checkinTitle => 'Check-in da semana';

  /// pt: 'Uma conversa curta, em privado primeiro.'
  String get checkinText => 'Uma conversa curta, em privado primeiro.';

  /// pt: 'PRÁTICO'
  String get logisticsLabel => 'PRÁTICO';

  /// pt: 'Reunião de logística'
  String get logisticsTitle => 'Reunião de logística';

  /// pt: 'As coisas práticas, sem ninguém carregar sozinho.'
  String get logisticsText => 'As coisas práticas, sem ninguém carregar sozinho.';

  /// pt: 'LISTAS'
  String get listsLabel => 'LISTAS';

  /// pt: 'Listas'
  String get listsTitle => 'Listas';

  /// pt: 'Nenhuma lista ainda. Comecem uma juntos.'
  String get listsEmpty => 'Nenhuma lista ainda. Comecem uma juntos.';

  /// pt: 'Nenhuma lista ainda. Comece uma só sua.'
  String get listsEmptyPrivate => 'Nenhuma lista ainda. Comece uma só sua.';

  /// pt: '(one) {1 lista, compartilhada} (other) {{count} listas, compartilhadas}'
  String listsSharedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 lista, compartilhada',
        other: '${count} listas, compartilhadas',
      );

  /// pt: '(one) {1 lista, privada} (other) {{count} listas, privadas}'
  String listsPrivateCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 lista, privada',
        other: '${count} listas, privadas',
      );

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

  /// pt: 'Encontro'
  String get dateNightTitle => 'Encontro';

  /// pt: 'Ideias para vocês dois, escolhidas juntos.'
  String get dateNightText => 'Ideias para vocês dois, escolhidas juntos.';

  /// pt: 'SÓ PARA VOCÊ'
  String get partnerLabel => 'SÓ PARA VOCÊ';

  /// pt: 'Sobre seu par'
  String get partnerTitle => 'Sobre seu par';

  /// pt: 'Notas privadas para lembrar do que ele ou ela gosta.'
  String get partnerText => 'Notas privadas para lembrar do que ele ou ela gosta.';

  /// pt: 'CONVERSAR'
  String get chatLabel => 'CONVERSAR';

  /// pt: 'Mascote'
  String get chatTitle => 'Mascote';

  /// pt: 'Uma conversa calma, que não fica guardada.'
  String get chatText => 'Uma conversa calma, que não fica guardada.';

  /// pt: 'CONVERSA DIFÍCIL'
  String get hardTalkLabel => 'CONVERSA DIFÍCIL';

  /// pt: 'Preparar uma conversa difícil'
  String get hardTalkTitle => 'Preparar uma conversa difícil';

  /// pt: 'A mascote ajuda você a organizar o que dizer.'
  String get hardTalkText => 'A mascote ajuda você a organizar o que dizer.';

  /// pt: 'PARA SEU PAR'
  String get notesLabel => 'PARA SEU PAR';

  /// pt: 'Bilhete ou desenho'
  String get notesTitle => 'Bilhete ou desenho';

  /// pt: 'Mande algo curto e carinhoso, quando quiser.'
  String get notesText => 'Mande algo curto e carinhoso, quando quiser.';

  /// pt: 'NÓS'
  String get usLabel => 'NÓS';

  /// pt: 'Sinto saudade de nós'
  String get usTitle => 'Sinto saudade de nós';

  /// pt: 'Um toque leve para o seu par, sem cobrança.'
  String get usText => 'Um toque leve para o seu par, sem cobrança.';

  /// pt: 'TOQUE'
  String get touchLabel => 'TOQUE';

  /// pt: 'Cartas de toque'
  String get touchTitle => 'Cartas de toque';

  /// pt: 'Neutras, para fazer ou pular.'
  String get touchText => 'Neutras, para fazer ou pular.';

  /// pt: 'DISTÂNCIA'
  String get distanceLabel => 'DISTÂNCIA';

  /// pt: 'Nossos dois relógios'
  String get distanceTitle => 'Nossos dois relógios';

  /// pt: 'Fusos e a contagem até o reencontro.'
  String get distanceText => 'Fusos e a contagem até o reencontro.';

  /// pt: 'COM OS PAIS'
  String get parentsLabel => 'COM OS PAIS';

  /// pt: 'Cinco minutos para nós'
  String get parentsTitle => 'Cinco minutos para nós';

  /// pt: 'Um momento curto e só de vocês dois, mesmo com a casa cheia.'
  String get parentsText => 'Um momento curto e só de vocês dois, mesmo com a casa cheia.';

  /// pt: 'CÁPSULA DO TEMPO'
  String get capsulesLabel => 'CÁPSULA DO TEMPO';

  /// pt: 'Uma mensagem para o futuro'
  String get capsulesTitle => 'Uma mensagem para o futuro';

  /// pt: 'Fica fechada até a data que você escolher.'
  String get capsulesText => 'Fica fechada até a data que você escolher.';

  /// pt: 'DATAS'
  String get datesLabel => 'DATAS';

  /// pt: 'Datas importantes'
  String get datesTitle => 'Datas importantes';

  /// pt: 'Aniversários, presentes e feriados, com aviso antes.'
  String get datesText => 'Aniversários, presentes e feriados, com aviso antes.';

  /// pt: 'AJUDA'
  String get badDayLabel => 'AJUDA';

  /// pt: 'Um dia difícil'
  String get badDayTitle => 'Um dia difícil';

  /// pt: 'Três coisas pequenas para fazer agora.'
  String get badDayText => 'Três coisas pequenas para fazer agora.';

  /// pt: 'CONVERSA'
  String get starterLabel => 'CONVERSA';

  /// pt: 'Começar uma conversa'
  String get starterTitle => 'Começar uma conversa';

  /// pt: 'Uma pergunta para abrir, sem pressa.'
  String get starterText => 'Uma pergunta para abrir, sem pressa.';

  /// pt: 'DIA'
  String get dayLabel => 'DIA';

  /// pt: 'Dia a dia'
  String get dayTitle => 'Dia a dia';

  /// pt: 'O que importa em cada dia.'
  String get dayText => 'O que importa em cada dia.';

  /// pt: 'PLANO'
  String get plusLabel => 'PLANO';

  /// pt: 'Grátis e Plus'
  String get plusTitle => 'Grátis e Plus';

  /// pt: 'O que cada plano inclui, sem pressão.'
  String get plusText => 'O que cada plano inclui, sem pressão.';

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

  /// pt: 'SÓ PARA VOCÊ'
  String get fightStyleLabel => 'SÓ PARA VOCÊ';

  /// pt: 'Como eu reajo numa briga'
  String get fightStyleTitle => 'Como eu reajo numa briga';

  /// pt: 'Uma reflexão curta e privada sobre o seu jeito.'
  String get fightStyleText => 'Uma reflexão curta e privada sobre o seu jeito.';

  /// pt: 'CONVERSAS'
  String get guidesLabel => 'CONVERSAS';

  /// pt: 'Conversas difíceis'
  String get guidesTitle => 'Conversas difíceis';

  /// pt: 'Um passo de cada vez, só para você.'
  String get guidesText => 'Um passo de cada vez, só para você.';

  /// pt: 'JOGOS'
  String get gamesLabel => 'JOGOS';

  /// pt: 'Jogar juntos'
  String get gamesTitle => 'Jogar juntos';

  /// pt: 'Jogos curtos, sem placar e sem vencedor.'
  String get gamesText => 'Jogos curtos, sem placar e sem vencedor.';

  /// pt: 'Precisa dos dois'
  String get gamesLock => 'Precisa dos dois';

  /// pt: 'Para vocês'
  String get sectionForYou => 'Para vocês';

  /// pt: 'Ferramentas'
  String get sectionTools => 'Ferramentas';

  /// pt: 'Mais'
  String get sectionMore => 'Mais';

  /// pt: 'Só seu'
  String get sectionPrivate => 'Só seu';

  /// pt: 'Meus padrões'
  String get sectionPatterns => 'Meus padrões';

  /// pt: '15 min · semanal'
  String get logisticsMeta => '15 min · semanal';

  /// pt: 'Pequenos hábitos'
  String get ritualsMeta => 'Pequenos hábitos';

  /// pt: 'Para vocês dois'
  String get dateNightMeta => 'Para vocês dois';

  /// pt: 'Microlições'
  String get programsMeta => 'Microlições';

  /// pt: 'Uma vez por semana'
  String get checkinMeta => 'Uma vez por semana';

  /// pt: 'Uma para os dois'
  String get questionMeta => 'Uma para os dois';

  /// pt: 'Sem placar'
  String get gamesMeta => 'Sem placar';

  /// pt: 'Com aviso antes'
  String get datesMeta => 'Com aviso antes';

  /// pt: 'Só para você'
  String get giftsMeta => 'Só para você';

  /// pt: 'Um passo de cada vez'
  String get guidesMeta => 'Um passo de cada vez';

  /// pt: 'Uma pergunta'
  String get starterMeta => 'Uma pergunta';

  /// pt: 'Um dia de cada vez'
  String get dayMeta => 'Um dia de cada vez';

  /// pt: 'Para o futuro'
  String get capsulesMeta => 'Para o futuro';

  /// pt: 'Privado, sem nota'
  String get temperatureMeta => 'Privado, sem nota';

  /// pt: 'Na tela inicial'
  String get widgetsMeta => 'Na tela inicial';

  /// pt: 'Um toque'
  String get usMeta => 'Um toque';

  /// pt: 'Cartas neutras'
  String get touchMeta => 'Cartas neutras';

  /// pt: 'Três coisas pequenas'
  String get badDayMeta => 'Três coisas pequenas';

  /// pt: 'Fusos e reencontro'
  String get distanceMeta => 'Fusos e reencontro';

  /// pt: 'Cinco minutos'
  String get parentsMeta => 'Cinco minutos';

  /// pt: 'Só seu'
  String get diaryMeta => 'Só seu';

  /// pt: 'Notas antes de falar'
  String get hardTalkMeta => 'Notas antes de falar';

  /// pt: 'Quando quiser'
  String get notesMeta => 'Quando quiser';

  /// pt: 'Anotações privadas'
  String get learningMeta => 'Anotações privadas';

  /// pt: 'Só para você'
  String get partnerMeta => 'Só para você';

  /// pt: 'Como você reage'
  String get fightStyleMeta => 'Como você reage';

  /// pt: 'Como você se sente amado'
  String get loveStyleMeta => 'Como você se sente amado';

  /// pt: 'Uma conversa calma'
  String get chatMeta => 'Uma conversa calma';

  /// pt: 'Nenhuma ainda'
  String get listsNone => 'Nenhuma ainda';
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

// Path: timeInApp
class Translations$timeInApp$pt {
  Translations$timeInApp$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Um tempo no app'
  String get title => 'Um tempo no app';

  /// pt: 'app'
  String get titleHighlight => 'app';

  /// pt: 'Escondemos cartões e lembretes até você voltar.'
  String get text => 'Escondemos cartões e lembretes até você voltar.';

  /// pt: 'Pausar o app'
  String get pause => 'Pausar o app';

  /// pt: 'Cancelar'
  String get cancel => 'Cancelar';
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

  /// pt: 'Abrir nossa história'
  String get togetherChipAction => 'Abrir nossa história';

  /// pt: '{first} e {second}'
  String togetherJoin({required Object first, required Object second}) => '${first} e ${second}';

  /// pt: 'Convidar sua pessoa'
  String get invitePerson => 'Convidar sua pessoa';

  /// pt: 'Convite enviado'
  String get pendingInviteTitle => 'Convite enviado';

  /// pt: 'A pessoa ainda não entrou. Reenviar ou revogar.'
  String get pendingInviteText => 'A pessoa ainda não entrou. Reenviar ou revogar.';

  /// pt: 'Ver convite'
  String get pendingInviteAction => 'Ver convite';

  /// pt: 'Responder'
  String get answer => 'Responder';

  /// pt: '(zero) {Nenhum slip ainda} (one) {1 slip esta semana} (other) {{count} slips esta semana}'
  String slipsThisWeek({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        zero: 'Nenhum slip ainda',
        one: '1 slip esta semana',
        other: '${count} slips esta semana',
      );

  /// pt: 'sem pressa'
  String get weekHintEmpty => 'sem pressa';

  /// pt: 'cartão no domingo'
  String get weekHint => 'cartão no domingo';

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

  /// pt: 'cartão sai hoje, 18:00'
  String get weekHintToday => 'cartão sai hoje, 18:00';
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

// Path: widgets
class Translations$widgets$pt {
  Translations$widgets$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Widgets'
  String get settingsTitle => 'Widgets';

  /// pt: 'Na tela inicial'
  String get settingsSubtitle => 'Na tela inicial';

  /// pt: 'TELA INICIAL'
  String get juntosCategory => 'TELA INICIAL';

  /// pt: 'Widgets do Repara'
  String get juntosTitle => 'Widgets do Repara';

  /// pt: 'Lembretes calmos para você ou para vocês dois.'
  String get juntosSubtitle => 'Lembretes calmos para você ou para vocês dois.';

  /// pt: 'Widgets'
  String get galleryTitle => 'Widgets';

  /// pt: 'Só meus'
  String get segmentOwn => 'Só meus';

  /// pt: 'Do casal'
  String get segmentCouple => 'Do casal';

  /// pt: 'Como colocar na tela'
  String get howToAddAction => 'Como colocar na tela';

  /// pt: 'Configurar'
  String get configureAction => 'Configurar';

  /// pt: 'ANOTAR SLIP'
  String get ownSlipLabel => 'ANOTAR SLIP';

  /// pt: '+ Slip'
  String get ownSlipTitle => '+ Slip';

  /// pt: 'Toque para anotar'
  String get ownSlipSubtitle => 'Toque para anotar';

  /// pt: 'IDEIA DO DIA'
  String get ownIdeaLabel => 'IDEIA DO DIA';

  /// pt: 'Deixe um bilhete hoje'
  String get ownIdeaDefault => 'Deixe um bilhete hoje';

  /// pt: 'Toque para abrir'
  String get ownIdeaHint => 'Toque para abrir';

  /// pt: 'POTINHO DO DIA RUIM'
  String get ownJarLabel => 'POTINHO DO DIA RUIM';

  /// pt: 'Abrir um slip guardado'
  String get ownJarTitle => 'Abrir um slip guardado';

  /// pt: 'Privado: só no seu aparelho'
  String get ownJarPrivacy => 'Privado: só no seu aparelho';

  /// pt: 'TELA DE BLOQUEIO'
  String get lockScreenLabel => 'TELA DE BLOQUEIO';

  /// pt: 'Lembrete calmo · Sem nomes'
  String get lockScreenDefault => 'Lembrete calmo · Sem nomes';

  /// pt: 'CONTADOR'
  String get coupleCounterLabel => 'CONTADOR';

  /// pt: 'Defina a data do casal para ver os dias juntos'
  String get coupleCounterUnset => 'Defina a data do casal para ver os dias juntos';

  /// pt: '(one) {{count} dia juntos} (other) {{count} dias juntos}'
  String coupleCounterDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} dia juntos',
        other: '${count} dias juntos',
      );

  /// pt: 'FOTOS DO CASAL · PLUS'
  String get couplePhotosLabel => 'FOTOS DO CASAL · PLUS';

  /// pt: 'Escolha uma foto de vocês dois'
  String get couplePhotosPrompt => 'Escolha uma foto de vocês dois';

  /// pt: 'Disponível no plano Plus'
  String get couplePhotosPlusHint => 'Disponível no plano Plus';

  /// pt: 'RECADO DO PAR'
  String get partnerNoteLabel => 'RECADO DO PAR';

  /// pt: 'Sem recado novo no momento'
  String get partnerNoteEmpty => 'Sem recado novo no momento';

  /// pt: 'De {name}'
  String partnerNoteFrom({required Object name}) => 'De ${name}';

  /// pt: 'Do seu par'
  String get partnerNoteFromDefault => 'Do seu par';

  /// pt: 'CARTÃO E ENCONTRO'
  String get cardEncounterLabel => 'CARTÃO E ENCONTRO';

  /// pt: 'Chegou um cartão · Toque para abrir'
  String get cardStateReady => 'Chegou um cartão · Toque para abrir';

  /// pt: 'Cartão enviado · Aguardando domingo'
  String get cardStateSent => 'Cartão enviado · Aguardando domingo';

  /// pt: 'Pausa em andamento'
  String get cardStatePause => 'Pausa em andamento';

  /// pt: 'Cartão de domingo em preparação'
  String get cardStateNone => 'Cartão de domingo em preparação';

  /// pt: 'Modo discreto ativo: nomes, fotos e recados estão ocultos nos widgets.'
  String get discreetBanner =>
      'Modo discreto ativo: nomes, fotos e recados estão ocultos nos widgets.';

  /// pt: 'Sem par conectado: os widgets do casal mostram o estado neutro.'
  String get unpairedBanner => 'Sem par conectado: os widgets do casal mostram o estado neutro.';

  /// pt: 'Mostrando o último dado salvo. Atualiza quando voltar a internet.'
  String get offlineBanner => 'Mostrando o último dado salvo. Atualiza quando voltar a internet.';

  /// pt: 'Como adicionar'
  String get howToAddTitle => 'Como adicionar';

  /// pt: 'Segure a tela inicial'
  String get howToAddStep1Title => 'Segure a tela inicial';

  /// pt: 'Toque e segure um espaço vazio até os ícones tremerem.'
  String get howToAddStep1Body => 'Toque e segure um espaço vazio até os ícones tremerem.';

  /// pt: 'Toque no botão +'
  String get howToAddStep2Title => 'Toque no botão +';

  /// pt: 'No canto superior, busque por QS-Flutter.'
  String get howToAddStep2Body => 'No canto superior, busque por QS-Flutter.';

  /// pt: 'Escolha o tamanho'
  String get howToAddStep3Title => 'Escolha o tamanho';

  /// pt: 'Pequeno ou médio.'
  String get howToAddStep3Body => 'Pequeno ou médio.';

  /// pt: 'No Android moderno os widgets ficam na tela inicial. A tela de bloqueio usa apenas ícones de notificação neutros.'
  String get howToAddAndroidLockNote =>
      'No Android moderno os widgets ficam na tela inicial. A tela de bloqueio usa apenas ícones de notificação neutros.';

  /// pt: 'No iOS 16 ou mais novo, você também pode adicionar o widget na tela de bloqueio.'
  String get howToAddIosLockNote =>
      'No iOS 16 ou mais novo, você também pode adicionar o widget na tela de bloqueio.';

  /// pt: 'Entendi'
  String get howToAddDone => 'Entendi';

  /// pt: 'Configurar widget'
  String get configureTitle => 'Configurar widget';

  /// pt: 'PRÉVIA'
  String get configurePreviewLabel => 'PRÉVIA';

  /// pt: 'Conteúdo'
  String get configureContentSection => 'Conteúdo';

  /// pt: 'Favoritas'
  String get configureContentFavorites => 'Favoritas';

  /// pt: 'Recentes'
  String get configureContentRecent => 'Recentes';

  /// pt: 'Ideia do dia'
  String get configureContentDailyIdea => 'Ideia do dia';

  /// pt: 'Troca de foto'
  String get configureRotationSection => 'Troca de foto';

  /// pt: 'Todo dia'
  String get configureRotationDaily => 'Todo dia';

  /// pt: 'A cada 6h'
  String get configureRotationSixHours => 'A cada 6h';

  /// pt: 'Manual'
  String get configureRotationManual => 'Manual';

  /// pt: 'Privacidade'
  String get configurePrivacySection => 'Privacidade';

  /// pt: 'Mostrar nomes'
  String get configureShowNames => 'Mostrar nomes';

  /// pt: 'Ocultar em modo discreto'
  String get configureHideInDiscreet => 'Ocultar em modo discreto';

  /// pt: 'Permitir recado do parceiro'
  String get configureAllowPartnerNotes => 'Permitir recado do parceiro';

  /// pt: 'Permitir na tela de bloqueio'
  String get configureOnLockScreen => 'Permitir na tela de bloqueio';

  /// pt: 'Salvar'
  String get configureSave => 'Salvar';

  /// pt: 'Preferências do widget salvas.'
  String get configureSavedToast => 'Preferências do widget salvas.';

  /// pt: 'Não foi possível carregar os widgets'
  String get loadErrorTitle => 'Não foi possível carregar os widgets';

  /// pt: 'Verifique sua conexão e tente novamente.'
  String get loadErrorBody => 'Verifique sua conexão e tente novamente.';

  /// pt: 'Tentar novamente'
  String get retryAction => 'Tentar novamente';

  /// pt: 'Claro'
  String get themeLight => 'Claro';

  /// pt: 'Escuro'
  String get themeDark => 'Escuro';

  /// pt: 'Lembrete'
  String get discreetReminderLabel => 'Lembrete';

  /// pt: 'Texto neutro'
  String get discreetNeutralBody => 'Texto neutro';

  /// pt: 'Repara'
  String get signedOutLabel => 'Repara';

  /// pt: 'Toque para entrar'
  String get signedOutBody => 'Toque para entrar';

  /// pt: 'Widget · Meu (pequeno)'
  String get ownSmallPageTitle => 'Widget · Meu (pequeno)';

  /// pt: 'Anotar'
  String get ownSmallSlipAction => 'Anotar';

  /// pt: 'Próxima data'
  String get ownSmallDateDefaultTitle => 'Próxima data';

  /// pt: '(one) {{count} dia} (other) {{count} dias}'
  String ownSmallDateDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} dia',
        other: '${count} dias',
      );

  /// pt: 'HUMOR'
  String get ownSmallMoodLabel => 'HUMOR';

  /// pt: 'Como você está?'
  String get ownSmallMoodPrompt => 'Como você está?';

  /// pt: 'Feliz · Cansado · Triste'
  String get ownSmallMoodOptions => 'Feliz · Cansado · Triste';

  /// pt: 'RITUAL'
  String get ownSmallRitualLabel => 'RITUAL';

  /// pt: 'Caminhada de domingo'
  String get ownSmallRitualDefaultTitle => 'Caminhada de domingo';

  /// pt: 'Dom · 10:00'
  String get ownSmallRitualDefaultTime => 'Dom · 10:00';

  /// pt: 'Widget · Meu (médio)'
  String get ownMediumPageTitle => 'Widget · Meu (médio)';

  /// pt: 'Toque para ver'
  String get ownMediumIdeaAction => 'Toque para ver';

  /// pt: 'Toque para abrir um slip guardado'
  String get ownMediumJarTitle => 'Toque para abrir um slip guardado';

  /// pt: 'Privado: só aparece no seu aparelho'
  String get ownMediumJarPrivacy => 'Privado: só aparece no seu aparelho';

  /// pt: 'Tela de bloqueio'
  String get lockScreenPageTitle => 'Tela de bloqueio';

  /// pt: '19:38'
  String get lockScreenClockTime => '19:38';

  /// pt: 'Sexta, 10 de abril'
  String get lockScreenClockDate => 'Sexta, 10 de abril';

  /// pt: 'Pausa em andamento'
  String get lockScreenPauseTitle => 'Pausa em andamento';

  /// pt: 'até {time}'
  String lockScreenPauseUntil({required Object time}) => 'até ${time}';

  /// pt: 'até 20:00'
  String get lockScreenPauseUntilDefault => 'até 20:00';

  /// pt: 'Estou pronto'
  String get lockScreenReadyAction => 'Estou pronto';

  /// pt: 'Momento calmo'
  String get lockScreenGenericPhrase => 'Momento calmo';

  /// pt: 'Lembrete'
  String get lockScreenDiscreetPhrase => 'Lembrete';

  /// pt: 'Sem nomes nem mensagens na tela bloqueada.'
  String get lockScreenPrivacyRule => 'Sem nomes nem mensagens na tela bloqueada.';

  /// pt: 'O widget da tela de bloqueio está desativado nas configurações.'
  String get lockScreenDisabledNote =>
      'O widget da tela de bloqueio está desativado nas configurações.';

  /// pt: 'Formatos no iOS (Circular, Retangular e Linha)'
  String get lockScreenFamiliesTitle => 'Formatos no iOS (Circular, Retangular e Linha)';

  /// pt: 'Widget · Contador'
  String get counterPageTitle => 'Widget · Contador';

  /// pt: '{years} anos · {months} meses'
  String counterYearsMonthsTitle({required Object years, required Object months}) =>
      '${years} anos · ${months} meses';

  /// pt: '{months} meses · {days} dias'
  String counterMonthsDaysSubtitle({required Object months, required Object days}) =>
      '${months} meses · ${days} dias';

  /// pt: 'Namorando'
  String get counterStatusDating => 'Namorando';

  /// pt: 'Morando juntos'
  String get counterStatusLivingTogether => 'Morando juntos';

  /// pt: 'Casados'
  String get counterStatusMarried => 'Casados';

  /// pt: 'Juntos'
  String get counterStatusTogether => 'Juntos';

  /// pt: 'O contador atualiza automaticamente à meia-noite no fuso local.'
  String get counterMidnightNote =>
      'O contador atualiza automaticamente à meia-noite no fuso local.';

  /// pt: 'Definir data do relacionamento'
  String get counterSetDateAction => 'Definir data do relacionamento';

  /// pt: 'Widget · Fotos do casal'
  String get photosPageTitle => 'Widget · Fotos do casal';

  /// pt: 'PLUS'
  String get photosPlusBadge => 'PLUS';

  /// pt: 'Quando nenhuma foto local está salva (ou no modo discreto), o widget mostra apenas o cartão neutro com o tempo juntos.'
  String get photosNeutralFallbackNote =>
      'Quando nenhuma foto local está salva (ou no modo discreto), o widget mostra apenas o cartão neutro com o tempo juntos.';

  /// pt: 'Conhecer o Plus'
  String get photosUnlockPlusAction => 'Conhecer o Plus';

  /// pt: 'Escolher foto'
  String get photosChooseAction => 'Escolher foto';

  /// pt: 'Remover foto'
  String get photosRemoveAction => 'Remover foto';

  /// pt: 'Foto salva no widget.'
  String get photosSavedToast => 'Foto salva no widget.';

  /// pt: 'Foto removida do widget.'
  String get photosRemovedToast => 'Foto removida do widget.';

  /// pt: 'Recado do parceiro'
  String get partnerNotePageTitle => 'Recado do parceiro';

  /// pt: 'Médio'
  String get partnerNoteMediumSection => 'Médio';

  /// pt: 'Responder com um coração'
  String get partnerNoteReplyHint => 'Responder com um coração';

  /// pt: 'desenho'
  String get partnerNoteDrawingPlaceholder => 'desenho';

  /// pt: 'Apenas recados marcados pelo seu par como visíveis no widget aparecem aqui.'
  String get partnerNoteSafeNote =>
      'Apenas recados marcados pelo seu par como visíveis no widget aparecem aqui.';

  /// pt: 'Você desativou recados do parceiro no widget. Ative abaixo se quiser exibi-los.'
  String get partnerNoteDisabledNote =>
      'Você desativou recados do parceiro no widget. Ative abaixo se quiser exibi-los.';

  /// pt: 'Cartão e próximo encontro'
  String get cardEncounterPageTitle => 'Cartão e próximo encontro';

  /// pt: 'Cartão da semana'
  String get cardWeeklyLabel => 'Cartão da semana';

  /// pt: 'Chegou um cartão'
  String get cardReadyTitle => 'Chegou um cartão';

  /// pt: 'Toque para abrir'
  String get cardReadySubtitle => 'Toque para abrir';

  /// pt: 'Cartão enviado'
  String get cardSentTitle => 'Cartão enviado';

  /// pt: 'Aguardando domingo'
  String get cardSentSubtitle => 'Aguardando domingo';

  /// pt: 'Cartão de domingo'
  String get cardNoneTitle => 'Cartão de domingo';

  /// pt: 'Em preparação'
  String get cardNoneSubtitle => 'Em preparação';

  /// pt: 'Pausa em andamento'
  String get cardPauseTitle => 'Pausa em andamento';

  /// pt: 'Toque quando estiver pronto'
  String get cardPauseSubtitle => 'Toque quando estiver pronto';

  /// pt: 'Próximo encontro'
  String get nextEncounterLabel => 'Próximo encontro';

  /// pt: 'Sem data futura'
  String get nextEncounterEmptyTitle => 'Sem data futura';

  /// pt: 'Toque para agendar'
  String get nextEncounterEmptySubtitle => 'Toque para agendar';

  /// pt: 'Este widget mostra apenas o estado do cartão e a próxima data — nunca nomes nem o texto do cartão.'
  String get cardEncounterPrivacyNote =>
      'Este widget mostra apenas o estado do cartão e a próxima data — nunca nomes nem o texto do cartão.';

  /// pt: 'Estados do widget'
  String get statesPageTitle => 'Estados do widget';

  /// pt: 'Ver estados (discreto e sem par)'
  String get statesAction => 'Ver estados (discreto e sem par)';

  /// pt: 'Modo discreto'
  String get statesDiscreetSection => 'Modo discreto';

  /// pt: 'Ativar modo discreto agora'
  String get statesDiscreetToggle => 'Ativar modo discreto agora';

  /// pt: 'Sem parceiro'
  String get statesUnpairedSection => 'Sem parceiro';

  /// pt: 'Convide para ver aqui'
  String get statesUnpairedTitle => 'Convide para ver aqui';

  /// pt: 'Convidar'
  String get statesUnpairedAction => 'Convidar';

  /// pt: 'Sem conexão'
  String get statesOfflineSection => 'Sem conexão';

  /// pt: 'Mostrando o último dado'
  String get statesOfflineTitle => 'Mostrando o último dado';

  /// pt: 'Atualiza quando voltar a internet'
  String get statesOfflineSubtitle => 'Atualiza quando voltar a internet';

  /// pt: 'Quando o modo discreto e o estado sem parceiro estão ativos ao mesmo tempo, o widget usa sempre a variante mais neutra (Lembrete).'
  String get statesPrecedenceNote =>
      'Quando o modo discreto e o estado sem parceiro estão ativos ao mesmo tempo, o widget usa sempre a variante mais neutra (Lembrete).';

  Map<String, String> get errors => {
    'WIDGET_PREFERENCES_SAVE_FAILED': 'Não foi possível salvar as preferências agora.',
    'COUPLE_PHOTO_LOAD_FAILED': 'Não foi possível carregar a foto do casal agora.',
    'COUPLE_PHOTO_UPLOAD_FAILED': 'Não foi possível salvar a foto do casal agora.',
    'COUPLE_PHOTO_REMOVE_FAILED': 'Não foi possível remover a foto do casal agora.',
    'COUPLE_PHOTO_INVALID': 'Escolha uma imagem JPG, PNG, WebP ou HEIC de até 8 MB.',
    'COUPLE_PHOTO_READ_FAILED': 'Não foi possível ler o arquivo escolhido.',
    'COUPLE_PHOTO_PICK_FAILED': 'Não foi possível abrir o seletor de fotos.',
    'COUPLE_PHOTO_SIGNED_OUT': 'Entre na sua conta para escolher uma foto do casal.',
    'COUPLE_PHOTO_NOT_PAIRED': 'Conecte-se com seu par para escolher uma foto do casal.',
    'other': 'Não foi possível salvar as preferências agora.',
  };
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

// Path: games.hub
class Translations$games$hub$pt {
  Translations$games$hub$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Jogar'
  String get title => 'Jogar';

  /// pt: 'Jogos curtos para vocês dois. Sem placar e sem vencedor.'
  String get subtitle => 'Jogos curtos para vocês dois. Sem placar e sem vencedor.';

  /// pt: 'Palpites'
  String get guessLabel => 'Palpites';

  /// pt: 'Conversa'
  String get talkLabel => 'Conversa';

  /// pt: 'Desafio'
  String get challengeLabel => 'Desafio';

  /// pt: '{minutes} min'
  String minutes({required Object minutes}) => '${minutes} min';

  /// pt: '{name} chamou você'
  String invitedTitle({required Object name}) => '${name} chamou você';

  /// pt: 'Seu par chamou você'
  String get invitedFallbackTitle => 'Seu par chamou você';

  /// pt: 'Entrar'
  String get join => 'Entrar';

  /// pt: 'Aguardando {name}'
  String stateWaiting({required Object name}) => 'Aguardando ${name}';

  /// pt: 'Aguardando seu par'
  String get stateWaitingFallback => 'Aguardando seu par';

  /// pt: 'Chamou você'
  String get stateInvited => 'Chamou você';

  /// pt: 'Em andamento'
  String get stateActive => 'Em andamento';

  /// pt: 'Terminado'
  String get stateFinished => 'Terminado';

  /// pt: 'Convite cancelado'
  String get stateCancelled => 'Convite cancelado';

  /// pt: 'Convite expirado'
  String get stateExpired => 'Convite expirado';

  /// pt: 'Precisa dos dois'
  String get lockChip => 'Precisa dos dois';

  /// pt: 'Os jogos precisam dos dois. Quando seu par entrar, vocês podem jogar.'
  String get noPartnerNote =>
      'Os jogos precisam dos dois. Quando seu par entrar, vocês podem jogar.';

  /// pt: 'Para ver se algo mudou, volte ao app ou puxe para atualizar.'
  String get refreshNote => 'Para ver se algo mudou, volte ao app ou puxe para atualizar.';

  /// pt: 'Não deu para abrir os jogos'
  String get loadErrorTitle => 'Não deu para abrir os jogos';

  /// pt: 'Nada foi perdido. Tente de novo.'
  String get loadErrorText => 'Nada foi perdido. Tente de novo.';

  /// pt: '(one) {1 pergunta} (other) {{count} perguntas}'
  String questionCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 pergunta',
        other: '${count} perguntas',
      );

  /// pt: '(one) {1 palpite} (other) {{count} palpites}'
  String guessCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 palpite',
        other: '${count} palpites',
      );
}

// Path: games.kinds
class Translations$games$kinds$pt {
  Translations$games$kinds$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$games$kinds$meOrYou$pt meOrYou =
      Translations$games$kinds$meOrYou$pt.internal(_root);
  late final Translations$games$kinds$howWell$pt howWell =
      Translations$games$kinds$howWell$pt.internal(_root);
  late final Translations$games$kinds$twentyQuestions$pt twentyQuestions =
      Translations$games$kinds$twentyQuestions$pt.internal(_root);
  late final Translations$games$kinds$neverHaveWe$pt neverHaveWe =
      Translations$games$kinds$neverHaveWe$pt.internal(_root);
  late final Translations$games$kinds$mission$pt mission =
      Translations$games$kinds$mission$pt.internal(_root);
}

// Path: games.start
class Translations$games$start$pt {
  Translations$games$start$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Sem vencedor, sem pontos.'
  String get noWinnerNote => 'Sem vencedor, sem pontos.';

  /// pt: 'Chamar {name}'
  String cta({required Object name}) => 'Chamar ${name}';

  /// pt: 'Chamar seu par'
  String get ctaFallback => 'Chamar seu par';

  /// pt: 'O último convite foi cancelado. Vocês podem começar de novo quando quiserem.'
  String get cancelledNote =>
      'O último convite foi cancelado. Vocês podem começar de novo quando quiserem.';

  /// pt: 'O convite anterior expirou. Chame de novo quando quiserem.'
  String get expiredNote => 'O convite anterior expirou. Chame de novo quando quiserem.';

  /// pt: 'Este jogo ainda não tem perguntas'
  String get noContentTitle => 'Este jogo ainda não tem perguntas';

  /// pt: 'Ainda não há conteúdo para jogar. Volte em breve.'
  String get noContentText => 'Ainda não há conteúdo para jogar. Volte em breve.';
}

// Path: games.invitation
class Translations$games$invitation$pt {
  Translations$games$invitation$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: '{name} chamou você'
  String title({required Object name}) => '${name} chamou você';

  /// pt: 'Seu par chamou você'
  String get titleFallback => 'Seu par chamou você';

  /// pt: 'Jogar agora'
  String get join => 'Jogar agora';

  /// pt: 'Depois'
  String get later => 'Depois';
}

// Path: games.waiting
class Translations$games$waiting$pt {
  Translations$games$waiting$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Convite enviado para {name}. Começa quando entrar.'
  String text({required Object name}) => 'Convite enviado para ${name}. Começa quando entrar.';

  /// pt: 'Convite enviado. Começa quando seu par entrar.'
  String get textFallback => 'Convite enviado. Começa quando seu par entrar.';

  /// pt: 'Aguardando…'
  String get status => 'Aguardando…';

  /// pt: 'O convite espera por até 48 horas.'
  String get window => 'O convite espera por até 48 horas.';

  /// pt: 'Ver se já entrou'
  String get checkAgain => 'Ver se já entrou';

  /// pt: 'Cancelar o convite'
  String get cancel => 'Cancelar o convite';
}

// Path: games.active
class Translations$games$active$pt {
  Translations$games$active$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'O jogo começou'
  String get title => 'O jogo começou';

  /// pt: 'Os dois estão dentro. As telas deste jogo aparecem aqui.'
  String get text => 'Os dois estão dentro. As telas deste jogo aparecem aqui.';

  /// pt: 'Encerrar o jogo'
  String get cancel => 'Encerrar o jogo';
}

// Path: games.playing
class Translations$games$playing$pt {
  Translations$games$playing$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Pergunta {current} de {total}'
  String progress({required Object current, required Object total}) =>
      'Pergunta ${current} de ${total}';

  /// pt: 'Você'
  String get you => 'Você';

  /// pt: 'Seu par'
  String get partnerFallback => 'Seu par';

  /// pt: 'Enviar resposta'
  String get submit => 'Enviar resposta';

  /// pt: 'Pular esta'
  String get skip => 'Pular esta';

  /// pt: 'Sobre você'
  String get guessAboutYou => 'Sobre você';

  /// pt: 'Sobre {name}'
  String guessAboutPartner({required Object name}) => 'Sobre ${name}';

  /// pt: 'Sobre seu par'
  String get guessAboutPartnerFallback => 'Sobre seu par';

  /// pt: 'O que {name} respondeu?'
  String guessPrompt({required Object name}) => 'O que ${name} respondeu?';

  /// pt: 'O que seu par respondeu?'
  String get guessPromptFallback => 'O que seu par respondeu?';

  /// pt: 'Seu palpite'
  String get guessYourGuess => 'Seu palpite';

  /// pt: 'Responda do seu jeito.'
  String get answerHint => 'Responda do seu jeito.';

  /// pt: 'Tente adivinhar a resposta.'
  String get guessHint => 'Tente adivinhar a resposta.';

  /// pt: 'Escreva sua resposta. Só você lê até os dois terminarem.'
  String get talkHint => 'Escreva sua resposta. Só você lê até os dois terminarem.';

  /// pt: 'Seu par só vê depois que os dois responderem.'
  String get talkNote => 'Seu par só vê depois que os dois responderem.';
}

// Path: games.date
class Translations$games$date$pt {
  Translations$games$date$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Começar o encontro'
  String get start => 'Começar o encontro';

  /// pt: 'Façam a missão juntos e voltem para contar como foi.'
  String get startNote => 'Façam a missão juntos e voltem para contar como foi.';

  /// pt: 'Como foi?'
  String get reflectionTitle => 'Como foi?';

  /// pt: 'Escolha o que aconteceu. Seu par só vê depois que os dois responderem.'
  String get reflectionText =>
      'Escolha o que aconteceu. Seu par só vê depois que os dois responderem.';
}

// Path: games.waitingPartner
class Translations$games$waitingPartner$pt {
  Translations$games$waitingPartner$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Você respondeu tudo'
  String get title => 'Você respondeu tudo';

  /// pt: 'Agora é só esperar {name}. Nada do que você escreveu aparece antes dos dois terminarem.'
  String text({required Object name}) =>
      'Agora é só esperar ${name}. Nada do que você escreveu aparece antes dos dois terminarem.';

  /// pt: 'Agora é só esperar seu par. Nada do que você escreveu aparece antes dos dois terminarem.'
  String get textFallback =>
      'Agora é só esperar seu par. Nada do que você escreveu aparece antes dos dois terminarem.';

  /// pt: 'O que você salvou'
  String get answersTitle => 'O que você salvou';

  /// pt: 'Ver de novo'
  String get checkAgain => 'Ver de novo';

  /// pt: 'Encerrar o jogo'
  String get cancel => 'Encerrar o jogo';
}

// Path: games.finished
class Translations$games$finished$pt {
  Translations$games$finished$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Que conversa boa'
  String get title => 'Que conversa boa';

  /// pt: 'Sem placar, sem vencedor. Só vocês dois.'
  String get text => 'Sem placar, sem vencedor. Só vocês dois.';

  /// pt: 'Você'
  String get you => 'Você';

  /// pt: 'Seu palpite'
  String get yourGuess => 'Seu palpite';

  /// pt: 'O palpite do seu par'
  String get partnerGuess => 'O palpite do seu par';

  /// pt: 'Acertou'
  String get matched => 'Acertou';

  /// pt: 'Sem resposta'
  String get noAnswer => 'Sem resposta';

  /// pt: 'Os dois'
  String get both => 'Os dois';

  /// pt: 'Vocês combinaram'
  String get agreed => 'Vocês combinaram';

  /// pt: 'Voltar'
  String get back => 'Voltar';
}

// Path: games.notFound
class Translations$games$notFound$pt {
  Translations$games$notFound$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Este jogo não existe'
  String get title => 'Este jogo não existe';

  /// pt: 'Ele pode ter mudado ou nunca ter existido. Volte e escolha outro.'
  String get text => 'Ele pode ter mudado ou nunca ter existido. Volte e escolha outro.';

  /// pt: 'Voltar'
  String get action => 'Voltar';
}

// Path: games.cancel
class Translations$games$cancel$pt {
  Translations$games$cancel$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Encerrar o jogo?'
  String get title => 'Encerrar o jogo?';

  /// pt: 'O jogo termina para os dois. Vocês podem começar outro depois.'
  String get text => 'O jogo termina para os dois. Vocês podem começar outro depois.';

  /// pt: 'Encerrar'
  String get confirm => 'Encerrar';

  /// pt: 'Continuar'
  String get keep => 'Continuar';
}

// Path: games.noPartner
class Translations$games$noPartner$pt {
  Translations$games$noPartner$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Os jogos são para os dois'
  String get title => 'Os jogos são para os dois';

  /// pt: 'Quando seu par entrar, vocês podem jogar juntos.'
  String get text => 'Quando seu par entrar, vocês podem jogar juntos.';
}

// Path: games.common
class Translations$games$common$pt {
  Translations$games$common$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Fechar'
  String get close => 'Fechar';
}

// Path: guides.hub
class Translations$guides$hub$pt {
  Translations$guides$hub$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Conversas difíceis'
  String get title => 'Conversas difíceis';

  /// pt: 'difíceis'
  String get titleHighlight => 'difíceis';

  /// pt: 'Um passo de cada vez, só para você.'
  String get subtitle => 'Um passo de cada vez, só para você.';

  /// pt: 'Suas anotações ficam só com você. Nada é enviado ao seu par.'
  String get privateNote => 'Suas anotações ficam só com você. Nada é enviado ao seu par.';

  /// pt: '(one) {1 passo} (other) {{count} passos}'
  String stepCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 passo',
        other: '${count} passos',
      );

  /// pt: 'Não deu para abrir os temas'
  String get loadErrorTitle => 'Não deu para abrir os temas';

  /// pt: 'Nada foi perdido. Tente de novo.'
  String get loadErrorText => 'Nada foi perdido. Tente de novo.';
}

// Path: guides.viewer
class Translations$guides$viewer$pt {
  Translations$guides$viewer$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Passo {current} de {total}'
  String stepOf({required Object current, required Object total}) => 'Passo ${current} de ${total}';

  /// pt: 'Escreva o que fizer sentido. Pode ficar em branco.'
  String get answerHint => 'Escreva o que fizer sentido. Pode ficar em branco.';

  /// pt: 'Guardado aos poucos. Só você vê.'
  String get stepNote => 'Guardado aos poucos. Só você vê.';

  /// pt: 'Próximo'
  String get next => 'Próximo';

  /// pt: 'Concluir'
  String get finish => 'Concluir';

  /// pt: 'Voltar'
  String get back => 'Voltar';

  /// pt: 'Não deu para abrir esta conversa'
  String get loadErrorTitle => 'Não deu para abrir esta conversa';

  /// pt: 'Nada foi perdido. Tente de novo.'
  String get loadErrorText => 'Nada foi perdido. Tente de novo.';

  Map<String, String> get errors => {
    'other': 'Não deu para salvar agora. Suas respostas continuam aqui.',
  };
}

// Path: guides.gate
class Translations$guides$gate$pt {
  Translations$guides$gate$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Um tema sensível'
  String get title => 'Um tema sensível';

  /// pt: 'Este tema fala sobre intimidade e foi pensado para pessoas adultas. Você pode ir com calma ou escolher outro tema quando quiser.'
  String get text =>
      'Este tema fala sobre intimidade e foi pensado para pessoas adultas. Você pode ir com calma ou escolher outro tema quando quiser.';

  /// pt: 'Este tema fala sobre o corpo e o humor ao longo do mês e foi pensado para pessoas adultas. Você pode ir com calma ou escolher outro tema quando quiser.'
  String get cycleText =>
      'Este tema fala sobre o corpo e o humor ao longo do mês e foi pensado para pessoas adultas. Você pode ir com calma ou escolher outro tema quando quiser.';

  /// pt: 'Continuar'
  String get continueAction => 'Continuar';

  /// pt: 'Ver outros temas'
  String get otherAction => 'Ver outros temas';
}

// Path: guides.finish
class Translations$guides$finish$pt {
  Translations$guides$finish$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Sua conversa está preparada'
  String get title => 'Sua conversa está preparada';

  /// pt: 'preparada'
  String get titleHighlight => 'preparada';

  /// pt: 'Suas anotações ficam guardadas na sua conta, só para você.'
  String get text => 'Suas anotações ficam guardadas na sua conta, só para você.';

  /// pt: 'Salvo só para você.'
  String get finishSaved => 'Salvo só para você.';

  /// pt: 'Começar uma conversa'
  String get start => 'Começar uma conversa';

  /// pt: 'Voltar aos temas'
  String get other => 'Voltar aos temas';
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
    'with_parents': 'Moramos com os pais',
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

  Map<String, String> get feelingErrors => {'empty': 'Diga como você se sente'};

  /// pt: 'Quando…'
  String get situation => 'Quando…';

  /// pt: 'Ex.: a louça fica para depois'
  String get situationHint => 'Ex.: a louça fica para depois';

  Map<String, String> get situationErrors => {'empty': 'Diga quando acontece'};

  /// pt: 'Eu preciso de…'
  String get need => 'Eu preciso de…';

  /// pt: 'Ex.: um pouco de ajuda'
  String get needHint => 'Ex.: um pouco de ajuda';

  Map<String, String> get needErrors => {'empty': 'Diga o que você precisa'};

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

  Map<String, String> get textErrors => {
    'empty': 'Escreva uma mensagem',
    'tooLong': 'A mensagem está muito longa',
  };

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

  Map<String, String> get noteErrors => {
    'empty': 'Escreva o que você aprendeu',
    'tooLong': 'A nota está muito longa',
  };

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

// Path: games.kinds.meOrYou
class Translations$games$kinds$meOrYou$pt {
  Translations$games$kinds$meOrYou$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Eu ou ele'
  String get title => 'Eu ou ele';

  /// pt: 'Respondam em separado quem combina mais com cada frase. Depois vejam onde vocês pensaram igual.'
  String get intro =>
      'Respondam em separado quem combina mais com cada frase. Depois vejam onde vocês pensaram igual.';
}

// Path: games.kinds.howWell
class Translations$games$kinds$howWell$pt {
  Translations$games$kinds$howWell$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Quanto você me conhece'
  String get title => 'Quanto você me conhece';

  /// pt: 'Cada um responde sobre si e tenta adivinhar a resposta do outro. Depois vem a conversa.'
  String get intro =>
      'Cada um responde sobre si e tenta adivinhar a resposta do outro. Depois vem a conversa.';
}

// Path: games.kinds.twentyQuestions
class Translations$games$kinds$twentyQuestions$pt {
  Translations$games$kinds$twentyQuestions$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: '20 perguntas'
  String get title => '20 perguntas';

  /// pt: 'Perguntas leves para responder em privado e revelar juntos.'
  String get intro => 'Perguntas leves para responder em privado e revelar juntos.';
}

// Path: games.kinds.neverHaveWe
class Translations$games$kinds$neverHaveWe$pt {
  Translations$games$kinds$neverHaveWe$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Eu nunca, nós dois'
  String get title => 'Eu nunca, nós dois';

  /// pt: 'Coisas que vocês nunca fizeram juntos. Cada um responde em privado e vocês veem os dois lados no fim.'
  String get intro =>
      'Coisas que vocês nunca fizeram juntos. Cada um responde em privado e vocês veem os dois lados no fim.';
}

// Path: games.kinds.mission
class Translations$games$kinds$mission$pt {
  Translations$games$kinds$mission$pt.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// pt: 'Missão do encontro'
  String get title => 'Missão do encontro';

  /// pt: 'Uma ideia de encontro para fazer juntos e uma reflexão curta depois.'
  String get intro => 'Uma ideia de encontro para fazer juntos e uma reflexão curta depois.';
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
          'acceptInvite.codeErrors.empty' => 'Digite o código do convite.',
          'acceptInvite.codeErrors.tooShort' => 'O código tem 8 caracteres.',
          'acceptInvite.codeErrors.tooLong' => 'O código tem 8 caracteres.',
          'acceptInvite.codeErrors.invalid' => 'Use só letras e números.',
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
          'account.deleteTitle' => 'Apagar conta',
          'account.deleteHighlight' => 'conta',
          'account.deleteText' =>
            'Os dados são apagados após 14 dias. Precisa de nova autenticação.',
          'account.deleteWarningTitle' => 'Isso também desfaz o vínculo',
          'account.deleteWarning' => ({
            required Object name,
          }) => 'Isso também desfaz o vínculo com ${name}.',
          'account.deleteWarningNoPartner' => 'Isso também desfaz o vínculo com seu par.',
          'account.deleteAction' => 'Apagar conta',
          'account.deleteConfirmTitle' => 'Apagar sua conta?',
          'account.deleteConfirmText' =>
            'Você terá 14 dias para mudar de ideia. Depois disso, nada pode ser recuperado.',
          'account.reauthReason' => 'Confirme para apagar sua conta.',
          'account.pendingTitle' => ({
            required Object day,
            required Object month,
          }) => 'Exclusão em ${day} de ${month}',
          'account.pendingHighlight' => ({
            required Object day,
            required Object month,
          }) => '${day} de ${month}',
          'account.pendingText' => 'Você pode cancelar antes disso.',
          'account.pendingCancel' => 'Cancelar exclusão',
          'account.signOutTitle' => 'Sair?',
          'account.signOutText' => 'Remover também os dados locais?',
          'account.signOutPending' => ({
            required Object count,
          }) => 'Você tem ${count} slips que ainda não foram enviados. Sair e remover dados apaga esses slips.',
          'account.signOut' => 'Sair',
          'account.signOutRemove' => 'Sair e remover dados',
          'account.months.0' => 'jan',
          'account.months.1' => 'fev',
          'account.months.2' => 'mar',
          'account.months.3' => 'abr',
          'account.months.4' => 'mai',
          'account.months.5' => 'jun',
          'account.months.6' => 'jul',
          'account.months.7' => 'ago',
          'account.months.8' => 'set',
          'account.months.9' => 'out',
          'account.months.10' => 'nov',
          'account.months.11' => 'dez',
          'account.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'account.errors.other' => 'Não deu para concluir agora. Tente de novo.',
          'authentication.signInTitle' => 'Entrar',
          'authentication.signInSubtitle' => 'Sem e-mail e senha. Só Apple ou Google.',
          'authentication.signInNote' => 'Entrar leva direto para o seu Hoje.',
          'authentication.existingAccountTitle' => 'Você já tem uma conta',
          'authentication.existingAccountSubtitle' => 'Entre para continuar de onde parou.',
          'authentication.continueWithApple' => 'Continuar com a Apple',
          'authentication.continueWithGoogle' => 'Continuar com o Google',
          'authentication.errors.NETWORK' => 'Sem conexão. Confira a internet e tente de novo.',
          'authentication.errors.other' => 'Não deu para entrar agora. Tente de novo.',
          'capsules.title' => 'Cápsula do tempo',
          'capsules.text' =>
            'Escreva algo para ser aberto em uma data futura. Até lá, ninguém lê, nem você.',
          'capsules.bodyHint' => 'O que você quer dizer para o futuro?',
          'capsules.bodyErrors.empty' => 'Escreva a mensagem',
          'capsules.bodyErrors.tooLong' => 'A mensagem está muito longa',
          'capsules.dateLabel' => 'Abre em',
          'capsules.dateHint' => 'Escolha uma data',
          'capsules.dateErrors.empty' => 'Escolha o dia em que ela abre',
          'capsules.dateErrors.outOfRange' =>
            'Escolha uma data entre uma semana e 50 anos à frente',
          'capsules.dateFormat' => ({
            required Object day,
            required Object month,
            required Object year,
          }) => '${day} de ${month} de ${year}',
          'capsules.months.0' => 'janeiro',
          'capsules.months.1' => 'fevereiro',
          'capsules.months.2' => 'março',
          'capsules.months.3' => 'abril',
          'capsules.months.4' => 'maio',
          'capsules.months.5' => 'junho',
          'capsules.months.6' => 'julho',
          'capsules.months.7' => 'agosto',
          'capsules.months.8' => 'setembro',
          'capsules.months.9' => 'outubro',
          'capsules.months.10' => 'novembro',
          'capsules.months.11' => 'dezembro',
          'capsules.sharedLabel' => 'Para nós dois',
          'capsules.sharedText' => 'Seu par também lê quando a data chegar. Desligado, só você lê.',
          'capsules.save' => 'Guardar cápsula',
          'capsules.saved' => 'Cápsula guardada',
          'capsules.closedUntil' => ({required Object date}) => 'Fechada até ${date}',
          'capsules.ownerSharedBy' => 'Sua, para os dois',
          'capsules.ownerPrivate' => 'Só sua',
          'capsules.fromPartner' => 'Do seu par',
          'capsules.delete' => 'Apagar',
          'capsules.deleteTitle' => 'Apagar esta cápsula?',
          'capsules.deleteText' => 'Ela some antes de qualquer pessoa ler. Não dá para desfazer.',
          'capsules.deleteConfirm' => 'Apagar',
          'capsules.emptyTitle' => 'Nenhuma cápsula ainda',
          'capsules.emptyText' => 'Escreva uma e escolha o dia em que ela abre.',
          'capsules.errorTitle' => 'Não deu para carregar',
          'capsules.errorText' => 'Suas cápsulas continuam guardadas. Tente de novo.',
          'capsules.errors.CAPSULE_OPENS_TOO_SOON' =>
            'Escolha uma data pelo menos uma semana à frente.',
          'capsules.errors.CAPSULE_OPENS_TOO_FAR' =>
            'Escolha uma data dentro dos próximos 50 anos.',
          'capsules.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'capsules.errors.other' => 'Não deu para guardar agora. Seu texto continua aqui.',
          'capsules.deleteErrors.other' => 'Não deu para apagar esta cápsula. Ela continua aqui.',
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
          'chat.title' => 'Mascote',
          'chat.consentText' => 'Uma conversa calma com a mascote, para organizar o que você sente. Ela não substitui ajuda profissional e nunca toma partido.',
          'chat.consentPrivacy' => 'O que você escreve é enviado a um modelo de IA só para gerar a resposta. Nada da conversa é guardado, a menos que você transforme uma resposta em slip.',
          'chat.consentTurnOn' => 'Ligar a conversa',
          'chat.emptyHint' => 'Diga como você está, ou comece por uma coisa pequena.',
          'chat.inputHint' => 'Escreva aqui',
          'chat.draftErrors.empty' => 'Escreva algo para enviar',
          'chat.draftErrors.tooLong' => 'Esta mensagem está muito longa',
          'chat.send' => 'Enviar',
          'chat.messagesLeft' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Resta 1 mensagem hoje',
                  other: 'Restam ${count} mensagens hoje',
                ),
          'chat.saveAsSlip' => 'Virar slip',
          'chat.slipSaved' => 'Slip guardado',
          'chat.saveLearning' => 'Salvar aprendizado',
          'chat.learningSheetTitle' => 'Salvar aprendizado',
          'chat.learningSheetTarget' => 'Sobre o que é?',
          'chat.learningTargetError' => 'Escolha sobre o que é.',
          'chat.learningSheetHint' => 'O que você quer guardar',
          'chat.learningTextErrors.empty' => 'Escreva o que quer guardar',
          'chat.learningTextErrors.tooLong' => 'Isto está muito longo',
          'chat.learningSave' => 'Guardar',
          'chat.learningSaved' => 'Aprendizado guardado',
          'chat.learnedLink' => 'O que aprendi',
          'chat.settingsTitle' => 'Configurações da conversa',
          'chat.toggleLabel' => 'Conversar com a mascote',
          'chat.toggleSubtitle' => 'Só você decide quando a conversa está ligada.',
          'chat.planPlus' => 'Plano Plus',
          'chat.planFree' => 'Plano gratuito',
          'chat.usagePlus' => ({
            required Object left,
            required Object limit,
          }) => 'Restam ${left} de ${limit} mensagens hoje',
          'chat.usageFree' => 'A conversa faz parte do Plus. O plano gratuito não tem mensagens.',
          'chat.sendingTitle' => 'O que é enviado',
          'chat.sendingText' => 'Só o texto que você escreve e os últimos turnos da conversa vão para o modelo, para gerar a resposta. Nada é guardado, a menos que você salve como slip ou aprendizado.',
          'chat.disableNote' => 'Ao desligar, o passo de consentimento volta. A próxima mensagem só é enviada depois que você ligar de novo.',
          'chat.settingsOn' => 'Conversa ligada',
          'chat.settingsOff' => 'Conversa desligada',
          'chat.offline' => 'Sem conexão. A conversa volta quando você reconectar.',
          'chat.interrupted' => 'A resposta foi interrompida.',
          'chat.retry' => 'Tentar de novo',
          'chat.limitTitle' => 'As mensagens de hoje acabaram',
          'chat.limitText' => 'Volte amanhã, ou veja o Plus para conversar mais.',
          'chat.plusTitle' => 'A conversa faz parte do Plus',
          'chat.plusText' => 'A mascote está disponível no Plus, com 20 mensagens por dia.',
          'chat.plusCta' => 'Ver planos',
          'chat.crisisTitle' => 'Você não está sozinho',
          'chat.crisisText' => 'Parece que você está passando por algo muito pesado. Se estiver em perigo agora, ligue para o serviço de emergência da sua região ou procure alguém de confiança. Eu não sou a ajuda certa para isso.',
          'chat.crisisSafeMode' => 'Esconder o app (modo seguro)',
          'chat.unavailableTitle' => 'A conversa não está disponível agora',
          'chat.unavailableText' => 'Tente de novo mais tarde.',
          'chat.errorTitle' => 'Não deu para carregar',
          'chat.errorText' => 'Tente de novo em instantes.',
          'chat.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'chat.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'chat.starterHard' => 'Um momento difícil',
          'chat.starterIdea' => 'Uma ideia',
          'chat.starterPlan' => 'Um plano de encontro',
          'chat.menuLabel' => 'Mais opções',
          'checkin.title' => 'Check-in semanal',
          'checkin.titleHighlight' => 'semanal',
          'checkin.introSubtitle' => 'Dez minutos. Cada um responde em privado primeiro.',
          'checkin.start' => 'Começar',
          'checkin.notThisWeek' => 'Não nesta semana',
          'checkin.questionOf' => ({
            required Object current,
            required Object total,
          }) => 'Pergunta ${current} de ${total}',
          'checkin.questions.0' => 'O que foi bom nesta semana?',
          'checkin.questions.1' => 'O que você quer que a gente faça junto?',
          'checkin.questions.2' => 'Teve algo que pesou esta semana?',
          'checkin.questions.3' => 'O que você quer que eu saiba?',
          'checkin.answerHint' => 'Escreva o quanto quiser.',
          'checkin.privateNote' => 'As respostas ficam ocultas até os dois terminarem.',
          'checkin.next' => 'Próximo',
          'checkin.finish' => 'Concluir',
          'checkin.skip' => 'Pular esta pergunta',
          'checkin.skipNote' => 'Pular deixa esta pergunta em branco. O check-in só aparece quando vocês dois responderem as quatro.',
          'checkin.waitingTitle' => 'Suas respostas ficaram guardadas',
          'checkin.waitingText' =>
            'As respostas aparecem quando vocês dois tiverem respondido as quatro.',
          'checkin.waitingIncomplete' => 'Ainda faltam perguntas. As respostas aparecem quando vocês dois responderem as quatro.',
          'checkin.answerMissing' => 'Responder as que faltam',
          'checkin.checkAgain' => 'Verificar de novo',
          'checkin.review' => 'Rever minhas respostas',
          'checkin.discardTitle' => 'Descartar esta resposta?',
          'checkin.discardText' => 'O texto que você escreveu não foi salvo.',
          'checkin.discard' => 'Descartar',
          'checkin.keepWriting' => 'Continuar escrevendo',
          'checkin.revealTitle' => 'Suas respostas juntas',
          'checkin.revealHighlight' => 'juntas',
          'checkin.revealSubtitle' =>
            'Agora que os dois terminaram, aparecem as duas respostas de cada pergunta.',
          'checkin.revealNote' => 'Sem notas. Só o que cada um escreveu.',
          'checkin.you' => 'Você',
          'checkin.partnerFallback' => 'Seu par',
          'checkin.skippedAnswer' => 'Pulou esta pergunta',
          'checkin.close' => 'Fechar',
          'checkin.soloTitle' => 'O check-in é para vocês dois',
          'checkin.soloText' => 'Quando sua pessoa entrar, o check-in semanal aparece aqui.',
          'checkin.loadErrorTitle' => 'Não deu para abrir o check-in',
          'checkin.loadErrorText' => 'Nada foi perdido. Tente de novo.',
          'checkin.errors.other' => 'Não deu para salvar agora. Tente de novo.',
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
          'common.discardTitle' => 'Descartar as alterações?',
          'common.discardText' => 'O que você escreveu não será salvo.',
          'common.discard' => 'Descartar',
          'common.keepWriting' => 'Continuar escrevendo',
          'connectTouch.title' => 'Toque',
          'connectTouch.text' => 'Cartas neutras, sem tempero. Fazer ou pular, sem pressão.',
          'connectTouch.switchTitle' => 'Temas de toque',
          'connectTouch.switchText' => 'Vale para vocês dois: se um desligar, some para os dois.',
          'connectTouch.offTitle' => 'Temas de toque desligados',
          'connectTouch.offText' => 'Você ou seu par desligou. Podem religar aqui quando quiserem.',
          'connectTouch.emptyTitle' => 'Nenhuma carta agora',
          'connectTouch.emptyText' => 'Volte mais tarde.',
          'connectTouch.done' => 'Pronto',
          'connectTouch.skip' => 'Pular',
          'connectTouch.errorTitle' => 'Não deu para carregar',
          'connectTouch.errorText' => 'Tente de novo em instantes.',
          'connectTouch.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'connectTouch.errors.other' => 'Não deu para mudar agora. Tente de novo.',
          'connectUs.title' => 'Nós',
          'connectUs.text' => 'Envie “sinto saudade de nós” com um toque. Leve, sem culpa. Seu par não precisa responder.',
          'connectUs.send' => 'Enviar com carinho',
          'connectUs.plan' => 'Sugerir um plano pequeno',
          'connectUs.sentNote' => 'Enviado. Sem pressa de resposta.',
          'connectUs.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'connectUs.errors.other' => 'Não deu para enviar agora. Tente de novo.',
          'dateNight.title' => 'Encontro',
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
          'dates.title' => 'Datas',
          'dates.segmentDates' => 'Datas',
          'dates.segmentGifts' => 'Presentes',
          'dates.segmentHolidays' => 'Feriados',
          'dates.titleLabel' => 'Nome',
          'dates.titleHint' => 'Ex.: aniversário dele',
          'dates.titleErrors.empty' => 'Dê um nome a esta data',
          'dates.titleErrors.tooLong' => 'O nome está muito longo',
          'dates.kinds.relationship' => 'Namoro',
          'dates.kinds.birthday' => 'Aniversário',
          'dates.kinds.first' => 'Uma primeira vez',
          'dates.kinds.trip' => 'Viagem',
          'dates.kinds.custom' => 'Outra',
          'dates.kinds.holiday' => 'Feriado',
          'dates.kinds.reunion' => 'Reencontro',
          'dates.kinds.other' => '',
          'dates.monthLabel' => 'Mês',
          'dates.dayLabel' => 'Dia',
          'dates.yearLabel' => 'Ano (opcional)',
          'dates.yearHint' => 'Ex.: 1994',
          'dates.yearHelp' => 'Sem o ano, a data só se repete, sem idade.',
          'dates.yearErrors.invalid' => 'Use um ano entre 1900 e 2200',
          'dates.months.0' => 'janeiro',
          'dates.months.1' => 'fevereiro',
          'dates.months.2' => 'março',
          'dates.months.3' => 'abril',
          'dates.months.4' => 'maio',
          'dates.months.5' => 'junho',
          'dates.months.6' => 'julho',
          'dates.months.7' => 'agosto',
          'dates.months.8' => 'setembro',
          'dates.months.9' => 'outubro',
          'dates.months.10' => 'novembro',
          'dates.months.11' => 'dezembro',
          'dates.monthsShort.0' => 'jan',
          'dates.monthsShort.1' => 'fev',
          'dates.monthsShort.2' => 'mar',
          'dates.monthsShort.3' => 'abr',
          'dates.monthsShort.4' => 'mai',
          'dates.monthsShort.5' => 'jun',
          'dates.monthsShort.6' => 'jul',
          'dates.monthsShort.7' => 'ago',
          'dates.monthsShort.8' => 'set',
          'dates.monthsShort.9' => 'out',
          'dates.monthsShort.10' => 'nov',
          'dates.monthsShort.11' => 'dez',
          'dates.dayLine' => ({
            required Object day,
            required Object month,
            required Object kind,
          }) => '${day} ${month} · ${kind}',
          'dates.dayOnly' => ({required Object day, required Object month}) => '${day} ${month}',
          'dates.saveDate' => 'Guardar data',
          'dates.delete' => 'Apagar',
          'dates.add' => 'Adicionar',
          'dates.emptyDatesTitle' => 'Nenhuma data ainda',
          'dates.emptyDatesText' => 'Guarde aniversários e datas que importam. Avisamos antes.',
          'dates.giftsPrivate' => 'Ideias de presente só você vê.',
          'dates.giftHint' => 'Ex.: livro de poemas',
          'dates.giftErrors.empty' => 'Escreva a ideia de presente',
          'dates.giftErrors.tooLong' => 'A ideia de presente está muito longa',
          'dates.given' => 'Já dei',
          'dates.emptyGiftsTitle' => 'Nenhuma ideia ainda',
          'dates.emptyGiftsText' => 'Anote presentes quando pensar neles.',
          'dates.emptyHolidaysTitle' => 'Sem feriados por aqui',
          'dates.emptyHolidaysText' => 'O calendário ainda não tem feriados para você.',
          'dates.errorTitle' => 'Não deu para carregar',
          'dates.errorText' => 'Seus dados continuam salvos. Tente de novo.',
          'dates.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'dates.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'day.dateLine' => ({
            required Object day,
            required Object month,
            required Object year,
          }) => '${day} de ${month} de ${year}',
          'day.months.0' => 'janeiro',
          'day.months.1' => 'fevereiro',
          'day.months.2' => 'março',
          'day.months.3' => 'abril',
          'day.months.4' => 'maio',
          'day.months.5' => 'junho',
          'day.months.6' => 'julho',
          'day.months.7' => 'agosto',
          'day.months.8' => 'setembro',
          'day.months.9' => 'outubro',
          'day.months.10' => 'novembro',
          'day.months.11' => 'dezembro',
          'day.previous' => 'Dia anterior',
          'day.next' => 'Próximo dia',
          'day.planned' => 'Encontro planejado',
          'day.emptyTitle' => 'Nada marcado neste dia',
          'day.emptyText' => 'Um dia livre também é bom.',
          'day.errorTitle' => 'Não deu para carregar',
          'day.errorText' => 'Tente de novo daqui a pouco.',
          'devices.title' => 'Dispositivos de notificação',
          'devices.subtitle' =>
            'Celulares que recebem notificações desta conta. Remover um para as notificações dele.',
          'devices.current' => 'Este dispositivo',
          'devices.registeredToday' => ({required Object time}) => 'Registrado hoje às ${time}',
          'devices.registeredYesterday' => ({
            required Object time,
          }) => 'Registrado ontem às ${time}',
          'devices.registeredOn' => ({required Object date}) => 'Registrado em ${date}',
          'devices.platformIos' => 'iPhone',
          'devices.platformAndroid' => 'Android',
          'devices.revokeTitle' => 'Parar notificações deste dispositivo?',
          'devices.revokeText' => ({
            required Object name,
          }) => '${name} vai deixar de receber notificações desta conta.',
          'devices.revokeConfirm' => 'Parar notificações',
          'devices.revoked' => 'Notificações paradas nesse dispositivo.',
          'devices.emptyTitle' => 'Nenhum dispositivo de notificação',
          'devices.emptyText' =>
            'Os dispositivos que recebem notificações desta conta aparecem aqui.',
          'devices.errors.NETWORK' => 'Sem conexão. Tente de novo quando voltar a internet.',
          'devices.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'devices.errors.DEVICE_REVOKE_FAILED' =>
            'Não deu para parar as notificações nesse dispositivo. Tente de novo.',
          'devices.errors.other' =>
            'Não deu para parar as notificações nesse dispositivo. Tente de novo.',
          'discreet.title' => 'Modo discreto',
          'discreet.neutralIcon' => 'Ícone neutro',
          'discreet.neutralNotifications' => 'Notificações neutras',
          'discreet.hideWidgetText' => 'Ocultar texto do widget',
          'discreet.note' =>
            'Oculta nomes e conteúdo em notificações e widgets. Sem imagem do casal no ícone.',
          'discreet.saveError' => 'Não deu para salvar agora. Tente de novo.',
          'distance.title' => 'Distância',
          'distance.text' => 'Dois relógios, cada um no seu fuso, sem confusão.',
          'distance.you' => 'Você',
          'distance.partner' => 'Seu par',
          'distance.noPartner' => 'Quando seu par entrar, o relógio dele ou dela aparece aqui.',
          'distance.sameZone' => 'Vocês estão no mesmo fuso por enquanto.',
          'distance.reunionDays' => ({required Object n}) => '${n} dias até vocês se verem',
          'distance.reunionToday' => 'Vocês se veem hoje',
          'distance.reunionTomorrow' => 'Vocês se veem amanhã',
          'distance.noReunionTitle' => 'Sem data de reencontro',
          'distance.noReunionText' => 'Salve um “Reencontro” nas datas e a contagem aparece aqui.',
          'distance.addReunion' => 'Salvar uma data',
          'distance.errorTitle' => 'Não deu para carregar',
          'distance.errorText' => 'Tente de novo em instantes.',
          'fightStyle.exerciseTitle' => 'Como eu reajo numa briga',
          'fightStyle.exerciseHighlight' => 'reajo',
          'fightStyle.exerciseSubtitle' => 'Seis perguntas rápidas, só para você.',
          'fightStyle.questionOf' => ({
            required Object current,
            required Object total,
          }) => 'Pergunta ${current} de ${total}',
          'fightStyle.questions.0' => 'Quando a conversa esquenta, o que você faz primeiro?',
          'fightStyle.questions.1' => 'Se o seu par se cala no meio da briga, você...',
          'fightStyle.questions.2' => 'Depois de uma discussão, o que costuma acontecer?',
          'fightStyle.questions.3' => 'O que mais te incomoda numa briga?',
          'fightStyle.questions.4' => 'Quando percebe que exagerou, você...',
          'fightStyle.questions.5' => 'O que te ajuda a voltar ao normal?',
          'fightStyle.options1.pursue' => 'Continuo falando até resolver.',
          'fightStyle.options1.withdraw' => 'Preciso de um tempo antes de continuar.',
          'fightStyle.options1.repair' => 'Tento aliviar o clima com algo mais leve.',
          'fightStyle.options1.avoid' => 'Mudo de assunto para não piorar.',
          'fightStyle.options1.other' => '',
          'fightStyle.options2.pursue' => 'Insisto para ele falar.',
          'fightStyle.options2.withdraw' => 'Também me calo.',
          'fightStyle.options2.repair' => 'Pergunto com calma o que aconteceu.',
          'fightStyle.options2.avoid' => 'Deixo para depois.',
          'fightStyle.options2.other' => '',
          'fightStyle.options3.pursue' => 'Eu procuro a conversa logo.',
          'fightStyle.options3.withdraw' => 'Eu fico um tempo comigo.',
          'fightStyle.options3.repair' => 'Eu penso no que posso consertar.',
          'fightStyle.options3.avoid' => 'Eu prefiro não voltar ao assunto.',
          'fightStyle.options3.other' => '',
          'fightStyle.options4.pursue' => 'Ficar sem resposta.',
          'fightStyle.options4.withdraw' => 'Sentir pressão.',
          'fightStyle.options4.repair' => 'Ver que a gente não se entende.',
          'fightStyle.options4.avoid' => 'A conversa se arrastar.',
          'fightStyle.options4.other' => '',
          'fightStyle.options5.pursue' => 'Falo mais ainda para explicar.',
          'fightStyle.options5.withdraw' => 'Me fecho até me acalmar.',
          'fightStyle.options5.repair' => 'Peço desculpas ou proponho um jeito de resolver.',
          'fightStyle.options5.avoid' => 'Espero o assunto esfriar.',
          'fightStyle.options5.other' => '',
          'fightStyle.options6.pursue' => 'Terminar a conversa.',
          'fightStyle.options6.withdraw' => 'Um tempo quieto.',
          'fightStyle.options6.repair' => 'Um gesto pequeno de carinho.',
          'fightStyle.options6.avoid' => 'Seguir o dia como se nada tivesse acontecido.',
          'fightStyle.options6.other' => '',
          'fightStyle.continueAction' => 'Continuar',
          'fightStyle.finishAction' => 'Ver resultado',
          'fightStyle.back' => 'Voltar',
          'fightStyle.privateNote' => 'Só você vê as respostas. Nada é enviado ao seu par.',
          'fightStyle.resultTitle' => 'Como você costuma reagir',
          'fightStyle.resultHighlight' => 'reagir',
          'fightStyle.patternTag' => 'Seu padrão',
          'fightStyle.descriptions.pursue' =>
            'Você tende a buscar a conversa logo, mesmo quando o assunto ainda está quente.',
          'fightStyle.descriptions.withdraw' => 'Você tende a se afastar primeiro e voltar depois.',
          'fightStyle.descriptions.repair' =>
            'Você tende a procurar um jeito de consertar pouco depois da briga.',
          'fightStyle.descriptions.avoid' =>
            'Você tende a deixar o assunto de lado para não piorar na hora.',
          'fightStyle.descriptions.other' => '',
          'fightStyle.practices.pursue' =>
            'Isso ajuda a resolver rápido. Vale pausar antes de piorar e ouvir até o fim.',
          'fightStyle.practices.withdraw' =>
            'Isso ajuda a pausar antes de piorar. Escolha um jeito combinado de voltar.',
          'fightStyle.practices.repair' =>
            'Isso ajuda a retomar depois da briga. Um pedido de desculpas curto costuma bastar.',
          'fightStyle.practices.avoid' =>
            'Isso ajuda a pausar antes de piorar. Marque um momento curto para retomar.',
          'fightStyle.practices.other' => '',
          _ => null,
        } ??
        switch (path) {
          'fightStyle.partnerSignal' => ({
            required Object name,
          }) => 'Combine com ${name} um sinal de volta.',
          'fightStyle.addToTools' => 'Adicionar às minhas ferramentas de reparo',
          'fightStyle.addedToTools' => 'Já está nas suas ferramentas',
          'fightStyle.keepMine' => 'Guardar só para mim',
          'fightStyle.retake' => 'Refazer o exercício',
          'fightStyle.addedToast' => 'Adicionado às suas ferramentas de reparo.',
          'fightStyle.loadErrorTitle' => 'Não deu para carregar',
          'fightStyle.loadErrorText' => 'Não deu para abrir seu resultado agora. Tente de novo.',
          'fightStyle.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'fightStyle.errors.other' => 'Não deu para salvar agora. Suas respostas continuam aqui.',
          'fightStyle.addErrors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'fightStyle.addErrors.other' => 'Não deu para adicionar agora. Tente de novo.',
          'firstSlip.title' => 'Comece com uma coisa boa',
          'firstSlip.titleHighlight' => 'uma coisa boa',
          'firstSlip.subtitle' => 'O que seu parceiro fez ultimamente que te fez sorrir? 30 segundos bastam. Ainda sem conta.',
          'firstSlip.hint' => 'Ex.: fez café antes de eu acordar',
          'firstSlip.textErrors.empty' => 'Escreva uma coisa boa primeiro.',
          'firstSlip.textErrors.tooLong' => 'Use no máximo 140 caracteres.',
          'firstSlip.localNote' => 'Fica salvo só neste celular.',
          'firstSlip.save' => 'Salvar',
          'firstSlip.saveError' => 'Não deu para guardar agora. Tente de novo.',
          'games.hub.title' => 'Jogar',
          'games.hub.subtitle' => 'Jogos curtos para vocês dois. Sem placar e sem vencedor.',
          'games.hub.guessLabel' => 'Palpites',
          'games.hub.talkLabel' => 'Conversa',
          'games.hub.challengeLabel' => 'Desafio',
          'games.hub.minutes' => ({required Object minutes}) => '${minutes} min',
          'games.hub.invitedTitle' => ({required Object name}) => '${name} chamou você',
          'games.hub.invitedFallbackTitle' => 'Seu par chamou você',
          'games.hub.join' => 'Entrar',
          'games.hub.stateWaiting' => ({required Object name}) => 'Aguardando ${name}',
          'games.hub.stateWaitingFallback' => 'Aguardando seu par',
          'games.hub.stateInvited' => 'Chamou você',
          'games.hub.stateActive' => 'Em andamento',
          'games.hub.stateFinished' => 'Terminado',
          'games.hub.stateCancelled' => 'Convite cancelado',
          'games.hub.stateExpired' => 'Convite expirado',
          'games.hub.lockChip' => 'Precisa dos dois',
          'games.hub.noPartnerNote' =>
            'Os jogos precisam dos dois. Quando seu par entrar, vocês podem jogar.',
          'games.hub.refreshNote' => 'Para ver se algo mudou, volte ao app ou puxe para atualizar.',
          'games.hub.loadErrorTitle' => 'Não deu para abrir os jogos',
          'games.hub.loadErrorText' => 'Nada foi perdido. Tente de novo.',
          'games.hub.questionCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 pergunta',
                  other: '${count} perguntas',
                ),
          'games.hub.guessCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 palpite',
                  other: '${count} palpites',
                ),
          'games.kinds.meOrYou.title' => 'Eu ou ele',
          'games.kinds.meOrYou.intro' => 'Respondam em separado quem combina mais com cada frase. Depois vejam onde vocês pensaram igual.',
          'games.kinds.howWell.title' => 'Quanto você me conhece',
          'games.kinds.howWell.intro' => 'Cada um responde sobre si e tenta adivinhar a resposta do outro. Depois vem a conversa.',
          'games.kinds.twentyQuestions.title' => '20 perguntas',
          'games.kinds.twentyQuestions.intro' =>
            'Perguntas leves para responder em privado e revelar juntos.',
          'games.kinds.neverHaveWe.title' => 'Eu nunca, nós dois',
          'games.kinds.neverHaveWe.intro' => 'Coisas que vocês nunca fizeram juntos. Cada um responde em privado e vocês veem os dois lados no fim.',
          'games.kinds.mission.title' => 'Missão do encontro',
          'games.kinds.mission.intro' =>
            'Uma ideia de encontro para fazer juntos e uma reflexão curta depois.',
          'games.start.noWinnerNote' => 'Sem vencedor, sem pontos.',
          'games.start.cta' => ({required Object name}) => 'Chamar ${name}',
          'games.start.ctaFallback' => 'Chamar seu par',
          'games.start.cancelledNote' =>
            'O último convite foi cancelado. Vocês podem começar de novo quando quiserem.',
          'games.start.expiredNote' => 'O convite anterior expirou. Chame de novo quando quiserem.',
          'games.start.noContentTitle' => 'Este jogo ainda não tem perguntas',
          'games.start.noContentText' => 'Ainda não há conteúdo para jogar. Volte em breve.',
          'games.invitation.title' => ({required Object name}) => '${name} chamou você',
          'games.invitation.titleFallback' => 'Seu par chamou você',
          'games.invitation.join' => 'Jogar agora',
          'games.invitation.later' => 'Depois',
          'games.waiting.text' => ({
            required Object name,
          }) => 'Convite enviado para ${name}. Começa quando entrar.',
          'games.waiting.textFallback' => 'Convite enviado. Começa quando seu par entrar.',
          'games.waiting.status' => 'Aguardando…',
          'games.waiting.window' => 'O convite espera por até 48 horas.',
          'games.waiting.checkAgain' => 'Ver se já entrou',
          'games.waiting.cancel' => 'Cancelar o convite',
          'games.active.title' => 'O jogo começou',
          'games.active.text' => 'Os dois estão dentro. As telas deste jogo aparecem aqui.',
          'games.active.cancel' => 'Encerrar o jogo',
          'games.playing.progress' => ({
            required Object current,
            required Object total,
          }) => 'Pergunta ${current} de ${total}',
          'games.playing.you' => 'Você',
          'games.playing.partnerFallback' => 'Seu par',
          'games.playing.submit' => 'Enviar resposta',
          'games.playing.skip' => 'Pular esta',
          'games.playing.guessAboutYou' => 'Sobre você',
          'games.playing.guessAboutPartner' => ({required Object name}) => 'Sobre ${name}',
          'games.playing.guessAboutPartnerFallback' => 'Sobre seu par',
          'games.playing.guessPrompt' => ({required Object name}) => 'O que ${name} respondeu?',
          'games.playing.guessPromptFallback' => 'O que seu par respondeu?',
          'games.playing.guessYourGuess' => 'Seu palpite',
          'games.playing.answerHint' => 'Responda do seu jeito.',
          'games.playing.guessHint' => 'Tente adivinhar a resposta.',
          'games.playing.talkHint' => 'Escreva sua resposta. Só você lê até os dois terminarem.',
          'games.playing.talkNote' => 'Seu par só vê depois que os dois responderem.',
          'games.date.start' => 'Começar o encontro',
          'games.date.startNote' => 'Façam a missão juntos e voltem para contar como foi.',
          'games.date.reflectionTitle' => 'Como foi?',
          'games.date.reflectionText' =>
            'Escolha o que aconteceu. Seu par só vê depois que os dois responderem.',
          'games.reflections.great' => 'Foi ótimo',
          'games.reflections.ok' => 'Foi bom',
          'games.reflections.did_not_happen' => 'Não aconteceu',
          'games.reflections.other' => 'Sem resposta',
          'games.waitingPartner.title' => 'Você respondeu tudo',
          'games.waitingPartner.text' => ({
            required Object name,
          }) => 'Agora é só esperar ${name}. Nada do que você escreveu aparece antes dos dois terminarem.',
          'games.waitingPartner.textFallback' => 'Agora é só esperar seu par. Nada do que você escreveu aparece antes dos dois terminarem.',
          'games.waitingPartner.answersTitle' => 'O que você salvou',
          'games.waitingPartner.checkAgain' => 'Ver de novo',
          'games.waitingPartner.cancel' => 'Encerrar o jogo',
          'games.finished.title' => 'Que conversa boa',
          'games.finished.text' => 'Sem placar, sem vencedor. Só vocês dois.',
          'games.finished.you' => 'Você',
          'games.finished.yourGuess' => 'Seu palpite',
          'games.finished.partnerGuess' => 'O palpite do seu par',
          'games.finished.matched' => 'Acertou',
          'games.finished.noAnswer' => 'Sem resposta',
          'games.finished.both' => 'Os dois',
          'games.finished.agreed' => 'Vocês combinaram',
          'games.finished.back' => 'Voltar',
          'games.notFound.title' => 'Este jogo não existe',
          'games.notFound.text' =>
            'Ele pode ter mudado ou nunca ter existido. Volte e escolha outro.',
          'games.notFound.action' => 'Voltar',
          'games.cancel.title' => 'Encerrar o jogo?',
          'games.cancel.text' => 'O jogo termina para os dois. Vocês podem começar outro depois.',
          'games.cancel.confirm' => 'Encerrar',
          'games.cancel.keep' => 'Continuar',
          'games.noPartner.title' => 'Os jogos são para os dois',
          'games.noPartner.text' => 'Quando seu par entrar, vocês podem jogar juntos.',
          'games.common.close' => 'Fechar',
          'games.loadErrorTitle' => 'Não deu para abrir o jogo',
          'games.loadErrorText' => 'Nada foi perdido. Tente de novo.',
          'games.errors.NOT_PAIRED' => 'Os jogos precisam dos dois conectados.',
          'games.errors.NOT_FOUND' => 'Esse jogo não existe mais. Vamos atualizar.',
          'games.errors.INVALID_GAME_ACTION' => 'Esse jogo mudou. Vamos atualizar.',
          'games.errors.GAME_ALREADY_OPEN' =>
            'Já existe um jogo aberto. Termine ou cancele antes de chamar de novo.',
          'games.errors.GAME_NOT_COMPLETE' =>
            'Seu par ainda está respondendo. Tente de novo quando terminarem.',
          'games.errors.INVALID_GAME_INDEX' => 'Essa pergunta mudou. Vamos atualizar.',
          'games.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'gifts.title' => 'Página de presentes',
          'gifts.subtitle' => 'Uma página que seu par vê no app. Você escolhe o que compartilhar.',
          'gifts.myTitle' => 'Meus desejos',
          'gifts.partnerTitle' => 'Do seu par',
          'gifts.emptyPageTitle' => 'Nenhum desejo ainda',
          'gifts.emptyPageTextShared' => 'Adicione um desejo ou espere seu par compartilhar um.',
          'gifts.emptyPageTextSolo' =>
            'Adicione o que você gostaria de ganhar. Fica privado até vocês se conectarem.',
          'gifts.emptyMineTitle' => 'Nenhum desejo ainda',
          'gifts.emptyMineText' => 'Adicione o que você gostaria de ganhar.',
          'gifts.emptyPartnerTitle' => 'Nada compartilhado ainda',
          'gifts.emptyPartnerText' => 'Quando seu par compartilhar um desejo, ele aparece aqui.',
          'gifts.addTitle' => 'Novo desejo',
          'gifts.editTitle' => 'Editar desejo',
          'gifts.titleLabel' => 'Presente',
          'gifts.titleHint' => 'Ex.: livro de poemas',
          'gifts.titleErrors.empty' => 'Dê um nome ao presente.',
          'gifts.titleErrors.tooLong' => 'Use no máximo 120 caracteres.',
          'gifts.noteHint' => 'Tamanho, cor, onde encontrar.',
          'gifts.noteErrors.tooLong' => 'Use no máximo 1000 caracteres na nota.',
          'gifts.budgetLabel' => 'Orçamento (opcional)',
          'gifts.budgets.free' => 'Grátis',
          'gifts.budgets.low' => 'Baixo',
          'gifts.budgets.medium' => 'Médio',
          'gifts.budgets.high' => 'Alto',
          'gifts.budgets.other' => '',
          'gifts.noBudget' => 'Sem orçamento',
          'gifts.shared' => 'Compartilhado',
          'gifts.private' => 'Privado',
          'gifts.sharedHint' => 'Seu par pode ver este desejo.',
          'gifts.privateHint' => 'Só você vê este desejo.',
          'gifts.sharedNeedsPartner' => 'Conecte-se com seu par para compartilhar um desejo.',
          'gifts.save' => 'Salvar',
          'gifts.add' => 'Adicionar',
          'gifts.delete' => 'Excluir',
          'gifts.deleteTitle' => 'Excluir este desejo?',
          'gifts.deleteText' => 'Ele desaparece para você e seu par.',
          'gifts.deleteConfirm' => 'Excluir',
          'gifts.entryLabel' => 'PRESENTES',
          'gifts.entryTitle' => 'Página de presentes',
          'gifts.entryText' => 'Desejos que você escolhe compartilhar, ou guardar só para você.',
          'gifts.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um momento.',
          'gifts.errors.other' => 'Não foi possível agora. Tente de novo.',
          'globalErrors.offline' =>
            'Sem conexão. Suas anotações ficam salvas e sincronizam depois.',
          'globalErrors.errorTitle' => 'Não deu certo',
          'globalErrors.errorText' => 'Tente de novo em instantes.',
          'globalErrors.networkTitle' => 'Sem conexão',
          'globalErrors.networkText' => 'Verifique a conexão e tente de novo.',
          'globalErrors.timeoutTitle' => 'A conexão demorou',
          'globalErrors.timeoutText' => 'Tente de novo em instantes.',
          'globalErrors.rateTitle' => 'Calma aí',
          'globalErrors.rateText' => 'Muitas tentativas seguidas. Espere um pouco e tente de novo.',
          'globalErrors.notFoundTitle' => 'Não encontramos',
          'globalErrors.notFoundText' => 'Talvez isso não esteja mais disponível.',
          'globalErrors.retry' => 'Tentar de novo',
          'globalErrors.retryIn' => ({required Object seconds}) => 'Tentar em ${seconds}s',
          'globalErrors.updateTitle' => 'Atualize o app',
          'globalErrors.updateHighlight' => 'app',
          'globalErrors.updateText' => 'Há uma versão nova. Atualize para continuar.',
          'globalErrors.updateAction' => 'Atualizar',
          'globalErrors.updateUnavailable' => 'Não foi possível abrir a loja. Atualize por lá.',
          'griefSupport.title' => 'Estamos com você',
          'griefSupport.highlight' => 'você',
          'griefSupport.text' => 'Suas lembranças continuam aqui, no seu ritmo.',
          'griefSupport.seeSupport' => 'Ver apoio',
          'griefSupport.backHome' => 'Voltar ao início',
          'guides.hub.title' => 'Conversas difíceis',
          'guides.hub.titleHighlight' => 'difíceis',
          'guides.hub.subtitle' => 'Um passo de cada vez, só para você.',
          'guides.hub.privateNote' =>
            'Suas anotações ficam só com você. Nada é enviado ao seu par.',
          'guides.hub.stepCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 passo',
                  other: '${count} passos',
                ),
          'guides.hub.loadErrorTitle' => 'Não deu para abrir os temas',
          'guides.hub.loadErrorText' => 'Nada foi perdido. Tente de novo.',
          'guides.viewer.stepOf' => ({
            required Object current,
            required Object total,
          }) => 'Passo ${current} de ${total}',
          'guides.viewer.answerHint' => 'Escreva o que fizer sentido. Pode ficar em branco.',
          'guides.viewer.stepNote' => 'Guardado aos poucos. Só você vê.',
          'guides.viewer.next' => 'Próximo',
          'guides.viewer.finish' => 'Concluir',
          'guides.viewer.back' => 'Voltar',
          'guides.viewer.loadErrorTitle' => 'Não deu para abrir esta conversa',
          'guides.viewer.loadErrorText' => 'Nada foi perdido. Tente de novo.',
          'guides.viewer.errors.other' =>
            'Não deu para salvar agora. Suas respostas continuam aqui.',
          'guides.gate.title' => 'Um tema sensível',
          'guides.gate.text' => 'Este tema fala sobre intimidade e foi pensado para pessoas adultas. Você pode ir com calma ou escolher outro tema quando quiser.',
          'guides.gate.cycleText' => 'Este tema fala sobre o corpo e o humor ao longo do mês e foi pensado para pessoas adultas. Você pode ir com calma ou escolher outro tema quando quiser.',
          'guides.gate.continueAction' => 'Continuar',
          'guides.gate.otherAction' => 'Ver outros temas',
          'guides.finish.title' => 'Sua conversa está preparada',
          'guides.finish.titleHighlight' => 'preparada',
          'guides.finish.text' => 'Suas anotações ficam guardadas na sua conta, só para você.',
          'guides.finish.finishSaved' => 'Salvo só para você.',
          'guides.finish.start' => 'Começar uma conversa',
          'guides.finish.other' => 'Voltar aos temas',
          'hardConversation.title' => 'Preparar uma conversa difícil',
          'hardConversation.stepOf' => ({
            required Object current,
            required Object total,
          }) => 'Passo ${current} de ${total}',
          'hardConversation.whatTitle' => 'O que aconteceu?',
          'hardConversation.whatHint' => 'Se quiser, conte do seu jeito',
          'hardConversation.whatIgnored' => 'Ela se sentiu ignorada',
          'hardConversation.whatMoney' => 'Brigamos por dinheiro',
          'hardConversation.whatMisunderstanding' => 'Foi um mal-entendido',
          'hardConversation.whatOther' => 'Outro: escrever',
          'hardConversation.needTitle' => 'Do que eu preciso?',
          'hardConversation.needHint' => 'Se quiser, acrescente algo',
          'hardConversation.needHeard' => 'Ser ouvido',
          'hardConversation.needApology' => 'Pedir desculpa',
          'hardConversation.needAgree' => 'Combinar algo',
          'hardConversation.sayTitle' => 'Como dizer',
          'hardConversation.sayIntro' => 'Um ponto de partida para você editar antes de enviar.',
          'hardConversation.sayHint' => 'Sua frase de abertura',
          'hardConversation.messageErrors.empty' => 'Escreva a frase primeiro',
          'hardConversation.messageErrors.tooLong' => 'Esta frase está muito longa',
          'hardConversation.generating' => 'Escrevendo uma abertura gentil…',
          'hardConversation.gentler' => 'Mais gentil',
          'hardConversation.moreDirect' => 'Mais direto',
          'hardConversation.copy' => 'Copiar',
          'hardConversation.copied' => 'Copiado',
          'hardConversation.sendAsNote' => 'Enviar como recado',
          'hardConversation.sent' => 'Recado enviado',
          'hardConversation.exit' => 'Sair',
          'hardConversation.next' => 'Próximo',
          'hardConversation.back' => 'Voltar',
          'hardConversation.needPause' => 'Preciso de pausa',
          'hardConversation.retry' => 'Tentar de novo',
          'hardConversation.generationFailed' => 'Não deu para escrever uma frase agora.',
          'hardConversation.privateNote' =>
            'A mascote só vê o que você escreve aqui. Os dados do seu par nunca são enviados.',
          'hardConversation.offline' => 'Sem conexão. A frase de abertura precisa de internet.',
          'hardConversation.emptyTitle' => 'Não deu para carregar',
          'hardConversation.emptyText' => 'Tente de novo em instantes.',
          'hardConversation.errors.CHAT_LIMIT' => 'As mensagens de hoje acabaram.',
          'hardConversation.errors.CHAT_DISABLED' =>
            'A conversa está desligada. Ligue para usar a mascote.',
          'hardConversation.errors.CHAT_UNAVAILABLE' => 'A conversa não está disponível agora.',
          'hardConversation.errors.UPSTREAM' =>
            'Não deu para escrever uma frase agora. Tente de novo.',
          'hardConversation.errors.NOT_PAIRED' =>
            'Para enviar, você precisa estar conectado com seu par no app.',
          'hardConversation.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'heavyDay.title' => 'Aviso de dias pesados',
          'heavyDay.gateTitle' => 'Aviso de dias pesados',
          'heavyDay.gateText' => 'Às vezes um dia pesa. Você pode avisar seu par com uma frase curta, sem detalhes. Seu par não vê seus programas nem o que você escreve.',
          'heavyDay.activate' => 'Ligar',
          'heavyDay.notNow' => 'Agora não',
          'heavyDay.noticeBody' => 'Um dia delicado. Um pouco mais de carinho ajuda.',
          'heavyDay.previewPartner' => ({
            required Object name,
          }) => '${name} veria: “Um dia delicado. Um pouco mais de carinho ajuda.”',
          'heavyDay.previewGeneric' =>
            'Seu par veria: “Um dia delicado. Um pouco mais de carinho ajuda.”',
          'heavyDay.frequencyAsk' => 'A cada vez',
          'heavyDay.frequencyAlways' => 'Sempre',
          'heavyDay.share' => 'Compartilhar',
          'heavyDay.cancel' => 'Não compartilhar',
          'heavyDay.confirmationTitle' => ({required Object name}) => 'Aviso enviado para ${name}',
          'heavyDay.confirmationGeneric' => 'Aviso enviado',
          'heavyDay.confirmationHint' => 'Seu par vê no widget de recados, se estiver ativado.',
          'heavyDay.errorTitle' => 'Não deu para carregar',
          'heavyDay.errorText' => 'Não deu para fazer isso agora. Tente de novo.',
          'help.badDayTitle' => 'Um dia difícil',
          'help.badDayText' => 'Três coisas pequenas que podem ajudar agora. Nada obrigatório.',
          'help.starterTitle' => 'Começar uma conversa',
          'help.starterText' => 'Uma pergunta para abrir, sem pressa.',
          'help.another' => 'Outra',
          'help.emptyTitle' => 'Nada por aqui ainda',
          'help.emptyText' => 'Estamos preparando mais sugestões.',
          'help.errorTitle' => 'Não deu para carregar',
          'help.errorText' => 'Tente de novo daqui a pouco.',
          'helpSupport.title' => 'Ajuda',
          'helpSupport.contactTitle' => 'Falar com o suporte',
          'helpSupport.reportBug' => 'Relatar um erro',
          'helpSupport.faqTitle' => 'Perguntas frequentes',
          'helpSupport.faqQuestions.replyTime' => 'Quando vou receber uma resposta?',
          'helpSupport.faqQuestions.offline' => 'E se eu enviar sem internet?',
          'helpSupport.faqQuestions.privacy' => 'Quem lê o que eu envio?',
          'helpSupport.faqQuestions.reportBug' => 'Como relato um erro?',
          'helpSupport.faqAnswers.replyTime' => 'Respondemos em até 2 dias úteis.',
          'helpSupport.faqAnswers.offline' =>
            'A mensagem fica salva e sai quando você estiver online de novo.',
          'helpSupport.faqAnswers.privacy' =>
            'Só a equipe de suporte. Nada é compartilhado com seu parceiro.',
          'helpSupport.faqAnswers.reportBug' =>
            'Escolha Erro no formulário e conte o que aconteceu.',
          'helpSupport.pendingNote' =>
            'Uma mensagem está salva e será enviada quando você estiver online.',
          'helpSupport.discardedNote' => 'Uma mensagem salva não pôde ser enviada e foi removida. Escreva de novo se ainda importar.',
          'helpSupport.supportTitle' => 'Suporte',
          'helpSupport.supportHeading' => 'Como podemos ajudar?',
          'helpSupport.supportHighlight' => 'ajudar',
          'helpSupport.topics.account' => 'Conta',
          'helpSupport.topics.billing' => 'Cobrança',
          'helpSupport.topics.bug' => 'Erro',
          'helpSupport.topics.other' => 'Outro',
          'helpSupport.messageLabel' => 'Mensagem',
          'helpSupport.messageHint' =>
            'Conte o que aconteceu, com o máximo de detalhes que quiser.',
          'helpSupport.messageErrors.empty' => 'Escreva sua mensagem primeiro',
          'helpSupport.messageErrors.tooLong' => 'A mensagem está muito longa',
          'helpSupport.replyEmailLabel' => 'E-mail para resposta',
          'helpSupport.replyEmailHint' => 'voce@email.com',
          'helpSupport.replyEmailErrors.invalid' => 'Confira o e-mail.',
          'helpSupport.replyEmailErrors.tooLong' => 'Este e-mail é muito longo',
          'helpSupport.replyTime' => 'Respondemos em até 2 dias úteis.',
          'helpSupport.send' => 'Enviar',
          'helpSupport.sentTitle' => 'Mensagem enviada',
          'helpSupport.sentText' => 'Obrigado. Respondemos em até 2 dias úteis.',
          'helpSupport.queuedTitle' => 'Mensagem salva',
          'helpSupport.queuedText' =>
            'Vamos enviar quando você estiver online. Ainda não foi entregue.',
          'helpSupport.done' => 'Pronto',
          'helpSupport.errors.RATE_LIMITED' =>
            'Você enviou várias mensagens hoje. Tente de novo amanhã.',
          'helpSupport.errors.noData' => 'Não deu para enviar agora. Sua mensagem continua aqui.',
          'helpSupport.errors.other' => 'Não deu para enviar agora. Sua mensagem continua aqui.',
          'helpSupport.discardTitle' => 'Descartar esta mensagem?',
          'helpSupport.discardText' => 'O que você escreveu não será salvo.',
          'history.title' => 'Nossa história',
          'history.addMilestoneTooltip' => 'Adicionar marco',
          'history.togetherSinceLine' => ({required Object date}) => 'juntos desde ${date}',
          'history.setStartDate' => 'Definir início da história',
          'history.beginningHeadline' => 'Começando',
          'history.reunionCountdown' =>
            ({required num days}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  days,
                  one: 'Falta ${days} dia',
                  other: 'Faltam ${days} dias',
                ),
          'history.durationFull' => ({
            required Object years,
            required Object yearsUnit,
            required Object months,
            required Object monthsUnit,
            required Object days,
            required Object daysUnit,
          }) => '${years} ${yearsUnit}, ${months} ${monthsUnit}\ne ${days} ${daysUnit}',
          'history.durationFullInline' => ({
            required Object years,
            required Object yearsUnit,
            required Object months,
            required Object monthsUnit,
            required Object days,
            required Object daysUnit,
          }) => '${years} ${yearsUnit}, ${months} ${monthsUnit} e ${days} ${daysUnit}',
          'history.durationMonthsDays' => ({
            required Object months,
            required Object monthsUnit,
            required Object days,
            required Object daysUnit,
          }) => '${months} ${monthsUnit} e ${days} ${daysUnit}',
          'history.durationDaysOnly' => ({
            required Object days,
            required Object daysUnit,
          }) => '${days} ${daysUnit}',
          'history.yearOne' => 'ano',
          'history.yearMany' => 'anos',
          'history.monthOne' => 'mês',
          'history.monthMany' => 'meses',
          'history.dayOne' => 'dia',
          'history.dayMany' => 'dias',
          'history.statDays' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'dia',
                  other: 'dias',
                ),
          'history.statWeekends' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'fim de semana',
                  other: 'fins de semana',
                ),
          'history.statChristmases' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Natal',
                  other: 'Natais',
                ),
          'history.statPlaces' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'lugar',
                  other: 'lugares',
                ),
          'history.storyDatesAction' => 'Datas da história',
          'history.numbersAction' => 'Em números',
          'history.variationsAction' => 'Como o contador aparece',
          'history.avatarAction' => 'Seu avatar',
          'history.differentDatesBanner' => 'Vocês escolheram datas diferentes para o início',
          'history.differentDatesAction' => 'Ver datas',
          'history.timelineSection' => 'MARCOS E MEMÓRIAS',
          'history.recentChip' => 'Recentes',
          'history.unknownYearChip' => 'Sem data',
          'history.timelineRecentNote' => 'Mostrando os marcos mais recentes.',
          'history.loadEarlierYear' => ({required Object year}) => 'Ver ${year}',
          'history.unknownDateLabel' => 'Data desconhecida',
          'history.addMilestoneRow' => 'Adicionar um marco',
          'history.emptyTitle' => 'Comece pelo primeiro marco',
          'history.emptyText' => 'Registre quando vocês se conheceram ou um momento especial.',
          'history.suggestedFirstTitle' => 'Nos conhecemos',
          'history.suggestedFirstSub' => 'Sugestão de primeiro marco · toque para adicionar',
          'history.monthsShort.0' => 'jan',
          'history.monthsShort.1' => 'fev',
          'history.monthsShort.2' => 'mar',
          'history.monthsShort.3' => 'abr',
          'history.monthsShort.4' => 'mai',
          'history.monthsShort.5' => 'jun',
          'history.monthsShort.6' => 'jul',
          'history.monthsShort.7' => 'ago',
          'history.monthsShort.8' => 'set',
          'history.monthsShort.9' => 'out',
          'history.monthsShort.10' => 'nov',
          'history.monthsShort.11' => 'dez',
          'history.monthsLong.0' => 'janeiro',
          'history.monthsLong.1' => 'fevereiro',
          'history.monthsLong.2' => 'março',
          'history.monthsLong.3' => 'abril',
          'history.monthsLong.4' => 'maio',
          'history.monthsLong.5' => 'junho',
          'history.monthsLong.6' => 'julho',
          'history.monthsLong.7' => 'agosto',
          'history.monthsLong.8' => 'setembro',
          'history.monthsLong.9' => 'outubro',
          'history.monthsLong.10' => 'novembro',
          'history.monthsLong.11' => 'dezembro',
          'history.fullDate' => ({
            required Object day,
            required Object month,
            required Object year,
          }) => '${day} de ${month} de ${year}',
          'history.shortDayMonthYear' => ({
            required Object day,
            required Object month,
            required Object year,
          }) => '${day} ${month} ${year}',
          'history.shortMonthYear' => ({
            required Object month,
            required Object year,
          }) => '${month} ${year}',
          'history.shortDayMonth' => ({
            required Object day,
            required Object month,
          }) => '${day} ${month}',
          'history.milestoneNewTitle' => 'Novo marco',
          'history.milestoneDetailTitle' => 'Detalhe do marco',
          'history.milestoneDefaultHighlight' => 'juntos',
          'history.milestoneTitleLabel' => 'O que aconteceu',
          'history.milestoneTitleHint' => 'Ex.: Primeira viagem juntos',
          'history.milestoneTitleErrors.empty' => 'Conte o que aconteceu',
          'history.milestoneTitleErrors.tooLong' => 'O título está muito longo',
          'history.milestonePlaceLabel' => 'Lugar (opcional)',
          'history.milestonePlaceHint' => 'Ex.: Paraty',
          'history.milestonePlaceErrors.tooLong' => 'O lugar está muito longo',
          'history.milestoneBodyHint' => 'Uma nota sobre esse momento (opcional)',
          'history.milestoneBodyErrors.tooLong' => 'A nota está muito longa',
          'history.milestoneKindLabel' => 'Tipo de marco',
          'history.kindFirst' => 'Primeira vez',
          'history.kindTrip' => 'Viagem',
          'history.kindHome' => 'Moramos juntos',
          'history.kindCustom' => 'Marco',
          'history.unknownDateToggle' => 'Data desconhecida',
          'history.precisionDay' => 'Dia exato',
          'history.precisionMonth' => 'Mês e ano',
          'history.precisionYear' => 'Só o ano',
          'history.dateRowLabel' => 'Data',
          'history.addedByRowLabel' => 'Adicionado por',
          'history.addedByYou' => 'Você',
          'history.visibilityRowLabel' => 'Quem vê',
          'history.visibilityBoth' => 'Os dois',
          'history.visibilityOnlyYou' => 'Só você',
          'history.deleteMilestone' => 'Apagar',
          'history.deleteMilestoneTitle' => 'Excluir este marco?',
          'history.deleteMilestoneTextShared' => 'Ele será removido da história dos dois.',
          'history.deleteMilestoneTextPrivate' => 'Ele será removido da sua história.',
          'history.deleteMilestoneConfirm' => 'Excluir',
          'history.saveMilestone' => 'Salvar',
          'history.storyDatesTitle' => 'Datas da nossa história',
          'history.storyMet' => 'Nos conhecemos',
          'history.storyDating' => 'Começamos a namorar',
          'history.storyEngaged' => 'Noivamos',
          'history.storyMarried' => 'Casamos',
          'history.storyAdd' => 'Adicionar',
          'history.storyDateAddedBy' => ({required Object name}) => 'Adicionado por ${name}',
          'history.storyDatesNote' => 'Tudo opcional. A data de início alimenta o contador.',
          'history.variationsTitle' => 'Como o contador aparece',
          'history.variationDating' => 'Namoro',
          'history.variationEngaged' => 'Noivado',
          'history.variationMarried' => 'Casados',
          'history.variationBeginning' => 'Começando',
          'history.variationLongDistance' => 'Distância',
          'history.variationsPreviewNote' => 'Prévia de estilos. O tempo mostrado é o total real do casal; contagens por fase precisam de datas próprias.',
          'history.avatarHeadline' => 'Como você aparece?',
          'history.avatarHighlight' => 'aparece',
          'history.avatarInitials' => 'Iniciais',
          'history.avatarInitialsNote' => 'Seu avatar usa as suas iniciais.',
          'history.avatarNote' => 'Cada pessoa escolhe o seu. O app nunca puxa a foto do outro.',
          'history.avatarContinue' => 'Continuar',
          'history.numbersTitle' => 'Em números',
          'history.numbersHeroDays' => ({required Object days}) => '${days} dias',
          'history.numbersHeroEmpty' => 'No seu tempo',
          'history.numbersHeroEmptySub' =>
            'Defina uma data de início quando quiser acompanhar os dias.',
          'history.numbersWeekends' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'fim de semana juntos',
                  other: 'fins de semana juntos',
                ),
          'history.numbersFullMoons' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'lua cheia',
                  other: 'luas cheias',
                ),
          'history.numbersChristmases' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'Natal juntos',
                  other: 'Natais juntos',
                ),
          'history.numbersNextAnniversary' =>
            ({required num years, required Object suffix}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  years,
                  one: 'para ${years} ano ${suffix}',
                  other: 'para ${years} anos ${suffix}',
                ),
          'history.numbersSuffixDating' => 'de namoro',
          'history.numbersSuffixEngaged' => 'de noivado',
          'history.numbersSuffixMarried' => 'casados',
          'history.numbersSuffixTogether' => 'juntos',
          'history.numbersMonthsCount' =>
            ({required num months}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  months,
                  one: '${months} mês',
                  other: '${months} meses',
                ),
          'history.numbersDaysCount' =>
            ({required num days}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  days,
                  one: '${days} dia',
                  other: '${days} dias',
                ),
          'history.numbersPlacesSection' => 'LUGARES QUE MARCARAM',
          'history.numbersYearSection' => ({required Object year}) => 'SEU ANO (${year})',
          'history.numbersYearNote' => 'Só os seus registros deste ano.',
          'history.numbersFirstsCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'primeira vez',
                  other: 'primeiras vezes',
                ),
          'history.differentHeadline' => 'As datas diferem',
          'history.differentHighlight' => 'diferem',
          'history.differentSubtitle' => ({
            required Object partner,
          }) => 'Você e ${partner} escolheram datas diferentes para o início.',
          'history.differentYourDate' => 'Sua data',
          'history.differentPartnerDate' => ({required Object partner}) => 'Data de ${partner}',
          'history.differentNote' => 'Cada um vê a sua. Nada é trocado sem os dois.',
          'history.differentNoDates' => 'Ainda não há datas de início para comparar.',
          'history.differentContinue' => 'Continuar',
          'history.partnerFallback' => 'seu par',
          'history.errorTitle' => 'Não deu para carregar',
          'history.errorText' => 'Sua história continua salva. Tente de novo.',
          'history.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'history.errors.NOT_OWNER' => 'Só quem criou pode editar ou apagar.',
          'history.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'history.numbersMemoriesCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'memória guardada',
                  other: 'memórias guardadas',
                ),
          'history.numbersMemoriesRecent' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'memória recente',
                  other: 'memórias recentes',
                ),
          'history.numbersPlaces' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: 'lugar',
                  other: 'lugares',
                ),
          'history.readOnlyMilestone' =>
            'Este marco foi adicionado por outra pessoa. Só quem criou pode editar.',
          'history.readOnlyMilestoneBy' => ({
            required Object name,
          }) => 'Adicionado por ${name}. Só quem criou pode editar.',
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
          _ => null,
        } ??
        switch (path) {
          'intro.phase.options.dating' => 'Namorando',
          'intro.phase.options.living_together' => 'Moramos juntos',
          'intro.phase.options.engaged' => 'Noivos',
          'intro.phase.options.married' => 'Casados',
          'intro.phase.options.with_kids' => 'Com filhos',
          'intro.phase.options.long_distance' => 'Namoro à distância',
          'intro.phase.options.with_parents' => 'Moramos com os pais',
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
          'language.language' => 'Idioma',
          'language.languagePortuguese' => 'Português (Brasil)',
          'language.languageEnglish' => 'Inglês',
          'language.comingSoon' => 'Em breve',
          'language.languageNote' => 'O inglês fica completo depois.',
          'language.saveError' => 'Não foi possível salvar. Tente novamente.',
          'learned.title' => 'O que aprendi',
          'learned.intro' => 'Coisas que você escolheu guardar da conversa. Só você vê.',
          'learned.pendingTitle' => 'Para revisar',
          'learned.confirmedTitle' => 'Confirmado',
          'learned.targets.partnerFact' => 'Sobre meu par',
          'learned.targets.date' => 'Um date',
          'learned.targets.memory' => 'Uma memória',
          'learned.targets.commitment' => 'Um combinado',
          'learned.confirm' => 'Confirmar',
          'learned.edit' => 'Editar',
          'learned.discard' => 'Descartar',
          'learned.confirmTitle' => 'Confirmar este aprendizado?',
          'learned.confirmText' => 'Ele passa a aparecer em O que aprendi. Só você vê.',
          'learned.discardTitle' => 'Descartar este aprendizado?',
          'learned.discardText' => 'Ele não será guardado.',
          'learned.discardConfirm' => 'Descartar',
          'learned.editTitle' => 'Editar aprendizado',
          'learned.editHint' => 'O que você quer guardar',
          'learned.textErrors.empty' => 'Escreva o que quer guardar',
          'learned.textErrors.tooLong' => 'Isto está muito longo',
          'learned.save' => 'Guardar',
          'learned.partnerFactLabel' => 'Da conversa',
          'learned.updated' => 'Aprendizado atualizado',
          'learned.emptyTitle' => 'Nada guardado ainda',
          'learned.emptyText' =>
            'Quando quiser, salve uma resposta da conversa para lembrar depois.',
          'learned.errorTitle' => 'Não deu para carregar',
          'learned.errorText' => 'Tente de novo em instantes.',
          'learned.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'learned.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'lists.title' => 'Listas',
          'lists.subtitle' => 'Viagens, lugares e filmes, compartilhados ou só seus.',
          'lists.newList' => 'Nova lista',
          'lists.createTitle' => 'Nova lista',
          'lists.titleLabel' => 'Nome',
          'lists.titleHint' => 'Ex.: Viagens dos nossos sonhos',
          'lists.titleErrors.empty' => 'Dê um nome para a lista.',
          'lists.titleErrors.tooLong' => 'Use no máximo 80 caracteres.',
          'lists.kindLabel' => 'Tipo',
          'lists.visibilityLabel' => 'Quem pode ver',
          'lists.sharedHint' => 'Vocês dois podem ver e mudar esta lista.',
          'lists.privateHint' => 'Só você vê esta lista.',
          'lists.kinds.travel' => 'Viagem',
          'lists.kinds.restaurants' => 'Restaurantes',
          'lists.kinds.movies' => 'Filmes',
          'lists.kinds.custom' => 'Outra',
          'lists.kinds.other' => '',
          'lists.shared' => 'Compartilhada',
          'lists.private' => 'Privada',
          'lists.emptyTitle' => 'Nenhuma lista ainda',
          'lists.emptyTextShared' => 'Comece uma lista de coisas que vocês querem fazer juntos.',
          'lists.emptyTextPrivate' => 'Comece uma lista de coisas para você guardar.',
          'lists.create' => 'Criar lista',
          'lists.rename' => 'Renomear',
          'lists.delete' => 'Apagar',
          'lists.renameTitle' => 'Renomear lista',
          'lists.save' => 'Guardar',
          'lists.deleteTitle' => 'Apagar lista?',
          'lists.deleteTextShared' => 'A lista e tudo o que está nela somem para vocês dois.',
          'lists.deleteTextPrivate' => 'A lista e tudo o que está nela somem de vez.',
          'lists.deleteConfirm' => 'Apagar',
          'lists.itemDeleteTitle' => 'Apagar item?',
          'lists.itemDeleteTextShared' => 'Este item some para vocês dois.',
          'lists.itemDeleteTextPrivate' => 'Este item some de vez.',
          'lists.itemDeleteConfirm' => 'Apagar item',
          'lists.makePrivate' => 'Tornar privada',
          'lists.shareWithPartner' => 'Compartilhar com seu par',
          'lists.addItem' => 'Adicionar item',
          'lists.itemHint' => 'Ex.: Lisboa',
          'lists.itemTitleErrors.empty' => 'Escreva o nome do item.',
          'lists.itemTitleErrors.tooLong' => 'Use no máximo 160 caracteres.',
          'lists.add' => 'Adicionar',
          'lists.itemEmptyTitle' => 'Nada por aqui ainda',
          'lists.itemEmptyTextShared' => 'Adicione a primeira coisa que vocês querem fazer juntos.',
          'lists.itemEmptyTextPrivate' => 'Adicione a primeira coisa a esta lista.',
          'lists.statuses.dream' => 'Sonho',
          'lists.statuses.planned' => 'Planejado',
          'lists.statuses.done' => 'Feito',
          'lists.statuses.other' => '',
          'lists.markDream' => 'Voltar para sonhos',
          'lists.markPlanned' => 'Marcar como planejado',
          'lists.markDone' => 'Marcar como feito',
          'lists.moveUp' => 'Mover para cima',
          'lists.moveDown' => 'Mover para baixo',
          'lists.itemOptions' => 'Opções do item',
          'lists.listOptions' => 'Opções da lista',
          'lists.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'lists.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
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
          'loveStyle.entryLabel' => 'SÓ PARA VOCÊ',
          'loveStyle.entryTitle' => 'Como eu me sinto querido(a)',
          'loveStyle.entryText' =>
            'Seis perguntas rápidas para notar o que te faz sentir querido(a).',
          'loveStyle.exerciseTitle' => 'Como eu me sinto querido(a)',
          'loveStyle.exerciseHighlight' => 'querido(a)',
          'loveStyle.exerciseSubtitle' => 'Seis perguntas rápidas, só para você.',
          'loveStyle.questionOf' => ({
            required Object current,
            required Object total,
          }) => 'Pergunta ${current} de ${total}',
          'loveStyle.questions.0' => 'O que mais faz você se sentir querido(a)?',
          'loveStyle.questions.1' => 'Num dia difícil, o que mais te conforta?',
          'loveStyle.questions.2' => 'O que você nota primeiro quando seu par demonstra carinho?',
          'loveStyle.questions.3' => 'Qual desses gestos aquece seu coração?',
          'loveStyle.questions.4' => 'O que te faz sentir importante para alguém?',
          'loveStyle.questions.5' => 'Se pudesse escolher um gesto para hoje, qual seria?',
          'loveStyle.options1.time' => 'Passar um tempo junto, sem pressa.',
          'loveStyle.options1.words' => 'Ouvir que sou importante.',
          'loveStyle.options1.acts' => 'Ver que a pessoa me ajuda com algo.',
          'loveStyle.options1.gifts' => 'Receber um presente pequeno, sem motivo.',
          'loveStyle.options1.touch' => 'Um abraço demorado.',
          'loveStyle.options1.other' => '',
          'loveStyle.options2.time' => 'Ter alguém por perto, sem pressa de resolver.',
          'loveStyle.options2.words' => 'Uma mensagem dizendo que estou no pensamento.',
          'loveStyle.options2.acts' => 'Alguém assumir uma tarefa minha.',
          'loveStyle.options2.gifts' => 'Um cuidado pequeno que chegou de surpresa.',
          'loveStyle.options2.touch' => 'Um abraço bem apertado.',
          'loveStyle.options2.other' => '',
          'loveStyle.options3.time' => 'Quando a pessoa larga o celular para ficar comigo.',
          'loveStyle.options3.words' => 'Quando a pessoa elogia algo que eu fiz.',
          'loveStyle.options3.acts' => 'Quando a pessoa percebe o que eu preciso e faz.',
          'loveStyle.options3.gifts' => 'Quando a pessoa lembra de algo que eu gosto.',
          'loveStyle.options3.touch' => 'Quando a pessoa me toca de leve ao passar.',
          'loveStyle.options3.other' => '',
          'loveStyle.options4.time' => 'Um encontro tranquilo, só nós dois.',
          'loveStyle.options4.words' => 'Uma conversa em que me sinto ouvido(a).',
          'loveStyle.options4.acts' => 'Uma ajuda pequena numa tarefa.',
          'loveStyle.options4.gifts' => 'Um presente simples que tem a ver comigo.',
          'loveStyle.options4.touch' => 'Um carinho no cabelo ou na mão.',
          'loveStyle.options4.other' => '',
          'loveStyle.options5.time' => 'Quando alguém escolhe passar tempo comigo.',
          'loveStyle.options5.words' => 'Quando alguém reconhece o que eu faço.',
          'loveStyle.options5.acts' => 'Quando alguém facilita o meu dia.',
          'loveStyle.options5.gifts' => 'Quando alguém lembra de mim com um detalhe.',
          'loveStyle.options5.touch' => 'Quando alguém me abraça sem precisar falar.',
          'loveStyle.options5.other' => '',
          'loveStyle.options6.time' => 'Reservar uma noite livre para nós.',
          'loveStyle.options6.words' => 'Escrever um recado de carinho.',
          'loveStyle.options6.acts' => 'Resolver juntos uma tarefa chata.',
          'loveStyle.options6.gifts' => 'Escolher um presente pequeno.',
          'loveStyle.options6.touch' => 'Ficar de mãos dadas.',
          'loveStyle.options6.other' => '',
          'loveStyle.continueAction' => 'Próxima',
          'loveStyle.finishAction' => 'Ver resultado',
          'loveStyle.back' => 'Voltar',
          'loveStyle.privateNote' =>
            'Só você vê as respostas. Você escolhe se quer mostrar o resultado.',
          'loveStyle.resultTitle' => 'O que faz você se sentir querido(a)',
          'loveStyle.resultHighlight' => 'querido(a)',
          'loveStyle.resultSubtitle' =>
            'Uma descrição do que te faz sentir querido(a), do seu jeito.',
          'loveStyle.topTag' => 'O que mais combina com você',
          'loveStyle.descriptions.time' => 'Você se sente querido(a) quando tem tempo de verdade com quem gosta: sem pressa, sem telas, só a presença.',
          'loveStyle.descriptions.words' => 'Você se sente querido(a) quando ouve, de forma sincera, o que a outra pessoa sente por você.',
          'loveStyle.descriptions.acts' => 'Você se sente querido(a) quando alguém percebe o que você precisa e ajuda sem que você peça.',
          'loveStyle.descriptions.gifts' => 'Você se sente querido(a) quando alguém lembra de você num detalhe pequeno, escolhido com carinho.',
          'loveStyle.descriptions.touch' => 'Você se sente querido(a) quando um abraço, uma mão dada ou um carinho dizem o que as palavras não dizem.',
          'loveStyle.descriptions.other' => '',
          'loveStyle.shareDescriptions.time' =>
            'Eu me sinto querido(a) quando a gente passa um tempo junto, sem pressa e sem telas.',
          'loveStyle.shareDescriptions.words' =>
            'Eu me sinto querido(a) quando ouço, com sinceridade, o que você sente por mim.',
          'loveStyle.shareDescriptions.acts' =>
            'Eu me sinto querido(a) quando você percebe o que eu preciso e me ajuda sem eu pedir.',
          'loveStyle.shareDescriptions.gifts' => 'Eu me sinto querido(a) quando você lembra de mim num detalhe pequeno, escolhido com carinho.',
          'loveStyle.shareDescriptions.touch' => 'Eu me sinto querido(a) quando um abraço, uma mão dada ou um carinho dizem o que as palavras não dizem.',
          'loveStyle.shareDescriptions.other' => '',
          'loveStyle.resultPrivacyNote' => 'Salvo só para você. Mostrar no widget do seu par é uma escolha sua, e você pode desfazer.',
          'loveStyle.saveManualAction' => 'Salvar no Meu manual',
          'loveStyle.savedManualAction' => 'Salvo no Meu manual',
          'loveStyle.manualToast' => 'Salvo no Meu manual.',
          'loveStyle.shareAction' => ({required Object name}) => 'Mostrar para ${name}',
          'loveStyle.revokeAction' => 'Tirar do widget dele(a)',
          'loveStyle.shareToast' => 'Aparece no widget dele(a) se ele(a) permitir recados.',
          'loveStyle.revokeToast' => 'Não aparece mais no widget dele(a).',
          'loveStyle.shareSoloNote' =>
            'Quando vocês estiverem conectados, você pode mostrar isso no widget do seu par.',
          'loveStyle.partnerFallback' => 'seu par',
          'loveStyle.pairingErrorNote' => 'Não deu para verificar seu par agora.',
          'loveStyle.retryPairing' => 'Tentar de novo',
          'loveStyle.retake' => 'Refazer o exercício',
          'loveStyle.loadErrorTitle' => 'Não deu para carregar',
          'loveStyle.loadErrorText' => 'Não deu para abrir seu resultado agora. Tente de novo.',
          'loveStyle.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'loveStyle.errors.other' => 'Não deu para salvar agora. Suas respostas continuam aqui.',
          'loveStyle.manualErrors.RATE_LIMITED' =>
            'Muitas tentativas seguidas. Espere um instante.',
          'loveStyle.manualErrors.other' =>
            'Não deu para salvar no Meu manual agora. Tente de novo.',
          'loveStyle.shareErrors.NOT_PAIRED' => 'Você ainda não tem um par conectado.',
          'loveStyle.shareErrors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'loveStyle.shareErrors.other' => 'Não deu para mostrar agora. Tente de novo.',
          'loveStyle.revokeErrors.RATE_LIMITED' =>
            'Muitas tentativas seguidas. Espere um instante.',
          'loveStyle.revokeErrors.other' => 'Não deu para tirar do widget agora. Tente de novo.',
          'memories.title' => 'Memórias',
          'memories.historyLabel' => 'NOSSA HISTÓRIA',
          'memories.historyTitle' => 'Nossa história',
          'memories.historyText' => 'Marcos, datas, lugares e a nossa história em números.',
          'memories.storyLabel' => 'COMPARTILHAR',
          'memories.storyTitle' => 'Imagem para compartilhar',
          'memories.storyText' => 'Seus números em uma imagem, só com o que você escolher.',
          'memories.placesLabel' => 'LUGARES',
          'memories.placesTitle' => 'Lugares onde vocês estiveram',
          'memories.placesText' => 'Só o nome do lugar, nunca a localização.',
          'memories.placeLabel' => 'Lugar (opcional)',
          'memories.placeHint' => 'Ex.: Paraty',
          'memories.placeAddressNote' => 'Prefira só o nome do lugar, sem endereço ou número.',
          'memories.segmentTimeline' => 'Linha do tempo',
          'memories.segmentJar' => 'Potinho',
          'memories.jarEmpty' =>
            'Quando um slip te fizer bem, guarde-o no potinho pelos detalhes dele.',
          'memories.jarAnother' => 'Outro',
          'memories.jarClose' => 'Fechar',
          'memories.titleLabel' => 'Uma memória',
          'memories.titleHint' => 'Ex.: nosso primeiro jantar',
          'memories.titleErrors.empty' => 'Dê um título a esta memória',
          'memories.titleErrors.tooLong' => 'O título está muito longo',
          'memories.placeErrors.tooLong' => 'O lugar está muito longo',
          'memories.bodyErrors.tooLong' => 'A nota está muito longa',
          'memories.bodyHint' => 'Conte como foi (opcional)',
          'memories.add' => 'Adicionar memória',
          'memories.save' => 'Guardar memória',
          'memories.delete' => 'Apagar',
          'memories.monthsShort.0' => 'jan',
          'memories.monthsShort.1' => 'fev',
          'memories.monthsShort.2' => 'mar',
          'memories.monthsShort.3' => 'abr',
          'memories.monthsShort.4' => 'mai',
          'memories.monthsShort.5' => 'jun',
          'memories.monthsShort.6' => 'jul',
          'memories.monthsShort.7' => 'ago',
          'memories.monthsShort.8' => 'set',
          'memories.monthsShort.9' => 'out',
          'memories.monthsShort.10' => 'nov',
          'memories.monthsShort.11' => 'dez',
          'memories.dateLine' => ({
            required Object day,
            required Object month,
            required Object year,
          }) => '${day} ${month} ${year}',
          'memories.emptyTitle' => 'Nenhuma memória ainda',
          'memories.emptyText' => 'Guarde momentos que vocês querem rever.',
          'memories.errorTitle' => 'Não deu para carregar',
          'memories.errorText' => 'Suas memórias continuam salvas. Tente de novo.',
          'memories.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'memories.errors.other' => 'Não deu para fazer isso agora. Seu texto continua aqui.',
          'memories.jarEmptyTitle' => 'O potinho está vazio',
          'memories.jarEmptyAction' => 'Ver meus slips',
          'memories.moreTitle' => 'Mais',
          'mood.title' => 'Como você está hoje?',
          'mood.titleHighlight' => 'hoje',
          'mood.subtitle' => 'Um toque. A etiqueta “Preciso de...” é opcional.',
          'mood.privateCue' => 'só você vê',
          'mood.moods.happy' => 'Feliz',
          'mood.moods.tired' => 'Cansado(a)',
          'mood.moods.sad' => 'Triste',
          'mood.moods.stressed' => 'Estressado(a)',
          'mood.moods.loving' => 'Carinhoso(a)',
          'mood.moods.playful' => 'Brincalhão(ona)',
          'mood.needTitle' => 'Preciso de...',
          'mood.needs.listen' => 'Ser ouvido',
          'mood.needs.opinion' => 'Uma opinião',
          'mood.needs.hug' => 'Um abraço',
          'mood.needs.space' => 'Um tempo',
          'mood.shareTitle' => 'O que seu par vê',
          'mood.shareTitleNamed' => ({required Object name}) => 'O que ${name} vê',
          'mood.shareSubtitle' => 'Quem cria o dado decide. O padrão é privado.',
          'mood.share.none' => 'Manter privado',
          'mood.share.mood' => 'Só meu humor',
          'mood.share.mood_need' => 'Humor e o que preciso',
          'mood.shareSupport.none' => 'Nada é compartilhado.',
          'mood.shareSupport.mood' => 'Seu par vê o humor, sem o que você precisa.',
          'mood.shareSupport.mood_need' => 'Seu par vê o humor e o que você precisa.',
          'mood.privacyNote' =>
            'Nada é compartilhado por padrão. Seu par nunca vê gráfico nem nota.',
          'mood.save' => 'Salvar',
          'mood.saved' => 'Humor salvo',
          'mood.errors.NETWORK' =>
            'Não deu para salvar seu humor. Verifique a conexão e tente de novo.',
          'mood.errors.TIMEOUT' => 'Não deu para salvar seu humor a tempo. Tente de novo.',
          'mood.errors.other' => 'Não deu para salvar seu humor. Tente de novo.',
          'mood.entryCategory' => 'Humor do dia',
          'mood.entryTitle' => 'Como você está hoje?',
          'mood.entryText' => 'Um toque. Só você vê até compartilhar.',
          'mood.partnerLabel' => 'Humor do seu par',
          'mood.partnerFallback' => 'Seu par',
          'mood.partnerHappy' => ({required Object name}) => '${name} está feliz hoje',
          'mood.partnerTired' => ({required Object name}) => '${name} está sem energia hoje',
          'mood.partnerSad' => ({required Object name}) => '${name} está para baixo hoje',
          'mood.partnerStressed' => ({
            required Object name,
          }) => '${name} está com a cabeça cheia hoje',
          'mood.partnerLoving' => ({
            required Object name,
          }) => '${name} está com o coração quentinho hoje',
          'mood.partnerPlayful' => ({
            required Object name,
          }) => '${name} está com vontade de brincar hoje',
          'mood.partnerNeedListen' => 'O que ajuda: só ouvir.',
          'mood.partnerNeedOpinion' => 'O que ajuda: uma opinião.',
          'mood.partnerNeedHug' => 'O que ajuda: um abraço.',
          'mood.partnerNeedSpace' => 'O que ajuda: um pouco de espaço.',
          'mood.homeTitle' => 'Como você está?',
          'mood.homePrivacy' => 'Só você vê',
          'mood.homeMoods.happy' => 'Bem',
          'mood.homeMoods.loving' => 'Carinhoso',
          'mood.homeMoods.tired' => 'Cansado',
          'mood.homeMoods.stressed' => 'Tenso',
          'mood.homeMoods.sad' => 'Triste',
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
          'notes.title' => 'Bilhete ou desenho',
          'notes.intro' =>
            'Um recado curto para seu par, ou um desenho que fica na sua lista de enviados.',
          'notes.kinds.0' => 'Bilhete',
          'notes.kinds.1' => 'Desenho',
          'notes.noteHint' => 'Ex.: boa sorte na reunião de hoje',
          'notes.textErrors.empty' => 'Escreva o recado primeiro',
          'notes.textErrors.tooLong' => 'Este recado está muito longo',
          'notes.canvasLabel' => 'Área do desenho',
          'notes.pens.0' => 'Preto',
          'notes.pens.1' => 'Laranja',
          'notes.pens.2' => 'Roxo',
          'notes.pens.3' => 'Verde',
          'notes.eraser' => 'Borracha',
          'notes.undo' => 'Desfazer',
          'notes.clear' => 'Limpar',
          'notes.emptyDrawing' => 'Faça um traço para poder enviar.',
          'notes.widgetLabel' => 'Enviar para o widget',
          'notes.widgetText' => 'Aparece no widget dele se ele permitir recados.',
          'notes.drawingHint' =>
            'Desenhos ficam na sua lista de enviados. Recados no widget são só texto por enquanto.',
          'notes.unpairedTitle' => 'Conecte-se com seu par',
          'notes.unpairedText' =>
            'Você precisa estar conectado com seu par para enviar um bilhete ou desenho.',
          'notes.send' => 'Enviar',
          'notes.sent' => 'Enviado',
          'notes.sentTitle' => 'Enviados por você',
          'notes.justNow' => 'Agora',
          'notes.minutesAgo' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 min atrás',
                  other: '${count} min atrás',
                ),
          'notes.hoursAgo' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 h atrás',
                  other: '${count} h atrás',
                ),
          'notes.daysAgo' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 dia atrás',
                  other: '${count} dias atrás',
                ),
          'notes.drawingAlt' => 'Desenho',
          'notes.delete' => 'Apagar',
          'notes.deleteConfirmTitle' => 'Apagar este envio?',
          'notes.deleteConfirmText' =>
            'Ele sai da sua lista de enviados. Bilhetes também saem do widget do seu par.',
          'notes.deleteConfirm' => 'Apagar agora',
          'notes.deleted' => 'Apagado',
          'notes.deleteError' => 'Não deu para apagar agora. Tente de novo.',
          'notes.emptyTitle' => 'Nada enviado ainda',
          'notes.emptyText' => 'Quando você mandar um bilhete ou desenho, ele aparece aqui.',
          'notes.errorTitle' => 'Não deu para carregar',
          'notes.errorText' => 'Tente de novo em instantes.',
          'notes.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'notes.errors.NOT_PAIRED' => 'Para enviar, você precisa estar com seu par no app.',
          'notes.errors.other' => 'Não deu para enviar agora. O que você escreveu continua aqui.',
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
          'partnerProfile.title' => 'Sobre seu par',
          'partnerProfile.privateNote' =>
            'Só você vê estas notas. Elas nunca aparecem em avisos, widgets ou para seu par.',
          'partnerProfile.categories.likes' => 'Gosta',
          'partnerProfile.categories.dislikes' => 'Não gosta',
          'partnerProfile.categories.sizes' => 'Tamanhos',
          'partnerProfile.categories.health' => 'Saúde',
          'partnerProfile.categories.comfort' => 'Conforto',
          'partnerProfile.categories.people' => 'Pessoas',
          'partnerProfile.categories.other' => 'Outro',
          'partnerProfile.labelLabel' => 'Assunto',
          'partnerProfile.labelHint' => 'Ex.: café',
          'partnerProfile.labelErrors.empty' => 'Dê um assunto à nota.',
          'partnerProfile.labelErrors.tooLong' => 'Use no máximo 80 caracteres.',
          'partnerProfile.valueHint' => 'Ex.: sem açúcar, bem quente',
          'partnerProfile.valueErrors.empty' => 'Escreva o que quer lembrar.',
          'partnerProfile.valueErrors.tooLong' => 'Use no máximo 500 caracteres.',
          'partnerProfile.save' => 'Guardar nota',
          'partnerProfile.delete' => 'Apagar',
          'partnerProfile.emptyTitle' => 'Nenhuma nota ainda',
          'partnerProfile.emptyText' =>
            'Pequenos detalhes ajudam a escolher um presente ou um gesto.',
          'partnerProfile.errorTitle' => 'Não deu para carregar',
          'partnerProfile.errorText' => 'Suas notas continuam salvas. Tente de novo.',
          'partnerProfile.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'partnerProfile.errors.other' =>
            'Não deu para fazer isso agora. Seu texto continua aqui.',
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
          'pause.messageErrors.empty' => 'Escreva uma mensagem curta',
          'pause.messageErrors.tooLong' => 'A mensagem está muito longa',
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
          _ => null,
        } ??
        switch (path) {
          'places.title' => 'Lugares',
          'places.privacyNote' => 'Só o nome do lugar. O app nunca lê nem guarda sua localização.',
          'places.memoryOne' => '1 memória',
          'places.memoryMany' => ({required Object count}) => '${count} memórias',
          'places.monthsShort.0' => 'jan',
          'places.monthsShort.1' => 'fev',
          'places.monthsShort.2' => 'mar',
          'places.monthsShort.3' => 'abr',
          'places.monthsShort.4' => 'mai',
          'places.monthsShort.5' => 'jun',
          'places.monthsShort.6' => 'jul',
          'places.monthsShort.7' => 'ago',
          'places.monthsShort.8' => 'set',
          'places.monthsShort.9' => 'out',
          'places.monthsShort.10' => 'nov',
          'places.monthsShort.11' => 'dez',
          'places.dateLine' => ({
            required Object day,
            required Object month,
            required Object year,
          }) => '${day} ${month} ${year}',
          'places.emptyTitle' => 'Nenhum lugar ainda',
          'places.emptyText' =>
            'Ao guardar uma memória, escreva o nome do lugar e ele aparece aqui.',
          'places.detailEmptyTitle' => 'Nada neste lugar',
          'places.detailEmptyText' => 'As memórias deste lugar não estão mais aqui.',
          'places.errorTitle' => 'Não deu para carregar',
          'places.errorText' => 'Suas memórias continuam salvas. Tente de novo.',
          'plus.title' => 'Repara Plus',
          'plus.subtitle' => 'Compare com calma. O plano grátis continua inteiro para o essencial.',
          'plus.activeTitle' => 'Você tem o Plus',
          'plus.activeText' => 'Obrigado. Tudo está liberado para você e para seu par.',
          'plus.paidByPartner' => 'Seu par tem o Plus e ele vale para vocês dois.',
          'plus.freeLeft' => ({
            required Object slips,
            required Object cards,
          }) => 'Neste mês restam ${slips} slips e ${cards} cartões enviados no plano grátis.',
          'plus.freeName' => 'Grátis',
          'plus.freeFeatures' => 'Slips todo mês, um cartão enviado por mês, repair, pausa, segurança e tudo o que você já guardou.',
          'plus.plusName' => 'Plus',
          'plus.plusFeatures' =>
            'Mais slips e cartões por mês e mais recursos para os dois, cobrindo você e seu par.',
          'plus.monthly' => 'Mensal',
          'plus.yearly' => 'Anual',
          'plus.giftPlan' => 'Presente',
          'plus.storeTitle' => 'Não deu para ver os preços',
          'plus.storeText' => 'A loja não respondeu. Nada foi cobrado. Tente de novo.',
          'plus.subscribe' => 'Assinar',
          'plus.started' => 'Plus ativado. Obrigado.',
          'plus.pending' => 'Compra recebida. Estamos confirmando, o Plus aparece em instantes.',
          'plus.purchaseError' => 'Não deu para concluir a compra. Nada foi cobrado.',
          'plus.billingTitle' => 'Problema no pagamento',
          'plus.billingText' => 'O último pagamento não passou. O Plus continua por enquanto. Abra suas assinaturas na loja e atualize a forma de pagamento.',
          'plus.alwaysFree' => 'Segurança, pausa e desparear nunca ficam trancados.',
          'plus.lockLabel' => 'PLUS',
          'plus.lockText' => 'Disponível no Plus. Toque para ver os planos.',
          'plus.errorTitle' => 'Não deu para carregar',
          'plus.errorText' => 'Tente de novo daqui a pouco.',
          'plus.manageTitle' => 'Gerenciar Plus',
          'plus.planRow' => 'Plano',
          'plus.statusRow' => 'Status',
          'plus.coversRow' => 'Cobre',
          'plus.coversBoth' => 'Você e seu par',
          'plus.coveredByPartner' => 'Seu par',
          'plus.plusActive' => 'Plus ativo',
          'plus.statusActive' => 'Ativo',
          'plus.statusTrialing' => 'Período de teste',
          'plus.statusGrace' => 'Pagamento pendente',
          'plus.statusBillingIssue' => 'Problema no pagamento',
          'plus.manageInStore' => 'Gerenciar na loja',
          'plus.seePlus' => 'Ver o Plus',
          'plus.managePlan' => 'Gerenciar plano',
          'plus.restorePurchases' => 'Restaurar compras',
          'plus.partnerPays' => 'Seu par cuida desta assinatura.',
          'plus.partnerCancel' =>
            'Se um dos parceiros cancelar, o Plus termina para os dois, com aviso claro.',
          'plus.storeIssueTitle' => 'A loja não abriu',
          'plus.restoreLoadingTitle' => 'Restaurando compras',
          'plus.restoreLoadingText' => 'Isso leva alguns segundos.',
          'plus.restoredTitle' => 'Compras restauradas',
          'plus.restoredHighlight' => 'restauradas',
          'plus.restoredText' => 'Encontramos o seu Plus na loja.',
          'plus.pendingRestoreTitle' => 'Encontramos uma compra',
          'plus.pendingRestoreHighlight' => 'compra',
          'plus.pendingRestoreText' => 'Pode levar um instante, ou entre com a conta que comprou.',
          'plus.nothingTitle' => 'Nada para restaurar',
          'plus.nothingHighlight' => 'restaurar',
          'plus.nothingText' => 'Não encontramos compras ativas nesta loja. Se você assinou com outra conta, entre com ela e tente de novo.',
          'plus.restoreFailedTitle' => 'Não deu para restaurar',
          'plus.restoreFailedHighlight' => 'restaurar',
          'plus.tryAgain' => 'Tentar de novo',
          'plus.done' => 'Pronto',
          'plus.errors.storeUnavailable' => 'A loja não está disponível neste aparelho agora.',
          'plus.errors.manageUnavailable' => 'Não há uma página da loja para esta assinatura aqui.',
          'plus.errors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'privacy.title' => 'Privacidade e segurança',
          'privacy.discreetMode' => 'Modo discreto',
          'privacy.partnerTitle' => 'O que o parceiro vê',
          'privacy.partnerSlips' => 'Slips enviados',
          'privacy.partnerSlipsText' => 'Só o que você envia',
          'privacy.partnerPrivateSlips' => 'Slips privados',
          'privacy.partnerTemperature' => 'Temperatura',
          'privacy.partnerJournal' => 'Diário',
          'privacy.partnerPause' => 'Pausa',
          'privacy.partnerPauseText' => 'A mensagem que você escreveu',
          'privacy.never' => 'Nunca',
          'privacy.partnerNote' => 'Quem produz o dado decide quem vê.',
          'privacy.ourTitle' => 'O que podemos ver',
          'privacy.ourEncrypted' => 'Seu conteúdo é criptografado em trânsito.',
          'privacy.ourPrivate' => 'A equipe não pode ler suas notas privadas.',
          'privacy.ourAnalytics' => 'Análises: só contagens.',
          'privacy.ourPlain' => 'Página em linguagem simples.',
          'privacy.consents' => 'Consentimentos',
          'privacy.sensitiveData' => 'Dados sensíveis',
          'privacy.analytics' => 'Análises',
          'privacy.marketing' => 'Marketing',
          'privacy.ai' => 'IA (quando disponível)',
          'privacy.terms' => 'Termos',
          'privacy.required' => 'Obrigatório',
          'privacy.requiredNote' => 'Dados sensíveis e Termos são obrigatórios para usar o app.',
          'privacy.consentsNote' => 'Mudanças valem agora.',
          'privacy.saveError' => 'Não deu para salvar agora. Tente de novo.',
          'privacy.errorTitle' => 'Não deu para carregar os consentimentos',
          'privacy.errorText' => 'Tente de novo em instantes.',
          'privacy.sensitiveTracks' => 'Trilhas e avisos sensíveis',
          'privacy.heavyDayNotice' => 'Aviso de dias pesados',
          'profileDetails.title' => 'Perfil',
          'profileDetails.nameLabel' => 'Seu nome',
          'profileDetails.nameHint' => 'Marina',
          'profileDetails.nameErrors.empty' => 'Seu nome não pode ficar vazio.',
          'profileDetails.nameErrors.tooLong' => 'Use no máximo 30 caracteres.',
          'profileDetails.pronounsLabel' => 'Pronomes',
          'profileDetails.pronounsHint' => 'Opcional',
          'profileDetails.pronounsErrors.tooLong' => 'Use no máximo 30 caracteres.',
          'profileDetails.timeZoneLabel' => 'Fuso horário',
          'profileDetails.timeZonePlaceholder' => 'Escolha um fuso',
          'profileDetails.loginLabel' => 'Login',
          'profileDetails.loginAccount' => 'Conta',
          'profileDetails.loginEmail' => 'E-mail',
          'profileDetails.loginApple' => 'Apple',
          'profileDetails.loginGoogle' => 'Google',
          'profileDetails.photoNote' => 'Ainda não dá para enviar foto.',
          'profileDetails.saved' => 'Salvo',
          'profileDetails.loadErrorTitle' => 'Não deu para carregar seu perfil',
          'profileDetails.loadErrorText' => 'Confira a conexão e tente de novo.',
          'profileDetails.timeZones.America/Sao_Paulo' => 'São Paulo',
          'profileDetails.timeZones.America/Argentina/Buenos_Aires' => 'Buenos Aires',
          'profileDetails.timeZones.America/Bogota' => 'Bogotá',
          'profileDetails.timeZones.America/Mexico_City' => 'Cidade do México',
          'profileDetails.timeZones.America/New_York' => 'Nova York',
          'profileDetails.timeZones.America/Los_Angeles' => 'Los Angeles',
          'profileDetails.timeZones.Europe/Lisbon' => 'Lisboa',
          'profileDetails.timeZones.Europe/London' => 'Londres',
          'profileDetails.timeZones.Europe/Madrid' => 'Madri',
          'profileDetails.timeZones.Europe/Paris' => 'Paris',
          'profileDetails.timeZones.Europe/Berlin' => 'Berlim',
          'profileDetails.timeZones.Africa/Luanda' => 'Luanda',
          'profileDetails.timeZones.Asia/Tokyo' => 'Tóquio',
          'profileDetails.timeZones.Australia/Sydney' => 'Sydney',
          'profileDetails.timeZones.UTC' => 'UTC',
          'profileDetails.errors.NETWORK' => 'Sem conexão. Tente de novo.',
          'profileDetails.errors.other' => 'Não deu para salvar agora. Tente de novo.',
          'profileSetup.title' => 'O básico',
          'profileSetup.titleHighlight' => 'básico',
          'profileSetup.subtitle' =>
            'Usado para as palavras do app e para a primeira data da sua história.',
          'profileSetup.nameLabel' => 'Seu nome',
          'profileSetup.nameHint' => 'Marina',
          'profileSetup.nameErrors.empty' => 'Seu nome não pode ficar vazio.',
          'profileSetup.nameErrors.tooLong' => 'Use no máximo 30 caracteres.',
          'profileSetup.partnerNameLabel' => 'Nome do parceiro',
          'profileSetup.partnerNameHint' => 'Ricardo',
          'profileSetup.partnerNameErrors.tooLong' => 'Use no máximo 30 caracteres.',
          'profileSetup.partnerNameNote' => 'O nome do parceiro fica só na sua conta.',
          'profileSetup.themeLabel' => 'Cor do seu app',
          'profileSetup.themeRose' => 'Rosa',
          'profileSetup.themeBlue' => 'Azul',
          'profileSetup.themeNeutral' => 'Neutro',
          'profileSetup.dateLabel' => 'Quando começaram?',
          'profileSetup.dateHint' => 'Escolha uma data',
          'profileSetup.dateErrors.empty' => 'Escolha a data de vocês.',
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
          'programs.label' => 'PROGRAMAS',
          'programs.title' => 'Programas',
          'programs.entryText' => 'Programas curtos e guiados, no seu ritmo.',
          'programs.hubSubtitle' => 'Uma ideia por dia. Sem pressa, sem cobrança.',
          'programs.free' => 'GRÁTIS',
          'programs.plus' => 'PLUS',
          'programs.lessonCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 lição',
                  other: '${count} lições',
                ),
          'programs.noLessons' => 'Lições chegando',
          'programs.emptyTitle' => 'Nenhum programa por aqui ainda',
          'programs.emptyText' => 'Novos programas chegam em breve. Volte quando quiser.',
          'programs.errorTitle' => 'Não deu para carregar',
          'programs.errorText' => 'Os programas continuam aqui. Tente de novo.',
          'programs.diaryLabel' => 'SÓ EU',
          'programs.diaryTitle' => 'Diário',
          'programs.diaryText' => 'Um lugar privado para escrever como você está.',
          'programs.start' => 'Começar',
          'programs.kContinue' => 'Continuar',
          'programs.restart' => 'Começar de novo',
          'programs.restartConfirmTitle' => 'Começar de novo?',
          'programs.restartConfirmText' => 'Isto limpa suas marcações e volta à primeira lição.',
          'programs.restartConfirm' => 'Começar de novo',
          'programs.completed' => 'Concluído',
          'programs.lessonsTitle' => 'Lições',
          'programs.lessonsComingTitle' => 'Lições chegando',
          'programs.lessonsComingText' =>
            'Este programa ainda está sendo preparado. Volte em breve.',
          'programs.lessonGoneTitle' => 'Lição indisponível',
          'programs.lessonGoneText' =>
            'Este dia não faz mais parte do programa. Escolha outra lição.',
          'programs.dayOneHint' => 'A primeira lição é sempre aberta neste programa.',
          'programs.dayLabel' => ({required Object day}) => 'Dia ${day}',
          'programs.shortRead' => 'Uma ideia curta para hoje.',
          'programs.ready' => 'Pronto',
          'programs.saveForLater' => 'Salvar para depois',
          'programs.saved' => 'Guardado para depois.',
          'programs.savedTag' => 'Guardado',
          'programs.lockedTitle' => 'Lição do Plus',
          'programs.lockedLessonText' => 'Esta lição faz parte do Plus.',
          'programs.lockedProgramText' => 'Este programa faz parte do Plus.',
          'programs.completeTitle' => 'Muito bem',
          'programs.completeText' => ({required Object title}) => 'Você concluiu ${title}.',
          'programs.completeHint' => 'Escolha outro quando quiser.',
          'programs.seePrograms' => 'Ver programas',
          'programs.diaryPrivacy' => 'Só eu. Nunca é compartilhado.',
          'programs.diaryPrompt' => 'Hoje eu me senti...',
          'programs.diaryHint' => 'Escreva sem pressa. Só você vê isto.',
          'programs.diaryBodyErrors.empty' => 'Escreva um pouco antes de salvar',
          'programs.diaryBodyErrors.tooLong' => 'A entrada está muito longa',
          'programs.diarySave' => 'Salvar',
          'programs.diaryNew' => 'Nova entrada',
          'programs.diaryEdit' => 'Editar',
          'programs.diaryDelete' => 'Apagar',
          'programs.diaryDeleteTitle' => 'Apagar esta entrada?',
          'programs.diaryDeleteText' => 'Isto não pode ser desfeito.',
          'programs.diaryDeleteConfirm' => 'Apagar',
          'programs.diaryCapHint' => 'Mostrando suas últimas 100 entradas.',
          'programs.diaryEmptyTitle' => 'Nada escrito ainda',
          'programs.diaryEmptyText' => 'Quando quiser, escreva como você está. Só você vê.',
          'programs.diaryErrorTitle' => 'Não deu para carregar',
          'programs.diaryErrorText' => 'Suas entradas continuam guardadas. Tente de novo.',
          'programs.monthsShort.0' => 'jan',
          'programs.monthsShort.1' => 'fev',
          'programs.monthsShort.2' => 'mar',
          'programs.monthsShort.3' => 'abr',
          'programs.monthsShort.4' => 'mai',
          'programs.monthsShort.5' => 'jun',
          'programs.monthsShort.6' => 'jul',
          'programs.monthsShort.7' => 'ago',
          'programs.monthsShort.8' => 'set',
          'programs.monthsShort.9' => 'out',
          'programs.monthsShort.10' => 'nov',
          'programs.monthsShort.11' => 'dez',
          'programs.dateLine' => ({
            required Object day,
            required Object month,
            required Object year,
          }) => '${day} ${month} ${year}',
          'programs.moods.calm' => 'Em paz',
          'programs.moods.tender' => 'Acolhido(a)',
          'programs.moods.tired' => 'Cansado(a)',
          'programs.moods.heavy' => 'Pesado',
          'programs.moods.other' => 'Como estou',
          'programs.lessonErrors.other' => 'Não deu para fazer isso agora. Tente de novo.',
          'programs.diaryErrors.other' => 'Não deu para salvar agora. Seu texto continua aqui.',
          'programs.sensitive' => 'SENSÍVEL',
          'programs.sensitiveGateTitle' => 'Uma trilha só sua',
          'programs.sensitiveGateText' => 'Estas lições falam de luto, doença e confiança. Seu par não vê que você entrou nem o que você lê. Você pode sair quando quiser.',
          'programs.sensitiveGateAction' => 'Entrar nesta trilha',
          'programs.sensitiveConsentTitle' => 'Entrar nesta trilha?',
          'programs.sensitiveConsentText' => 'Estas lições falam de luto, doença e confiança. Elas ficam só para você: seu par não vê sua participação. Você pode retirar este consentimento em Privacidade e segurança.',
          'programs.sensitiveConsentConfirm' => 'Entrar',
          'programs.sensitiveConsentCancel' => 'Agora não',
          'programs.sensitiveLessonLockedTitle' => 'Trilha sensível',
          'programs.sensitiveLessonLockedText' =>
            'Para abrir esta lição, ative o consentimento das trilhas sensíveis.',
          'programs.freeNote' => 'No grátis aparece só a primeira lição.',
          'questions.tag' => 'Pergunta para vocês dois',
          'questions.eyebrow' => 'Pergunta do dia',
          'questions.answerCta' => 'Responder',
          'questions.editCta' => 'Editar minha resposta',
          'questions.answerHint' => 'Escreva o quanto quiser.',
          'questions.answerErrors.empty' => 'Escreva uma resposta',
          'questions.answerErrors.tooLong' => 'A resposta está muito longa',
          'questions.privateNote' => 'Só você vê isto até seu par responder também.',
          'questions.partnerAnsweredNote' => 'Seu par já respondeu. Envie a sua para ver as duas.',
          'questions.soloNote' =>
            'Sua resposta fica privada. Seu par vai ver depois que vocês se conectarem.',
          'questions.save' => 'Enviar',
          'questions.cancel' => 'Cancelar',
          'questions.waitingTitle' => 'Sua resposta ficou guardada',
          'questions.waitingText' => 'Ela aparece aqui quando seu par responder também.',
          'questions.waitingSoloText' =>
            'Quando seu par entrar, ele vê a sua resposta e você vê a dele.',
          'questions.checkAgain' => 'Verificar de novo',
          'questions.voiceSoon' => 'Recado de voz',
          'questions.voiceSoonNote' => 'Por enquanto as respostas são escritas. A voz vem depois.',
          'questions.revealTitle' => 'Suas respostas juntas',
          'questions.revealHighlight' => 'juntas',
          'questions.revealSubtitle' => 'Agora que os dois responderam, vocês veem as duas.',
          'questions.revealNote' => 'Sem notas. Só o que cada um escreveu.',
          'questions.you' => 'Você',
          'questions.partnerFallback' => 'Seu par',
          'questions.discardTitle' => 'Descartar esta resposta?',
          'questions.discardText' => 'O texto que você escreveu não foi salvo.',
          'questions.discard' => 'Descartar',
          'questions.keepWriting' => 'Continuar escrevendo',
          'questions.loadErrorTitle' => 'Não deu para abrir a pergunta',
          'questions.loadErrorText' => 'Nada foi perdido. Tente de novo.',
          'questions.close' => 'Fechar',
          'questions.errors.other' => 'Não deu para salvar agora. Tente de novo.',
          'questionsEntry.label' => 'PERGUNTA DO DIA',
          'questionsEntry.title' => 'Pergunta do dia',
          'questionsEntry.text' => 'Uma pergunta para os dois responderem.',
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
          'quickSlip.textErrors.empty' => 'Escreva o slip primeiro',
          'quickSlip.textErrors.tooLong' => 'Este slip está muito longo',
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
          'relationshipChanged.title' => 'Algo mudou?',
          'relationshipChanged.highlight' => 'mudou',
          'relationshipChanged.subtitle' => 'Conte com calma. Isso só muda o que o app mostra.',
          'relationshipChanged.optionEnded' => 'Terminamos',
          'relationshipChanged.optionBereaved' => 'Perdi a pessoa',
          'relationshipChanged.optionOnBreak' => 'Um tempo',
          'relationshipChanged.optionTogether' => 'Está tudo bem',
          'relationshipChanged.continueLabel' => 'Continuar',
          'relationshipChanged.saved' => 'Salvo',
          'relationshipChanged.errors.NETWORK' => 'Sem conexão. Tente de novo.',
          'relationshipChanged.errors.other' => 'Não deu para salvar agora. Tente de novo.',
          'relationshipSettings.title' => 'Relacionamento',
          'relationshipSettings.phaseLabel' => 'Fase',
          'relationshipSettings.phasePlaceholder' => 'Escolha uma fase',
          'relationshipSettings.phases.beginning' => 'Começando',
          'relationshipSettings.phases.dating' => 'Namorando',
          'relationshipSettings.phases.living_together' => 'Moramos juntos',
          'relationshipSettings.phases.engaged' => 'Noivos',
          'relationshipSettings.phases.married' => 'Casados',
          'relationshipSettings.phases.with_kids' => 'Com filhos',
          'relationshipSettings.phases.long_distance' => 'Namoro à distância',
          'relationshipSettings.phases.with_parents' => 'Moramos com os pais',
          'relationshipSettings.phases.restarting' => 'Recomeçando',
          'relationshipSettings.dateLabel' => 'Juntos desde',
          'relationshipSettings.dateHint' => 'Escolha uma data',
          'relationshipSettings.dateFormat' => ({
            required Object day,
            required Object month,
            required Object year,
          }) => '${day} de ${month} de ${year}',
          'relationshipSettings.months.0' => 'janeiro',
          'relationshipSettings.months.1' => 'fevereiro',
          'relationshipSettings.months.2' => 'março',
          'relationshipSettings.months.3' => 'abril',
          'relationshipSettings.months.4' => 'maio',
          'relationshipSettings.months.5' => 'junho',
          'relationshipSettings.months.6' => 'julho',
          'relationshipSettings.months.7' => 'agosto',
          'relationshipSettings.months.8' => 'setembro',
          'relationshipSettings.months.9' => 'outubro',
          'relationshipSettings.months.10' => 'novembro',
          'relationshipSettings.months.11' => 'dezembro',
          'relationshipSettings.futureDateNote' =>
            'Pode escolher uma data futura; a contagem só começa depois.',
          'relationshipSettings.partnerLabel' => 'Parceiro',
          'relationshipSettings.invitePartner' => 'Convide seu par',
          'relationshipSettings.partnerError' => 'Não deu para carregar seu par.',
          'relationshipSettings.partnerRetry' => 'Tentar de novo',
          'relationshipSettings.phaseNote' => 'A fase muda só as palavras.',
          'relationshipSettings.saved' => 'Salvo',
          'relationshipSettings.loadErrorTitle' => 'Não deu para carregar o relacionamento',
          'relationshipSettings.loadErrorText' => 'Confira a conexão e tente de novo.',
          'relationshipSettings.errors.NETWORK' => 'Sem conexão. Tente de novo.',
          'relationshipSettings.errors.other' => 'Não deu para salvar agora. Tente de novo.',
          'relationshipSettings.changedPrompt' => 'Algo mudou entre vocês?',
          'relationshipSettings.changedSubtitle' => 'Atualize o que o app mostra',
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
          'repair.softStart.feelingErrors.empty' => 'Diga como você se sente',
          'repair.softStart.situation' => 'Quando…',
          'repair.softStart.situationHint' => 'Ex.: a louça fica para depois',
          'repair.softStart.situationErrors.empty' => 'Diga quando acontece',
          'repair.softStart.need' => 'Eu preciso de…',
          'repair.softStart.needHint' => 'Ex.: um pouco de ajuda',
          'repair.softStart.needErrors.empty' => 'Diga o que você precisa',
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
          'repair.quick.textErrors.empty' => 'Escreva uma mensagem',
          'repair.quick.textErrors.tooLong' => 'A mensagem está muito longa',
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
          _ => null,
        } ??
        switch (path) {
          'repair.learning.hint' => 'Escreva em uma ou duas frases',
          'repair.learning.noteErrors.empty' => 'Escreva o que você aprendeu',
          'repair.learning.noteErrors.tooLong' => 'A nota está muito longa',
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
          'safeMode.title' => 'Modo seguro',
          'safeMode.text' => 'Para quando o app precisa ficar discreto neste celular.',
          'safeMode.toggle' => 'Esconder o app',
          'safeMode.toggleText' => 'Quando você troca de app, a tela fica em branco.',
          'safeMode.localOnly' => 'Isto fica só neste celular. Nada é enviado nem registrado.',
          'safeMode.quickExit' => 'Sair agora',
          'safety.entry' => 'Segurança e apoio',
          'sessionExpired.title' => 'Sua sessão terminou',
          'sessionExpired.highlight' => 'terminou',
          'sessionExpired.text' => 'Entre de novo para continuar. Seus dados estão seguros.',
          'sessionExpired.action' => 'Entrar',
          'settingsHome.title' => 'Configurações',
          'settingsHome.safety' => 'Segurança e apoio',
          'settingsHome.safetyStatus' => 'Modo seguro',
          'settingsHome.profile' => 'Perfil',
          'settingsHome.relationship' => 'Relacionamento',
          'settingsHome.connected' => 'Vocês estão conectados',
          'settingsHome.invitePartner' => 'Convide seu par',
          'settingsHome.notifications' => 'Notificações',
          'settingsHome.devices' => 'Dispositivos',
          'settingsHome.on' => 'Ligadas no app',
          'settingsHome.off' => 'Desligadas no app',
          'settingsHome.plan' => 'Plano',
          'settingsHome.planFree' => 'Grátis',
          'settingsHome.planPlus' => 'Plus',
          'settingsHome.spice' => 'Momentos a dois',
          'settingsHome.discreet' => 'Modo discreto',
          'settingsHome.discreetOn' => 'Ligado',
          'settingsHome.discreetOff' => 'Desligado',
          'settingsHome.privacy' => 'Privacidade e segurança',
          'settingsHome.privacyStatus' => 'Quem vê o quê',
          'settingsHome.signOut' => 'Sair',
          'settingsHome.deleteAccount' => 'Apagar conta',
          'settingsHome.pendingBanner' => ({
            required Object date,
          }) => 'Sua conta será apagada em ${date}.',
          'settingsHome.pendingAction' => 'Ver',
          'settingsHome.pendingBannerSimple' => 'Sua conta será apagada em breve.',
          'settingsHome.help' => 'Ajuda e suporte',
          'settingsHome.helpStatus' => 'Perguntas e contato',
          'settingsHome.appPreferences' => 'Preferências do app',
          'settingsHome.appPreferencesStatus' => 'Aparência, texto e idioma',
          'settingsHome.weeklyCard' => 'Cartão semanal',
          'settingsHome.language' => 'Idioma',
          'settingsHome.accountSection' => 'Conta',
          'settingsHome.preferencesSection' => 'Preferências',
          'settingsHome.privacySection' => 'Privacidade e ajuda',
          'settingsHome.connectedWith' => ({required Object name}) => 'Conectado com ${name}',
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
          'slipDetail.jarTitle' => 'Guardar no potinho',
          'slipDetail.jarText' => 'Para abrir em um dia ruim. Só você vê.',
          'slipDetail.cardTitle' => 'Quem vê isto',
          'slipDetail.cardOff' => 'Só eu',
          'slipDetail.cardOffText' => 'Fica na sua semana e não entra no cartão.',
          'slipDetail.cardOn' => 'Pode entrar no cartão',
          'slipDetail.cardOnText' => 'No domingo você escolhe se ele vai.',
          'slipDetail.cardInvisible' => 'Slips invisíveis nunca entram em um cartão.',
          'slipDetail.previewTitle' => 'O que seu par leria',
          'slipDetail.previewText' => 'Se este slip entrar no cartão, é este texto que aparece.',
          'slipDetail.sentNote' => 'Este slip já foi em um cartão. O cartão enviado guarda a cópia de antes, mesmo que você edite ou apague aqui.',
          'slipDetail.draftBodyErrors.empty' => 'Escreva o slip primeiro',
          'slipDetail.draftBodyErrors.tooLong' => 'Este slip está muito longo',
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
          'slipDetail.discardTitle' => 'Descartar este slip?',
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
          'slipKind.textErrors.empty' => 'Escreva o slip primeiro',
          'slipKind.textErrors.tooLong' => 'Este slip está muito longo',
          'slipKind.feelingErrors.tooLong' => 'Isto está muito longo',
          'slipKind.planErrors.empty' => 'Diga o que você vai fazer',
          'slipKind.planErrors.tooLong' => 'Isto está muito longo',
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
          'slipsList.search' => 'Buscar',
          'slipsList.searchClose' => 'Fechar busca',
          'slipsList.searchHint' => 'Buscar nos seus slips',
          'slipsList.searchEmptyTitle' => 'Nada encontrado',
          'slipsList.searchEmptyText' => 'Tente outra palavra.',
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
          'spice.title' => 'Momentos a dois',
          'spice.offText' => 'Esta seção fica oculta por padrão, atrás desta configuração. São cartas leves e brincalhonas, nada explícito. Só aparecem quando vocês dois ligam, e qualquer um pode desligar a qualquer momento, sem aviso.',
          'spice.turnOn' => 'Ligar',
          'spice.notNow' => 'Agora não',
          'spice.waitingText' => 'Os dois precisam aceitar. Nada é avisado ao seu par; quando ele também ligar, as cartas aparecem aqui.',
          'spice.readyText' => 'Cartas leves para vocês dois. Fazer ou pular, sem pressão.',
          'spice.drawCard' => 'Tirar uma carta',
          'spice.turnOff' => 'Desligar',
          'spice.errorTitle' => 'Não deu para carregar',
          'spice.errorText' => 'Tente de novo em instantes.',
          'spice.errors.RATE_LIMITED' => 'Muitas tentativas seguidas. Espere um instante.',
          'spice.errors.other' => 'Não deu para mudar agora. Tente de novo.',
          'story.title' => 'Imagem para compartilhar',
          'story.privacyNote' => 'A imagem é feita no seu aparelho e não leva nomes nem texto, a menos que você escolha.',
          'story.days' => 'dias',
          'story.together' => 'juntos',
          'story.namesLabel' => 'Incluir os nomes',
          'story.namesText' => 'Desligado por padrão.',
          'story.phraseLabel' => 'Uma frase (opcional)',
          'story.phraseHint' => 'Ex.: ainda tem muito pela frente',
          'story.share' => 'Compartilhar imagem',
          'story.emptyTitle' => 'Falta a data de vocês',
          'story.emptyText' =>
            'Defina desde quando vocês estão juntos em Nossa história para gerar a imagem.',
          'story.errorTitle' => 'Não deu para carregar',
          'story.errorText' => 'Tente de novo em instantes.',
          'story.errors.other' => 'Não deu para compartilhar agora. Tente de novo.',
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
          'tabs.segmentTogether' => 'Nós',
          'tabs.forMeFooter' => 'Ferramentas privadas. Nunca compartilhadas.',
          'tabs.segmentForMe' => 'Para mim',
          'tabs.checkinLabel' => 'CHECK-IN',
          'tabs.checkinTitle' => 'Check-in da semana',
          'tabs.checkinText' => 'Uma conversa curta, em privado primeiro.',
          'tabs.logisticsLabel' => 'PRÁTICO',
          'tabs.logisticsTitle' => 'Reunião de logística',
          'tabs.logisticsText' => 'As coisas práticas, sem ninguém carregar sozinho.',
          'tabs.listsLabel' => 'LISTAS',
          'tabs.listsTitle' => 'Listas',
          'tabs.listsEmpty' => 'Nenhuma lista ainda. Comecem uma juntos.',
          'tabs.listsEmptyPrivate' => 'Nenhuma lista ainda. Comece uma só sua.',
          'tabs.listsSharedCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 lista, compartilhada',
                  other: '${count} listas, compartilhadas',
                ),
          'tabs.listsPrivateCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '1 lista, privada',
                  other: '${count} listas, privadas',
                ),
          'tabs.soloNote' => 'Quando seu par entrar, as coisas compartilhadas aparecem aqui.',
          'tabs.ritualsLabel' => 'ROTINA',
          'tabs.ritualsTitle' => 'Rituais',
          'tabs.ritualsText' => 'Pequenos hábitos que vocês querem proteger.',
          'tabs.dateNightLabel' => 'ENCONTRO',
          'tabs.dateNightTitle' => 'Encontro',
          'tabs.dateNightText' => 'Ideias para vocês dois, escolhidas juntos.',
          'tabs.partnerLabel' => 'SÓ PARA VOCÊ',
          'tabs.partnerTitle' => 'Sobre seu par',
          'tabs.partnerText' => 'Notas privadas para lembrar do que ele ou ela gosta.',
          'tabs.chatLabel' => 'CONVERSAR',
          'tabs.chatTitle' => 'Mascote',
          'tabs.chatText' => 'Uma conversa calma, que não fica guardada.',
          'tabs.hardTalkLabel' => 'CONVERSA DIFÍCIL',
          'tabs.hardTalkTitle' => 'Preparar uma conversa difícil',
          'tabs.hardTalkText' => 'A mascote ajuda você a organizar o que dizer.',
          'tabs.notesLabel' => 'PARA SEU PAR',
          'tabs.notesTitle' => 'Bilhete ou desenho',
          'tabs.notesText' => 'Mande algo curto e carinhoso, quando quiser.',
          'tabs.usLabel' => 'NÓS',
          'tabs.usTitle' => 'Sinto saudade de nós',
          'tabs.usText' => 'Um toque leve para o seu par, sem cobrança.',
          'tabs.touchLabel' => 'TOQUE',
          'tabs.touchTitle' => 'Cartas de toque',
          'tabs.touchText' => 'Neutras, para fazer ou pular.',
          'tabs.distanceLabel' => 'DISTÂNCIA',
          'tabs.distanceTitle' => 'Nossos dois relógios',
          'tabs.distanceText' => 'Fusos e a contagem até o reencontro.',
          'tabs.parentsLabel' => 'COM OS PAIS',
          'tabs.parentsTitle' => 'Cinco minutos para nós',
          'tabs.parentsText' => 'Um momento curto e só de vocês dois, mesmo com a casa cheia.',
          'tabs.capsulesLabel' => 'CÁPSULA DO TEMPO',
          'tabs.capsulesTitle' => 'Uma mensagem para o futuro',
          'tabs.capsulesText' => 'Fica fechada até a data que você escolher.',
          'tabs.datesLabel' => 'DATAS',
          'tabs.datesTitle' => 'Datas importantes',
          'tabs.datesText' => 'Aniversários, presentes e feriados, com aviso antes.',
          'tabs.badDayLabel' => 'AJUDA',
          'tabs.badDayTitle' => 'Um dia difícil',
          'tabs.badDayText' => 'Três coisas pequenas para fazer agora.',
          'tabs.starterLabel' => 'CONVERSA',
          'tabs.starterTitle' => 'Começar uma conversa',
          'tabs.starterText' => 'Uma pergunta para abrir, sem pressa.',
          'tabs.dayLabel' => 'DIA',
          'tabs.dayTitle' => 'Dia a dia',
          'tabs.dayText' => 'O que importa em cada dia.',
          'tabs.plusLabel' => 'PLANO',
          'tabs.plusTitle' => 'Grátis e Plus',
          'tabs.plusText' => 'O que cada plano inclui, sem pressão.',
          'tabs.temperatureLabel' => 'ENTRE VOCÊS',
          'tabs.temperatureTitle' => 'Como está entre vocês?',
          'tabs.temperatureText' => 'Um registro privado, sem nota.',
          'tabs.learningLabel' => 'SÓ PARA VOCÊ',
          'tabs.learningTitle' => 'O que você aprendeu',
          'tabs.learningText' => 'Anotações privadas que você pode apagar.',
          'tabs.fightStyleLabel' => 'SÓ PARA VOCÊ',
          'tabs.fightStyleTitle' => 'Como eu reajo numa briga',
          'tabs.fightStyleText' => 'Uma reflexão curta e privada sobre o seu jeito.',
          'tabs.guidesLabel' => 'CONVERSAS',
          'tabs.guidesTitle' => 'Conversas difíceis',
          'tabs.guidesText' => 'Um passo de cada vez, só para você.',
          'tabs.gamesLabel' => 'JOGOS',
          'tabs.gamesTitle' => 'Jogar juntos',
          'tabs.gamesText' => 'Jogos curtos, sem placar e sem vencedor.',
          'tabs.gamesLock' => 'Precisa dos dois',
          'tabs.sectionForYou' => 'Para vocês',
          'tabs.sectionTools' => 'Ferramentas',
          'tabs.sectionMore' => 'Mais',
          'tabs.sectionPrivate' => 'Só seu',
          'tabs.sectionPatterns' => 'Meus padrões',
          'tabs.logisticsMeta' => '15 min · semanal',
          'tabs.ritualsMeta' => 'Pequenos hábitos',
          'tabs.dateNightMeta' => 'Para vocês dois',
          'tabs.programsMeta' => 'Microlições',
          'tabs.checkinMeta' => 'Uma vez por semana',
          'tabs.questionMeta' => 'Uma para os dois',
          'tabs.gamesMeta' => 'Sem placar',
          'tabs.datesMeta' => 'Com aviso antes',
          'tabs.giftsMeta' => 'Só para você',
          'tabs.guidesMeta' => 'Um passo de cada vez',
          'tabs.starterMeta' => 'Uma pergunta',
          'tabs.dayMeta' => 'Um dia de cada vez',
          'tabs.capsulesMeta' => 'Para o futuro',
          'tabs.temperatureMeta' => 'Privado, sem nota',
          'tabs.widgetsMeta' => 'Na tela inicial',
          'tabs.usMeta' => 'Um toque',
          'tabs.touchMeta' => 'Cartas neutras',
          'tabs.badDayMeta' => 'Três coisas pequenas',
          'tabs.distanceMeta' => 'Fusos e reencontro',
          'tabs.parentsMeta' => 'Cinco minutos',
          'tabs.diaryMeta' => 'Só seu',
          'tabs.hardTalkMeta' => 'Notas antes de falar',
          'tabs.notesMeta' => 'Quando quiser',
          'tabs.learningMeta' => 'Anotações privadas',
          'tabs.partnerMeta' => 'Só para você',
          'tabs.fightStyleMeta' => 'Como você reage',
          'tabs.loveStyleMeta' => 'Como você se sente amado',
          'tabs.chatMeta' => 'Uma conversa calma',
          'tabs.listsNone' => 'Nenhuma ainda',
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
          'timeInApp.title' => 'Um tempo no app',
          'timeInApp.titleHighlight' => 'app',
          'timeInApp.text' => 'Escondemos cartões e lembretes até você voltar.',
          'timeInApp.pause' => 'Pausar o app',
          'timeInApp.cancel' => 'Cancelar',
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
          'today.togetherChipAction' => 'Abrir nossa história',
          'today.togetherJoin' => ({
            required Object first,
            required Object second,
          }) => '${first} e ${second}',
          'today.invitePerson' => 'Convidar sua pessoa',
          'today.pendingInviteTitle' => 'Convite enviado',
          'today.pendingInviteText' => 'A pessoa ainda não entrou. Reenviar ou revogar.',
          'today.pendingInviteAction' => 'Ver convite',
          'today.answer' => 'Responder',
          'today.slipsThisWeek' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  zero: 'Nenhum slip ainda',
                  one: '1 slip esta semana',
                  other: '${count} slips esta semana',
                ),
          'today.weekHintEmpty' => 'sem pressa',
          'today.weekHint' => 'cartão no domingo',
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
          _ => null,
        } ??
        switch (path) {
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
          'today.weekHintToday' => 'cartão sai hoje, 18:00',
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
          'widgets.settingsTitle' => 'Widgets',
          'widgets.settingsSubtitle' => 'Na tela inicial',
          'widgets.juntosCategory' => 'TELA INICIAL',
          'widgets.juntosTitle' => 'Widgets do Repara',
          'widgets.juntosSubtitle' => 'Lembretes calmos para você ou para vocês dois.',
          'widgets.galleryTitle' => 'Widgets',
          'widgets.segmentOwn' => 'Só meus',
          'widgets.segmentCouple' => 'Do casal',
          'widgets.howToAddAction' => 'Como colocar na tela',
          'widgets.configureAction' => 'Configurar',
          'widgets.ownSlipLabel' => 'ANOTAR SLIP',
          'widgets.ownSlipTitle' => '+ Slip',
          'widgets.ownSlipSubtitle' => 'Toque para anotar',
          'widgets.ownIdeaLabel' => 'IDEIA DO DIA',
          'widgets.ownIdeaDefault' => 'Deixe um bilhete hoje',
          'widgets.ownIdeaHint' => 'Toque para abrir',
          'widgets.ownJarLabel' => 'POTINHO DO DIA RUIM',
          'widgets.ownJarTitle' => 'Abrir um slip guardado',
          'widgets.ownJarPrivacy' => 'Privado: só no seu aparelho',
          'widgets.lockScreenLabel' => 'TELA DE BLOQUEIO',
          'widgets.lockScreenDefault' => 'Lembrete calmo · Sem nomes',
          'widgets.coupleCounterLabel' => 'CONTADOR',
          'widgets.coupleCounterUnset' => 'Defina a data do casal para ver os dias juntos',
          'widgets.coupleCounterDays' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '${count} dia juntos',
                  other: '${count} dias juntos',
                ),
          'widgets.couplePhotosLabel' => 'FOTOS DO CASAL · PLUS',
          'widgets.couplePhotosPrompt' => 'Escolha uma foto de vocês dois',
          'widgets.couplePhotosPlusHint' => 'Disponível no plano Plus',
          'widgets.partnerNoteLabel' => 'RECADO DO PAR',
          'widgets.partnerNoteEmpty' => 'Sem recado novo no momento',
          'widgets.partnerNoteFrom' => ({required Object name}) => 'De ${name}',
          'widgets.partnerNoteFromDefault' => 'Do seu par',
          'widgets.cardEncounterLabel' => 'CARTÃO E ENCONTRO',
          'widgets.cardStateReady' => 'Chegou um cartão · Toque para abrir',
          'widgets.cardStateSent' => 'Cartão enviado · Aguardando domingo',
          'widgets.cardStatePause' => 'Pausa em andamento',
          'widgets.cardStateNone' => 'Cartão de domingo em preparação',
          'widgets.discreetBanner' =>
            'Modo discreto ativo: nomes, fotos e recados estão ocultos nos widgets.',
          'widgets.unpairedBanner' =>
            'Sem par conectado: os widgets do casal mostram o estado neutro.',
          'widgets.offlineBanner' =>
            'Mostrando o último dado salvo. Atualiza quando voltar a internet.',
          'widgets.howToAddTitle' => 'Como adicionar',
          'widgets.howToAddStep1Title' => 'Segure a tela inicial',
          'widgets.howToAddStep1Body' => 'Toque e segure um espaço vazio até os ícones tremerem.',
          'widgets.howToAddStep2Title' => 'Toque no botão +',
          'widgets.howToAddStep2Body' => 'No canto superior, busque por QS-Flutter.',
          'widgets.howToAddStep3Title' => 'Escolha o tamanho',
          'widgets.howToAddStep3Body' => 'Pequeno ou médio.',
          'widgets.howToAddAndroidLockNote' => 'No Android moderno os widgets ficam na tela inicial. A tela de bloqueio usa apenas ícones de notificação neutros.',
          'widgets.howToAddIosLockNote' =>
            'No iOS 16 ou mais novo, você também pode adicionar o widget na tela de bloqueio.',
          'widgets.howToAddDone' => 'Entendi',
          'widgets.configureTitle' => 'Configurar widget',
          'widgets.configurePreviewLabel' => 'PRÉVIA',
          'widgets.configureContentSection' => 'Conteúdo',
          'widgets.configureContentFavorites' => 'Favoritas',
          'widgets.configureContentRecent' => 'Recentes',
          'widgets.configureContentDailyIdea' => 'Ideia do dia',
          'widgets.configureRotationSection' => 'Troca de foto',
          'widgets.configureRotationDaily' => 'Todo dia',
          'widgets.configureRotationSixHours' => 'A cada 6h',
          'widgets.configureRotationManual' => 'Manual',
          'widgets.configurePrivacySection' => 'Privacidade',
          'widgets.configureShowNames' => 'Mostrar nomes',
          'widgets.configureHideInDiscreet' => 'Ocultar em modo discreto',
          'widgets.configureAllowPartnerNotes' => 'Permitir recado do parceiro',
          'widgets.configureOnLockScreen' => 'Permitir na tela de bloqueio',
          'widgets.configureSave' => 'Salvar',
          'widgets.configureSavedToast' => 'Preferências do widget salvas.',
          'widgets.loadErrorTitle' => 'Não foi possível carregar os widgets',
          'widgets.loadErrorBody' => 'Verifique sua conexão e tente novamente.',
          'widgets.retryAction' => 'Tentar novamente',
          'widgets.themeLight' => 'Claro',
          'widgets.themeDark' => 'Escuro',
          'widgets.discreetReminderLabel' => 'Lembrete',
          'widgets.discreetNeutralBody' => 'Texto neutro',
          'widgets.signedOutLabel' => 'Repara',
          'widgets.signedOutBody' => 'Toque para entrar',
          'widgets.ownSmallPageTitle' => 'Widget · Meu (pequeno)',
          'widgets.ownSmallSlipAction' => 'Anotar',
          'widgets.ownSmallDateDefaultTitle' => 'Próxima data',
          'widgets.ownSmallDateDays' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
                  count,
                  one: '${count} dia',
                  other: '${count} dias',
                ),
          'widgets.ownSmallMoodLabel' => 'HUMOR',
          'widgets.ownSmallMoodPrompt' => 'Como você está?',
          'widgets.ownSmallMoodOptions' => 'Feliz · Cansado · Triste',
          'widgets.ownSmallRitualLabel' => 'RITUAL',
          'widgets.ownSmallRitualDefaultTitle' => 'Caminhada de domingo',
          'widgets.ownSmallRitualDefaultTime' => 'Dom · 10:00',
          'widgets.ownMediumPageTitle' => 'Widget · Meu (médio)',
          'widgets.ownMediumIdeaAction' => 'Toque para ver',
          'widgets.ownMediumJarTitle' => 'Toque para abrir um slip guardado',
          'widgets.ownMediumJarPrivacy' => 'Privado: só aparece no seu aparelho',
          'widgets.lockScreenPageTitle' => 'Tela de bloqueio',
          'widgets.lockScreenClockTime' => '19:38',
          'widgets.lockScreenClockDate' => 'Sexta, 10 de abril',
          'widgets.lockScreenPauseTitle' => 'Pausa em andamento',
          'widgets.lockScreenPauseUntil' => ({required Object time}) => 'até ${time}',
          'widgets.lockScreenPauseUntilDefault' => 'até 20:00',
          'widgets.lockScreenReadyAction' => 'Estou pronto',
          'widgets.lockScreenGenericPhrase' => 'Momento calmo',
          'widgets.lockScreenDiscreetPhrase' => 'Lembrete',
          'widgets.lockScreenPrivacyRule' => 'Sem nomes nem mensagens na tela bloqueada.',
          'widgets.lockScreenDisabledNote' =>
            'O widget da tela de bloqueio está desativado nas configurações.',
          'widgets.lockScreenFamiliesTitle' => 'Formatos no iOS (Circular, Retangular e Linha)',
          'widgets.counterPageTitle' => 'Widget · Contador',
          'widgets.counterYearsMonthsTitle' => ({
            required Object years,
            required Object months,
          }) => '${years} anos · ${months} meses',
          'widgets.counterMonthsDaysSubtitle' => ({
            required Object months,
            required Object days,
          }) => '${months} meses · ${days} dias',
          'widgets.counterStatusDating' => 'Namorando',
          'widgets.counterStatusLivingTogether' => 'Morando juntos',
          'widgets.counterStatusMarried' => 'Casados',
          'widgets.counterStatusTogether' => 'Juntos',
          'widgets.counterMidnightNote' =>
            'O contador atualiza automaticamente à meia-noite no fuso local.',
          'widgets.counterSetDateAction' => 'Definir data do relacionamento',
          'widgets.photosPageTitle' => 'Widget · Fotos do casal',
          'widgets.photosPlusBadge' => 'PLUS',
          'widgets.photosNeutralFallbackNote' => 'Quando nenhuma foto local está salva (ou no modo discreto), o widget mostra apenas o cartão neutro com o tempo juntos.',
          'widgets.photosUnlockPlusAction' => 'Conhecer o Plus',
          'widgets.photosChooseAction' => 'Escolher foto',
          'widgets.photosRemoveAction' => 'Remover foto',
          'widgets.photosSavedToast' => 'Foto salva no widget.',
          'widgets.photosRemovedToast' => 'Foto removida do widget.',
          'widgets.partnerNotePageTitle' => 'Recado do parceiro',
          'widgets.partnerNoteMediumSection' => 'Médio',
          'widgets.partnerNoteReplyHint' => 'Responder com um coração',
          'widgets.partnerNoteDrawingPlaceholder' => 'desenho',
          'widgets.partnerNoteSafeNote' =>
            'Apenas recados marcados pelo seu par como visíveis no widget aparecem aqui.',
          'widgets.partnerNoteDisabledNote' =>
            'Você desativou recados do parceiro no widget. Ative abaixo se quiser exibi-los.',
          'widgets.cardEncounterPageTitle' => 'Cartão e próximo encontro',
          'widgets.cardWeeklyLabel' => 'Cartão da semana',
          'widgets.cardReadyTitle' => 'Chegou um cartão',
          'widgets.cardReadySubtitle' => 'Toque para abrir',
          'widgets.cardSentTitle' => 'Cartão enviado',
          'widgets.cardSentSubtitle' => 'Aguardando domingo',
          'widgets.cardNoneTitle' => 'Cartão de domingo',
          'widgets.cardNoneSubtitle' => 'Em preparação',
          'widgets.cardPauseTitle' => 'Pausa em andamento',
          'widgets.cardPauseSubtitle' => 'Toque quando estiver pronto',
          'widgets.nextEncounterLabel' => 'Próximo encontro',
          'widgets.nextEncounterEmptyTitle' => 'Sem data futura',
          'widgets.nextEncounterEmptySubtitle' => 'Toque para agendar',
          'widgets.cardEncounterPrivacyNote' => 'Este widget mostra apenas o estado do cartão e a próxima data — nunca nomes nem o texto do cartão.',
          'widgets.statesPageTitle' => 'Estados do widget',
          'widgets.statesAction' => 'Ver estados (discreto e sem par)',
          'widgets.statesDiscreetSection' => 'Modo discreto',
          'widgets.statesDiscreetToggle' => 'Ativar modo discreto agora',
          'widgets.statesUnpairedSection' => 'Sem parceiro',
          'widgets.statesUnpairedTitle' => 'Convide para ver aqui',
          'widgets.statesUnpairedAction' => 'Convidar',
          'widgets.statesOfflineSection' => 'Sem conexão',
          'widgets.statesOfflineTitle' => 'Mostrando o último dado',
          'widgets.statesOfflineSubtitle' => 'Atualiza quando voltar a internet',
          'widgets.statesPrecedenceNote' => 'Quando o modo discreto e o estado sem parceiro estão ativos ao mesmo tempo, o widget usa sempre a variante mais neutra (Lembrete).',
          'widgets.errors.WIDGET_PREFERENCES_SAVE_FAILED' =>
            'Não foi possível salvar as preferências agora.',
          'widgets.errors.COUPLE_PHOTO_LOAD_FAILED' =>
            'Não foi possível carregar a foto do casal agora.',
          'widgets.errors.COUPLE_PHOTO_UPLOAD_FAILED' =>
            'Não foi possível salvar a foto do casal agora.',
          'widgets.errors.COUPLE_PHOTO_REMOVE_FAILED' =>
            'Não foi possível remover a foto do casal agora.',
          'widgets.errors.COUPLE_PHOTO_INVALID' =>
            'Escolha uma imagem JPG, PNG, WebP ou HEIC de até 8 MB.',
          'widgets.errors.COUPLE_PHOTO_READ_FAILED' => 'Não foi possível ler o arquivo escolhido.',
          'widgets.errors.COUPLE_PHOTO_PICK_FAILED' => 'Não foi possível abrir o seletor de fotos.',
          'widgets.errors.COUPLE_PHOTO_SIGNED_OUT' =>
            'Entre na sua conta para escolher uma foto do casal.',
          'widgets.errors.COUPLE_PHOTO_NOT_PAIRED' =>
            'Conecte-se com seu par para escolher uma foto do casal.',
          'widgets.errors.other' => 'Não foi possível salvar as preferências agora.',
          _ => null,
        };
  }
}
