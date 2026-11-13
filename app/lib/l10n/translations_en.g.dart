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
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEn({
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
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsEn _root = this; // ignore: unused_field

  @override
  TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsEn(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _Translations$acceptInvite$en acceptInvite = _Translations$acceptInvite$en._(_root);
  @override
  late final _Translations$account$en account = _Translations$account$en._(_root);
  @override
  late final _Translations$authentication$en authentication = _Translations$authentication$en._(
    _root,
  );
  @override
  late final _Translations$capsules$en capsules = _Translations$capsules$en._(_root);
  @override
  late final _Translations$cardView$en cardView = _Translations$cardView$en._(_root);
  @override
  late final _Translations$cardsList$en cardsList = _Translations$cardsList$en._(_root);
  @override
  late final _Translations$chat$en chat = _Translations$chat$en._(_root);
  @override
  late final _Translations$checkin$en checkin = _Translations$checkin$en._(_root);
  @override
  late final _Translations$common$en common = _Translations$common$en._(_root);
  @override
  late final _Translations$connectTouch$en connectTouch = _Translations$connectTouch$en._(_root);
  @override
  late final _Translations$connectUs$en connectUs = _Translations$connectUs$en._(_root);
  @override
  late final _Translations$dateNight$en dateNight = _Translations$dateNight$en._(_root);
  @override
  late final _Translations$dates$en dates = _Translations$dates$en._(_root);
  @override
  late final _Translations$day$en day = _Translations$day$en._(_root);
  @override
  late final _Translations$devices$en devices = _Translations$devices$en._(_root);
  @override
  late final _Translations$discreet$en discreet = _Translations$discreet$en._(_root);
  @override
  late final _Translations$distance$en distance = _Translations$distance$en._(_root);
  @override
  late final _Translations$fightStyle$en fightStyle = _Translations$fightStyle$en._(_root);
  @override
  late final _Translations$firstSlip$en firstSlip = _Translations$firstSlip$en._(_root);
  @override
  late final _Translations$games$en games = _Translations$games$en._(_root);
  @override
  late final _Translations$gifts$en gifts = _Translations$gifts$en._(_root);
  @override
  late final _Translations$globalErrors$en globalErrors = _Translations$globalErrors$en._(_root);
  @override
  late final _Translations$griefSupport$en griefSupport = _Translations$griefSupport$en._(_root);
  @override
  late final _Translations$guides$en guides = _Translations$guides$en._(_root);
  @override
  late final _Translations$hardConversation$en hardConversation =
      _Translations$hardConversation$en._(_root);
  @override
  late final _Translations$heavyDay$en heavyDay = _Translations$heavyDay$en._(_root);
  @override
  late final _Translations$help$en help = _Translations$help$en._(_root);
  @override
  late final _Translations$helpSupport$en helpSupport = _Translations$helpSupport$en._(_root);
  @override
  late final _Translations$history$en history = _Translations$history$en._(_root);
  @override
  late final _Translations$ideaDetail$en ideaDetail = _Translations$ideaDetail$en._(_root);
  @override
  late final _Translations$intro$en intro = _Translations$intro$en._(_root);
  @override
  late final _Translations$invite$en invite = _Translations$invite$en._(_root);
  @override
  late final _Translations$language$en language = _Translations$language$en._(_root);
  @override
  late final _Translations$learned$en learned = _Translations$learned$en._(_root);
  @override
  late final _Translations$lists$en lists = _Translations$lists$en._(_root);
  @override
  late final _Translations$logistics$en logistics = _Translations$logistics$en._(_root);
  @override
  late final _Translations$loveStyle$en loveStyle = _Translations$loveStyle$en._(_root);
  @override
  late final _Translations$memories$en memories = _Translations$memories$en._(_root);
  @override
  late final _Translations$mood$en mood = _Translations$mood$en._(_root);
  @override
  late final _Translations$need$en need = _Translations$need$en._(_root);
  @override
  late final _Translations$notFound$en notFound = _Translations$notFound$en._(_root);
  @override
  late final _Translations$notes$en notes = _Translations$notes$en._(_root);
  @override
  late final _Translations$notificationPermission$en notificationPermission =
      _Translations$notificationPermission$en._(_root);
  @override
  late final _Translations$notificationPreferences$en notificationPreferences =
      _Translations$notificationPreferences$en._(_root);
  @override
  late final _Translations$partnerProfile$en partnerProfile = _Translations$partnerProfile$en._(
    _root,
  );
  @override
  late final _Translations$partnerStep$en partnerStep = _Translations$partnerStep$en._(_root);
  @override
  late final _Translations$pause$en pause = _Translations$pause$en._(_root);
  @override
  late final _Translations$places$en places = _Translations$places$en._(_root);
  @override
  late final _Translations$plus$en plus = _Translations$plus$en._(_root);
  @override
  late final _Translations$privacy$en privacy = _Translations$privacy$en._(_root);
  @override
  late final _Translations$profileDetails$en profileDetails = _Translations$profileDetails$en._(
    _root,
  );
  @override
  late final _Translations$profileSetup$en profileSetup = _Translations$profileSetup$en._(_root);
  @override
  late final _Translations$programs$en programs = _Translations$programs$en._(_root);
  @override
  late final _Translations$questions$en questions = _Translations$questions$en._(_root);
  @override
  late final _Translations$questionsEntry$en questionsEntry = _Translations$questionsEntry$en._(
    _root,
  );
  @override
  late final _Translations$quickSlip$en quickSlip = _Translations$quickSlip$en._(_root);
  @override
  late final _Translations$received$en received = _Translations$received$en._(_root);
  @override
  late final _Translations$relationshipChanged$en relationshipChanged =
      _Translations$relationshipChanged$en._(_root);
  @override
  late final _Translations$relationshipSettings$en relationshipSettings =
      _Translations$relationshipSettings$en._(_root);
  @override
  late final _Translations$reminders$en reminders = _Translations$reminders$en._(_root);
  @override
  late final _Translations$repair$en repair = _Translations$repair$en._(_root);
  @override
  late final _Translations$rituals$en rituals = _Translations$rituals$en._(_root);
  @override
  late final _Translations$safeMode$en safeMode = _Translations$safeMode$en._(_root);
  @override
  late final _Translations$safety$en safety = _Translations$safety$en._(_root);
  @override
  late final _Translations$sessionExpired$en sessionExpired = _Translations$sessionExpired$en._(
    _root,
  );
  @override
  late final _Translations$settingsHome$en settingsHome = _Translations$settingsHome$en._(_root);
  @override
  late final _Translations$slipDetail$en slipDetail = _Translations$slipDetail$en._(_root);
  @override
  late final _Translations$slipKind$en slipKind = _Translations$slipKind$en._(_root);
  @override
  late final _Translations$slipsList$en slipsList = _Translations$slipsList$en._(_root);
  @override
  late final _Translations$spice$en spice = _Translations$spice$en._(_root);
  @override
  late final _Translations$story$en story = _Translations$story$en._(_root);
  @override
  late final _Translations$sundayCard$en sundayCard = _Translations$sundayCard$en._(_root);
  @override
  late final _Translations$tabs$en tabs = _Translations$tabs$en._(_root);
  @override
  late final _Translations$temperature$en temperature = _Translations$temperature$en._(_root);
  @override
  late final _Translations$timeInApp$en timeInApp = _Translations$timeInApp$en._(_root);
  @override
  late final _Translations$today$en today = _Translations$today$en._(_root);
  @override
  late final _Translations$unpair$en unpair = _Translations$unpair$en._(_root);
  @override
  late final _Translations$welcome$en welcome = _Translations$welcome$en._(_root);
  @override
  late final _Translations$widgets$en widgets = _Translations$widgets$en._(_root);
}

// Path: acceptInvite
class _Translations$acceptInvite$en extends Translations$acceptInvite$pt {
  _Translations$acceptInvite$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Got an invite?';
  @override
  String get titleHighlight => 'invite';
  @override
  String get subtitle => 'Type the code the other person sent so you can connect.';
  @override
  String get codeLabel => 'Invite code';
  @override
  String get codeHint => 'ABCD2345';
  @override
  Map<String, String> get codeErrors => {
    'empty': 'Type the invite code.',
    'tooShort': 'The code has 8 characters.',
    'tooLong': 'The code has 8 characters.',
    'invalid': 'Use letters and numbers only.',
  };
  @override
  String get privacyNote => 'Accepting shares cards and tools. Your private notes stay private.';
  @override
  String get accept => 'Accept';
  @override
  late final _Translations$acceptInvite$connected$en connected =
      _Translations$acceptInvite$connected$en._(_root);
  @override
  late final _Translations$acceptInvite$unusable$en unusable =
      _Translations$acceptInvite$unusable$en._(_root);
  @override
  Map<String, String> get errors => {
    'ALREADY_PAIRED': 'You are already connected with someone.',
    'COUPLE_FULL': 'That space already has two people.',
    'RATE_LIMITED': 'Too many tries in a row. Wait a bit and try again.',
    'NETWORK': 'No connection. Check your internet and try again.',
    'other': 'Could not connect right now. Try again.',
  };
}

// Path: account
class _Translations$account$en extends Translations$account$pt {
  _Translations$account$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get deleteTitle => 'Delete account';
  @override
  String get deleteHighlight => 'account';
  @override
  String get deleteText => 'Your data is erased after 14 days. This needs a fresh sign-in.';
  @override
  String get deleteWarningTitle => 'This also ends the link';
  @override
  String deleteWarning({required Object name}) => 'This also ends the link with ${name}.';
  @override
  String get deleteWarningNoPartner => 'This also ends the link with your partner.';
  @override
  String get deleteAction => 'Delete account';
  @override
  String get deleteConfirmTitle => 'Delete your account?';
  @override
  String get deleteConfirmText =>
      'You have 14 days to change your mind. After that, nothing can be recovered.';
  @override
  String get reauthReason => 'Confirm to delete your account.';
  @override
  String pendingTitle({required Object month, required Object day}) =>
      'Deletion on ${month} ${day}';
  @override
  String pendingHighlight({required Object month, required Object day}) => '${month} ${day}';
  @override
  String get pendingText => 'You can cancel before that.';
  @override
  String get pendingCancel => 'Cancel deletion';
  @override
  String get signOutTitle => 'Sign out?';
  @override
  String get signOutText => 'Remove the local data too?';
  @override
  String signOutPending({required Object count}) =>
      'You have ${count} slips that were not sent yet. Signing out and removing data erases them.';
  @override
  String get signOut => 'Sign out';
  @override
  String get signOutRemove => 'Sign out and remove data';
  @override
  List<String> get months => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many tries in a row. Wait a moment.',
    'other': 'Could not finish now. Try again.',
  };
}

// Path: authentication
class _Translations$authentication$en extends Translations$authentication$pt {
  _Translations$authentication$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get signInTitle => 'Sign in';
  @override
  String get signInSubtitle => 'No email and password. Just Apple or Google.';
  @override
  String get signInNote => 'Signing in takes you straight to your Today.';
  @override
  String get existingAccountTitle => 'You already have an account';
  @override
  String get existingAccountSubtitle => 'Sign in to pick up where you left off.';
  @override
  String get continueWithApple => 'Continue with Apple';
  @override
  String get continueWithGoogle => 'Continue with Google';
  @override
  Map<String, String> get errors => {
    'NETWORK': 'No connection. Check your internet and try again.',
    'other': 'Could not sign you in right now. Try again.',
  };
}

// Path: capsules
class _Translations$capsules$en extends Translations$capsules$pt {
  _Translations$capsules$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Time capsule';
  @override
  String get text =>
      'Write something to be opened on a future date. Until then nobody reads it, not even you.';
  @override
  String get bodyHint => 'What do you want to say to the future?';
  @override
  Map<String, String> get bodyErrors => {
    'empty': 'Write the message',
    'tooLong': 'The message is too long',
  };
  @override
  String get dateLabel => 'Opens on';
  @override
  String get dateHint => 'Pick a date';
  @override
  Map<String, String> get dateErrors => {
    'empty': 'Pick the day it opens',
    'outOfRange': 'Pick a date between a week and 50 years ahead',
  };
  @override
  String dateFormat({required Object month, required Object day, required Object year}) =>
      '${month} ${day}, ${year}';
  @override
  List<String> get months => [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  String get sharedLabel => 'For both of us';
  @override
  String get sharedText => 'Your partner reads it too when the date comes. Off, only you read it.';
  @override
  String get save => 'Save capsule';
  @override
  String get saved => 'Capsule saved';
  @override
  String closedUntil({required Object date}) => 'Closed until ${date}';
  @override
  String get ownerSharedBy => 'Yours, for both';
  @override
  String get ownerPrivate => 'Only yours';
  @override
  String get fromPartner => 'From your partner';
  @override
  String get delete => 'Delete';
  @override
  String get deleteTitle => 'Delete this capsule?';
  @override
  String get deleteText => 'It will be gone before anyone reads it. This cannot be undone.';
  @override
  String get deleteConfirm => 'Delete';
  @override
  String get emptyTitle => 'No capsules yet';
  @override
  String get emptyText => 'Write one and choose the day it opens.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Your capsules are still saved. Try again.';
  @override
  Map<String, String> get errors => {
    'CAPSULE_OPENS_TOO_SOON': 'Pick a date at least a week ahead.',
    'CAPSULE_OPENS_TOO_FAR': 'Pick a date within the next 50 years.',
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t save right now. Your text is still here.',
  };
  @override
  Map<String, String> get deleteErrors => {
    'other': 'Couldn\'t delete this capsule. It\'s still here.',
  };
}

// Path: cardView
class _Translations$cardView$en extends Translations$cardView$pt {
  _Translations$cardView$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String forPartner({required Object name}) => 'For ${name}';
  @override
  String get forPartnerNoName => 'For your person';
  @override
  String goodThings({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        zero: 'No good things yet',
        one: '1 good thing this week',
        other: '${count} good things this week',
      );
  @override
  List<String> get weekdays => ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
  @override
  Map<String, String> get categories => {
    'said': 'said something',
    'did': 'did something',
    'noticed': 'noticed me',
    'helped': 'helped me',
    'other': '',
  };
}

// Path: cardsList
class _Translations$cardsList$en extends Translations$cardsList$pt {
  _Translations$cardsList$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Past cards';
  @override
  String dateShort({required Object month, required Object day}) => '${month} ${day}';
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  String slipCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        zero: 'no slips',
        one: '1 slip',
        other: '${count} slips',
      );
  @override
  String get sent => 'Sent';
  @override
  String get received => 'Received';
  @override
  String get opened => 'opened';
  @override
  String get reacted => 'reaction';
  @override
  String get replied => 'replied';
  @override
  String get emptyTitle => 'No cards yet';
  @override
  String get emptyText => 'When a card is sent or arrives, it shows up here. No rush.';
  @override
  String get errorTitle => 'Could not load the cards';
  @override
  String get errorText => 'They are still saved. Try again.';
  @override
  String get detailTitle => 'Card';
  @override
  String get detailErrorTitle => 'Could not open the card';
  @override
  Map<String, String> get errors => {
    'CARD_NOT_FOUND': 'That card is no longer available.',
    'other': 'It is still saved. Try again.',
  };
  @override
  String get reactionPrompt => 'How do you want to reply?';
  @override
  String get reactionThankYou => 'Thank you';
  @override
  String get reactionHug => 'Hug';
  @override
  String get reactionMadeMyDay => 'Made my day';
  @override
  String get reactionNoted => 'Noted';
  @override
  String get reactionError => 'Could not reply right now. Try again.';
  @override
  String responseReceivedName({required Object name}) => '${name}';
  @override
  String get responseReceivedNoName => 'Your person replied';
  @override
  String get responseReceivedVerb => 'replied';
  @override
  String responseQuote({required Object label}) => '“${label}”';
  @override
  String get notFound => 'That card is no longer available.';
  @override
  String get reactionQuoteMadeMyDay => 'That made my week.';
}

// Path: chat
class _Translations$chat$en extends Translations$chat$pt {
  _Translations$chat$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Mascot';
  @override
  String get consentText =>
      'A calm conversation with the mascot, to sort out what you feel. It does not replace professional help and never takes sides.';
  @override
  String get consentPrivacy =>
      'What you write is sent to an AI model only to produce the reply. Nothing from the conversation is kept, unless you turn a reply into a slip.';
  @override
  String get consentTurnOn => 'Turn on the chat';
  @override
  String get emptyHint => 'Say how you are, or start with something small.';
  @override
  String get inputHint => 'Write here';
  @override
  Map<String, String> get draftErrors => {
    'empty': 'Write something to send',
    'tooLong': 'This message is too long',
  };
  @override
  String get send => 'Send';
  @override
  String messagesLeft({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 message left today',
        other: '${count} messages left today',
      );
  @override
  String get saveAsSlip => 'Make it a slip';
  @override
  String get slipSaved => 'Slip saved';
  @override
  String get saveLearning => 'Save as learning';
  @override
  String get learningSheetTitle => 'Save as learning';
  @override
  String get learningSheetTarget => 'What is it about?';
  @override
  String get learningSheetHint => 'What you want to keep';
  @override
  Map<String, String> get learningTextErrors => {
    'empty': 'Write what you want to keep',
    'tooLong': 'This is too long',
  };
  @override
  String get learningSave => 'Save';
  @override
  String get learningSaved => 'Learning saved';
  @override
  String get learnedLink => 'What I learned';
  @override
  String get settingsTitle => 'Conversation settings';
  @override
  String get toggleLabel => 'Talk with the mascot';
  @override
  String get toggleSubtitle => 'Only you decide when the conversation is on.';
  @override
  String get planPlus => 'Plus plan';
  @override
  String get planFree => 'Free plan';
  @override
  String usagePlus({required Object left, required Object limit}) =>
      '${left} of ${limit} messages left today';
  @override
  String get usageFree => 'The chat is part of Plus. The free plan has no messages.';
  @override
  String get sendingTitle => 'What is sent';
  @override
  String get sendingText =>
      'Only the text you type and the last turns of the conversation go to the model, to produce the reply. Nothing is stored unless you save it as a slip or a learning.';
  @override
  String get disableNote =>
      'Turning it off brings back the consent step. The next message is only sent after you turn it on again.';
  @override
  String get settingsOn => 'Chat turned on';
  @override
  String get settingsOff => 'Chat turned off';
  @override
  String get offline => 'You\'re offline. The chat resumes when you reconnect.';
  @override
  String get interrupted => 'The reply was interrupted.';
  @override
  String get retry => 'Try again';
  @override
  String get limitTitle => 'Today\'s messages are used up';
  @override
  String get limitText => 'Come back tomorrow, or see Plus to talk more.';
  @override
  String get plusTitle => 'The chat is part of Plus';
  @override
  String get plusText => 'The mascot is available on Plus, with 20 messages a day.';
  @override
  String get crisisTitle => 'You are not alone';
  @override
  String get crisisText =>
      'It sounds like you are going through something very heavy. If you are in danger right now, call your local emergency service or reach someone you trust. I am not the right help for this.';
  @override
  String get crisisSafeMode => 'Hide the app (safe mode)';
  @override
  String get unavailableTitle => 'The chat is not available right now';
  @override
  String get unavailableText => 'Try again later.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Try again in a moment.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
  @override
  String get starterHard => 'A hard moment';
  @override
  String get starterIdea => 'An idea';
  @override
  String get starterPlan => 'A date plan';
  @override
  String get menuLabel => 'More options';
}

// Path: checkin
class _Translations$checkin$en extends Translations$checkin$pt {
  _Translations$checkin$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Weekly check-in';
  @override
  String get titleHighlight => 'Weekly';
  @override
  String get introSubtitle => 'Ten minutes. Each of you answers privately first.';
  @override
  String get start => 'Start';
  @override
  String get notThisWeek => 'Not this week';
  @override
  String questionOf({required Object current, required Object total}) =>
      'Question ${current} of ${total}';
  @override
  List<String> get questions => [
    'What was good this week?',
    'What do you want us to do together?',
    'Did anything weigh on you this week?',
    'What do you want me to know?',
  ];
  @override
  String get answerHint => 'Write as much or as little as you want.';
  @override
  String get privateNote => 'Answers stay hidden until both of you finish.';
  @override
  String get next => 'Next';
  @override
  String get finish => 'Finish';
  @override
  String get skip => 'Skip this question';
  @override
  String get skipNote =>
      'Skipping leaves this question blank. The check-in only appears when both of you answer all four.';
  @override
  String get waitingTitle => 'Your answers are kept';
  @override
  String get waitingText => 'Answers appear when both of you have answered all four.';
  @override
  String get waitingIncomplete =>
      'Some questions are still blank. Answers appear when both of you answer all four.';
  @override
  String get answerMissing => 'Answer the missing ones';
  @override
  String get checkAgain => 'Check again';
  @override
  String get review => 'Review my answers';
  @override
  String get discardTitle => 'Discard this answer?';
  @override
  String get discardText => 'The text you wrote was not saved.';
  @override
  String get discard => 'Discard';
  @override
  String get keepWriting => 'Keep writing';
  @override
  String get revealTitle => 'Your answers together';
  @override
  String get revealHighlight => 'together';
  @override
  String get revealSubtitle =>
      'Now that you both finished, both answers to each question are shown.';
  @override
  String get revealNote => 'No scores. Just what each of you wrote.';
  @override
  String get you => 'You';
  @override
  String get partnerFallback => 'Your partner';
  @override
  String get skippedAnswer => 'Skipped this question';
  @override
  String get close => 'Close';
  @override
  String get soloTitle => 'The check-in is for both of you';
  @override
  String get soloText => 'When your person joins, the weekly check-in shows up here.';
  @override
  String get loadErrorTitle => 'Couldn\'t open the check-in';
  @override
  String get loadErrorText => 'Nothing was lost. Try again.';
  @override
  Map<String, String> get errors => {'other': 'Couldn\'t save that now. Try again.'};
}

// Path: common
class _Translations$common$en extends Translations$common$pt {
  _Translations$common$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get appName => 'Flutter Bloc Starter';
  @override
  String get send => 'Send';
  @override
  String get save => 'Save';
  @override
  String get retry => 'Retry';
  @override
  String get loading => 'Loading';
  @override
  String get username => 'Username';
  @override
  String get email => 'Email';
  @override
  String get password => 'Password';
  @override
  String get firstName => 'First Name';
  @override
  String get lastName => 'Last Name';
  @override
  String get genericError => 'Something went wrong';
  @override
  String get discardTitle => 'Discard changes?';
  @override
  String get discardText => 'What you wrote won\'t be saved.';
  @override
  String get discard => 'Discard';
  @override
  String get keepWriting => 'Keep writing';
}

// Path: connectTouch
class _Translations$connectTouch$en extends Translations$connectTouch$pt {
  _Translations$connectTouch$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Touch';
  @override
  String get text => 'Neutral cards, nothing spicy. Do it or skip it, no pressure.';
  @override
  String get switchTitle => 'Touch topics';
  @override
  String get switchText => 'Applies to both of you: if one turns it off, it goes away for both.';
  @override
  String get offTitle => 'Touch topics are off';
  @override
  String get offText =>
      'You or your partner turned them off. You can turn them back on here anytime.';
  @override
  String get emptyTitle => 'No cards right now';
  @override
  String get emptyText => 'Come back later.';
  @override
  String get done => 'Done';
  @override
  String get skip => 'Skip';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Try again in a moment.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t change that right now. Try again.',
  };
}

// Path: connectUs
class _Translations$connectUs$en extends Translations$connectUs$pt {
  _Translations$connectUs$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Us';
  @override
  String get text =>
      'Send “I miss us” with one tap. Light, no guilt. Your partner doesn\'t have to answer.';
  @override
  String get send => 'Send with care';
  @override
  String get plan => 'Suggest a small plan';
  @override
  String get sentNote => 'Sent. No rush to reply.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t send right now. Try again.',
  };
}

// Path: dateNight
class _Translations$dateNight$en extends Translations$dateNight$pt {
  _Translations$dateNight$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Date night';
  @override
  String get subtitle => 'Ideas for the two of you, picked together.';
  @override
  String get hint => 'E.g. picnic in the park';
  @override
  String get add => 'Add';
  @override
  String get save => 'Save';
  @override
  String get nextTitle => 'Next date';
  @override
  String get ideasTitle => 'Ideas';
  @override
  String get suggestionsTitle => 'To start with';
  @override
  String plannedFor({required Object month, required Object day}) => '${month} ${day}';
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  Map<String, String> get planChoices => {
    'today': 'Plan for today',
    'tomorrow': 'Plan for tomorrow',
    'saturday': 'Plan for Saturday',
    'sunday': 'Plan for Sunday',
    'other': '',
  };
  @override
  String get markDone => 'We did it';
  @override
  String get reopen => 'Back to ideas';
  @override
  String get done => 'Done';
  @override
  String get delete => 'Delete';
  @override
  String get emptyTitle => 'No ideas yet';
  @override
  String get emptyText => 'Write a date idea. You both see it.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Your ideas are still saved. Try again.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
}

// Path: dates
class _Translations$dates$en extends Translations$dates$pt {
  _Translations$dates$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Dates';
  @override
  String get segmentDates => 'Dates';
  @override
  String get segmentGifts => 'Gifts';
  @override
  String get segmentHolidays => 'Holidays';
  @override
  String get titleLabel => 'Name';
  @override
  String get titleHint => 'E.g. their birthday';
  @override
  Map<String, String> get titleErrors => {
    'empty': 'Give this date a name',
    'tooLong': 'The name is too long',
  };
  @override
  Map<String, String> get kinds => {
    'relationship': 'Relationship',
    'birthday': 'Birthday',
    'first': 'A first time',
    'trip': 'Trip',
    'custom': 'Other',
    'holiday': 'Holiday',
    'reunion': 'Reunion',
    'other': '',
  };
  @override
  String get monthLabel => 'Month';
  @override
  String get dayLabel => 'Day';
  @override
  String get yearLabel => 'Year (optional)';
  @override
  String get yearHint => 'E.g. 1994';
  @override
  String get yearHelp => 'Without the year the date just repeats, with no age.';
  @override
  Map<String, String> get yearErrors => {'invalid': 'Use a year between 1900 and 2200'};
  @override
  List<String> get months => [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  String dayLine({required Object month, required Object day, required Object kind}) =>
      '${month} ${day} · ${kind}';
  @override
  String dayOnly({required Object month, required Object day}) => '${month} ${day}';
  @override
  String get saveDate => 'Save date';
  @override
  String get delete => 'Delete';
  @override
  String get deleteTitle => 'Delete this date?';
  @override
  String get deleteText => 'It disappears from the calendar for both of you.';
  @override
  String get deleteConfirm => 'Delete';
  @override
  String get add => 'Add';
  @override
  String get emptyDatesTitle => 'No dates yet';
  @override
  String get emptyDatesText => 'Keep birthdays and dates that matter. We remind you ahead.';
  @override
  String get giftsPrivate => 'Gift ideas only you see.';
  @override
  String get giftHint => 'E.g. book of poems';
  @override
  Map<String, String> get giftErrors => {
    'empty': 'Write the gift idea',
    'tooLong': 'The gift idea is too long',
  };
  @override
  String get given => 'Given';
  @override
  String get emptyGiftsTitle => 'No ideas yet';
  @override
  String get emptyGiftsText => 'Jot down gifts when you think of them.';
  @override
  String get emptyHolidaysTitle => 'No holidays here';
  @override
  String get emptyHolidaysText => 'The calendar has no holidays for you yet.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Your data is still saved. Try again.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
}

// Path: day
class _Translations$day$en extends Translations$day$pt {
  _Translations$day$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String dateLine({required Object month, required Object day, required Object year}) =>
      '${month} ${day}, ${year}';
  @override
  List<String> get months => [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  String get previous => 'Previous day';
  @override
  String get next => 'Next day';
  @override
  String get planned => 'Planned date';
  @override
  String get emptyTitle => 'Nothing set for this day';
  @override
  String get emptyText => 'A free day is good too.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Try again in a moment.';
}

// Path: devices
class _Translations$devices$en extends Translations$devices$pt {
  _Translations$devices$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Notification devices';
  @override
  String get subtitle =>
      'Phones that receive notifications for this account. Removing one stops its notifications.';
  @override
  String get current => 'This device';
  @override
  String registeredToday({required Object time}) => 'Registered today at ${time}';
  @override
  String registeredYesterday({required Object time}) => 'Registered yesterday at ${time}';
  @override
  String registeredOn({required Object date}) => 'Registered on ${date}';
  @override
  String get platformIos => 'iPhone';
  @override
  String get platformAndroid => 'Android';
  @override
  String get revokeTitle => 'Stop notifications on this device?';
  @override
  String revokeText({required Object name}) =>
      '${name} will stop receiving notifications for this account.';
  @override
  String get revokeConfirm => 'Stop notifications';
  @override
  String get revoked => 'Notifications stopped on that device.';
  @override
  String get emptyTitle => 'No notification devices';
  @override
  String get emptyText => 'Devices that receive notifications for this account appear here.';
  @override
  Map<String, String> get errors => {
    'NETWORK': 'No connection. Try again when you are back online.',
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'DEVICE_REVOKE_FAILED': 'Couldn\'t stop notifications on that device. Try again.',
    'other': 'Couldn\'t stop notifications on that device. Try again.',
  };
}

// Path: discreet
class _Translations$discreet$en extends Translations$discreet$pt {
  _Translations$discreet$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Discreet mode';
  @override
  String get neutralIcon => 'Neutral icon';
  @override
  String get neutralNotifications => 'Neutral notifications';
  @override
  String get hideWidgetText => 'Hide widget text';
  @override
  String get note =>
      'Hides names and content in notifications and widgets. No couple photo on the icon.';
  @override
  String get saveError => 'Could not save now. Try again.';
}

// Path: distance
class _Translations$distance$en extends Translations$distance$pt {
  _Translations$distance$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Distance';
  @override
  String get text => 'Two clocks, each in its own time zone, never mixed up.';
  @override
  String get you => 'You';
  @override
  String get partner => 'Your partner';
  @override
  String get noPartner => 'When your partner joins, their clock shows up here.';
  @override
  String get sameZone => 'You are in the same time zone for now.';
  @override
  String reunionDays({required Object n}) => '${n} days until you see each other';
  @override
  String get reunionToday => 'You see each other today';
  @override
  String get reunionTomorrow => 'You see each other tomorrow';
  @override
  String get noReunionTitle => 'No reunion date';
  @override
  String get noReunionText => 'Save a “Reunion” in your dates and the countdown shows here.';
  @override
  String get addReunion => 'Save a date';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Try again in a moment.';
}

// Path: fightStyle
class _Translations$fightStyle$en extends Translations$fightStyle$pt {
  _Translations$fightStyle$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get exerciseTitle => 'How I react in a fight';
  @override
  String get exerciseHighlight => 'react';
  @override
  String get exerciseSubtitle => 'Six quick questions, just for you.';
  @override
  String questionOf({required Object current, required Object total}) =>
      'Question ${current} of ${total}';
  @override
  List<String> get questions => [
    'When the conversation heats up, what do you do first?',
    'If your partner goes quiet mid-fight, you...',
    'After an argument, what usually happens?',
    'What bothers you most in a fight?',
    'When you notice you went too far, you...',
    'What helps you feel normal again?',
  ];
  @override
  Map<String, String> get options1 => {
    'pursue': 'I keep talking until it\'s settled.',
    'withdraw': 'I need some time before going on.',
    'repair': 'I try to lighten the mood.',
    'avoid': 'I change the subject so it doesn\'t get worse.',
    'other': '',
  };
  @override
  Map<String, String> get options2 => {
    'pursue': 'I push for them to speak.',
    'withdraw': 'I go quiet too.',
    'repair': 'I calmly ask what happened.',
    'avoid': 'I leave it for later.',
    'other': '',
  };
  @override
  Map<String, String> get options3 => {
    'pursue': 'I look for the conversation right away.',
    'withdraw': 'I spend some time alone.',
    'repair': 'I think about what I can fix.',
    'avoid': 'I\'d rather not go back to it.',
    'other': '',
  };
  @override
  Map<String, String> get options4 => {
    'pursue': 'Getting no answer.',
    'withdraw': 'Feeling pressured.',
    'repair': 'Seeing that we don\'t understand each other.',
    'avoid': 'The conversation dragging on.',
    'other': '',
  };
  @override
  Map<String, String> get options5 => {
    'pursue': 'I talk even more to explain.',
    'withdraw': 'I close up until I calm down.',
    'repair': 'I apologize or suggest a way to fix it.',
    'avoid': 'I wait for it to cool down.',
    'other': '',
  };
  @override
  Map<String, String> get options6 => {
    'pursue': 'Finishing the conversation.',
    'withdraw': 'Some quiet time.',
    'repair': 'A small gesture of care.',
    'avoid': 'Carrying on with the day as if nothing happened.',
    'other': '',
  };
  @override
  String get continueAction => 'Continue';
  @override
  String get finishAction => 'See result';
  @override
  String get back => 'Back';
  @override
  String get privateNote => 'Only you see your answers. Nothing is sent to your partner.';
  @override
  String get resultTitle => 'How you usually react';
  @override
  String get resultHighlight => 'react';
  @override
  String get patternTag => 'Your pattern';
  @override
  Map<String, String> get descriptions => {
    'pursue': 'You tend to seek the conversation right away, even while things are still hot.',
    'withdraw': 'You tend to step back first and come back later.',
    'repair': 'You tend to look for a way to fix things soon after a fight.',
    'avoid': 'You tend to set the subject aside so it doesn\'t get worse in the moment.',
    'other': '',
  };
  @override
  Map<String, String> get practices => {
    'pursue': 'That helps you sort it out fast. Pausing before it gets worse and listening to the end is worth it.',
    'withdraw': 'That helps you pause before it gets worse. Pick a set way to come back.',
    'repair': 'That helps you return after a fight. A short apology often does it.',
    'avoid': 'That helps you pause before it gets worse. Choose a short moment to come back to it.',
    'other': '',
  };
  @override
  String partnerSignal({required Object name}) => 'Agree on a signal with ${name} to come back.';
  @override
  String get addToTools => 'Add to my repair tools';
  @override
  String get addedToTools => 'Already in your repair tools';
  @override
  String get keepMine => 'Keep it to myself';
  @override
  String get retake => 'Take it again';
  @override
  String get addedToast => 'Added to your repair tools.';
  @override
  String get loadErrorTitle => 'Couldn\'t load';
  @override
  String get loadErrorText => 'Couldn\'t open your result right now. Try again.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t save right now. Your answers are still here.',
  };
  @override
  Map<String, String> get addErrors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t add it right now. Try again.',
  };
}

// Path: firstSlip
class _Translations$firstSlip$en extends Translations$firstSlip$pt {
  _Translations$firstSlip$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Start with one good thing';
  @override
  String get titleHighlight => 'one good thing';
  @override
  String get subtitle =>
      'What did your partner do lately that made you smile? 30 seconds is enough. No account yet.';
  @override
  String get hint => 'E.g. made coffee before I woke up';
  @override
  Map<String, String> get textErrors => {
    'empty': 'Write one good thing first.',
    'tooLong': 'Use at most 140 characters.',
  };
  @override
  String get localNote => 'Stays saved on this phone only.';
  @override
  String get save => 'Save';
  @override
  String get saveError => 'Could not keep it right now. Try again.';
}

// Path: games
class _Translations$games$en extends Translations$games$pt {
  _Translations$games$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$games$hub$en hub = _Translations$games$hub$en._(_root);
  @override
  late final _Translations$games$kinds$en kinds = _Translations$games$kinds$en._(_root);
  @override
  late final _Translations$games$start$en start = _Translations$games$start$en._(_root);
  @override
  late final _Translations$games$invitation$en invitation = _Translations$games$invitation$en._(
    _root,
  );
  @override
  late final _Translations$games$waiting$en waiting = _Translations$games$waiting$en._(_root);
  @override
  late final _Translations$games$active$en active = _Translations$games$active$en._(_root);
  @override
  late final _Translations$games$playing$en playing = _Translations$games$playing$en._(_root);
  @override
  late final _Translations$games$date$en date = _Translations$games$date$en._(_root);
  @override
  Map<String, String> get reflections => {
    'great': 'It was great',
    'ok': 'It was nice',
    'did_not_happen': 'It did not happen',
    'other': 'No answer',
  };
  @override
  late final _Translations$games$waitingPartner$en waitingPartner =
      _Translations$games$waitingPartner$en._(_root);
  @override
  late final _Translations$games$finished$en finished = _Translations$games$finished$en._(_root);
  @override
  late final _Translations$games$notFound$en notFound = _Translations$games$notFound$en._(_root);
  @override
  late final _Translations$games$cancel$en cancel = _Translations$games$cancel$en._(_root);
  @override
  late final _Translations$games$noPartner$en noPartner = _Translations$games$noPartner$en._(_root);
  @override
  late final _Translations$games$common$en common = _Translations$games$common$en._(_root);
  @override
  String get loadErrorTitle => 'Could not open the game';
  @override
  String get loadErrorText => 'Nothing was lost. Try again.';
  @override
  Map<String, String> get errors => {
    'NOT_PAIRED': 'Games need both of you connected.',
    'NOT_FOUND': 'That game no longer exists. We\'ll refresh.',
    'INVALID_GAME_ACTION': 'That game changed. We\'ll refresh.',
    'GAME_ALREADY_OPEN': 'A game is already open. Finish or cancel it before inviting again.',
    'GAME_NOT_COMPLETE': 'Your partner is still answering. Try again when they finish.',
    'INVALID_GAME_INDEX': 'That question changed. We\'ll refresh.',
    'other': 'Could not do that right now. Try again.',
  };
}

// Path: gifts
class _Translations$gifts$en extends Translations$gifts$pt {
  _Translations$gifts$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Gift page';
  @override
  String get subtitle => 'A page your partner can see in the app. You choose what to share.';
  @override
  String get myTitle => 'My wishes';
  @override
  String get partnerTitle => 'From your partner';
  @override
  String get emptyPageTitle => 'No wishes yet';
  @override
  String get emptyPageTextShared => 'Add a wish, or wait for your partner to share one.';
  @override
  String get emptyPageTextSolo =>
      'Add what you would love to receive. It stays private until you pair.';
  @override
  String get emptyMineTitle => 'No wishes yet';
  @override
  String get emptyMineText => 'Add what you would love to receive.';
  @override
  String get emptyPartnerTitle => 'Nothing shared yet';
  @override
  String get emptyPartnerText => 'When your partner shares a wish, it shows up here.';
  @override
  String get addTitle => 'New wish';
  @override
  String get editTitle => 'Edit wish';
  @override
  String get titleLabel => 'Gift';
  @override
  String get titleHint => 'E.g. a book of poems';
  @override
  Map<String, String> get titleErrors => {
    'empty': 'Give the wish a name.',
    'tooLong': 'Keep it to 120 characters or fewer.',
  };
  @override
  String get noteHint => 'Size, color, where to find it.';
  @override
  Map<String, String> get noteErrors => {'tooLong': 'Keep the note under 1000 characters.'};
  @override
  String get budgetLabel => 'Budget (optional)';
  @override
  Map<String, String> get budgets => {
    'free': 'Free',
    'low': 'Low',
    'medium': 'Medium',
    'high': 'High',
    'other': '',
  };
  @override
  String get noBudget => 'No budget';
  @override
  String get shared => 'Shared';
  @override
  String get private => 'Private';
  @override
  String get sharedHint => 'Your partner can see this wish.';
  @override
  String get privateHint => 'Only you can see this wish.';
  @override
  String get sharedNeedsPartner => 'Pair with your partner to share a wish.';
  @override
  String get save => 'Save';
  @override
  String get add => 'Add';
  @override
  String get delete => 'Delete';
  @override
  String get deleteTitle => 'Delete this wish?';
  @override
  String get deleteText => 'It disappears for you and your partner.';
  @override
  String get deleteConfirm => 'Delete';
  @override
  String get entryLabel => 'GIFTS';
  @override
  String get entryTitle => 'Gift page';
  @override
  String get entryText => 'Wishes you choose to share, or keep to yourself.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
}

// Path: globalErrors
class _Translations$globalErrors$en extends Translations$globalErrors$pt {
  _Translations$globalErrors$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get offline => 'No connection. Your notes stay saved and sync later.';
  @override
  String get errorTitle => 'Something went wrong';
  @override
  String get errorText => 'Try again in a moment.';
  @override
  String get networkTitle => 'No connection';
  @override
  String get networkText => 'Check the connection and try again.';
  @override
  String get timeoutTitle => 'The connection took too long';
  @override
  String get timeoutText => 'Try again in a moment.';
  @override
  String get rateTitle => 'Easy there';
  @override
  String get rateText => 'Too many tries in a row. Wait a little and try again.';
  @override
  String get notFoundTitle => 'Not found';
  @override
  String get notFoundText => 'Maybe this is no longer available.';
  @override
  String get retry => 'Try again';
  @override
  String retryIn({required Object seconds}) => 'Try in ${seconds}s';
  @override
  String get updateTitle => 'Update the app';
  @override
  String get updateHighlight => 'app';
  @override
  String get updateText => 'There is a new version. Update to continue.';
  @override
  String get updateAction => 'Update';
  @override
  String get updateUnavailable => 'Could not open the store. Update there.';
}

// Path: griefSupport
class _Translations$griefSupport$en extends Translations$griefSupport$pt {
  _Translations$griefSupport$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'We\'re with you';
  @override
  String get highlight => 'you';
  @override
  String get text => 'Your memories stay here, at your pace.';
  @override
  String get seeSupport => 'See support';
  @override
  String get backHome => 'Back to the start';
}

// Path: guides
class _Translations$guides$en extends Translations$guides$pt {
  _Translations$guides$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$guides$hub$en hub = _Translations$guides$hub$en._(_root);
  @override
  late final _Translations$guides$viewer$en viewer = _Translations$guides$viewer$en._(_root);
  @override
  late final _Translations$guides$gate$en gate = _Translations$guides$gate$en._(_root);
  @override
  late final _Translations$guides$finish$en finish = _Translations$guides$finish$en._(_root);
}

// Path: hardConversation
class _Translations$hardConversation$en extends Translations$hardConversation$pt {
  _Translations$hardConversation$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Prepare a hard conversation';
  @override
  String stepOf({required Object current, required Object total}) => 'Step ${current} of ${total}';
  @override
  String get whatTitle => 'What happened?';
  @override
  String get whatHint => 'If you want, tell me in your own words';
  @override
  String get whatIgnored => 'She felt ignored';
  @override
  String get whatMoney => 'We fought about money';
  @override
  String get whatMisunderstanding => 'It was a misunderstanding';
  @override
  String get whatOther => 'Other: write it';
  @override
  String get needTitle => 'What do I need?';
  @override
  String get needHint => 'If you want, add something';
  @override
  String get needHeard => 'To be heard';
  @override
  String get needApology => 'To apologize';
  @override
  String get needAgree => 'To agree on something';
  @override
  String get sayTitle => 'How to say it';
  @override
  String get sayIntro => 'A starting point for you to edit before sending.';
  @override
  String get sayHint => 'Your opening sentence';
  @override
  Map<String, String> get messageErrors => {
    'empty': 'Write the sentence first',
    'tooLong': 'This sentence is too long',
  };
  @override
  String get generating => 'Writing a gentle opening…';
  @override
  String get gentler => 'More gentle';
  @override
  String get moreDirect => 'More direct';
  @override
  String get copy => 'Copy';
  @override
  String get copied => 'Copied';
  @override
  String get sendAsNote => 'Send as a note';
  @override
  String get sent => 'Note sent';
  @override
  String get exit => 'Leave';
  @override
  String get next => 'Next';
  @override
  String get back => 'Back';
  @override
  String get needPause => 'I need a pause';
  @override
  String get retry => 'Try again';
  @override
  String get generationFailed => 'Couldn\'t write a sentence right now.';
  @override
  String get privateNote =>
      'The mascot only sees what you write here. Your partner\'s data is never sent.';
  @override
  String get offline => 'You\'re offline. The opening sentence needs a connection.';
  @override
  String get emptyTitle => 'Couldn\'t load';
  @override
  String get emptyText => 'Try again in a moment.';
  @override
  Map<String, String> get errors => {
    'CHAT_LIMIT': 'Today\'s messages are used up.',
    'CHAT_DISABLED': 'The chat is off. Turn it on to use the mascot.',
    'CHAT_UNAVAILABLE': 'The chat is not available right now.',
    'UPSTREAM': 'Couldn\'t write a sentence right now. Try again.',
    'NOT_PAIRED': 'To send this, you need to be connected with your partner in the app.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
}

// Path: heavyDay
class _Translations$heavyDay$en extends Translations$heavyDay$pt {
  _Translations$heavyDay$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Heavy-day notice';
  @override
  String get gateTitle => 'Heavy-day notice';
  @override
  String get gateText =>
      'Some days weigh more. You can tell your partner with one short sentence, without details. Your partner does not see your programs or what you write.';
  @override
  String get activate => 'Turn on';
  @override
  String get notNow => 'Not now';
  @override
  String get noticeBody => 'A delicate day. A little extra care helps.';
  @override
  String previewPartner({required Object name}) =>
      '${name} would see: “A delicate day. A little extra care helps.”';
  @override
  String get previewGeneric =>
      'Your partner would see: “A delicate day. A little extra care helps.”';
  @override
  String get frequencyAsk => 'Each time';
  @override
  String get frequencyAlways => 'Always';
  @override
  String get share => 'Share';
  @override
  String get cancel => 'Don\'t share';
  @override
  String confirmationTitle({required Object name}) => 'Notice sent to ${name}';
  @override
  String get confirmationGeneric => 'Notice sent';
  @override
  String get confirmationHint => 'Your partner sees it on the notes widget, if it is on.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Couldn\'t do that right now. Try again.';
}

// Path: help
class _Translations$help$en extends Translations$help$pt {
  _Translations$help$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get badDayTitle => 'A hard day';
  @override
  String get badDayText => 'Three small things that may help right now. Nothing required.';
  @override
  String get starterTitle => 'Start a conversation';
  @override
  String get starterText => 'A question to open with, no rush.';
  @override
  String get another => 'Another';
  @override
  String get emptyTitle => 'Nothing here yet';
  @override
  String get emptyText => 'We\'re preparing more suggestions.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Try again in a moment.';
}

// Path: helpSupport
class _Translations$helpSupport$en extends Translations$helpSupport$pt {
  _Translations$helpSupport$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Help';
  @override
  String get contactTitle => 'Talk to support';
  @override
  String get reportBug => 'Report a bug';
  @override
  String get faqTitle => 'Common questions';
  @override
  Map<String, String> get faqQuestions => {
    'replyTime': 'When will I get an answer?',
    'offline': 'What if I send without internet?',
    'privacy': 'Who reads what I send?',
    'reportBug': 'How do I report a bug?',
  };
  @override
  Map<String, String> get faqAnswers => {
    'replyTime': 'We reply within 2 business days.',
    'offline': 'Your message stays saved and goes out when you\'re online again.',
    'privacy': 'Only the support team. Nothing is shared with your partner.',
    'reportBug': 'Choose Bug in the form and tell us what happened.',
  };
  @override
  String get pendingNote => 'A message is saved and will be sent when you\'re online.';
  @override
  String get discardedNote =>
      'A saved message couldn\'t be sent and was removed. Write to us again if it still matters.';
  @override
  String get supportTitle => 'Support';
  @override
  String get supportHeading => 'How can we help?';
  @override
  String get supportHighlight => 'help';
  @override
  Map<String, String> get topics => {
    'account': 'Account',
    'billing': 'Billing',
    'bug': 'Bug',
    'other': 'Other',
  };
  @override
  String get messageLabel => 'Message';
  @override
  String get messageHint => 'Tell us what happened, with as much detail as you like.';
  @override
  Map<String, String> get messageErrors => {
    'empty': 'Write your message first',
    'tooLong': 'The message is too long',
  };
  @override
  String get replyEmailLabel => 'Reply email';
  @override
  String get replyEmailHint => 'you@email.com';
  @override
  Map<String, String> get replyEmailErrors => {
    'invalid': 'Check the email address.',
    'tooLong': 'This email is too long',
  };
  @override
  String get replyTime => 'We reply within 2 business days.';
  @override
  String get send => 'Send';
  @override
  String get sentTitle => 'Message sent';
  @override
  String get sentText => 'Thanks. We reply within 2 business days.';
  @override
  String get queuedTitle => 'Saved';
  @override
  String get queuedText =>
      'We\'ll send it when you\'re back online. It hasn\'t been delivered yet.';
  @override
  String get done => 'Done';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'You sent several messages today. Try again tomorrow.',
    'noData': 'Couldn\'t send right now. Your message is still here.',
    'other': 'Couldn\'t send right now. Your message is still here.',
  };
  @override
  String get discardTitle => 'Discard this message?';
  @override
  String get discardText => 'What you wrote won\'t be saved.';
}

// Path: history
class _Translations$history$en extends Translations$history$pt {
  _Translations$history$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Our history';
  @override
  String get addMilestoneTooltip => 'Add milestone';
  @override
  String togetherSinceLine({required Object date}) => 'together since ${date}';
  @override
  String get setStartDate => 'Set when our story started';
  @override
  String get beginningHeadline => 'Starting out';
  @override
  String reunionCountdown({required num days}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        days,
        one: '${days} day to go',
        other: '${days} days to go',
      );
  @override
  String durationFull({
    required Object years,
    required Object yearsUnit,
    required Object months,
    required Object monthsUnit,
    required Object days,
    required Object daysUnit,
  }) => '${years} ${yearsUnit}, ${months} ${monthsUnit}\nand ${days} ${daysUnit}';
  @override
  String durationFullInline({
    required Object years,
    required Object yearsUnit,
    required Object months,
    required Object monthsUnit,
    required Object days,
    required Object daysUnit,
  }) => '${years} ${yearsUnit}, ${months} ${monthsUnit} and ${days} ${daysUnit}';
  @override
  String durationMonthsDays({
    required Object months,
    required Object monthsUnit,
    required Object days,
    required Object daysUnit,
  }) => '${months} ${monthsUnit} and ${days} ${daysUnit}';
  @override
  String durationDaysOnly({required Object days, required Object daysUnit}) =>
      '${days} ${daysUnit}';
  @override
  String get yearOne => 'year';
  @override
  String get yearMany => 'years';
  @override
  String get monthOne => 'month';
  @override
  String get monthMany => 'months';
  @override
  String get dayOne => 'day';
  @override
  String get dayMany => 'days';
  @override
  String statDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'day',
        other: 'days',
      );
  @override
  String statWeekends({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'weekend',
        other: 'weekends',
      );
  @override
  String statChristmases({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Christmas',
        other: 'Christmases',
      );
  @override
  String statPlaces({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'place',
        other: 'places',
      );
  @override
  String get storyDatesAction => 'Story dates';
  @override
  String get numbersAction => 'In numbers';
  @override
  String get variationsAction => 'How the counter looks';
  @override
  String get avatarAction => 'Your avatar';
  @override
  String get differentDatesBanner => 'You chose different start dates';
  @override
  String get differentDatesAction => 'See dates';
  @override
  String get timelineSection => 'MILESTONES AND MEMORIES';
  @override
  String get recentChip => 'Recent';
  @override
  String get unknownYearChip => 'No date';
  @override
  String get timelineRecentNote => 'Showing your most recent milestones.';
  @override
  String loadEarlierYear({required Object year}) => 'See ${year}';
  @override
  String get unknownDateLabel => 'Unknown date';
  @override
  String get addMilestoneRow => 'Add a milestone';
  @override
  String get emptyTitle => 'Start with your first milestone';
  @override
  String get emptyText => 'Save when you met or a special moment.';
  @override
  String get suggestedFirstTitle => 'We met';
  @override
  String get suggestedFirstSub => 'Suggested first milestone · tap to add';
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  List<String> get monthsLong => [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  String fullDate({required Object month, required Object day, required Object year}) =>
      '${month} ${day}, ${year}';
  @override
  String shortDayMonthYear({required Object month, required Object day, required Object year}) =>
      '${month} ${day}, ${year}';
  @override
  String shortMonthYear({required Object month, required Object year}) => '${month} ${year}';
  @override
  String shortDayMonth({required Object month, required Object day}) => '${month} ${day}';
  @override
  String get milestoneNewTitle => 'New milestone';
  @override
  String get milestoneDetailTitle => 'Milestone details';
  @override
  String get milestoneDefaultHighlight => 'together';
  @override
  String get milestoneTitleLabel => 'What happened';
  @override
  String get milestoneTitleHint => 'E.g. First trip together';
  @override
  Map<String, String> get milestoneTitleErrors => {
    'empty': 'Say what happened',
    'tooLong': 'The title is too long',
  };
  @override
  String get milestonePlaceLabel => 'Place (optional)';
  @override
  String get milestonePlaceHint => 'E.g. Paraty';
  @override
  Map<String, String> get milestonePlaceErrors => {'tooLong': 'The place is too long'};
  @override
  String get milestoneBodyHint => 'A note about this moment (optional)';
  @override
  Map<String, String> get milestoneBodyErrors => {'tooLong': 'The note is too long'};
  @override
  String get milestoneKindLabel => 'Milestone kind';
  @override
  String get kindFirst => 'First time';
  @override
  String get kindTrip => 'Trip';
  @override
  String get kindHome => 'Moved in together';
  @override
  String get kindCustom => 'Milestone';
  @override
  String get unknownDateToggle => 'Unknown date';
  @override
  String get precisionDay => 'Exact day';
  @override
  String get precisionMonth => 'Month and year';
  @override
  String get precisionYear => 'Year only';
  @override
  String get dateRowLabel => 'Date';
  @override
  String get addedByRowLabel => 'Added by';
  @override
  String get addedByYou => 'You';
  @override
  String get visibilityRowLabel => 'Who sees it';
  @override
  String get visibilityBoth => 'Both';
  @override
  String get visibilityOnlyYou => 'Only you';
  @override
  String get deleteMilestone => 'Delete';
  @override
  String get deleteMilestoneTitle => 'Delete this milestone?';
  @override
  String get deleteMilestoneTextShared => 'It will be removed from both of your stories.';
  @override
  String get deleteMilestoneTextPrivate => 'It will be removed from your story.';
  @override
  String get deleteMilestoneConfirm => 'Delete';
  @override
  String get saveMilestone => 'Save';
  @override
  String get storyDatesTitle => 'Dates of our story';
  @override
  String get storyMet => 'We met';
  @override
  String get storyDating => 'Started dating';
  @override
  String get storyEngaged => 'Got engaged';
  @override
  String get storyMarried => 'Got married';
  @override
  String get storyAdd => 'Add';
  @override
  String storyDateAddedBy({required Object name}) => 'Added by ${name}';
  @override
  String get storyDatesNote => 'Everything is optional. The start date feeds the counter.';
  @override
  String get variationsTitle => 'How the counter looks';
  @override
  String get variationDating => 'Dating';
  @override
  String get variationEngaged => 'Engaged';
  @override
  String get variationMarried => 'Married';
  @override
  String get variationBeginning => 'Starting out';
  @override
  String get variationLongDistance => 'Long distance';
  @override
  String get variationsPreviewNote =>
      'Style preview. The time shown is your real total; per-phase counts need their own dates.';
  @override
  String get avatarHeadline => 'How do you appear?';
  @override
  String get avatarHighlight => 'appear';
  @override
  String get avatarInitials => 'Initials';
  @override
  String get avatarInitialsNote => 'Your avatar uses your initials.';
  @override
  String get avatarNote => 'Each person chooses their own. The app never pulls the other\'s photo.';
  @override
  String get avatarContinue => 'Continue';
  @override
  String get numbersTitle => 'In numbers';
  @override
  String numbersHeroDays({required Object days}) => '${days} days';
  @override
  String get numbersHeroEmpty => 'In your own time';
  @override
  String get numbersHeroEmptySub => 'Set a start date whenever you want to track the days.';
  @override
  String numbersWeekends({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'weekend together',
        other: 'weekends together',
      );
  @override
  String numbersFullMoons({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'full moon',
        other: 'full moons',
      );
  @override
  String numbersChristmases({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Christmas together',
        other: 'Christmases together',
      );
  @override
  String numbersNextAnniversary({required num years, required Object suffix}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        years,
        one: 'until ${years} year ${suffix}',
        other: 'until ${years} years ${suffix}',
      );
  @override
  String get numbersSuffixDating => 'dating';
  @override
  String get numbersSuffixEngaged => 'engaged';
  @override
  String get numbersSuffixMarried => 'married';
  @override
  String get numbersSuffixTogether => 'together';
  @override
  String numbersMonthsCount({required num months}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        months,
        one: '${months} month',
        other: '${months} months',
      );
  @override
  String numbersDaysCount({required num days}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        days,
        one: '${days} day',
        other: '${days} days',
      );
  @override
  String get numbersPlacesSection => 'PLACES THAT MATTERED';
  @override
  String numbersYearSection({required Object year}) => 'YOUR YEAR (${year})';
  @override
  String get numbersYearNote => 'Only your own records this year.';
  @override
  String numbersFirstsCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'first time',
        other: 'first times',
      );
  @override
  String get differentHeadline => 'The dates differ';
  @override
  String get differentHighlight => 'differ';
  @override
  String differentSubtitle({required Object partner}) =>
      'You and ${partner} chose different start dates.';
  @override
  String get differentYourDate => 'Your date';
  @override
  String differentPartnerDate({required Object partner}) => '${partner}\'s date';
  @override
  String get differentNote => 'Each sees their own. Nothing is changed without both.';
  @override
  String get differentNoDates => 'There are no start dates to compare yet.';
  @override
  String get differentContinue => 'Continue';
  @override
  String get partnerFallback => 'your partner';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Your story is still saved. Try again.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'NOT_OWNER': 'Only its author can edit or delete it.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
  @override
  String numbersMemoriesCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'saved memory',
        other: 'saved memories',
      );
  @override
  String numbersMemoriesRecent({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'recent memory',
        other: 'recent memories',
      );
  @override
  String numbersPlaces({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'place',
        other: 'places',
      );
  @override
  String get readOnlyMilestone =>
      'This milestone was added by someone else. Only its author can edit it.';
  @override
  String readOnlyMilestoneBy({required Object name}) =>
      'Added by ${name}. Only its author can edit it.';
}

// Path: ideaDetail
class _Translations$ideaDetail$en extends Translations$ideaDetail$pt {
  _Translations$ideaDetail$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Idea of the day';
  @override
  String get whyTitle => 'Why this idea';
  @override
  String get yourPhase => 'Your phase';
  @override
  String get yourGoal => 'Your goal';
  @override
  String get willDo => 'I will do it';
  @override
  String get done => 'Noted. Nice!';
  @override
  String get another => 'Another idea';
  @override
  String get later => 'Later';
  @override
  String get laterTitle => 'When should we remind you?';
  @override
  String get tonight => 'Tonight';
  @override
  String get tomorrow => 'Tomorrow morning';
  @override
  String get weekend => 'This weekend';
  @override
  String get reminderSet => 'Done. We will remind you with a gentle nudge.';
  @override
  String get reminderSetNotificationsOff =>
      'Reminder saved. Turn notifications on in settings to receive it.';
  @override
  String get reminderError => 'Could not save the reminder. Try again.';
  @override
  String get emptyTitle => 'No ideas right now';
  @override
  String get emptyText => 'Come back later. In the meantime, note a slip.';
  @override
  String get errorTitle => 'Could not load the idea';
  @override
  String get errorText => 'Try again in a moment.';
}

// Path: intro
class _Translations$intro$en extends Translations$intro$pt {
  _Translations$intro$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get skip => 'Skip';
  @override
  String get continueButton => 'Continue';
  @override
  late final _Translations$intro$phase$en phase = _Translations$intro$phase$en._(_root);
  @override
  late final _Translations$intro$goals$en goals = _Translations$intro$goals$en._(_root);
  @override
  late final _Translations$intro$theme$en theme = _Translations$intro$theme$en._(_root);
}

// Path: invite
class _Translations$invite$en extends Translations$invite$pt {
  _Translations$invite$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object name}) => 'Invite ${name}';
  @override
  String get titleNoName => 'Invite your person';
  @override
  String get messageIntro => 'This message will be sent:';
  @override
  String message({required Object code}) =>
      'I started something small for us. To connect in the app, use the code ${code}.';
  @override
  String expiryNote({required Object days}) =>
      'The invite is valid for ${days} days. Only the latest invite you create works.';
  @override
  String get share => 'Share invite';
  @override
  String get copy => 'Copy invite';
  @override
  String get sentTitle => 'Invite sent';
  @override
  String get sentHighlight => 'sent';
  @override
  String sentText({required Object name}) =>
      '${name} has not joined yet. In the meantime you can use the app on your own.';
  @override
  String get sentTextNoName =>
      'Your person has not joined yet. In the meantime you can use the app on your own.';
  @override
  String get resend => 'Send again';
  @override
  String get revoke => 'Revoke';
  @override
  String get errorTitle => 'Could not create the invite';
  @override
  Map<String, String> get errors => {
    'ALREADY_PAIRED': 'You are already connected with someone.',
    'RATE_LIMITED': 'You created too many invites today. Try again tomorrow.',
    'NETWORK': 'No connection. Check your internet and try again.',
    'other': 'Something went wrong. Try again.',
  };
}

// Path: language
class _Translations$language$en extends Translations$language$pt {
  _Translations$language$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get language => 'Language';
  @override
  String get languagePortuguese => 'Portuguese (Brazil)';
  @override
  String get languageEnglish => 'English';
  @override
  String get comingSoon => 'Coming soon';
  @override
  String get languageNote => 'English is finished later.';
  @override
  String get saveError => 'Could not save. Try again.';
}

// Path: learned
class _Translations$learned$en extends Translations$learned$pt {
  _Translations$learned$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'What I learned';
  @override
  String get intro => 'Things you chose to keep from the conversation. Only you see them.';
  @override
  String get pendingTitle => 'To review';
  @override
  String get confirmedTitle => 'Confirmed';
  @override
  Map<String, String> get targets => {
    'partnerFact': 'About my partner',
    'date': 'A date',
    'memory': 'A memory',
    'commitment': 'A promise',
  };
  @override
  String get confirm => 'Confirm';
  @override
  String get edit => 'Edit';
  @override
  String get discard => 'Discard';
  @override
  String get confirmTitle => 'Confirm this learning?';
  @override
  String get confirmText => 'It will show in What I learned. Only you see it.';
  @override
  String get discardTitle => 'Discard this learning?';
  @override
  String get discardText => 'It will not be saved.';
  @override
  String get discardConfirm => 'Discard';
  @override
  String get editTitle => 'Edit learning';
  @override
  String get editHint => 'What you want to keep';
  @override
  Map<String, String> get textErrors => {
    'empty': 'Write what you want to keep',
    'tooLong': 'This is too long',
  };
  @override
  String get save => 'Save';
  @override
  String get partnerFactLabel => 'From the conversation';
  @override
  String get updated => 'Learning updated';
  @override
  String get emptyTitle => 'Nothing kept yet';
  @override
  String get emptyText => 'When you want, save a reply from the conversation to remember it later.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Try again in a moment.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
}

// Path: lists
class _Translations$lists$en extends Translations$lists$pt {
  _Translations$lists$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Lists';
  @override
  String get subtitle => 'Trips, places and films, shared or just for you.';
  @override
  String get newList => 'New list';
  @override
  String get createTitle => 'New list';
  @override
  String get titleLabel => 'Name';
  @override
  String get titleHint => 'E.g. Trips of our dreams';
  @override
  Map<String, String> get titleErrors => {
    'empty': 'Give the list a name.',
    'tooLong': 'Use at most 80 characters.',
  };
  @override
  String get kindLabel => 'Type';
  @override
  String get visibilityLabel => 'Who can see it';
  @override
  String get sharedHint => 'You both can see and change this list.';
  @override
  String get privateHint => 'Only you can see this list.';
  @override
  Map<String, String> get kinds => {
    'travel': 'Travel',
    'restaurants': 'Restaurants',
    'movies': 'Movies',
    'custom': 'Other',
    'other': '',
  };
  @override
  String get shared => 'Shared';
  @override
  String get private => 'Private';
  @override
  String get emptyTitle => 'No lists yet';
  @override
  String get emptyTextShared => 'Start a list of things you want to do together.';
  @override
  String get emptyTextPrivate => 'Start a list of things you want to keep for yourself.';
  @override
  String get create => 'Create list';
  @override
  String get rename => 'Rename';
  @override
  String get delete => 'Delete';
  @override
  String get renameTitle => 'Rename list';
  @override
  String get save => 'Save';
  @override
  String get deleteTitle => 'Delete list?';
  @override
  String get deleteTextShared => 'The list and everything in it will be gone for both of you.';
  @override
  String get deleteTextPrivate => 'The list and everything in it will be gone for good.';
  @override
  String get deleteConfirm => 'Delete';
  @override
  String get itemDeleteTitle => 'Delete item?';
  @override
  String get itemDeleteTextShared => 'This item will be gone for both of you.';
  @override
  String get itemDeleteTextPrivate => 'This item will be gone for good.';
  @override
  String get itemDeleteConfirm => 'Delete item';
  @override
  String get makePrivate => 'Make private';
  @override
  String get shareWithPartner => 'Share with your partner';
  @override
  String get addItem => 'Add item';
  @override
  String get itemHint => 'E.g. Lisbon';
  @override
  Map<String, String> get itemTitleErrors => {
    'empty': 'Type the item name.',
    'tooLong': 'Use at most 160 characters.',
  };
  @override
  String get add => 'Add';
  @override
  String get itemEmptyTitle => 'Nothing here yet';
  @override
  String get itemEmptyTextShared => 'Add the first thing you want to do together.';
  @override
  String get itemEmptyTextPrivate => 'Add the first thing to this list.';
  @override
  Map<String, String> get statuses => {
    'dream': 'Dream',
    'planned': 'Planned',
    'done': 'Done',
    'other': '',
  };
  @override
  String get markDream => 'Back to dreams';
  @override
  String get markPlanned => 'Mark as planned';
  @override
  String get markDone => 'Mark as done';
  @override
  String get moveUp => 'Move up';
  @override
  String get moveDown => 'Move down';
  @override
  String get itemOptions => 'Item options';
  @override
  String get listOptions => 'List options';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
}

// Path: logistics
class _Translations$logistics$en extends Translations$logistics$pt {
  _Translations$logistics$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Logistics';
  @override
  String get subtitle => 'The practical things, with nobody carrying them alone.';
  @override
  String get hint => 'E.g. call the plumber';
  @override
  String get add => 'Add';
  @override
  String get me => 'Me';
  @override
  String get partner => 'My partner';
  @override
  String get both => 'Both of us';
  @override
  String get assignMe => 'I\'ll take it';
  @override
  String get delete => 'Delete';
  @override
  String get doneTitle => 'Done';
  @override
  String get emptyTitle => 'Nothing here';
  @override
  String get emptyText => 'Add something practical you need to sort out.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'The list is still saved. Try again.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
}

// Path: loveStyle
class _Translations$loveStyle$en extends Translations$loveStyle$pt {
  _Translations$loveStyle$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get entryLabel => 'ONLY FOR YOU';
  @override
  String get entryTitle => 'What makes me feel loved';
  @override
  String get entryText => 'Six quick questions to notice what makes you feel loved.';
  @override
  String get exerciseTitle => 'How I feel loved';
  @override
  String get exerciseHighlight => 'loved';
  @override
  String get exerciseSubtitle => 'Six quick questions, just for you.';
  @override
  String questionOf({required Object current, required Object total}) =>
      'Question ${current} of ${total}';
  @override
  List<String> get questions => [
    'What makes you feel loved the most?',
    'On a hard day, what comforts you the most?',
    'What do you notice first when your partner shows care?',
    'Which of these gestures warms your heart?',
    'What makes you feel important to someone?',
    'If you could choose one gesture for today, what would it be?',
  ];
  @override
  Map<String, String> get options1 => {
    'time': 'Spending unhurried time together.',
    'words': 'Hearing that I matter.',
    'acts': 'Seeing the person help me with something.',
    'gifts': 'Getting a small gift for no reason.',
    'touch': 'A long hug.',
    'other': '',
  };
  @override
  Map<String, String> get options2 => {
    'time': 'Having someone nearby, with no rush to fix it.',
    'words': 'A message saying I\'m on their mind.',
    'acts': 'Someone taking a task off my hands.',
    'gifts': 'A small care that arrived by surprise.',
    'touch': 'A tight hug.',
    'other': '',
  };
  @override
  Map<String, String> get options3 => {
    'time': 'When the person puts the phone down to be with me.',
    'words': 'When the person praises something I did.',
    'acts': 'When the person notices what I need and does it.',
    'gifts': 'When the person remembers something I like.',
    'touch': 'When the person touches me lightly as they pass.',
    'other': '',
  };
  @override
  Map<String, String> get options4 => {
    'time': 'A quiet date, just the two of us.',
    'words': 'A conversation where I feel heard.',
    'acts': 'A small help with a task.',
    'gifts': 'A simple gift that has to do with me.',
    'touch': 'A caress on my hair or hand.',
    'other': '',
  };
  @override
  Map<String, String> get options5 => {
    'time': 'When someone chooses to spend time with me.',
    'words': 'When someone acknowledges what I do.',
    'acts': 'When someone makes my day easier.',
    'gifts': 'When someone remembers me with a detail.',
    'touch': 'When someone hugs me without needing to speak.',
    'other': '',
  };
  @override
  Map<String, String> get options6 => {
    'time': 'Saving a free evening for us.',
    'words': 'Writing a loving note.',
    'acts': 'Tackling a boring task together.',
    'gifts': 'Picking a small gift.',
    'touch': 'Holding hands.',
    'other': '',
  };
  @override
  String get continueAction => 'Next';
  @override
  String get finishAction => 'See result';
  @override
  String get back => 'Back';
  @override
  String get privateNote => 'Only you see your answers. You choose whether to show the result.';
  @override
  String get resultTitle => 'What makes you feel loved';
  @override
  String get resultHighlight => 'loved';
  @override
  String get resultSubtitle => 'A description of what makes you feel loved, in your own way.';
  @override
  String get topTag => 'What fits you best';
  @override
  Map<String, String> get descriptions => {
    'time': 'You feel loved when you have real time with someone you care about: unhurried, no screens, just presence.',
    'words': 'You feel loved when you hear, honestly, what the other person feels for you.',
    'acts': 'You feel loved when someone notices what you need and helps without being asked.',
    'gifts': 'You feel loved when someone remembers you in a small detail, chosen with care.',
    'touch': 'You feel loved when a hug, a held hand or a caress says what words cannot.',
    'other': '',
  };
  @override
  Map<String, String> get shareDescriptions => {
    'time': 'I feel loved when we spend unhurried time together, with no screens.',
    'words': 'I feel loved when I hear, honestly, what you feel for me.',
    'acts': 'I feel loved when you notice what I need and help without me asking.',
    'gifts': 'I feel loved when you remember me in a small detail, chosen with care.',
    'touch': 'I feel loved when a hug, a held hand or a caress says what words cannot.',
    'other': '',
  };
  @override
  String get resultPrivacyNote =>
      'Saved only for you. Showing it on your partner\'s widget is your choice, and you can undo it.';
  @override
  String get saveManualAction => 'Save to My manual';
  @override
  String get savedManualAction => 'Saved to My manual';
  @override
  String get manualToast => 'Saved to My manual.';
  @override
  String shareAction({required Object name}) => 'Show ${name}';
  @override
  String get revokeAction => 'Remove from their widget';
  @override
  String get shareToast => 'It appears on their widget if they allow notes.';
  @override
  String get revokeToast => 'It\'s no longer on their widget.';
  @override
  String get shareSoloNote =>
      'When you\'re connected with a partner, you can show this on their widget.';
  @override
  String get partnerFallback => 'your partner';
  @override
  String get pairingErrorNote => 'Couldn\'t check your partner right now.';
  @override
  String get retryPairing => 'Try again';
  @override
  String get retake => 'Take it again';
  @override
  String get loadErrorTitle => 'Couldn\'t load';
  @override
  String get loadErrorText => 'Couldn\'t open your result right now. Try again.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t save right now. Your answers are still here.',
  };
  @override
  Map<String, String> get manualErrors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t save to My manual right now. Try again.',
  };
  @override
  Map<String, String> get shareErrors => {
    'NOT_PAIRED': 'You don\'t have a connected partner yet.',
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t show it right now. Try again.',
  };
  @override
  Map<String, String> get revokeErrors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t remove it from their widget right now. Try again.',
  };
}

// Path: memories
class _Translations$memories$en extends Translations$memories$pt {
  _Translations$memories$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Memories';
  @override
  String get historyLabel => 'OUR HISTORY';
  @override
  String get historyTitle => 'Our history';
  @override
  String get historyText => 'Milestones, dates, places and our story in numbers.';
  @override
  String get storyLabel => 'SHARE';
  @override
  String get storyTitle => 'Image to share';
  @override
  String get storyText => 'Your numbers in an image, with only what you choose.';
  @override
  String get placesLabel => 'PLACES';
  @override
  String get placesTitle => 'Places you have been';
  @override
  String get placesText => 'Only the name of the place, never the location.';
  @override
  String get placeLabel => 'Place (optional)';
  @override
  String get placeHint => 'E.g. Lisbon';
  @override
  String get placeAddressNote => 'Prefer just the name of the place, with no address or number.';
  @override
  String get segmentTimeline => 'Timeline';
  @override
  String get segmentJar => 'Jar';
  @override
  String get jarEmpty => 'When a slip feels good, keep it in the jar from its details.';
  @override
  String get jarAnother => 'Another';
  @override
  String get jarClose => 'Close';
  @override
  String get titleLabel => 'A memory';
  @override
  String get titleHint => 'E.g. our first dinner';
  @override
  Map<String, String> get titleErrors => {
    'empty': 'Give this memory a title',
    'tooLong': 'The title is too long',
  };
  @override
  Map<String, String> get placeErrors => {'tooLong': 'The place is too long'};
  @override
  Map<String, String> get bodyErrors => {'tooLong': 'The note is too long'};
  @override
  String get bodyHint => 'Tell how it went (optional)';
  @override
  String get add => 'Add a memory';
  @override
  String get save => 'Save memory';
  @override
  String get delete => 'Delete';
  @override
  String get deleteTitle => 'Delete this memory?';
  @override
  String get deleteText => 'It disappears from the timeline for both of you.';
  @override
  String get deleteConfirm => 'Delete';
  @override
  String get detailPlace => 'Place';
  @override
  String get detailBody => 'How it went';
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  String dateLine({required Object month, required Object day, required Object year}) =>
      '${month} ${day}, ${year}';
  @override
  String get emptyTitle => 'No memories yet';
  @override
  String get emptyText => 'Keep moments you want to look back on.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Your memories are still saved. Try again.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Your text is still here.',
  };
  @override
  String get jarEmptyTitle => 'The jar is empty';
  @override
  String get jarEmptyAction => 'See my slips';
  @override
  String get moreTitle => 'More';
}

// Path: mood
class _Translations$mood$en extends Translations$mood$pt {
  _Translations$mood$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'How are you today?';
  @override
  String get titleHighlight => 'today';
  @override
  String get subtitle => 'One tap. The “I need…” tag is optional.';
  @override
  String get privateCue => 'Only you see this';
  @override
  Map<String, String> get moods => {
    'happy': 'Happy',
    'tired': 'Tired',
    'sad': 'Sad',
    'stressed': 'Stressed',
    'loving': 'Loving',
    'playful': 'Playful',
  };
  @override
  String get needTitle => 'I need…';
  @override
  Map<String, String> get needs => {
    'listen': 'To be heard',
    'opinion': 'An opinion',
    'hug': 'A hug',
    'space': 'Some space',
  };
  @override
  String get shareTitle => 'What your partner sees';
  @override
  String shareTitleNamed({required Object name}) => 'What ${name} sees';
  @override
  String get shareSubtitle => 'You decide. Nothing is shared by default.';
  @override
  Map<String, String> get share => {
    'none': 'Keep private',
    'mood': 'Just my mood',
    'mood_need': 'Mood and what I need',
  };
  @override
  Map<String, String> get shareSupport => {
    'none': 'Nothing is shared.',
    'mood': 'Your partner sees the mood only.',
    'mood_need': 'Your partner sees the mood and the need.',
  };
  @override
  String get privacyNote =>
      'Nothing is shared by default. Your partner never sees a chart or a score.';
  @override
  String get save => 'Save';
  @override
  String get saved => 'Mood saved';
  @override
  Map<String, String> get errors => {
    'NETWORK': 'Couldn\'t save your mood. Check your connection and try again.',
    'TIMEOUT': 'Couldn\'t save your mood in time. Try again.',
    'other': 'Couldn\'t save your mood. Try again.',
  };
  @override
  String get entryCategory => 'Mood of the day';
  @override
  String get entryTitle => 'How are you today?';
  @override
  String get entryText => 'One tap. Only you see it until you share.';
  @override
  String get partnerLabel => 'Your partner\'s mood';
  @override
  String get partnerFallback => 'Your partner';
  @override
  String partnerHappy({required Object name}) => '${name} is happy today';
  @override
  String partnerTired({required Object name}) => '${name} is out of energy today';
  @override
  String partnerSad({required Object name}) => '${name} is feeling low today';
  @override
  String partnerStressed({required Object name}) => '${name} has a lot on their mind today';
  @override
  String partnerLoving({required Object name}) => '${name} is feeling tender today';
  @override
  String partnerPlayful({required Object name}) => '${name} is in a playful mood today';
  @override
  String get partnerNeedListen => 'What helps: just listening.';
  @override
  String get partnerNeedOpinion => 'What helps: an opinion.';
  @override
  String get partnerNeedHug => 'What helps: a hug.';
  @override
  String get partnerNeedSpace => 'What helps: some space.';
  @override
  String get homeTitle => 'How are you?';
  @override
  String get homePrivacy => 'Only you see it';
  @override
  Map<String, String> get homeMoods => {
    'happy': 'Good',
    'loving': 'Loving',
    'tired': 'Tired',
    'stressed': 'Tense',
    'sad': 'Sad',
  };
}

// Path: need
class _Translations$need$en extends Translations$need$pt {
  _Translations$need$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'I need…';
  @override
  String get titleHighlight => 'need';
  @override
  String get subtitle => 'Pick one thing. Your partner gets a gentle note, no pressure.';
  @override
  Map<String, String> get options => {
    'hug': 'A hug',
    'talk': 'To talk',
    'help_home': 'Help at home',
    'quiet': 'Some quiet time',
    'time_together': 'Time together',
    'rest': 'To rest',
    'other': '',
  };
  @override
  String get note => 'It\'s not a demand. It\'s just a simple way to ask.';
  @override
  String get send => 'Send';
  @override
  late final _Translations$need$sent$en sent = _Translations$need$sent$en._(_root);
  @override
  Map<String, String> get errors => {
    'NOT_PAIRED': 'To send this, you need to be connected with your partner in the app.',
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t send right now. Try again.',
  };
}

// Path: notFound
class _Translations$notFound$en extends Translations$notFound$pt {
  _Translations$notFound$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '404';
  @override
  String get description => 'Page not found';
  @override
  String get buttonBack => 'Go back home';
}

// Path: notes
class _Translations$notes$en extends Translations$notes$pt {
  _Translations$notes$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'A note or a drawing';
  @override
  String get intro => 'A short note for your partner, or a drawing that stays in your sent list.';
  @override
  List<String> get kinds => ['Note', 'Drawing'];
  @override
  String get noteHint => 'E.g. good luck at today\'s meeting';
  @override
  Map<String, String> get textErrors => {
    'empty': 'Write the note first',
    'tooLong': 'This note is too long',
  };
  @override
  String get canvasLabel => 'Drawing area';
  @override
  List<String> get pens => ['Black', 'Orange', 'Purple', 'Green'];
  @override
  String get eraser => 'Eraser';
  @override
  String get undo => 'Undo';
  @override
  String get clear => 'Clear';
  @override
  String get emptyDrawing => 'Draw something to be able to send it.';
  @override
  String get widgetLabel => 'Send to the widget';
  @override
  String get widgetText => 'It appears on their widget if they allow notes.';
  @override
  String get drawingHint => 'Drawings stay in your sent list. Widget notes are text-only for now.';
  @override
  String get unpairedTitle => 'Connect with your partner';
  @override
  String get unpairedText =>
      'You need to be connected with your partner to send a note or drawing.';
  @override
  String get send => 'Send';
  @override
  String get sent => 'Sent';
  @override
  String get sentTitle => 'Sent by you';
  @override
  String get justNow => 'Just now';
  @override
  String minutesAgo({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 min ago',
        other: '${count} min ago',
      );
  @override
  String hoursAgo({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 h ago',
        other: '${count} h ago',
      );
  @override
  String daysAgo({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 day ago',
        other: '${count} days ago',
      );
  @override
  String get drawingAlt => 'Drawing';
  @override
  String get delete => 'Delete';
  @override
  String get deleteConfirmTitle => 'Delete this?';
  @override
  String get deleteConfirmText =>
      'It leaves your sent list. Notes also leave your partner\'s widget.';
  @override
  String get deleteConfirm => 'Delete now';
  @override
  String get deleted => 'Deleted';
  @override
  String get deleteError => 'Couldn\'t delete right now. Try again.';
  @override
  String get emptyTitle => 'Nothing sent yet';
  @override
  String get emptyText => 'When you send a note or a drawing, it shows up here.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Try again in a moment.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'NOT_PAIRED': 'To send this, you need to be connected with your partner in the app.',
    'other': 'Couldn\'t send right now. What you wrote is still here.',
  };
}

// Path: notificationPermission
class _Translations$notificationPermission$en extends Translations$notificationPermission$pt {
  _Translations$notificationPermission$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Reminders';
  @override
  String get title => 'Gentle reminders?';
  @override
  String get titleHighlight => 'Gentle';
  @override
  String get pointLimit => 'At most 1 or 2 a day.';
  @override
  String get pointPrivate => 'They never show names on the lock screen.';
  @override
  String get pointChoice => 'You choose what arrives and when.';
  @override
  String get changeLater => 'You can change this whenever you like.';
  @override
  String get notNow => 'Not now';
  @override
  String get allow => 'Allow';
  @override
  String get offBanner => 'Reminders are off. Turn them on in settings.';
  @override
  String get close => 'Close';
}

// Path: notificationPreferences
class _Translations$notificationPreferences$en extends Translations$notificationPreferences$pt {
  _Translations$notificationPreferences$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Notifications';
  @override
  String get subtitle => 'Choose what arrives and when. No pressure.';
  @override
  String get systemOff =>
      'Notifications are off on this phone. Your choices apply once you turn them on.';
  @override
  String get openSystem => 'Open settings';
  @override
  String get all => 'Receive notifications';
  @override
  String get allText => 'Turn off to pause everything.';
  @override
  String get typesTitle => 'What you want to receive';
  @override
  Map<String, String> get types => {
    'card_ready': 'Card ready',
    'card_received': 'Card received',
    'card_reaction': 'Reply to your card',
    'daily_idea': 'Idea of the day',
    'date_coming': 'Dates coming up',
    'other': '',
  };
  @override
  String get cardTitle => 'Sunday card';
  @override
  String get cardDay => 'Day';
  @override
  String get cardHour => 'Time';
  @override
  List<String> get days => [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  @override
  String hourFormat({required Object hour}) => '${hour}:00';
  @override
  String get previewTitle => 'How a notification looks';
  @override
  String get previewText => 'Always short, with no personal details.';
  @override
  String get loadErrorTitle => 'Couldn\'t open your preferences';
  @override
  String get loadErrorText => 'They are still saved. Try again.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t save right now. Your previous choice was kept.',
  };
}

// Path: partnerProfile
class _Translations$partnerProfile$en extends Translations$partnerProfile$pt {
  _Translations$partnerProfile$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'About your partner';
  @override
  String get privateNote =>
      'Only you see these notes. They never show in notifications, widgets or to your partner.';
  @override
  Map<String, String> get categories => {
    'likes': 'Likes',
    'dislikes': 'Dislikes',
    'sizes': 'Sizes',
    'health': 'Health',
    'comfort': 'Comfort',
    'people': 'People',
    'other': 'Other',
  };
  @override
  String get labelLabel => 'Topic';
  @override
  String get labelHint => 'E.g. coffee';
  @override
  Map<String, String> get labelErrors => {
    'empty': 'Give the note a topic.',
    'tooLong': 'Use at most 80 characters.',
  };
  @override
  String get valueHint => 'E.g. no sugar, very hot';
  @override
  Map<String, String> get valueErrors => {
    'empty': 'Write what you want to remember.',
    'tooLong': 'Use at most 500 characters.',
  };
  @override
  String get save => 'Save note';
  @override
  String get delete => 'Delete';
  @override
  String get emptyTitle => 'No notes yet';
  @override
  String get emptyText => 'Small details help you pick a gift or a gesture.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Your notes are still saved. Try again.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Your text is still here.',
  };
}

// Path: partnerStep
class _Translations$partnerStep$en extends Translations$partnerStep$pt {
  _Translations$partnerStep$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Want to bring your partner?';
  @override
  String get titleHighlight => 'partner';
  @override
  String get subtitle => 'The app works on your own. Invite whenever you want.';
  @override
  String get inviteTitle => 'Send an invite';
  @override
  String get inviteSupport => 'Your person joins with a code';
  @override
  String get aloneTitle => 'Start on my own for now';
  @override
  String get aloneSupport => 'Your slips stay with you only';
  @override
  String get haveCode => 'I have an invite code';
  @override
  String get continueButton => 'Continue';
}

// Path: pause
class _Translations$pause$en extends Translations$pause$pt {
  _Translations$pause$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Ask for some space';
  @override
  String get titleHighlight => 'space';
  @override
  String get subtitle => 'A short, kind message. Your partner sees only what you write.';
  @override
  Map<String, String> get presets => {
    'space': 'I need some time to breathe. I\'ll be back soon.',
    'later': 'Can we talk later, calmly?',
    'calm': 'I want to listen well. I need to calm down first.',
    'other': '',
  };
  @override
  String get hint => 'Write my own';
  @override
  Map<String, String> get messageErrors => {
    'empty': 'Write a short message',
    'tooLong': 'The message is too long',
  };
  @override
  String get returnTitle => 'I\'ll be back in';
  @override
  Map<String, String> get returns => {
    'oneHour': '1 hour',
    'threeHours': '3 hours',
    'eightHours': '8 hours',
    'tomorrow': 'Tomorrow',
    'other': '',
  };
  @override
  String get note => 'You both see Today on pause. You can come back whenever you like.';
  @override
  String get send => 'Send and pause';
  @override
  String get sentTitle => 'Pause sent';
  @override
  String get sentText => 'Today is on pause for both of you. When you\'re ready, come back there.';
  @override
  String get done => 'Done';
  @override
  Map<String, String> get errors => {
    'INVALID_RETURN_TIME': 'That return time doesn\'t work. Pick another.',
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t send right now. Your message is still here.',
  };
}

// Path: places
class _Translations$places$en extends Translations$places$pt {
  _Translations$places$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Places';
  @override
  String get privacyNote =>
      'Only the name of the place. The app never reads or stores your location.';
  @override
  String get memoryOne => '1 memory';
  @override
  String memoryMany({required Object count}) => '${count} memories';
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  String dateLine({required Object month, required Object day, required Object year}) =>
      '${month} ${day}, ${year}';
  @override
  String get emptyTitle => 'No places yet';
  @override
  String get emptyText =>
      'When you save a memory, write the name of the place and it shows up here.';
  @override
  String get detailEmptyTitle => 'Nothing at this place';
  @override
  String get detailEmptyText => 'The memories of this place are not here anymore.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Your memories are still saved. Try again.';
}

// Path: plus
class _Translations$plus$en extends Translations$plus$pt {
  _Translations$plus$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Repara Plus';
  @override
  String get subtitle => 'Compare calmly. The free plan stays whole for the essentials.';
  @override
  String get activeTitle => 'You have Plus';
  @override
  String get activeText => 'Thank you. Everything is unlocked for you and your partner.';
  @override
  String get paidByPartner => 'Your partner has Plus and it covers you both.';
  @override
  String freeLeft({required Object slips, required Object cards}) =>
      'This month you have ${slips} slips and ${cards} sent cards left on the free plan.';
  @override
  String get freeName => 'Free';
  @override
  String get freeFeatures =>
      'Slips every month, one sent card a month, repair, pause, safety and everything you already saved.';
  @override
  String get plusName => 'Plus';
  @override
  String get plusFeatures =>
      'More slips and cards each month and more for both of you, covering you and your partner.';
  @override
  String get monthly => 'Monthly';
  @override
  String get yearly => 'Yearly';
  @override
  String get giftPlan => 'Gift';
  @override
  String get storeTitle => 'Couldn\'t load the prices';
  @override
  String get storeText => 'The store didn\'t answer. Nothing was charged. Try again.';
  @override
  String get subscribe => 'Subscribe';
  @override
  String get started => 'Plus is on. Thank you.';
  @override
  String get pending => 'Purchase received. We\'re confirming, Plus will show up shortly.';
  @override
  String get purchaseError => 'Couldn\'t complete the purchase. Nothing was charged.';
  @override
  String get billingTitle => 'Payment problem';
  @override
  String get billingText =>
      'The last payment didn\'t go through. Plus stays on for now. Open your subscriptions in the store and update the payment method.';
  @override
  String get alwaysFree => 'Safety, pause and unpair are never locked.';
  @override
  String get lockLabel => 'PLUS';
  @override
  String get lockText => 'Available with Plus. Tap to see the plans.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Try again in a moment.';
  @override
  String get manageTitle => 'Manage Plus';
  @override
  String get planRow => 'Plan';
  @override
  String get statusRow => 'Status';
  @override
  String get coversRow => 'Covers';
  @override
  String get coversBoth => 'You and your partner';
  @override
  String get coveredByPartner => 'Your partner';
  @override
  String get plusActive => 'Plus active';
  @override
  String get statusActive => 'Active';
  @override
  String get statusTrialing => 'Trial';
  @override
  String get statusGrace => 'Payment pending';
  @override
  String get statusBillingIssue => 'Payment problem';
  @override
  String get manageInStore => 'Manage in store';
  @override
  String get seePlus => 'See Plus';
  @override
  String get managePlan => 'Manage plan';
  @override
  String get restorePurchases => 'Restore purchases';
  @override
  String get partnerPays => 'Your partner looks after this subscription.';
  @override
  String get partnerCancel => 'If either partner cancels, Plus ends for both, with a clear notice.';
  @override
  String get storeIssueTitle => 'The store didn\'t open';
  @override
  String get restoreLoadingTitle => 'Restoring purchases';
  @override
  String get restoreLoadingText => 'This takes a few seconds.';
  @override
  String get restoredTitle => 'Purchases restored';
  @override
  String get restoredHighlight => 'restored';
  @override
  String get restoredText => 'We found your Plus in the store.';
  @override
  String get pendingRestoreTitle => 'We found a purchase';
  @override
  String get pendingRestoreHighlight => 'purchase';
  @override
  String get pendingRestoreText =>
      'It can take a moment, or sign in with the account that bought it.';
  @override
  String get nothingTitle => 'Nothing to restore';
  @override
  String get nothingHighlight => 'restore';
  @override
  String get nothingText =>
      'We found no active purchases in this store. If you subscribed with another account, sign in with it and try again.';
  @override
  String get restoreFailedTitle => 'Couldn\'t restore';
  @override
  String get restoreFailedHighlight => 'restore';
  @override
  String get tryAgain => 'Try again';
  @override
  String get done => 'Done';
  @override
  Map<String, String> get errors => {
    'storeUnavailable': 'The store isn\'t available on this device right now.',
    'manageUnavailable': 'There\'s no store page for this subscription here.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
}

// Path: privacy
class _Translations$privacy$en extends Translations$privacy$pt {
  _Translations$privacy$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Privacy and security';
  @override
  String get discreetMode => 'Discreet mode';
  @override
  String get partnerTitle => 'What your partner sees';
  @override
  String get partnerSlips => 'Sent slips';
  @override
  String get partnerSlipsText => 'Only what you send';
  @override
  String get partnerPrivateSlips => 'Private slips';
  @override
  String get partnerTemperature => 'Temperature';
  @override
  String get partnerJournal => 'Journal';
  @override
  String get partnerPause => 'Pause';
  @override
  String get partnerPauseText => 'The message you wrote';
  @override
  String get never => 'Never';
  @override
  String get partnerNote => 'Whoever makes the data decides who sees it.';
  @override
  String get ourTitle => 'What we can see';
  @override
  String get ourEncrypted => 'Your content is encrypted in transit.';
  @override
  String get ourPrivate => 'The team cannot read your private notes.';
  @override
  String get ourAnalytics => 'Analytics: counts only.';
  @override
  String get ourPlain => 'This page in plain language.';
  @override
  String get consents => 'Consents';
  @override
  String get sensitiveData => 'Sensitive data';
  @override
  String get analytics => 'Analytics';
  @override
  String get marketing => 'Marketing';
  @override
  String get ai => 'AI (when available)';
  @override
  String get terms => 'Terms';
  @override
  String get required => 'Required';
  @override
  String get consentsNote => 'Changes apply now.';
  @override
  String get saveError => 'Could not save now. Try again.';
  @override
  String get errorTitle => 'Could not load the consents';
  @override
  String get errorText => 'Try again in a moment.';
  @override
  String get sensitiveTracks => 'Sensitive tracks and notices';
  @override
  String get heavyDayNotice => 'Heavy-day notice';
}

// Path: profileDetails
class _Translations$profileDetails$en extends Translations$profileDetails$pt {
  _Translations$profileDetails$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Profile';
  @override
  String get nameLabel => 'Your name';
  @override
  String get nameHint => 'Marina';
  @override
  Map<String, String> get nameErrors => {
    'empty': 'Your name cannot be empty.',
    'tooLong': 'Use at most 30 characters.',
  };
  @override
  String get pronounsLabel => 'Pronouns';
  @override
  String get pronounsHint => 'Optional';
  @override
  Map<String, String> get pronounsErrors => {'tooLong': 'Use at most 30 characters.'};
  @override
  String get timeZoneLabel => 'Time zone';
  @override
  String get timeZonePlaceholder => 'Pick a time zone';
  @override
  String get loginLabel => 'Login';
  @override
  String get loginAccount => 'Account';
  @override
  String get loginEmail => 'Email';
  @override
  String get loginApple => 'Apple';
  @override
  String get loginGoogle => 'Google';
  @override
  String get photoNote => 'Photo upload is not available yet.';
  @override
  String get saved => 'Saved';
  @override
  String get loadErrorTitle => 'Could not load your profile';
  @override
  String get loadErrorText => 'Check your connection and try again.';
  @override
  Map<String, String> get timeZones => {
    'America/Sao_Paulo': 'São Paulo',
    'America/Argentina/Buenos_Aires': 'Buenos Aires',
    'America/Bogota': 'Bogotá',
    'America/Mexico_City': 'Mexico City',
    'America/New_York': 'New York',
    'America/Los_Angeles': 'Los Angeles',
    'Europe/Lisbon': 'Lisbon',
    'Europe/London': 'London',
    'Europe/Madrid': 'Madrid',
    'Europe/Paris': 'Paris',
    'Europe/Berlin': 'Berlin',
    'Africa/Luanda': 'Luanda',
    'Asia/Tokyo': 'Tokyo',
    'Australia/Sydney': 'Sydney',
    'UTC': 'UTC',
  };
  @override
  Map<String, String> get errors => {
    'NETWORK': 'No connection. Try again.',
    'other': 'Could not save right now. Try again.',
  };
}

// Path: profileSetup
class _Translations$profileSetup$en extends Translations$profileSetup$pt {
  _Translations$profileSetup$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'The basics';
  @override
  String get titleHighlight => 'basics';
  @override
  String get subtitle => 'Used for the words in the app and for the first date of your story.';
  @override
  String get nameLabel => 'Your name';
  @override
  String get nameHint => 'Marina';
  @override
  Map<String, String> get nameErrors => {
    'empty': 'Your name cannot be empty.',
    'tooLong': 'Use at most 30 characters.',
  };
  @override
  String get partnerNameLabel => 'Partner\'s name';
  @override
  String get partnerNameHint => 'Ricardo';
  @override
  Map<String, String> get partnerNameErrors => {'tooLong': 'Use at most 30 characters.'};
  @override
  String get partnerNameNote => 'Your partner\'s name stays on your account only.';
  @override
  String get themeLabel => 'Your app colour';
  @override
  String get themeRose => 'Rose';
  @override
  String get themeBlue => 'Blue';
  @override
  String get themeNeutral => 'Neutral';
  @override
  String get dateLabel => 'When did you start?';
  @override
  String get dateHint => 'Pick a date';
  @override
  String dateFormat({required Object month, required Object day, required Object year}) =>
      '${month} ${day}, ${year}';
  @override
  List<String> get months => [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  String get continueButton => 'Continue';
  @override
  Map<String, String> get errors => {
    'INVALID_DATE': 'That date does not look right. Pick one between 1950 and today.',
    'NETWORK': 'No connection. Your answers are still here, try again.',
    'other': 'Could not save right now. Try again.',
  };
}

// Path: programs
class _Translations$programs$en extends Translations$programs$pt {
  _Translations$programs$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'PROGRAMS';
  @override
  String get title => 'Programs';
  @override
  String get entryText => 'Short guided programs, at your own pace.';
  @override
  String get hubSubtitle => 'One idea a day. No rush, no pressure.';
  @override
  String get free => 'FREE';
  @override
  String get plus => 'PLUS';
  @override
  String lessonCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 lesson',
        other: '${count} lessons',
      );
  @override
  String get noLessons => 'Lessons coming';
  @override
  String get emptyTitle => 'No programs here yet';
  @override
  String get emptyText => 'New programs are on the way. Come back whenever you like.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'The programs are still here. Try again.';
  @override
  String get diaryLabel => 'JUST ME';
  @override
  String get diaryTitle => 'Diary';
  @override
  String get diaryText => 'A private place to write how you are.';
  @override
  String get start => 'Start';
  @override
  String get kContinue => 'Continue';
  @override
  String get restart => 'Start over';
  @override
  String get restartConfirmTitle => 'Start over?';
  @override
  String get restartConfirmText => 'This clears your lesson marks and returns to the first lesson.';
  @override
  String get restartConfirm => 'Start over';
  @override
  String get completed => 'Completed';
  @override
  String get lessonsTitle => 'Lessons';
  @override
  String get lessonsComingTitle => 'Lessons coming';
  @override
  String get lessonsComingText => 'This program is still being prepared. Come back soon.';
  @override
  String get lessonGoneTitle => 'Lesson not here';
  @override
  String get lessonGoneText => 'This day is no longer part of the program. Choose another lesson.';
  @override
  String get dayOneHint => 'The first lesson is always open in this program.';
  @override
  String dayLabel({required Object day}) => 'Day ${day}';
  @override
  String get shortRead => 'A short idea for today.';
  @override
  String get ready => 'Done';
  @override
  String get saveForLater => 'Save for later';
  @override
  String get saved => 'Saved for later.';
  @override
  String get savedTag => 'Saved';
  @override
  String get lockedTitle => 'Plus lesson';
  @override
  String get lockedLessonText => 'This lesson is part of Plus.';
  @override
  String get lockedProgramText => 'This program is part of Plus.';
  @override
  String get completeTitle => 'Well done';
  @override
  String completeText({required Object title}) => 'You completed ${title}.';
  @override
  String get completeHint => 'Choose another whenever you want.';
  @override
  String get seePrograms => 'See programs';
  @override
  String get diaryPrivacy => 'Just me. Never shared.';
  @override
  String get diaryPrompt => 'Today I felt...';
  @override
  String get diaryHint => 'Write without hurry. Only you can see this.';
  @override
  Map<String, String> get diaryBodyErrors => {
    'empty': 'Write a little before saving',
    'tooLong': 'The entry is too long',
  };
  @override
  String get diarySave => 'Save';
  @override
  String get diaryNew => 'New entry';
  @override
  String get diaryEdit => 'Edit';
  @override
  String get diaryDelete => 'Delete';
  @override
  String get diaryDeleteTitle => 'Delete this entry?';
  @override
  String get diaryDeleteText => 'This can\'t be undone.';
  @override
  String get diaryDeleteConfirm => 'Delete';
  @override
  String get diaryCapHint => 'Showing your last 100 entries.';
  @override
  String get diaryEmptyTitle => 'Nothing written yet';
  @override
  String get diaryEmptyText => 'When you want, write how you are. Only you can see it.';
  @override
  String get diaryErrorTitle => 'Couldn\'t load';
  @override
  String get diaryErrorText => 'Your entries are still saved. Try again.';
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  String dateLine({required Object month, required Object day, required Object year}) =>
      '${month} ${day}, ${year}';
  @override
  Map<String, String> get moods => {
    'calm': 'At peace',
    'tender': 'Held',
    'tired': 'Tired',
    'heavy': 'Heavy',
    'other': 'How I am',
  };
  @override
  Map<String, String> get lessonErrors => {'other': 'Couldn\'t do that right now. Try again.'};
  @override
  Map<String, String> get diaryErrors => {
    'other': 'Couldn\'t save right now. Your text is still here.',
  };
  @override
  String get sensitive => 'SENSITIVE';
  @override
  String get sensitiveGateTitle => 'A track just for you';
  @override
  String get sensitiveGateText =>
      'These lessons talk about grief, illness and trust. Your partner does not see that you joined or what you read. You can leave whenever you want.';
  @override
  String get sensitiveGateAction => 'Join this track';
  @override
  String get sensitiveConsentTitle => 'Join this track?';
  @override
  String get sensitiveConsentText =>
      'These lessons talk about grief, illness and trust. They stay just for you: your partner does not see your participation. You can withdraw this consent in Privacy and security.';
  @override
  String get sensitiveConsentConfirm => 'Join';
  @override
  String get sensitiveConsentCancel => 'Not now';
  @override
  String get sensitiveLessonLockedTitle => 'Sensitive track';
  @override
  String get sensitiveLessonLockedText =>
      'To open this lesson, turn on the sensitive tracks consent.';
  @override
  String get freeNote => 'Free shows only the first lesson.';
}

// Path: questions
class _Translations$questions$en extends Translations$questions$pt {
  _Translations$questions$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get tag => 'Question for you two';
  @override
  String get eyebrow => 'Question of the day';
  @override
  String get answerCta => 'Answer';
  @override
  String get editCta => 'Edit my answer';
  @override
  String get answerHint => 'Write as much or as little as you want.';
  @override
  Map<String, String> get answerErrors => {
    'empty': 'Write an answer',
    'tooLong': 'The answer is too long',
  };
  @override
  String get privateNote => 'Only you can see this until your partner answers too.';
  @override
  String get partnerAnsweredNote => 'Your partner already answered. Send yours to see both.';
  @override
  String get soloNote => 'Your answer stays private. Your partner will see it after you connect.';
  @override
  String get save => 'Send';
  @override
  String get cancel => 'Cancel';
  @override
  String get waitingTitle => 'Your answer is saved';
  @override
  String get waitingText => 'It appears here when your partner answers too.';
  @override
  String get waitingSoloText =>
      'When your partner joins, they will see your answer and you can see theirs.';
  @override
  String get checkAgain => 'Check again';
  @override
  String get voiceSoon => 'Voice note';
  @override
  String get voiceSoonNote => 'For now answers are written. Voice will come later.';
  @override
  String get revealTitle => 'Your answers together';
  @override
  String get revealHighlight => 'together';
  @override
  String get revealSubtitle => 'Now that you both answered, you can see each one.';
  @override
  String get revealNote => 'No scores. Just what each of you wrote.';
  @override
  String get you => 'You';
  @override
  String get partnerFallback => 'Your partner';
  @override
  String get discardTitle => 'Discard this answer?';
  @override
  String get discardText => 'The text you wrote was not saved.';
  @override
  String get discard => 'Discard';
  @override
  String get keepWriting => 'Keep writing';
  @override
  String get loadErrorTitle => 'Couldn\'t open the question';
  @override
  String get loadErrorText => 'Nothing was lost. Try again.';
  @override
  String get close => 'Close';
  @override
  Map<String, String> get errors => {'other': 'Couldn\'t save that now. Try again.'};
}

// Path: questionsEntry
class _Translations$questionsEntry$en extends Translations$questionsEntry$pt {
  _Translations$questionsEntry$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'QUESTION OF THE DAY';
  @override
  String get title => 'Question of the day';
  @override
  String get text => 'One question for both of you to answer.';
}

// Path: quickSlip
class _Translations$quickSlip$en extends Translations$quickSlip$pt {
  _Translations$quickSlip$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String dateLine({required Object weekday, required Object month, required Object day}) =>
      '${weekday}, ${month} ${day}';
  @override
  List<String> get weekdays => [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  String get title => 'What made you happy?';
  @override
  String get titleHighlight => 'happy';
  @override
  String get subtitle => 'One line is enough. 30 seconds.';
  @override
  String get hint => 'E.g. made coffee before I woke up';
  @override
  Map<String, String> get textErrors => {
    'empty': 'Write the slip first',
    'tooLong': 'This slip is too long',
  };
  @override
  Map<String, String> get categories => {
    'said': 'Said something',
    'did': 'Did something',
    'noticed': 'Noticed me',
    'helped': 'Helped me',
    'other': '',
  };
  @override
  String get privacyNote => 'It stays private. On Sunday you choose what goes on the card.';
  @override
  String get save => 'Save';
  @override
  late final _Translations$quickSlip$saved$en saved = _Translations$quickSlip$saved$en._(_root);
  @override
  Map<String, String> get errors => {
    'FREE_LIMIT_REACHED': 'You reached the free plan\'s slip limit.',
    'RATE_LIMITED': 'Too many tries in a row. Wait a moment.',
    'other': 'Could not save right now. Your text is still here, try again.',
  };
}

// Path: received
class _Translations$received$en extends Translations$received$pt {
  _Translations$received$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  Map<String, String> get kinds => {
    'repair': 'Repair card',
    'need': 'I need…',
    'miss_us': 'Missing you',
    'hug': 'A hug',
    'distance': 'A little distance',
    'heavy_day': 'A heavy day',
    'good_news': 'Good news',
    'other': '',
  };
  @override
  String get fromPartner => 'From your partner';
  @override
  String get privateFirst => 'Your answer is private first. There is no right or wrong.';
  @override
  Map<String, String> get responses => {
    'talk': 'Yes, let\'s talk',
    'more_time': 'I need a bit more time',
    'later': 'I\'ll answer later',
    'other': '',
  };
  @override
  String get seen => 'Got it';
  @override
  String get doneTitle => 'All good';
  @override
  String get doneText => 'Thanks for reading it calmly.';
  @override
  String get emptyTitle => 'Nothing new';
  @override
  String get emptyText => 'When your partner sends something, it shows up here.';
  @override
  String get close => 'Close';
  @override
  String get errorTitle => 'Couldn\'t open this';
  @override
  String get errorText => 'Nothing was lost. Try again.';
  @override
  Map<String, String> get errors => {
    'NOT_FOUND': 'That message isn\'t here anymore.',
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t answer right now. Try again.',
  };
}

// Path: relationshipChanged
class _Translations$relationshipChanged$en extends Translations$relationshipChanged$pt {
  _Translations$relationshipChanged$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Something changed?';
  @override
  String get highlight => 'changed';
  @override
  String get subtitle => 'Take your time. This only changes what the app shows.';
  @override
  String get optionEnded => 'We broke up';
  @override
  String get optionBereaved => 'I lost them';
  @override
  String get optionOnBreak => 'A break';
  @override
  String get optionTogether => 'Everything is fine';
  @override
  String get continueLabel => 'Continue';
  @override
  String get saved => 'Saved';
  @override
  Map<String, String> get errors => {
    'NETWORK': 'No connection. Try again.',
    'other': 'Could not save right now. Try again.',
  };
}

// Path: relationshipSettings
class _Translations$relationshipSettings$en extends Translations$relationshipSettings$pt {
  _Translations$relationshipSettings$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Relationship';
  @override
  String get phaseLabel => 'Phase';
  @override
  String get phasePlaceholder => 'Pick a phase';
  @override
  Map<String, String> get phases => {
    'beginning': 'Just starting',
    'dating': 'Dating',
    'living_together': 'Living together',
    'engaged': 'Engaged',
    'married': 'Married',
    'with_kids': 'With kids',
    'long_distance': 'Long distance',
    'with_parents': 'Living with parents',
    'restarting': 'Starting over',
  };
  @override
  String get dateLabel => 'Together since';
  @override
  String get dateHint => 'Pick a date';
  @override
  String dateFormat({required Object month, required Object day, required Object year}) =>
      '${month} ${day}, ${year}';
  @override
  List<String> get months => [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  String get futureDateNote => 'A future date is fine; the countdown just starts later.';
  @override
  String get partnerLabel => 'Partner';
  @override
  String get invitePartner => 'Invite your partner';
  @override
  String get partnerError => 'Could not load your partner.';
  @override
  String get partnerRetry => 'Try again';
  @override
  String get phaseNote => 'The phase only changes the words.';
  @override
  String get saved => 'Saved';
  @override
  String get loadErrorTitle => 'Could not load the relationship';
  @override
  String get loadErrorText => 'Check your connection and try again.';
  @override
  Map<String, String> get errors => {
    'NETWORK': 'No connection. Try again.',
    'other': 'Could not save right now. Try again.',
  };
  @override
  String get changedPrompt => 'Something changed between you two?';
  @override
  String get changedSubtitle => 'Update what the app shows';
}

// Path: reminders
class _Translations$reminders$en extends Translations$reminders$pt {
  _Translations$reminders$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Repara';
  @override
  String get dailyIdea => 'A small idea for today.';
  @override
  String get dates => 'A date is coming up.';
  @override
  String get weeklyCard => 'Your card is ready.';
  @override
  String get discreet => 'Open the app to see.';
}

// Path: repair
class _Translations$repair$en extends Translations$repair$pt {
  _Translations$repair$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$repair$calm$en calm = _Translations$repair$calm$en._(_root);
  @override
  late final _Translations$repair$softStart$en softStart = _Translations$repair$softStart$en._(
    _root,
  );
  @override
  late final _Translations$repair$quick$en quick = _Translations$repair$quick$en._(_root);
  @override
  late final _Translations$repair$guided$en guided = _Translations$repair$guided$en._(_root);
  @override
  late final _Translations$repair$learning$en learning = _Translations$repair$learning$en._(_root);
  @override
  late final _Translations$repair$next$en next = _Translations$repair$next$en._(_root);
}

// Path: rituals
class _Translations$rituals$en extends Translations$rituals$pt {
  _Translations$rituals$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Rituals';
  @override
  String get subtitle => 'Small habits you want to protect. No streaks, no pressure.';
  @override
  String get emptyTitle => 'No rituals yet';
  @override
  String get emptyText => 'A Friday dinner, a Sunday walk. What do you want to protect?';
  @override
  String get create => 'Create a ritual';
  @override
  String get didIt => 'We did it';
  @override
  String get warm => 'That\'s lovely. A moment for the two of you.';
  @override
  Map<String, String> get cadences => {
    'daily': 'Every day',
    'weekly': 'Every week',
    'biweekly': 'Every two weeks',
    'monthly': 'Every month',
    'other': '',
  };
  @override
  String cadenceOn({required Object cadence, required Object weekday}) => '${cadence}, ${weekday}';
  @override
  List<String> get weekdays => [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  @override
  String get createTitle => 'New ritual';
  @override
  String get editTitle => 'Your ritual';
  @override
  String get nameLabel => 'Name';
  @override
  String get nameHint => 'E.g. Friday dinner';
  @override
  String get cadenceLabel => 'How often';
  @override
  String get weekdayLabel => 'On which day';
  @override
  String get hourLabel => 'What time';
  @override
  String hourFormat({required Object hour}) => '${hour}:00';
  @override
  String get reminderTitle => 'Reminder';
  @override
  String get reminderText => 'A short notice on this phone, with no details.';
  @override
  String get save => 'Save';
  @override
  String get archive => 'Archive';
  @override
  String get archiveTitle => 'Archive this ritual?';
  @override
  String get archiveText => 'It leaves the list. The history stays saved.';
  @override
  String get errorTitle => 'Couldn\'t open this';
  @override
  String get errorText => 'Nothing was lost. Try again.';
  @override
  Map<String, String> get errors => {
    'NOT_FOUND': 'That ritual isn\'t here anymore.',
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
}

// Path: safeMode
class _Translations$safeMode$en extends Translations$safeMode$pt {
  _Translations$safeMode$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Safe mode';
  @override
  String get text => 'For when the app needs to stay discreet on this phone.';
  @override
  String get toggle => 'Hide the app';
  @override
  String get toggleText => 'When you switch apps, the screen goes blank.';
  @override
  String get localOnly => 'This stays only on this phone. Nothing is sent or recorded.';
  @override
  String get quickExit => 'Leave now';
}

// Path: safety
class _Translations$safety$en extends Translations$safety$pt {
  _Translations$safety$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get entry => 'Safety and support';
}

// Path: sessionExpired
class _Translations$sessionExpired$en extends Translations$sessionExpired$pt {
  _Translations$sessionExpired$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Your session ended';
  @override
  String get highlight => 'ended';
  @override
  String get text => 'Sign in again to continue. Your data is safe.';
  @override
  String get action => 'Sign in';
}

// Path: settingsHome
class _Translations$settingsHome$en extends Translations$settingsHome$pt {
  _Translations$settingsHome$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Settings';
  @override
  String get safety => 'Safety and support';
  @override
  String get safetyStatus => 'Safe mode';
  @override
  String get profile => 'Profile';
  @override
  String get relationship => 'Relationship';
  @override
  String get connected => 'You are connected';
  @override
  String get invitePartner => 'Invite your partner';
  @override
  String get notifications => 'Notifications';
  @override
  String get devices => 'Devices';
  @override
  String get on => 'On in the app';
  @override
  String get off => 'Off in the app';
  @override
  String get plan => 'Plan';
  @override
  String get planFree => 'Free';
  @override
  String get planPlus => 'Plus';
  @override
  String get spice => 'Moments for two';
  @override
  String get discreet => 'Discreet mode';
  @override
  String get discreetOn => 'On';
  @override
  String get discreetOff => 'Off';
  @override
  String get privacy => 'Privacy and security';
  @override
  String get privacyStatus => 'Who sees what';
  @override
  String get signOut => 'Sign out';
  @override
  String get deleteAccount => 'Delete account';
  @override
  String pendingBanner({required Object date}) => 'Your account will be deleted on ${date}.';
  @override
  String get pendingAction => 'See';
  @override
  String get pendingBannerSimple => 'Your account will be deleted soon.';
  @override
  String get help => 'Help and support';
  @override
  String get helpStatus => 'FAQ and contact';
  @override
  String get appPreferences => 'App preferences';
  @override
  String get appPreferencesStatus => 'Appearance, text and language';
  @override
  String get weeklyCard => 'Weekly card';
  @override
  String get language => 'Language';
  @override
  String get accountSection => 'Account';
  @override
  String get preferencesSection => 'Preferences';
  @override
  String get privacySection => 'Privacy and help';
  @override
  String connectedWith({required Object name}) => 'Connected with ${name}';
}

// Path: slipDetail
class _Translations$slipDetail$en extends Translations$slipDetail$pt {
  _Translations$slipDetail$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String dateLine({required Object weekday, required Object month, required Object day}) =>
      '${weekday}, ${month} ${day}';
  @override
  List<String> get weekdays => [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  Map<String, String> get kinds => {
    'quick': 'Quick',
    'specific': 'Specific',
    'if_then': 'If… then',
    'invisible': 'Invisible',
    'other': '',
  };
  @override
  String get private => 'Only you see this slip.';
  @override
  String get archived => 'Archived';
  @override
  String get feeling => 'How you felt';
  @override
  String get plan => 'Then I…';
  @override
  String get jarTitle => 'Keep in the jar';
  @override
  String get jarText => 'To open on a bad day. Only you see it.';
  @override
  String get cardTitle => 'Who sees this';
  @override
  String get cardOff => 'Only me';
  @override
  String get cardOffText => 'Stays in your week and does not go in the card.';
  @override
  String get cardOn => 'Can go in the card';
  @override
  String get cardOnText => 'On Sunday you choose whether it goes.';
  @override
  String get cardInvisible => 'Invisible slips never go in a card.';
  @override
  String get previewTitle => 'What your partner would read';
  @override
  String get previewText => 'If this slip goes in the card, this is the text that shows.';
  @override
  String get sentNote =>
      'This slip already went in a card. The sent card keeps the earlier copy, even if you edit or delete it here.';
  @override
  Map<String, String> get draftBodyErrors => {
    'empty': 'Write the slip first',
    'tooLong': 'This slip is too long',
  };
  @override
  String get edit => 'Edit';
  @override
  String get editSave => 'Save';
  @override
  String get editCancel => 'Cancel';
  @override
  String get archive => 'Archive';
  @override
  String get restore => 'Restore';
  @override
  String get delete => 'Delete';
  @override
  String get deleteTitle => 'Delete this slip?';
  @override
  String get deleteText => 'It will be removed from your week and your timeline.';
  @override
  String get deleteConfirm => 'Delete';
  @override
  String get saved => 'Saved';
  @override
  String get archivedToast => 'Archived';
  @override
  String get deleted => 'Slip deleted';
  @override
  String get notFoundTitle => 'This slip no longer exists';
  @override
  String get notFoundText => 'It may have been deleted.';
  @override
  String get errorTitle => 'Couldn\'t open this slip';
  @override
  String get errorText => 'It is still saved. Try again.';
  @override
  Map<String, String> get errors => {
    'SLIP_NOT_FOUND': 'This slip no longer exists.',
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t do that right now. Try again.',
  };
  @override
  String get discardTitle => 'Discard this slip?';
}

// Path: slipKind
class _Translations$slipKind$en extends Translations$slipKind$pt {
  _Translations$slipKind$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get switcherTitle => 'Other ways to write it down';
  @override
  String get quickEntry => 'Quick';
  @override
  String get needEntry => 'I need…';
  @override
  Map<String, String> get kinds => {
    'specific': 'Specific',
    'if_then': 'If… then',
    'invisible': 'Invisible',
    'other': '',
  };
  @override
  late final _Translations$slipKind$specific$en specific = _Translations$slipKind$specific$en._(
    _root,
  );
  @override
  late final _Translations$slipKind$ifThen$en ifThen = _Translations$slipKind$ifThen$en._(_root);
  @override
  late final _Translations$slipKind$invisible$en invisible = _Translations$slipKind$invisible$en._(
    _root,
  );
  @override
  Map<String, String> get workAreas => {
    'planning': 'Planning',
    'dates': 'Dates',
    'kitchen': 'Kitchen',
    'cleaning': 'Cleaning',
    'kids': 'Kids',
    'emotional': 'Emotional',
    'finances': 'Finances',
    'other': 'Other',
  };
  @override
  Map<String, String> get textErrors => {
    'empty': 'Write the slip first',
    'tooLong': 'This slip is too long',
  };
  @override
  Map<String, String> get feelingErrors => {'tooLong': 'This is too long'};
  @override
  Map<String, String> get planErrors => {
    'empty': 'Say what you will do',
    'tooLong': 'This is too long',
  };
  @override
  String get save => 'Save';
  @override
  late final _Translations$slipKind$saved$en saved = _Translations$slipKind$saved$en._(_root);
  @override
  Map<String, String> get errors => {
    'FREE_LIMIT_REACHED': 'You reached the free plan\'s slip limit.',
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t save right now. Your text is still here, try again.',
  };
}

// Path: slipsList
class _Translations$slipsList$en extends Translations$slipsList$pt {
  _Translations$slipsList$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Slips';
  @override
  String get scopeWeek => 'This week';
  @override
  String get scopeAll => 'All';
  @override
  String get search => 'Search';
  @override
  String get searchClose => 'Close search';
  @override
  String get searchHint => 'Search your slips';
  @override
  String get searchEmptyTitle => 'Nothing found';
  @override
  String get searchEmptyText => 'Try another word.';
  @override
  String get thisWeek => 'This week';
  @override
  String get lastWeek => 'Last week';
  @override
  String weekRange({required Object start, required Object end}) => '${start} – ${end}';
  @override
  String dateShort({required Object month, required Object day}) => '${month} ${day}';
  @override
  String dayLine({required Object weekday, required Object category}) => '${weekday} · ${category}';
  @override
  List<String> get weekdaysShort => ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  @override
  List<String> get monthsShort => [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  @override
  Map<String, String> get categories => {
    'said': 'Said something',
    'did': 'Did something',
    'noticed': 'Noticed me',
    'helped': 'Helped',
    'other': '',
  };
  @override
  String get pastCards => 'Past cards';
  @override
  String get emptyTitle => 'Nothing yet';
  @override
  String get emptyText => 'A slip is one good thing, in one line.';
  @override
  String get emptyAction => 'Add a slip';
  @override
  String get errorTitle => 'Could not load your slips';
  @override
  String get errorText => 'They are still saved. Try again.';
}

// Path: spice
class _Translations$spice$en extends Translations$spice$pt {
  _Translations$spice$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Moments for two';
  @override
  String get offText =>
      'This section is hidden by default, behind this setting. It is light, playful cards, nothing explicit. They only show up when you both turn it on, and either of you can turn it off at any time, without notice.';
  @override
  String get turnOn => 'Turn on';
  @override
  String get notNow => 'Not now';
  @override
  String get waitingText =>
      'You both need to accept. Nothing is sent to your partner; when they turn it on too, the cards show up here.';
  @override
  String get readyText => 'Light cards for the two of you. Do it or skip it, no pressure.';
  @override
  String get drawCard => 'Draw a card';
  @override
  String get turnOff => 'Turn off';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Try again in a moment.';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t change that right now. Try again.',
  };
}

// Path: story
class _Translations$story$en extends Translations$story$pt {
  _Translations$story$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Image to share';
  @override
  String get privacyNote =>
      'The image is made on your device and carries no names or text unless you choose.';
  @override
  String get days => 'days';
  @override
  String get together => 'together';
  @override
  String get namesLabel => 'Include the names';
  @override
  String get namesText => 'Off by default.';
  @override
  String get phraseLabel => 'A line (optional)';
  @override
  String get phraseHint => 'E.g. so much still ahead';
  @override
  String get share => 'Share image';
  @override
  String get emptyTitle => 'Your date is missing';
  @override
  String get emptyText => 'Set since when you are together in Our history to create the image.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Try again in a moment.';
  @override
  Map<String, String> get errors => {'other': 'Couldn\'t share right now. Try again.'};
}

// Path: sundayCard
class _Translations$sundayCard$en extends Translations$sundayCard$pt {
  _Translations$sundayCard$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Your card';
  @override
  String get edit => 'Edit';
  @override
  String get save => 'Save';
  @override
  String get cancel => 'Cancel';
  @override
  String get noteLabel => 'Closing note';
  @override
  String get noteHint => 'Thank you for this week.';
  @override
  String get moveUp => 'Move up';
  @override
  String get moveDown => 'Move down';
  @override
  String get remove => 'Remove from card';
  @override
  String get emptyTitle => 'A week without slips';
  @override
  String get emptyText => 'Note one good thing and it goes on the Sunday card.';
  @override
  String get emptyAction => 'Note a slip';
  @override
  String get errorTitle => 'Could not load the card';
  @override
  String get errorText => 'Your slips are still saved. Try again.';
  @override
  String get saveError => 'Could not save the card. Try again.';
  @override
  String get openFromToday => 'See the draft';
  @override
  String get deliverError => 'Could not send right now. The card is still here, try again.';
  @override
  late final _Translations$sundayCard$send$en send = _Translations$sundayCard$send$en._(_root);
  @override
  late final _Translations$sundayCard$hold$en hold = _Translations$sundayCard$hold$en._(_root);
  @override
  late final _Translations$sundayCard$held$en held = _Translations$sundayCard$held$en._(_root);
  @override
  late final _Translations$sundayCard$sent$en sent = _Translations$sundayCard$sent$en._(_root);
}

// Path: tabs
class _Translations$tabs$en extends Translations$tabs$pt {
  _Translations$tabs$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get today => 'Today';
  @override
  String get slips => 'Slips';
  @override
  String get together => 'Together';
  @override
  String get memories => 'Memories';
  @override
  String get capture => 'New slip';
  @override
  String get soonTitle => 'Under construction';
  @override
  String get soonText => 'This part of the app is still being prepared.';
  @override
  String get segmentTogether => 'Us';
  @override
  String get forMeFooter => 'Private tools. Never shared.';
  @override
  String get segmentForMe => 'For me';
  @override
  String get checkinLabel => 'CHECK-IN';
  @override
  String get checkinTitle => 'Weekly check-in';
  @override
  String get checkinText => 'A short conversation, private first.';
  @override
  String get logisticsLabel => 'PRACTICAL';
  @override
  String get logisticsTitle => 'Logistics meeting';
  @override
  String get logisticsText => 'The practical things, with nobody carrying them alone.';
  @override
  String get listsLabel => 'LISTS';
  @override
  String get listsTitle => 'Lists';
  @override
  String get listsEmpty => 'No lists yet. Start one together.';
  @override
  String get listsEmptyPrivate => 'No lists yet. Start one of your own.';
  @override
  String listsSharedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 list, shared',
        other: '${count} lists, shared',
      );
  @override
  String listsPrivateCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 list, private',
        other: '${count} lists, private',
      );
  @override
  String get soloNote => 'When your partner joins, shared things show up here.';
  @override
  String get ritualsLabel => 'ROUTINE';
  @override
  String get ritualsTitle => 'Rituals';
  @override
  String get ritualsText => 'Small habits you want to protect.';
  @override
  String get dateNightLabel => 'DATE';
  @override
  String get dateNightTitle => 'Date night';
  @override
  String get dateNightText => 'Ideas for the two of you, picked together.';
  @override
  String get partnerLabel => 'JUST FOR YOU';
  @override
  String get partnerTitle => 'About your partner';
  @override
  String get partnerText => 'Private notes to remember what they like.';
  @override
  String get chatLabel => 'TALK';
  @override
  String get chatTitle => 'Mascot';
  @override
  String get chatText => 'A calm conversation that is not kept.';
  @override
  String get hardTalkLabel => 'HARD CONVERSATION';
  @override
  String get hardTalkTitle => 'Prepare a hard conversation';
  @override
  String get hardTalkText => 'The mascot helps you sort out what to say.';
  @override
  String get notesLabel => 'FOR YOUR PARTNER';
  @override
  String get notesTitle => 'A note or a drawing';
  @override
  String get notesText => 'Send something short and kind, whenever you like.';
  @override
  String get usLabel => 'US';
  @override
  String get usTitle => 'I miss us';
  @override
  String get usText => 'A light tap for your partner, no pressure.';
  @override
  String get touchLabel => 'TOUCH';
  @override
  String get touchTitle => 'Touch cards';
  @override
  String get touchText => 'Neutral, to do or skip.';
  @override
  String get distanceLabel => 'DISTANCE';
  @override
  String get distanceTitle => 'Our two clocks';
  @override
  String get distanceText => 'Time zones and the countdown to seeing each other.';
  @override
  String get parentsLabel => 'WITH PARENTS';
  @override
  String get parentsTitle => 'Five minutes for us';
  @override
  String get parentsText => 'A short moment just for the two of you, even in a full house.';
  @override
  String get capsulesLabel => 'TIME CAPSULE';
  @override
  String get capsulesTitle => 'A message to the future';
  @override
  String get capsulesText => 'Stays closed until the day you choose.';
  @override
  String get datesLabel => 'DATES';
  @override
  String get datesTitle => 'Important dates';
  @override
  String get datesText => 'Birthdays, gifts and holidays, with a heads-up.';
  @override
  String get badDayLabel => 'HELP';
  @override
  String get badDayTitle => 'A hard day';
  @override
  String get badDayText => 'Three small things to do right now.';
  @override
  String get starterLabel => 'TALK';
  @override
  String get starterTitle => 'Start a conversation';
  @override
  String get starterText => 'A question to open with, no rush.';
  @override
  String get dayLabel => 'DAY';
  @override
  String get dayTitle => 'Day by day';
  @override
  String get dayText => 'What matters on each day.';
  @override
  String get plusLabel => 'PLAN';
  @override
  String get plusTitle => 'Free and Plus';
  @override
  String get plusText => 'What each plan includes, no pressure.';
  @override
  String get temperatureLabel => 'BETWEEN YOU';
  @override
  String get temperatureTitle => 'How is it between you?';
  @override
  String get temperatureText => 'A private check-in, never a score.';
  @override
  String get learningLabel => 'JUST FOR YOU';
  @override
  String get learningTitle => 'What you learned';
  @override
  String get learningText => 'Private notes you can delete.';
  @override
  String get fightStyleLabel => 'JUST FOR YOU';
  @override
  String get fightStyleTitle => 'How I react in a fight';
  @override
  String get fightStyleText => 'A short, private reflection on your own way.';
  @override
  String get guidesLabel => 'CONVERSATIONS';
  @override
  String get guidesTitle => 'Difficult conversations';
  @override
  String get guidesText => 'One step at a time, just for you.';
  @override
  String get gamesLabel => 'GAMES';
  @override
  String get gamesTitle => 'Play together';
  @override
  String get gamesText => 'Short games, no scores and no winner.';
  @override
  String get gamesLock => 'Needs both of you';
  @override
  String get sectionForYou => 'For you two';
  @override
  String get sectionTools => 'Tools';
  @override
  String get sectionMore => 'More';
  @override
  String get sectionPrivate => 'Only yours';
  @override
  String get sectionPatterns => 'My patterns';
  @override
  String get logisticsMeta => '15 min · weekly';
  @override
  String get ritualsMeta => 'Small habits';
  @override
  String get dateNightMeta => 'For you two';
  @override
  String get programsMeta => 'Micro-lessons';
  @override
  String get checkinMeta => 'Once a week';
  @override
  String get questionMeta => 'One for both';
  @override
  String get gamesMeta => 'No score';
  @override
  String get datesMeta => 'With a heads-up';
  @override
  String get giftsMeta => 'Only for you';
  @override
  String get guidesMeta => 'One step at a time';
  @override
  String get starterMeta => 'One question';
  @override
  String get dayMeta => 'One day at a time';
  @override
  String get capsulesMeta => 'For the future';
  @override
  String get temperatureMeta => 'Private, no score';
  @override
  String get widgetsMeta => 'On the home screen';
  @override
  String get usMeta => 'One touch';
  @override
  String get touchMeta => 'Neutral cards';
  @override
  String get badDayMeta => 'Three small things';
  @override
  String get distanceMeta => 'Time zones and reunion';
  @override
  String get parentsMeta => 'Five minutes';
  @override
  String get diaryMeta => 'Only yours';
  @override
  String get hardTalkMeta => 'Notes before you talk';
  @override
  String get notesMeta => 'When you want';
  @override
  String get learningMeta => 'Private notes';
  @override
  String get partnerMeta => 'Only for you';
  @override
  String get fightStyleMeta => 'How you react';
  @override
  String get loveStyleMeta => 'How you feel loved';
  @override
  String get chatMeta => 'A calm conversation';
  @override
  String get listsNone => 'None yet';
}

// Path: temperature
class _Translations$temperature$en extends Translations$temperature$pt {
  _Translations$temperature$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get levelTitle => 'How is it between you?';
  @override
  String get levelHighlight => 'between you';
  @override
  String get levelNote => 'Private. Never becomes a score.';
  @override
  Map<String, String> get levels => {
    'good': 'Good',
    'so_so': 'So-so',
    'turbulent': 'Turbulent',
    'fight': 'An argument',
    'other': '',
  };
  @override
  String get continueAction => 'Continue';
  @override
  String get back => 'Back';
  @override
  String get skip => 'Not now';
  @override
  String get intensityTitle => 'How strong is it?';
  @override
  String get intensityHighlight => 'strong';
  @override
  String get intensityHint => 'Under 7 you can talk. Over 7, take a pause first.';
  @override
  String get intensityHigh => 'High value: how about a pause first?';
  @override
  String get intensityLow => 'Mild';
  @override
  String get intensityTop => 'Very strong';
  @override
  String get intensityLabel => 'Intensity';
  @override
  late final _Translations$temperature$result$en result = _Translations$temperature$result$en._(
    _root,
  );
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t save right now. Your answers are still here.',
  };
}

// Path: timeInApp
class _Translations$timeInApp$en extends Translations$timeInApp$pt {
  _Translations$timeInApp$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Time in the app';
  @override
  String get titleHighlight => 'app';
  @override
  String get text => 'We hide cards and reminders until you come back.';
  @override
  String get pause => 'Pause the app';
  @override
  String get cancel => 'Cancel';
}

// Path: today
class _Translations$today$en extends Translations$today$pt {
  _Translations$today$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String greetingMorning({required Object name}) => 'Good morning, ${name}';
  @override
  String greetingAfternoon({required Object name}) => 'Good afternoon, ${name}';
  @override
  String greetingEvening({required Object name}) => 'Good evening, ${name}';
  @override
  String get greetingNoName => 'Hello';
  @override
  String dateLine({required Object weekday, required Object month, required Object day}) =>
      '${weekday}, ${month} ${day}';
  @override
  List<String> get weekdays => [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  @override
  List<String> get months => [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  String togetherYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 year',
        other: '${count} years',
      );
  @override
  String togetherMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 month',
        other: '${count} months',
      );
  @override
  String togetherDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 day',
        other: '${count} days',
      );
  @override
  String get togetherChipAction => 'Open our story';
  @override
  String togetherJoin({required Object first, required Object second}) => '${first} and ${second}';
  @override
  String get invitePerson => 'Invite your person';
  @override
  String get pendingInviteTitle => 'Invite sent';
  @override
  String get pendingInviteText => 'They have not joined yet. Send again or revoke.';
  @override
  String get pendingInviteAction => 'See invite';
  @override
  String get answer => 'Answer';
  @override
  String slipsThisWeek({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        zero: 'No slips yet',
        one: '1 slip this week',
        other: '${count} slips this week',
      );
  @override
  String get weekHintEmpty => 'no rush';
  @override
  String get weekHint => 'card on Sunday';
  @override
  String get forToday => 'For today';
  @override
  String get ideaLabel => 'Idea of the day';
  @override
  String slipsThisWeekPrivate({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        zero: 'Your private slips: none this week',
        one: 'Your private slips: 1 this week',
        other: 'Your private slips: ${count} this week',
      );
  @override
  String get sundayCardLabel => 'Sunday card';
  @override
  String get sundayCardTitle => 'Your card for this week';
  @override
  String get inviteCardLabel => 'Invite';
  @override
  String inviteCardTitle({required Object name}) => 'Invite ${name}';
  @override
  String get inviteCardTitleNoName => 'Invite your person';
  @override
  String get inviteCardText => 'Shared cards and tools need both of you.';
  @override
  String get privateTag => 'Only yours';
  @override
  String get privateQuestion => 'How was your day, really?';
  @override
  String get privateHighlight => 'day';
  @override
  String get privateAction => 'Note a slip';
  @override
  String get emptyWeekTag => 'No rush';
  @override
  String get emptyWeekQuestion => 'What was one good thing today?';
  @override
  String get emptyWeekHighlight => 'good';
  @override
  String get emptyWeekAction => 'Note a slip';
  @override
  String get nothingReceived => 'No new cards. No rush.';
  @override
  String get cardReceived => 'You received a card';
  @override
  String get cardReceivedAction => 'See card';
  @override
  String get firstDayLabel => 'Getting started';
  @override
  String firstDayGreeting({required Object name}) => 'Hi, ${name}';
  @override
  String get firstDaySubtitle => 'so glad you are here';
  @override
  String get firstDayTag => 'Good start';
  @override
  String firstDayTitle({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'You have 1 slip.',
        other: 'You have ${count} slips.',
      );
  @override
  String firstDayHighlight({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 slip',
        other: '${count} slips',
      );
  @override
  String get firstDayText => 'A slip is one good thing, in one line. On Sunday they become a card.';
  @override
  String get firstDayAction => 'Note one more';
  @override
  String get errorTitle => 'Could not load Today';
  @override
  String get errorText => 'Your slips are safe. Try again.';
  @override
  String cardReceivedNamed({required Object name}) => '${name} sent you a card';
  @override
  String get pauseOwnTitle => 'You asked for some space';
  @override
  String pauseOwnText({required Object time}) =>
      'You\'re back around ${time}. Nothing to do right now.';
  @override
  String get pausePartnerTitle => 'Your partner asked for some space';
  @override
  String get pausePartnerText => 'No rush. There\'s nothing to do right now.';
  @override
  String get signalReceived => 'Your partner sent you a message';
  @override
  String get signalReceivedAction => 'View';
  @override
  String get pauseBack => 'Come back now';
  @override
  String get pauseBackRepair => 'Come back and repair';
  @override
  String get pauseWriteSlip => 'Write a slip';
  @override
  String get weekHintToday => 'card goes out today, 18:00';
}

// Path: unpair
class _Translations$unpair$en extends Translations$unpair$pt {
  _Translations$unpair$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get appBarTitle => 'Unpair';
  @override
  String title({required Object name}) => 'Unpair from ${name}?';
  @override
  String get text => 'Shared cards and lists stop. Your notes stay with you.';
  @override
  String get confirm => 'Unpair';
  @override
  String get cancel => 'Cancel';
  @override
  String get unnamedPartner => 'your person';
  @override
  late final _Translations$unpair$done$en done = _Translations$unpair$done$en._(_root);
  @override
  late final _Translations$unpair$relationship$en relationship =
      _Translations$unpair$relationship$en._(_root);
  @override
  late final _Translations$unpair$breakup$en breakup = _Translations$unpair$breakup$en._(_root);
  @override
  late final _Translations$unpair$partnerNotice$en partnerNotice =
      _Translations$unpair$partnerNotice$en._(_root);
  @override
  Map<String, String> get errors => {
    'NETWORK': 'No connection. Check your internet and try again.',
    'STILL_PAIRED': 'The relationship is still active. Try again.',
    'other': 'Could not unpair right now. Try again.',
  };
}

// Path: welcome
class _Translations$welcome$en extends Translations$welcome$pt {
  _Translations$welcome$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get headline => 'Small good things, said out loud.';
  @override
  String get headlineHighlight => 'said out loud';
  @override
  String get subtitle => 'A light way to notice what the other does well, every week.';
  @override
  String get start => 'Get started';
  @override
  String get haveAccount => 'I already have an account';
  @override
  String get debugSignIn => 'Sign in (debug)';
}

// Path: widgets
class _Translations$widgets$en extends Translations$widgets$pt {
  _Translations$widgets$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get settingsTitle => 'Widgets';
  @override
  String get settingsSubtitle => 'Home screen';
  @override
  String get juntosCategory => 'HOME SCREEN';
  @override
  String get juntosTitle => 'Repara widgets';
  @override
  String get juntosSubtitle => 'Calm reminders for you or for the two of you.';
  @override
  String get galleryTitle => 'Widgets';
  @override
  String get segmentOwn => 'Just mine';
  @override
  String get segmentCouple => 'Couple';
  @override
  String get howToAddAction => 'How to add to screen';
  @override
  String get configureAction => 'Configure';
  @override
  String get ownSlipLabel => 'LOG SLIP';
  @override
  String get ownSlipTitle => '+ Slip';
  @override
  String get ownSlipSubtitle => 'Tap to log';
  @override
  String get ownIdeaLabel => 'DAILY IDEA';
  @override
  String get ownIdeaDefault => 'Leave a small note today';
  @override
  String get ownIdeaHint => 'Tap to open';
  @override
  String get ownJarLabel => 'BAD DAY JAR';
  @override
  String get ownJarTitle => 'Open a saved slip';
  @override
  String get ownJarPrivacy => 'Private: only on your device';
  @override
  String get lockScreenLabel => 'LOCK SCREEN';
  @override
  String get lockScreenDefault => 'Calm reminder · No names';
  @override
  String get coupleCounterLabel => 'COUNTER';
  @override
  String get coupleCounterUnset => 'Set your relationship date to see days together';
  @override
  String coupleCounterDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '${count} day together',
        other: '${count} days together',
      );
  @override
  String get couplePhotosLabel => 'COUPLE PHOTOS · PLUS';
  @override
  String get couplePhotosPrompt => 'Choose a photo of you two';
  @override
  String get couplePhotosPlusHint => 'Available with Plus';
  @override
  String get partnerNoteLabel => 'PARTNER NOTE';
  @override
  String get partnerNoteEmpty => 'No new note right now';
  @override
  String partnerNoteFrom({required Object name}) => 'From ${name}';
  @override
  String get partnerNoteFromDefault => 'From your partner';
  @override
  String get cardEncounterLabel => 'CARD & DATE';
  @override
  String get cardStateReady => 'A card arrived · Tap to open';
  @override
  String get cardStateSent => 'Card sent · Waiting for Sunday';
  @override
  String get cardStatePause => 'Pause in progress';
  @override
  String get cardStateNone => 'Sunday card in preparation';
  @override
  String get discreetBanner =>
      'Discreet mode is on: names, photos and notes are hidden in widgets.';
  @override
  String get unpairedBanner => 'No partner connected: couple widgets show a neutral state.';
  @override
  String get offlineBanner => 'Showing the last saved data. Updates when back online.';
  @override
  String get howToAddTitle => 'How to add';
  @override
  String get howToAddStep1Title => 'Hold the home screen';
  @override
  String get howToAddStep1Body => 'Touch and hold an empty space until the icons jiggle.';
  @override
  String get howToAddStep2Title => 'Tap the + button';
  @override
  String get howToAddStep2Body => 'In the top corner, search for QS-Flutter.';
  @override
  String get howToAddStep3Title => 'Pick a size';
  @override
  String get howToAddStep3Body => 'Small or medium.';
  @override
  String get howToAddAndroidLockNote =>
      'On modern Android, widgets live on the home screen. The lock screen only shows neutral notification icons.';
  @override
  String get howToAddIosLockNote => 'On iOS 16 or newer, you can also add the lock-screen widget.';
  @override
  String get howToAddDone => 'Got it';
  @override
  String get configureTitle => 'Configure widget';
  @override
  String get configurePreviewLabel => 'PREVIEW';
  @override
  String get configureContentSection => 'Content';
  @override
  String get configureContentFavorites => 'Favorites';
  @override
  String get configureContentRecent => 'Recent';
  @override
  String get configureContentDailyIdea => 'Daily idea';
  @override
  String get configureRotationSection => 'Photo rotation';
  @override
  String get configureRotationDaily => 'Every day';
  @override
  String get configureRotationSixHours => 'Every 6h';
  @override
  String get configureRotationManual => 'Manual';
  @override
  String get configurePrivacySection => 'Privacy';
  @override
  String get configureShowNames => 'Show names';
  @override
  String get configureHideInDiscreet => 'Hide in discreet mode';
  @override
  String get configureAllowPartnerNotes => 'Allow partner notes';
  @override
  String get configureOnLockScreen => 'Allow on lock screen';
  @override
  String get configureSave => 'Save';
  @override
  String get configureSavedToast => 'Widget preferences saved.';
  @override
  String get loadErrorTitle => 'Could not load widgets';
  @override
  String get loadErrorBody => 'Check your connection and try again.';
  @override
  String get retryAction => 'Try again';
  @override
  String get themeLight => 'Light';
  @override
  String get themeDark => 'Dark';
  @override
  String get discreetReminderLabel => 'Reminder';
  @override
  String get discreetNeutralBody => 'Neutral text';
  @override
  String get signedOutLabel => 'Repara';
  @override
  String get signedOutBody => 'Tap to sign in';
  @override
  String get ownSmallPageTitle => 'Widget · Mine (small)';
  @override
  String get ownSmallSlipAction => 'Log';
  @override
  String get ownSmallDateDefaultTitle => 'Next date';
  @override
  String ownSmallDateDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '${count} day',
        other: '${count} days',
      );
  @override
  String get ownSmallMoodLabel => 'MOOD';
  @override
  String get ownSmallMoodPrompt => 'How are you?';
  @override
  String get ownSmallMoodOptions => 'Happy · Tired · Sad';
  @override
  String get ownSmallRitualLabel => 'RITUAL';
  @override
  String get ownSmallRitualDefaultTitle => 'Sunday walk';
  @override
  String get ownSmallRitualDefaultTime => 'Sun · 10:00';
  @override
  String get ownMediumPageTitle => 'Widget · Mine (medium)';
  @override
  String get ownMediumIdeaAction => 'Tap to view';
  @override
  String get ownMediumJarTitle => 'Tap to open a saved slip';
  @override
  String get ownMediumJarPrivacy => 'Private: only appears on your device';
  @override
  String get lockScreenPageTitle => 'Lock screen';
  @override
  String get lockScreenClockTime => '19:38';
  @override
  String get lockScreenClockDate => 'Friday, April 10';
  @override
  String get lockScreenPauseTitle => 'Pause in progress';
  @override
  String lockScreenPauseUntil({required Object time}) => 'until ${time}';
  @override
  String get lockScreenPauseUntilDefault => 'until 20:00';
  @override
  String get lockScreenReadyAction => 'I am ready';
  @override
  String get lockScreenGenericPhrase => 'Calm moment';
  @override
  String get lockScreenDiscreetPhrase => 'Reminder';
  @override
  String get lockScreenPrivacyRule => 'Never shows names or messages on the lock screen.';
  @override
  String get lockScreenDisabledNote => 'The lock-screen widget is turned off in widget settings.';
  @override
  String get lockScreenFamiliesTitle => 'iOS formats (Circular, Rectangular and Inline)';
  @override
  String get counterPageTitle => 'Widget · Counter';
  @override
  String counterYearsMonthsTitle({required Object years, required Object months}) =>
      '${years} years · ${months} months';
  @override
  String counterMonthsDaysSubtitle({required Object months, required Object days}) =>
      '${months} months · ${days} days';
  @override
  String get counterStatusDating => 'Dating';
  @override
  String get counterStatusLivingTogether => 'Living together';
  @override
  String get counterStatusMarried => 'Married';
  @override
  String get counterStatusTogether => 'Together';
  @override
  String get counterMidnightNote => 'The counter updates automatically at local midnight.';
  @override
  String get counterSetDateAction => 'Set relationship date';
  @override
  String get photosPageTitle => 'Widget · Couple photos';
  @override
  String get photosPlusBadge => 'PLUS';
  @override
  String get photosNeutralFallbackNote =>
      'When no local photo is cached (or in discreet mode), the widget shows only a neutral card with your time together.';
  @override
  String get photosUnlockPlusAction => 'Explore Plus';
  @override
  String get photosChooseAction => 'Choose photo';
  @override
  String get photosRemoveAction => 'Remove photo';
  @override
  String get photosSavedToast => 'Photo saved to the widget.';
  @override
  String get photosRemovedToast => 'Photo removed from the widget.';
  @override
  String get partnerNotePageTitle => 'Partner note';
  @override
  String get partnerNoteMediumSection => 'Medium';
  @override
  String get partnerNoteReplyHint => 'Reply with a heart';
  @override
  String get partnerNoteDrawingPlaceholder => 'drawing';
  @override
  String get partnerNoteSafeNote => 'Only notes your partner marked as widget-safe appear here.';
  @override
  String get partnerNoteDisabledNote =>
      'You turned off partner notes on widgets. Enable below if you want to show them.';
  @override
  String get cardEncounterPageTitle => 'Card & next date';
  @override
  String get cardWeeklyLabel => 'Weekly card';
  @override
  String get cardReadyTitle => 'A card arrived';
  @override
  String get cardReadySubtitle => 'Tap to open';
  @override
  String get cardSentTitle => 'Card sent';
  @override
  String get cardSentSubtitle => 'Waiting for Sunday';
  @override
  String get cardNoneTitle => 'Sunday card';
  @override
  String get cardNoneSubtitle => 'In preparation';
  @override
  String get cardPauseTitle => 'Pause in progress';
  @override
  String get cardPauseSubtitle => 'Tap when ready';
  @override
  String get nextEncounterLabel => 'Next date';
  @override
  String get nextEncounterEmptyTitle => 'No upcoming date';
  @override
  String get nextEncounterEmptySubtitle => 'Tap to schedule';
  @override
  String get cardEncounterPrivacyNote =>
      'This widget only shows card status and the next date — never names or card text.';
  @override
  String get statesPageTitle => 'Widget states';
  @override
  String get statesAction => 'View states (discreet & unpaired)';
  @override
  String get statesDiscreetSection => 'Discreet mode';
  @override
  String get statesDiscreetToggle => 'Enable discreet mode now';
  @override
  String get statesUnpairedSection => 'No partner';
  @override
  String get statesUnpairedTitle => 'Invite to see here';
  @override
  String get statesUnpairedAction => 'Invite';
  @override
  String get statesOfflineSection => 'Offline';
  @override
  String get statesOfflineTitle => 'Showing the last saved data';
  @override
  String get statesOfflineSubtitle => 'Updates when back online';
  @override
  String get statesPrecedenceNote =>
      'When both discreet mode and no-partner are active at the same time, widgets always degrade to the most neutral variant (Reminder).';
  @override
  Map<String, String> get errors => {
    'WIDGET_PREFERENCES_SAVE_FAILED': 'Could not save widget preferences right now.',
    'COUPLE_PHOTO_LOAD_FAILED': 'Could not load the couple photo right now.',
    'COUPLE_PHOTO_UPLOAD_FAILED': 'Could not save the couple photo right now.',
    'COUPLE_PHOTO_REMOVE_FAILED': 'Could not remove the couple photo right now.',
    'COUPLE_PHOTO_INVALID': 'Choose a JPG, PNG, WebP or HEIC image up to 8 MB.',
    'COUPLE_PHOTO_READ_FAILED': 'Could not read the selected file.',
    'COUPLE_PHOTO_PICK_FAILED': 'Could not open the photo picker.',
    'COUPLE_PHOTO_SIGNED_OUT': 'Sign in to choose a couple photo.',
    'COUPLE_PHOTO_NOT_PAIRED': 'Connect with your partner to choose a couple photo.',
    'other': 'Could not save widget preferences right now.',
  };
}

// Path: acceptInvite.connected
class _Translations$acceptInvite$connected$en extends Translations$acceptInvite$connected$pt {
  _Translations$acceptInvite$connected$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'You are connected';
  @override
  String get titleHighlight => 'connected';
  @override
  String get text => 'Shared cards and tools are on. Everything private stays private.';
  @override
  String get goToToday => 'Go to Today';
}

// Path: acceptInvite.unusable
class _Translations$acceptInvite$unusable$en extends Translations$acceptInvite$unusable$pt {
  _Translations$acceptInvite$unusable$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'That invite is old';
  @override
  String get titleHighlight => 'old';
  @override
  String get text => 'Check the code or ask for a new invite from whoever invited you.';
  @override
  String get tryAgain => 'Type again';
  @override
  String get close => 'Close';
}

// Path: games.hub
class _Translations$games$hub$en extends Translations$games$hub$pt {
  _Translations$games$hub$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Play';
  @override
  String get subtitle => 'Short games for the two of you. No scores and no winner.';
  @override
  String get guessLabel => 'Guesses';
  @override
  String get talkLabel => 'Conversation';
  @override
  String get challengeLabel => 'Challenge';
  @override
  String minutes({required Object minutes}) => '${minutes} min';
  @override
  String invitedTitle({required Object name}) => '${name} invited you';
  @override
  String get invitedFallbackTitle => 'Your partner invited you';
  @override
  String get join => 'Join';
  @override
  String stateWaiting({required Object name}) => 'Waiting for ${name}';
  @override
  String get stateWaitingFallback => 'Waiting for your partner';
  @override
  String get stateInvited => 'Invited you';
  @override
  String get stateActive => 'In progress';
  @override
  String get stateFinished => 'Finished';
  @override
  String get stateCancelled => 'Invitation cancelled';
  @override
  String get stateExpired => 'Invitation expired';
  @override
  String get lockChip => 'Needs both of you';
  @override
  String get noPartnerNote => 'Games need both of you. When your partner joins, you can play.';
  @override
  String get refreshNote => 'To see if anything changed, come back to the app or pull to refresh.';
  @override
  String get loadErrorTitle => 'Could not open the games';
  @override
  String get loadErrorText => 'Nothing was lost. Try again.';
  @override
  String questionCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 question',
        other: '${count} questions',
      );
  @override
  String guessCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 guess',
        other: '${count} guesses',
      );
}

// Path: games.kinds
class _Translations$games$kinds$en extends Translations$games$kinds$pt {
  _Translations$games$kinds$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$games$kinds$meOrYou$en meOrYou = _Translations$games$kinds$meOrYou$en._(
    _root,
  );
  @override
  late final _Translations$games$kinds$howWell$en howWell = _Translations$games$kinds$howWell$en._(
    _root,
  );
  @override
  late final _Translations$games$kinds$twentyQuestions$en twentyQuestions =
      _Translations$games$kinds$twentyQuestions$en._(_root);
  @override
  late final _Translations$games$kinds$neverHaveWe$en neverHaveWe =
      _Translations$games$kinds$neverHaveWe$en._(_root);
  @override
  late final _Translations$games$kinds$mission$en mission = _Translations$games$kinds$mission$en._(
    _root,
  );
}

// Path: games.start
class _Translations$games$start$en extends Translations$games$start$pt {
  _Translations$games$start$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get noWinnerNote => 'No winner, no points.';
  @override
  String cta({required Object name}) => 'Invite ${name}';
  @override
  String get ctaFallback => 'Invite your partner';
  @override
  String get cancelledNote =>
      'The last invitation was cancelled. You can start again whenever you like.';
  @override
  String get expiredNote => 'The previous invitation expired. Invite again whenever you like.';
  @override
  String get noContentTitle => 'This game has no questions yet';
  @override
  String get noContentText => 'There is no content to play yet. Come back soon.';
}

// Path: games.invitation
class _Translations$games$invitation$en extends Translations$games$invitation$pt {
  _Translations$games$invitation$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object name}) => '${name} invited you';
  @override
  String get titleFallback => 'Your partner invited you';
  @override
  String get join => 'Play now';
  @override
  String get later => 'Later';
}

// Path: games.waiting
class _Translations$games$waiting$en extends Translations$games$waiting$pt {
  _Translations$games$waiting$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String text({required Object name}) => 'Invitation sent to ${name}. It starts when they join.';
  @override
  String get textFallback => 'Invitation sent. It starts when your partner joins.';
  @override
  String get status => 'Waiting…';
  @override
  String get window => 'The invitation waits for up to 48 hours.';
  @override
  String get checkAgain => 'Check if they joined';
  @override
  String get cancel => 'Cancel the invitation';
}

// Path: games.active
class _Translations$games$active$en extends Translations$games$active$pt {
  _Translations$games$active$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'The game has started';
  @override
  String get text => 'Both of you are in. This game\'s screens appear here.';
  @override
  String get cancel => 'End the game';
}

// Path: games.playing
class _Translations$games$playing$en extends Translations$games$playing$pt {
  _Translations$games$playing$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String progress({required Object current, required Object total}) =>
      'Question ${current} of ${total}';
  @override
  String get you => 'You';
  @override
  String get partnerFallback => 'Your partner';
  @override
  String get submit => 'Send answer';
  @override
  String get skip => 'Skip this one';
  @override
  String get guessAboutYou => 'About you';
  @override
  String guessAboutPartner({required Object name}) => 'About ${name}';
  @override
  String get guessAboutPartnerFallback => 'About your partner';
  @override
  String guessPrompt({required Object name}) => 'What did ${name} answer?';
  @override
  String get guessPromptFallback => 'What did your partner answer?';
  @override
  String get guessYourGuess => 'Your guess';
  @override
  String get answerHint => 'Answer as you would.';
  @override
  String get guessHint => 'Guess what they answered.';
  @override
  String get talkHint => 'Write your answer. Only you can read it until you both finish.';
  @override
  String get talkNote => 'Your partner only sees this after both of you answer.';
}

// Path: games.date
class _Translations$games$date$en extends Translations$games$date$pt {
  _Translations$games$date$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get start => 'Start the date';
  @override
  String get startNote => 'Do the mission together, then come back and tell how it was.';
  @override
  String get reflectionTitle => 'How was it?';
  @override
  String get reflectionText =>
      'Pick what happened. Your partner sees it only after you both answer.';
}

// Path: games.waitingPartner
class _Translations$games$waitingPartner$en extends Translations$games$waitingPartner$pt {
  _Translations$games$waitingPartner$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'You answered everything';
  @override
  String text({required Object name}) =>
      'Now it is just waiting for ${name}. Nothing you wrote appears before both of you finish.';
  @override
  String get textFallback =>
      'Now it is just waiting for your partner. Nothing you wrote appears before both of you finish.';
  @override
  String get answersTitle => 'What you saved';
  @override
  String get checkAgain => 'Check again';
  @override
  String get cancel => 'End the game';
}

// Path: games.finished
class _Translations$games$finished$en extends Translations$games$finished$pt {
  _Translations$games$finished$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'That was a good conversation';
  @override
  String get text => 'No score, no winner. Just the two of you.';
  @override
  String get you => 'You';
  @override
  String get yourGuess => 'Your guess';
  @override
  String get partnerGuess => 'Their guess';
  @override
  String get matched => 'Matched';
  @override
  String get noAnswer => 'No answer';
  @override
  String get both => 'Both of you';
  @override
  String get agreed => 'You both agreed';
  @override
  String get back => 'Back';
}

// Path: games.notFound
class _Translations$games$notFound$en extends Translations$games$notFound$pt {
  _Translations$games$notFound$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'This game does not exist';
  @override
  String get text => 'It may have changed or never existed. Go back and pick another one.';
  @override
  String get action => 'Go back';
}

// Path: games.cancel
class _Translations$games$cancel$en extends Translations$games$cancel$pt {
  _Translations$games$cancel$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'End the game?';
  @override
  String get text => 'The game ends for both of you. You can start another later.';
  @override
  String get confirm => 'End game';
  @override
  String get keep => 'Keep playing';
}

// Path: games.noPartner
class _Translations$games$noPartner$en extends Translations$games$noPartner$pt {
  _Translations$games$noPartner$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Games are for two';
  @override
  String get text => 'When your partner joins, you can play together.';
}

// Path: games.common
class _Translations$games$common$en extends Translations$games$common$pt {
  _Translations$games$common$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get close => 'Close';
}

// Path: guides.hub
class _Translations$guides$hub$en extends Translations$guides$hub$pt {
  _Translations$guides$hub$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Difficult conversations';
  @override
  String get titleHighlight => 'Difficult';
  @override
  String get subtitle => 'One step at a time, in private.';
  @override
  String get privateNote => 'Your notes stay with you. Nothing is sent to your partner.';
  @override
  String stepCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 step',
        other: '${count} steps',
      );
  @override
  String get loadErrorTitle => 'Could not open the topics';
  @override
  String get loadErrorText => 'Nothing was lost. Try again.';
}

// Path: guides.viewer
class _Translations$guides$viewer$en extends Translations$guides$viewer$pt {
  _Translations$guides$viewer$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String stepOf({required Object current, required Object total}) => 'Step ${current} of ${total}';
  @override
  String get answerHint => 'Write whatever makes sense. It can stay blank.';
  @override
  String get stepNote => 'Saved as you go. Only you can see it.';
  @override
  String get next => 'Next';
  @override
  String get finish => 'Finish';
  @override
  String get back => 'Back';
  @override
  String get loadErrorTitle => 'Could not open this conversation';
  @override
  String get loadErrorText => 'Nothing was lost. Try again.';
  @override
  Map<String, String> get errors => {
    'other': 'Could not save right now. Your answers are still here.',
  };
}

// Path: guides.gate
class _Translations$guides$gate$en extends Translations$guides$gate$pt {
  _Translations$guides$gate$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'A sensitive topic';
  @override
  String get text =>
      'This topic is about intimacy and is meant for adults. You can go slowly or choose another topic whenever you like.';
  @override
  String get cycleText =>
      'This topic is about your body and mood through the month and is meant for adults. You can go slowly or choose another topic whenever you like.';
  @override
  String get continueAction => 'Continue';
  @override
  String get otherAction => 'See other topics';
}

// Path: guides.finish
class _Translations$guides$finish$en extends Translations$guides$finish$pt {
  _Translations$guides$finish$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Your conversation is ready';
  @override
  String get titleHighlight => 'ready';
  @override
  String get text => 'Your notes are saved to your account, privately.';
  @override
  String get finishSaved => 'Saved only for you.';
  @override
  String get start => 'Start a conversation';
  @override
  String get other => 'Back to topics';
}

// Path: intro.phase
class _Translations$intro$phase$en extends Translations$intro$phase$pt {
  _Translations$intro$phase$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Where are you two right now?';
  @override
  String get titleHighlight => 'right now';
  @override
  String get subtitle => 'Pick the closest one. You can change it later.';
  @override
  Map<String, String> get options => {
    'dating': 'Dating',
    'living_together': 'Living together',
    'engaged': 'Engaged',
    'married': 'Married',
    'with_kids': 'With kids',
    'long_distance': 'Long distance',
    'with_parents': 'Living with parents',
    'restarting': 'Starting over',
    'other': '',
  };
}

// Path: intro.goals
class _Translations$intro$goals$en extends Translations$intro$goals$pt {
  _Translations$intro$goals$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'What do you want from the app?';
  @override
  String get titleHighlight => 'app';
  @override
  String get subtitle => 'Pick as many as you like.';
  @override
  Map<String, String> get options => {
    'reconnect': 'Reconnect',
    'fight_less': 'Fight less',
    'keep_romance': 'Keep the romance',
    'remember_dates': 'Remember dates',
    'organize_routine': 'Organise the routine',
    'just_record': 'Just note the good things',
    'other': '',
  };
}

// Path: intro.theme
class _Translations$intro$theme$en extends Translations$intro$theme$pt {
  _Translations$intro$theme$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Which colour suits you?';
  @override
  String get titleHighlight => 'colour';
  @override
  String get subtitle => 'You pick the colour, not the gender. The features are the same.';
  @override
  String get rose => 'Soft rose';
  @override
  String get roseSupport => 'Delicate and warm';
  @override
  String get blue => 'Soft blue';
  @override
  String get blueSupport => 'Calm and light';
  @override
  String get neutral => 'Neutral';
  @override
  String get neutralSupport => 'Paper and green';
  @override
  String get footnote => 'You can change it later in Settings, Appearance.';
}

// Path: need.sent
class _Translations$need$sent$en extends Translations$need$sent$pt {
  _Translations$need$sent$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sent';
  @override
  String get text => 'Your partner will see it when they open the app.';
  @override
  String get done => 'Done';
}

// Path: quickSlip.saved
class _Translations$quickSlip$saved$en extends Translations$quickSlip$saved$pt {
  _Translations$quickSlip$saved$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Saved';
  @override
  String get added => 'Slip added to this week.';
  @override
  String get queued => 'Saved on this phone. We send it when the connection is back.';
  @override
  String get undoHint => 'Undo for 30 seconds.';
  @override
  String get undo => 'Undo';
  @override
  String get done => 'Done';
}

// Path: repair.calm
class _Translations$repair$calm$en extends Translations$repair$calm$pt {
  _Translations$repair$calm$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'A moment to breathe';
  @override
  String get titleHighlight => 'breathe';
  @override
  String get cadence =>
      'Breathe in slowly for 4. Breathe out slowly for 6. Repeat at your own pace.';
  @override
  String get text => 'There\'s no rush and no timer. Leave whenever you like.';
  @override
  String get ready => 'I feel calmer';
  @override
  String get leave => 'Leave';
  @override
  String get askPause => 'Ask my partner for some space';
}

// Path: repair.softStart
class _Translations$repair$softStart$en extends Translations$repair$softStart$pt {
  _Translations$repair$softStart$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Start softly';
  @override
  String get titleHighlight => 'softly';
  @override
  String get subtitle => 'A blame-free template to open the conversation.';
  @override
  String get feeling => 'I feel…';
  @override
  String get feelingHint => 'E.g. tired';
  @override
  Map<String, String> get feelingErrors => {'empty': 'Say how you feel'};
  @override
  String get situation => 'When…';
  @override
  String get situationHint => 'E.g. the dishes wait until later';
  @override
  Map<String, String> get situationErrors => {'empty': 'Say when it happens'};
  @override
  String get need => 'I need…';
  @override
  String get needHint => 'E.g. a little help';
  @override
  Map<String, String> get needErrors => {'empty': 'Say what you need'};
  @override
  String template({required Object feeling, required Object situation, required Object need}) =>
      'I feel ${feeling} when ${situation}. I need ${need}.';
  @override
  String get use => 'Use this template';
}

// Path: repair.quick
class _Translations$repair$quick$en extends Translations$repair$quick$pt {
  _Translations$repair$quick$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'A small repair';
  @override
  String get titleHighlight => 'repair';
  @override
  String get subtitle => 'One tap sends. You can change the text first.';
  @override
  Map<String, String> get presets => {
    'tone': 'Sorry for my tone.',
    'restart': 'Can we start over?',
    'five_minutes': 'I need five minutes.',
    'love': 'I love you, even now.',
    'other': '',
  };
  @override
  String get hint => 'Write my own';
  @override
  Map<String, String> get textErrors => {
    'empty': 'Write a message',
    'tooLong': 'The message is too long',
  };
  @override
  String get send => 'Send';
  @override
  String get sentTitle => 'Sent';
  @override
  String get sentText => 'Your partner will see it when they open the app.';
  @override
  String get done => 'Done';
  @override
  Map<String, String> get errors => {
    'NOT_PAIRED': 'To send this, you need to be connected with your partner in the app.',
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t send right now. Your message is still here.',
  };
}

// Path: repair.guided
class _Translations$repair$guided$en extends Translations$repair$guided$pt {
  _Translations$repair$guided$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String stepOf({required Object current, required Object total}) => 'Step ${current} of ${total}';
  @override
  List<String> get stepTitles => ['What happened?', 'What do you need?', 'What can you offer?'];
  @override
  List<String> get stepHighlights => ['happened', 'need', 'offer'];
  @override
  List<String> get stepHints => [
    'In your own words, without blaming anyone.',
    'One thing that would help right now.',
    'Something small and sincere.',
  ];
  @override
  String get private => 'Only you see this. Nothing is sent to your partner.';
  @override
  String get next => 'Continue';
  @override
  String get back => 'Back';
  @override
  String get later => 'Save for later';
  @override
  String get savedLater => 'Saved. You\'ll pick up where you left off.';
  @override
  String get finalTitle => 'How are you now?';
  @override
  String get finalHighlight => 'now';
  @override
  Map<String, String> get feelings => {
    'calmer': 'Calmer',
    'still_tense': 'Still tense',
    'need_more_time': 'I need more time',
    'other': '',
  };
  @override
  String get followUpTitle => 'Want a reminder to check in on how you are?';
  @override
  Map<String, String> get followUps => {
    'none': 'No need',
    'tomorrow': 'Tomorrow',
    'inThreeDays': 'In 3 days',
    'other': '',
  };
  @override
  String get followUpNote => 'The reminder is short and says nothing about what happened.';
  @override
  String get finish => 'Finish';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t save right now. Your answers are still here.',
  };
  @override
  String get loadErrorTitle => 'Couldn\'t open this';
  @override
  String get loadErrorText => 'Nothing was lost. Try again.';
}

// Path: repair.learning
class _Translations$repair$learning$en extends Translations$repair$learning$pt {
  _Translations$repair$learning$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'What did you learn?';
  @override
  String get titleHighlight => 'learn';
  @override
  String get subtitle => 'It stays with you and can be deleted whenever you like.';
  @override
  Map<String, String> get kinds => {
    'trigger': 'What bothers me',
    'need': 'What I need',
    'good_fix': 'What helped',
    'other': '',
  };
  @override
  String get hint => 'Write one or two sentences';
  @override
  Map<String, String> get noteErrors => {
    'empty': 'Write what you learned',
    'tooLong': 'The note is too long',
  };
  @override
  String get save => 'Save';
  @override
  String get listTitle => 'Your learnings';
  @override
  String get delete => 'Delete';
  @override
  String get emptyTitle => 'Nothing yet';
  @override
  String get emptyText => 'When you write a learning, it shows up here.';
  @override
  String get errorTitle => 'Couldn\'t load';
  @override
  String get errorText => 'Your learnings are still saved. Try again.';
  @override
  String get done => 'Done';
  @override
  Map<String, String> get errors => {
    'RATE_LIMITED': 'Too many attempts in a row. Wait a moment.',
    'other': 'Couldn\'t save right now. Your text is still here.',
  };
}

// Path: repair.next
class _Translations$repair$next$en extends Translations$repair$next$pt {
  _Translations$repair$next$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get pause => 'Breathe a little';
  @override
  String get guided => 'Start the guided repair';
  @override
  String get quick => 'Send a repair';
}

// Path: slipKind.specific
class _Translations$slipKind$specific$en extends Translations$slipKind$specific$pt {
  _Translations$slipKind$specific$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'What exactly did they do?';
  @override
  String get titleHighlight => 'exactly';
  @override
  String get subtitle => 'Details help you remember why it mattered.';
  @override
  String get hint => 'E.g. took out the trash without being asked';
  @override
  String get feelingLabel => 'How did you feel?';
  @override
  String get feelingHint => 'Optional';
}

// Path: slipKind.ifThen
class _Translations$slipKind$ifThen$en extends Translations$slipKind$ifThen$pt {
  _Translations$slipKind$ifThen$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Want to tell them?';
  @override
  String get titleHighlight => 'tell';
  @override
  String get subtitle => 'A small plan: when this happens, you do that.';
  @override
  String get ifLabel => 'If…';
  @override
  String get ifHint => 'E.g. I feel overwhelmed';
  @override
  String get thenLabel => 'Then…';
  @override
  String get thenHint => 'E.g. I ask for 10 minutes alone';
}

// Path: slipKind.invisible
class _Translations$slipKind$invisible$en extends Translations$slipKind$invisible$pt {
  _Translations$slipKind$invisible$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Things nobody notices';
  @override
  String get titleHighlight => 'nobody notices';
  @override
  String get subtitle => 'Only for you. This never goes into a card.';
  @override
  String get hint => 'E.g. remembered the kids\' appointment';
  @override
  String get areaLabel => 'What kind of work?';
  @override
  String get private => 'Stays with you and never enters a card.';
}

// Path: slipKind.saved
class _Translations$slipKind$saved$en extends Translations$slipKind$saved$pt {
  _Translations$slipKind$saved$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Saved';
  @override
  String get added => 'Written down.';
  @override
  String get queued => 'Saved on this phone. We\'ll send it when the connection is back.';
  @override
  String get done => 'Done';
}

// Path: sundayCard.send
class _Translations$sundayCard$send$en extends Translations$sundayCard$send$pt {
  _Translations$sundayCard$send$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get action => 'Send';
  @override
  String get invite => 'Invite to send';
  @override
  String get needsPartner => 'To send the card in the app, your person has to be connected.';
  @override
  String get title => 'Send the card?';
  @override
  String text({required Object name}) =>
      '${name} receives it now. Once sent, the card does not change.';
  @override
  String get textNoName => 'Your person receives it now. Once sent, the card does not change.';
  @override
  String get confirm => 'Send';
}

// Path: sundayCard.hold
class _Translations$sundayCard$hold$en extends Translations$sundayCard$hold$pt {
  _Translations$sundayCard$hold$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get action => 'Hold this week';
  @override
  String get title => 'Hold this week?';
  @override
  String get text => 'The card is kept and nothing is lost. You can send it whenever you like.';
  @override
  String get confirm => 'Hold';
}

// Path: sundayCard.held
class _Translations$sundayCard$held$en extends Translations$sundayCard$held$pt {
  _Translations$sundayCard$held$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Held this week';
  @override
  String get titleHighlight => 'Held';
  @override
  String get text => 'Your card waits. Send it when you are ready. Nothing is lost.';
  @override
  String get keepHolding => 'Keep holding';
  @override
  String get sendAnyway => 'Send anyway';
}

// Path: sundayCard.sent
class _Translations$sundayCard$sent$en extends Translations$sundayCard$sent$pt {
  _Translations$sundayCard$sent$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Sent';
  @override
  String text({required Object name}) => 'The card went to ${name}.';
  @override
  String get textNoName => 'The card went to your person.';
  @override
  String get done => 'Done';
}

// Path: temperature.result
class _Translations$temperature$result$en extends Translations$temperature$result$pt {
  _Translations$temperature$result$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$temperature$result$good$en good =
      _Translations$temperature$result$good$en._(_root);
  @override
  late final _Translations$temperature$result$pause$en pause =
      _Translations$temperature$result$pause$en._(_root);
  @override
  late final _Translations$temperature$result$guided$en guided =
      _Translations$temperature$result$guided$en._(_root);
  @override
  late final _Translations$temperature$result$quick$en quick =
      _Translations$temperature$result$quick$en._(_root);
  @override
  String get done => 'Done';
}

// Path: unpair.done
class _Translations$unpair$done$en extends Translations$unpair$done$pt {
  _Translations$unpair$done$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Unpaired';
  @override
  String get highlight => 'Unpaired';
  @override
  String get text => 'Your own data stays yours.';
  @override
  String get keepOption => 'Keep a copy of the shared items';
  @override
  String get deleteOption => 'Delete shared items';
  @override
  String get plusNote => 'The Plus that covered your partner ends.';
  @override
  String get continueLabel => 'Continue';
}

// Path: unpair.relationship
class _Translations$unpair$relationship$en extends Translations$unpair$relationship$pt {
  _Translations$unpair$relationship$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Relationship';
  @override
  String unpair({required Object name}) => 'Unpair from ${name}';
  @override
  String get ended => 'The relationship ended';
}

// Path: unpair.breakup
class _Translations$unpair$breakup$en extends Translations$unpair$breakup$pt {
  _Translations$unpair$breakup$en._(TranslationsEn root) : this._root = root, super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get appBarTitle => 'We broke up';
  @override
  String get title => 'I am sorry';
  @override
  String get highlight => 'sorry';
  @override
  String get text => 'You decide what to keep. Nothing is deleted without you wanting it.';
  @override
  String get cancel => 'Cancel';
  @override
  String get continueLabel => 'Continue';
}

// Path: unpair.partnerNotice
class _Translations$unpair$partnerNotice$en extends Translations$unpair$partnerNotice$pt {
  _Translations$unpair$partnerNotice$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object name}) => '${name} unpaired';
  @override
  String get titleNoName => 'Your partner unpaired';
  @override
  String get highlight => 'unpaired';
  @override
  String get text => 'Your data stays yours. Shared cards stopped.';
  @override
  String get ok => 'Ok';
}

// Path: games.kinds.meOrYou
class _Translations$games$kinds$meOrYou$en extends Translations$games$kinds$meOrYou$pt {
  _Translations$games$kinds$meOrYou$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Me or you';
  @override
  String get intro =>
      'Answer separately who fits each phrase better. Then see where you thought alike.';
}

// Path: games.kinds.howWell
class _Translations$games$kinds$howWell$en extends Translations$games$kinds$howWell$pt {
  _Translations$games$kinds$howWell$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'How well you know me';
  @override
  String get intro =>
      'Each of you answers about yourself and guesses the other\'s answer. Then comes the conversation.';
}

// Path: games.kinds.twentyQuestions
class _Translations$games$kinds$twentyQuestions$en
    extends Translations$games$kinds$twentyQuestions$pt {
  _Translations$games$kinds$twentyQuestions$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '20 questions';
  @override
  String get intro => 'Light questions to answer in private and reveal together.';
}

// Path: games.kinds.neverHaveWe
class _Translations$games$kinds$neverHaveWe$en extends Translations$games$kinds$neverHaveWe$pt {
  _Translations$games$kinds$neverHaveWe$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Never have we';
  @override
  String get intro =>
      'Things you have never done together. Each of you answers in private and you see both sides at the end.';
}

// Path: games.kinds.mission
class _Translations$games$kinds$mission$en extends Translations$games$kinds$mission$pt {
  _Translations$games$kinds$mission$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Date mission';
  @override
  String get intro => 'A date idea to do together and a short reflection afterwards.';
}

// Path: temperature.result.good
class _Translations$temperature$result$good$en extends Translations$temperature$result$good$pt {
  _Translations$temperature$result$good$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'That\'s good';
  @override
  String get text => 'Saved just for you. Carry on with your day.';
}

// Path: temperature.result.pause
class _Translations$temperature$result$pause$en extends Translations$temperature$result$pause$pt {
  _Translations$temperature$result$pause$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'First, breathe';
  @override
  String get text =>
      'When it\'s very hot, waiting helps. Some time apart is worth it before any conversation.';
}

// Path: temperature.result.guided
class _Translations$temperature$result$guided$en extends Translations$temperature$result$guided$pt {
  _Translations$temperature$result$guided$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'You can talk with care';
  @override
  String get text => 'One step at a time, at your pace.';
}

// Path: temperature.result.quick
class _Translations$temperature$result$quick$en extends Translations$temperature$result$quick$pt {
  _Translations$temperature$result$quick$en._(TranslationsEn root)
    : this._root = root,
      super.internal(root);

  final TranslationsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'A small fix is enough';
  @override
  String get text => 'Something light and quick can do it.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'acceptInvite.title' => 'Got an invite?',
          'acceptInvite.titleHighlight' => 'invite',
          'acceptInvite.subtitle' => 'Type the code the other person sent so you can connect.',
          'acceptInvite.codeLabel' => 'Invite code',
          'acceptInvite.codeHint' => 'ABCD2345',
          'acceptInvite.codeErrors.empty' => 'Type the invite code.',
          'acceptInvite.codeErrors.tooShort' => 'The code has 8 characters.',
          'acceptInvite.codeErrors.tooLong' => 'The code has 8 characters.',
          'acceptInvite.codeErrors.invalid' => 'Use letters and numbers only.',
          'acceptInvite.privacyNote' =>
            'Accepting shares cards and tools. Your private notes stay private.',
          'acceptInvite.accept' => 'Accept',
          'acceptInvite.connected.title' => 'You are connected',
          'acceptInvite.connected.titleHighlight' => 'connected',
          'acceptInvite.connected.text' =>
            'Shared cards and tools are on. Everything private stays private.',
          'acceptInvite.connected.goToToday' => 'Go to Today',
          'acceptInvite.unusable.title' => 'That invite is old',
          'acceptInvite.unusable.titleHighlight' => 'old',
          'acceptInvite.unusable.text' =>
            'Check the code or ask for a new invite from whoever invited you.',
          'acceptInvite.unusable.tryAgain' => 'Type again',
          'acceptInvite.unusable.close' => 'Close',
          'acceptInvite.errors.ALREADY_PAIRED' => 'You are already connected with someone.',
          'acceptInvite.errors.COUPLE_FULL' => 'That space already has two people.',
          'acceptInvite.errors.RATE_LIMITED' =>
            'Too many tries in a row. Wait a bit and try again.',
          'acceptInvite.errors.NETWORK' => 'No connection. Check your internet and try again.',
          'acceptInvite.errors.other' => 'Could not connect right now. Try again.',
          'account.deleteTitle' => 'Delete account',
          'account.deleteHighlight' => 'account',
          'account.deleteText' => 'Your data is erased after 14 days. This needs a fresh sign-in.',
          'account.deleteWarningTitle' => 'This also ends the link',
          'account.deleteWarning' => ({
            required Object name,
          }) => 'This also ends the link with ${name}.',
          'account.deleteWarningNoPartner' => 'This also ends the link with your partner.',
          'account.deleteAction' => 'Delete account',
          'account.deleteConfirmTitle' => 'Delete your account?',
          'account.deleteConfirmText' =>
            'You have 14 days to change your mind. After that, nothing can be recovered.',
          'account.reauthReason' => 'Confirm to delete your account.',
          'account.pendingTitle' => ({
            required Object month,
            required Object day,
          }) => 'Deletion on ${month} ${day}',
          'account.pendingHighlight' => ({
            required Object month,
            required Object day,
          }) => '${month} ${day}',
          'account.pendingText' => 'You can cancel before that.',
          'account.pendingCancel' => 'Cancel deletion',
          'account.signOutTitle' => 'Sign out?',
          'account.signOutText' => 'Remove the local data too?',
          'account.signOutPending' => ({
            required Object count,
          }) => 'You have ${count} slips that were not sent yet. Signing out and removing data erases them.',
          'account.signOut' => 'Sign out',
          'account.signOutRemove' => 'Sign out and remove data',
          'account.months.0' => 'Jan',
          'account.months.1' => 'Feb',
          'account.months.2' => 'Mar',
          'account.months.3' => 'Apr',
          'account.months.4' => 'May',
          'account.months.5' => 'Jun',
          'account.months.6' => 'Jul',
          'account.months.7' => 'Aug',
          'account.months.8' => 'Sep',
          'account.months.9' => 'Oct',
          'account.months.10' => 'Nov',
          'account.months.11' => 'Dec',
          'account.errors.RATE_LIMITED' => 'Too many tries in a row. Wait a moment.',
          'account.errors.other' => 'Could not finish now. Try again.',
          'authentication.signInTitle' => 'Sign in',
          'authentication.signInSubtitle' => 'No email and password. Just Apple or Google.',
          'authentication.signInNote' => 'Signing in takes you straight to your Today.',
          'authentication.existingAccountTitle' => 'You already have an account',
          'authentication.existingAccountSubtitle' => 'Sign in to pick up where you left off.',
          'authentication.continueWithApple' => 'Continue with Apple',
          'authentication.continueWithGoogle' => 'Continue with Google',
          'authentication.errors.NETWORK' => 'No connection. Check your internet and try again.',
          'authentication.errors.other' => 'Could not sign you in right now. Try again.',
          'capsules.title' => 'Time capsule',
          'capsules.text' => 'Write something to be opened on a future date. Until then nobody reads it, not even you.',
          'capsules.bodyHint' => 'What do you want to say to the future?',
          'capsules.bodyErrors.empty' => 'Write the message',
          'capsules.bodyErrors.tooLong' => 'The message is too long',
          'capsules.dateLabel' => 'Opens on',
          'capsules.dateHint' => 'Pick a date',
          'capsules.dateErrors.empty' => 'Pick the day it opens',
          'capsules.dateErrors.outOfRange' => 'Pick a date between a week and 50 years ahead',
          'capsules.dateFormat' => ({
            required Object month,
            required Object day,
            required Object year,
          }) => '${month} ${day}, ${year}',
          'capsules.months.0' => 'January',
          'capsules.months.1' => 'February',
          'capsules.months.2' => 'March',
          'capsules.months.3' => 'April',
          'capsules.months.4' => 'May',
          'capsules.months.5' => 'June',
          'capsules.months.6' => 'July',
          'capsules.months.7' => 'August',
          'capsules.months.8' => 'September',
          'capsules.months.9' => 'October',
          'capsules.months.10' => 'November',
          'capsules.months.11' => 'December',
          'capsules.sharedLabel' => 'For both of us',
          'capsules.sharedText' =>
            'Your partner reads it too when the date comes. Off, only you read it.',
          'capsules.save' => 'Save capsule',
          'capsules.saved' => 'Capsule saved',
          'capsules.closedUntil' => ({required Object date}) => 'Closed until ${date}',
          'capsules.ownerSharedBy' => 'Yours, for both',
          'capsules.ownerPrivate' => 'Only yours',
          'capsules.fromPartner' => 'From your partner',
          'capsules.delete' => 'Delete',
          'capsules.deleteTitle' => 'Delete this capsule?',
          'capsules.deleteText' => 'It will be gone before anyone reads it. This cannot be undone.',
          'capsules.deleteConfirm' => 'Delete',
          'capsules.emptyTitle' => 'No capsules yet',
          'capsules.emptyText' => 'Write one and choose the day it opens.',
          'capsules.errorTitle' => 'Couldn\'t load',
          'capsules.errorText' => 'Your capsules are still saved. Try again.',
          'capsules.errors.CAPSULE_OPENS_TOO_SOON' => 'Pick a date at least a week ahead.',
          'capsules.errors.CAPSULE_OPENS_TOO_FAR' => 'Pick a date within the next 50 years.',
          'capsules.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'capsules.errors.other' => 'Couldn\'t save right now. Your text is still here.',
          'capsules.deleteErrors.other' => 'Couldn\'t delete this capsule. It\'s still here.',
          'cardView.forPartner' => ({required Object name}) => 'For ${name}',
          'cardView.forPartnerNoName' => 'For your person',
          'cardView.goodThings' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  zero: 'No good things yet',
                  one: '1 good thing this week',
                  other: '${count} good things this week',
                ),
          'cardView.weekdays.0' => 'mon',
          'cardView.weekdays.1' => 'tue',
          'cardView.weekdays.2' => 'wed',
          'cardView.weekdays.3' => 'thu',
          'cardView.weekdays.4' => 'fri',
          'cardView.weekdays.5' => 'sat',
          'cardView.weekdays.6' => 'sun',
          'cardView.categories.said' => 'said something',
          'cardView.categories.did' => 'did something',
          'cardView.categories.noticed' => 'noticed me',
          'cardView.categories.helped' => 'helped me',
          'cardView.categories.other' => '',
          'cardsList.title' => 'Past cards',
          'cardsList.dateShort' => ({
            required Object month,
            required Object day,
          }) => '${month} ${day}',
          'cardsList.monthsShort.0' => 'Jan',
          'cardsList.monthsShort.1' => 'Feb',
          'cardsList.monthsShort.2' => 'Mar',
          'cardsList.monthsShort.3' => 'Apr',
          'cardsList.monthsShort.4' => 'May',
          'cardsList.monthsShort.5' => 'Jun',
          'cardsList.monthsShort.6' => 'Jul',
          'cardsList.monthsShort.7' => 'Aug',
          'cardsList.monthsShort.8' => 'Sep',
          'cardsList.monthsShort.9' => 'Oct',
          'cardsList.monthsShort.10' => 'Nov',
          'cardsList.monthsShort.11' => 'Dec',
          'cardsList.slipCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  zero: 'no slips',
                  one: '1 slip',
                  other: '${count} slips',
                ),
          'cardsList.sent' => 'Sent',
          'cardsList.received' => 'Received',
          'cardsList.opened' => 'opened',
          'cardsList.reacted' => 'reaction',
          'cardsList.replied' => 'replied',
          'cardsList.emptyTitle' => 'No cards yet',
          'cardsList.emptyText' => 'When a card is sent or arrives, it shows up here. No rush.',
          'cardsList.errorTitle' => 'Could not load the cards',
          'cardsList.errorText' => 'They are still saved. Try again.',
          'cardsList.detailTitle' => 'Card',
          'cardsList.detailErrorTitle' => 'Could not open the card',
          'cardsList.errors.CARD_NOT_FOUND' => 'That card is no longer available.',
          'cardsList.errors.other' => 'It is still saved. Try again.',
          'cardsList.reactionPrompt' => 'How do you want to reply?',
          'cardsList.reactionThankYou' => 'Thank you',
          'cardsList.reactionHug' => 'Hug',
          'cardsList.reactionMadeMyDay' => 'Made my day',
          'cardsList.reactionNoted' => 'Noted',
          'cardsList.reactionError' => 'Could not reply right now. Try again.',
          'cardsList.responseReceivedName' => ({required Object name}) => '${name}',
          'cardsList.responseReceivedNoName' => 'Your person replied',
          'cardsList.responseReceivedVerb' => 'replied',
          'cardsList.responseQuote' => ({required Object label}) => '“${label}”',
          'cardsList.notFound' => 'That card is no longer available.',
          'cardsList.reactionQuoteMadeMyDay' => 'That made my week.',
          'chat.title' => 'Mascot',
          'chat.consentText' => 'A calm conversation with the mascot, to sort out what you feel. It does not replace professional help and never takes sides.',
          'chat.consentPrivacy' => 'What you write is sent to an AI model only to produce the reply. Nothing from the conversation is kept, unless you turn a reply into a slip.',
          'chat.consentTurnOn' => 'Turn on the chat',
          'chat.emptyHint' => 'Say how you are, or start with something small.',
          'chat.inputHint' => 'Write here',
          'chat.draftErrors.empty' => 'Write something to send',
          'chat.draftErrors.tooLong' => 'This message is too long',
          'chat.send' => 'Send',
          'chat.messagesLeft' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 message left today',
                  other: '${count} messages left today',
                ),
          'chat.saveAsSlip' => 'Make it a slip',
          'chat.slipSaved' => 'Slip saved',
          'chat.saveLearning' => 'Save as learning',
          'chat.learningSheetTitle' => 'Save as learning',
          'chat.learningSheetTarget' => 'What is it about?',
          'chat.learningSheetHint' => 'What you want to keep',
          'chat.learningTextErrors.empty' => 'Write what you want to keep',
          'chat.learningTextErrors.tooLong' => 'This is too long',
          'chat.learningSave' => 'Save',
          'chat.learningSaved' => 'Learning saved',
          'chat.learnedLink' => 'What I learned',
          'chat.settingsTitle' => 'Conversation settings',
          'chat.toggleLabel' => 'Talk with the mascot',
          'chat.toggleSubtitle' => 'Only you decide when the conversation is on.',
          'chat.planPlus' => 'Plus plan',
          'chat.planFree' => 'Free plan',
          'chat.usagePlus' => ({
            required Object left,
            required Object limit,
          }) => '${left} of ${limit} messages left today',
          'chat.usageFree' => 'The chat is part of Plus. The free plan has no messages.',
          'chat.sendingTitle' => 'What is sent',
          'chat.sendingText' => 'Only the text you type and the last turns of the conversation go to the model, to produce the reply. Nothing is stored unless you save it as a slip or a learning.',
          'chat.disableNote' => 'Turning it off brings back the consent step. The next message is only sent after you turn it on again.',
          'chat.settingsOn' => 'Chat turned on',
          'chat.settingsOff' => 'Chat turned off',
          'chat.offline' => 'You\'re offline. The chat resumes when you reconnect.',
          'chat.interrupted' => 'The reply was interrupted.',
          'chat.retry' => 'Try again',
          'chat.limitTitle' => 'Today\'s messages are used up',
          'chat.limitText' => 'Come back tomorrow, or see Plus to talk more.',
          'chat.plusTitle' => 'The chat is part of Plus',
          'chat.plusText' => 'The mascot is available on Plus, with 20 messages a day.',
          'chat.crisisTitle' => 'You are not alone',
          'chat.crisisText' => 'It sounds like you are going through something very heavy. If you are in danger right now, call your local emergency service or reach someone you trust. I am not the right help for this.',
          'chat.crisisSafeMode' => 'Hide the app (safe mode)',
          'chat.unavailableTitle' => 'The chat is not available right now',
          'chat.unavailableText' => 'Try again later.',
          'chat.errorTitle' => 'Couldn\'t load',
          'chat.errorText' => 'Try again in a moment.',
          'chat.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'chat.errors.other' => 'Couldn\'t do that right now. Try again.',
          'chat.starterHard' => 'A hard moment',
          'chat.starterIdea' => 'An idea',
          'chat.starterPlan' => 'A date plan',
          'chat.menuLabel' => 'More options',
          'checkin.title' => 'Weekly check-in',
          'checkin.titleHighlight' => 'Weekly',
          'checkin.introSubtitle' => 'Ten minutes. Each of you answers privately first.',
          'checkin.start' => 'Start',
          'checkin.notThisWeek' => 'Not this week',
          'checkin.questionOf' => ({
            required Object current,
            required Object total,
          }) => 'Question ${current} of ${total}',
          'checkin.questions.0' => 'What was good this week?',
          'checkin.questions.1' => 'What do you want us to do together?',
          'checkin.questions.2' => 'Did anything weigh on you this week?',
          'checkin.questions.3' => 'What do you want me to know?',
          'checkin.answerHint' => 'Write as much or as little as you want.',
          'checkin.privateNote' => 'Answers stay hidden until both of you finish.',
          'checkin.next' => 'Next',
          'checkin.finish' => 'Finish',
          'checkin.skip' => 'Skip this question',
          'checkin.skipNote' => 'Skipping leaves this question blank. The check-in only appears when both of you answer all four.',
          'checkin.waitingTitle' => 'Your answers are kept',
          'checkin.waitingText' => 'Answers appear when both of you have answered all four.',
          'checkin.waitingIncomplete' =>
            'Some questions are still blank. Answers appear when both of you answer all four.',
          'checkin.answerMissing' => 'Answer the missing ones',
          'checkin.checkAgain' => 'Check again',
          'checkin.review' => 'Review my answers',
          'checkin.discardTitle' => 'Discard this answer?',
          'checkin.discardText' => 'The text you wrote was not saved.',
          'checkin.discard' => 'Discard',
          'checkin.keepWriting' => 'Keep writing',
          'checkin.revealTitle' => 'Your answers together',
          'checkin.revealHighlight' => 'together',
          'checkin.revealSubtitle' =>
            'Now that you both finished, both answers to each question are shown.',
          'checkin.revealNote' => 'No scores. Just what each of you wrote.',
          'checkin.you' => 'You',
          'checkin.partnerFallback' => 'Your partner',
          'checkin.skippedAnswer' => 'Skipped this question',
          'checkin.close' => 'Close',
          'checkin.soloTitle' => 'The check-in is for both of you',
          'checkin.soloText' => 'When your person joins, the weekly check-in shows up here.',
          'checkin.loadErrorTitle' => 'Couldn\'t open the check-in',
          'checkin.loadErrorText' => 'Nothing was lost. Try again.',
          'checkin.errors.other' => 'Couldn\'t save that now. Try again.',
          'common.appName' => 'Flutter Bloc Starter',
          'common.send' => 'Send',
          'common.save' => 'Save',
          'common.retry' => 'Retry',
          'common.loading' => 'Loading',
          'common.username' => 'Username',
          'common.email' => 'Email',
          'common.password' => 'Password',
          'common.firstName' => 'First Name',
          'common.lastName' => 'Last Name',
          'common.genericError' => 'Something went wrong',
          'common.discardTitle' => 'Discard changes?',
          'common.discardText' => 'What you wrote won\'t be saved.',
          'common.discard' => 'Discard',
          'common.keepWriting' => 'Keep writing',
          'connectTouch.title' => 'Touch',
          'connectTouch.text' => 'Neutral cards, nothing spicy. Do it or skip it, no pressure.',
          'connectTouch.switchTitle' => 'Touch topics',
          'connectTouch.switchText' =>
            'Applies to both of you: if one turns it off, it goes away for both.',
          'connectTouch.offTitle' => 'Touch topics are off',
          'connectTouch.offText' =>
            'You or your partner turned them off. You can turn them back on here anytime.',
          'connectTouch.emptyTitle' => 'No cards right now',
          'connectTouch.emptyText' => 'Come back later.',
          'connectTouch.done' => 'Done',
          'connectTouch.skip' => 'Skip',
          'connectTouch.errorTitle' => 'Couldn\'t load',
          'connectTouch.errorText' => 'Try again in a moment.',
          'connectTouch.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'connectTouch.errors.other' => 'Couldn\'t change that right now. Try again.',
          'connectUs.title' => 'Us',
          'connectUs.text' =>
            'Send “I miss us” with one tap. Light, no guilt. Your partner doesn\'t have to answer.',
          'connectUs.send' => 'Send with care',
          'connectUs.plan' => 'Suggest a small plan',
          'connectUs.sentNote' => 'Sent. No rush to reply.',
          'connectUs.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'connectUs.errors.other' => 'Couldn\'t send right now. Try again.',
          'dateNight.title' => 'Date night',
          'dateNight.subtitle' => 'Ideas for the two of you, picked together.',
          'dateNight.hint' => 'E.g. picnic in the park',
          'dateNight.add' => 'Add',
          'dateNight.save' => 'Save',
          'dateNight.nextTitle' => 'Next date',
          'dateNight.ideasTitle' => 'Ideas',
          'dateNight.suggestionsTitle' => 'To start with',
          'dateNight.plannedFor' => ({
            required Object month,
            required Object day,
          }) => '${month} ${day}',
          'dateNight.monthsShort.0' => 'Jan',
          'dateNight.monthsShort.1' => 'Feb',
          'dateNight.monthsShort.2' => 'Mar',
          'dateNight.monthsShort.3' => 'Apr',
          'dateNight.monthsShort.4' => 'May',
          'dateNight.monthsShort.5' => 'Jun',
          'dateNight.monthsShort.6' => 'Jul',
          'dateNight.monthsShort.7' => 'Aug',
          'dateNight.monthsShort.8' => 'Sep',
          'dateNight.monthsShort.9' => 'Oct',
          'dateNight.monthsShort.10' => 'Nov',
          'dateNight.monthsShort.11' => 'Dec',
          'dateNight.planChoices.today' => 'Plan for today',
          'dateNight.planChoices.tomorrow' => 'Plan for tomorrow',
          'dateNight.planChoices.saturday' => 'Plan for Saturday',
          'dateNight.planChoices.sunday' => 'Plan for Sunday',
          'dateNight.planChoices.other' => '',
          'dateNight.markDone' => 'We did it',
          'dateNight.reopen' => 'Back to ideas',
          'dateNight.done' => 'Done',
          'dateNight.delete' => 'Delete',
          'dateNight.emptyTitle' => 'No ideas yet',
          'dateNight.emptyText' => 'Write a date idea. You both see it.',
          'dateNight.errorTitle' => 'Couldn\'t load',
          'dateNight.errorText' => 'Your ideas are still saved. Try again.',
          'dateNight.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'dateNight.errors.other' => 'Couldn\'t do that right now. Try again.',
          'dates.title' => 'Dates',
          'dates.segmentDates' => 'Dates',
          'dates.segmentGifts' => 'Gifts',
          'dates.segmentHolidays' => 'Holidays',
          'dates.titleLabel' => 'Name',
          'dates.titleHint' => 'E.g. their birthday',
          'dates.titleErrors.empty' => 'Give this date a name',
          'dates.titleErrors.tooLong' => 'The name is too long',
          'dates.kinds.relationship' => 'Relationship',
          'dates.kinds.birthday' => 'Birthday',
          'dates.kinds.first' => 'A first time',
          'dates.kinds.trip' => 'Trip',
          'dates.kinds.custom' => 'Other',
          'dates.kinds.holiday' => 'Holiday',
          'dates.kinds.reunion' => 'Reunion',
          'dates.kinds.other' => '',
          'dates.monthLabel' => 'Month',
          'dates.dayLabel' => 'Day',
          'dates.yearLabel' => 'Year (optional)',
          'dates.yearHint' => 'E.g. 1994',
          'dates.yearHelp' => 'Without the year the date just repeats, with no age.',
          'dates.yearErrors.invalid' => 'Use a year between 1900 and 2200',
          'dates.months.0' => 'January',
          'dates.months.1' => 'February',
          'dates.months.2' => 'March',
          'dates.months.3' => 'April',
          'dates.months.4' => 'May',
          'dates.months.5' => 'June',
          'dates.months.6' => 'July',
          'dates.months.7' => 'August',
          'dates.months.8' => 'September',
          'dates.months.9' => 'October',
          'dates.months.10' => 'November',
          'dates.months.11' => 'December',
          'dates.monthsShort.0' => 'Jan',
          'dates.monthsShort.1' => 'Feb',
          'dates.monthsShort.2' => 'Mar',
          'dates.monthsShort.3' => 'Apr',
          'dates.monthsShort.4' => 'May',
          'dates.monthsShort.5' => 'Jun',
          'dates.monthsShort.6' => 'Jul',
          'dates.monthsShort.7' => 'Aug',
          'dates.monthsShort.8' => 'Sep',
          'dates.monthsShort.9' => 'Oct',
          'dates.monthsShort.10' => 'Nov',
          'dates.monthsShort.11' => 'Dec',
          'dates.dayLine' => ({
            required Object month,
            required Object day,
            required Object kind,
          }) => '${month} ${day} · ${kind}',
          'dates.dayOnly' => ({required Object month, required Object day}) => '${month} ${day}',
          'dates.saveDate' => 'Save date',
          'dates.delete' => 'Delete',
          'dates.deleteTitle' => 'Delete this date?',
          'dates.deleteText' => 'It disappears from the calendar for both of you.',
          'dates.deleteConfirm' => 'Delete',
          'dates.add' => 'Add',
          'dates.emptyDatesTitle' => 'No dates yet',
          'dates.emptyDatesText' => 'Keep birthdays and dates that matter. We remind you ahead.',
          'dates.giftsPrivate' => 'Gift ideas only you see.',
          'dates.giftHint' => 'E.g. book of poems',
          'dates.giftErrors.empty' => 'Write the gift idea',
          'dates.giftErrors.tooLong' => 'The gift idea is too long',
          'dates.given' => 'Given',
          'dates.emptyGiftsTitle' => 'No ideas yet',
          'dates.emptyGiftsText' => 'Jot down gifts when you think of them.',
          'dates.emptyHolidaysTitle' => 'No holidays here',
          'dates.emptyHolidaysText' => 'The calendar has no holidays for you yet.',
          'dates.errorTitle' => 'Couldn\'t load',
          'dates.errorText' => 'Your data is still saved. Try again.',
          'dates.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'dates.errors.other' => 'Couldn\'t do that right now. Try again.',
          'day.dateLine' => ({
            required Object month,
            required Object day,
            required Object year,
          }) => '${month} ${day}, ${year}',
          'day.months.0' => 'January',
          'day.months.1' => 'February',
          'day.months.2' => 'March',
          'day.months.3' => 'April',
          'day.months.4' => 'May',
          'day.months.5' => 'June',
          'day.months.6' => 'July',
          'day.months.7' => 'August',
          'day.months.8' => 'September',
          'day.months.9' => 'October',
          'day.months.10' => 'November',
          'day.months.11' => 'December',
          'day.previous' => 'Previous day',
          'day.next' => 'Next day',
          'day.planned' => 'Planned date',
          'day.emptyTitle' => 'Nothing set for this day',
          'day.emptyText' => 'A free day is good too.',
          'day.errorTitle' => 'Couldn\'t load',
          'day.errorText' => 'Try again in a moment.',
          'devices.title' => 'Notification devices',
          'devices.subtitle' => 'Phones that receive notifications for this account. Removing one stops its notifications.',
          'devices.current' => 'This device',
          'devices.registeredToday' => ({required Object time}) => 'Registered today at ${time}',
          'devices.registeredYesterday' => ({
            required Object time,
          }) => 'Registered yesterday at ${time}',
          'devices.registeredOn' => ({required Object date}) => 'Registered on ${date}',
          'devices.platformIos' => 'iPhone',
          'devices.platformAndroid' => 'Android',
          'devices.revokeTitle' => 'Stop notifications on this device?',
          'devices.revokeText' => ({
            required Object name,
          }) => '${name} will stop receiving notifications for this account.',
          'devices.revokeConfirm' => 'Stop notifications',
          'devices.revoked' => 'Notifications stopped on that device.',
          'devices.emptyTitle' => 'No notification devices',
          'devices.emptyText' => 'Devices that receive notifications for this account appear here.',
          'devices.errors.NETWORK' => 'No connection. Try again when you are back online.',
          'devices.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'devices.errors.DEVICE_REVOKE_FAILED' =>
            'Couldn\'t stop notifications on that device. Try again.',
          'devices.errors.other' => 'Couldn\'t stop notifications on that device. Try again.',
          'discreet.title' => 'Discreet mode',
          'discreet.neutralIcon' => 'Neutral icon',
          'discreet.neutralNotifications' => 'Neutral notifications',
          'discreet.hideWidgetText' => 'Hide widget text',
          'discreet.note' =>
            'Hides names and content in notifications and widgets. No couple photo on the icon.',
          'discreet.saveError' => 'Could not save now. Try again.',
          'distance.title' => 'Distance',
          'distance.text' => 'Two clocks, each in its own time zone, never mixed up.',
          'distance.you' => 'You',
          'distance.partner' => 'Your partner',
          'distance.noPartner' => 'When your partner joins, their clock shows up here.',
          'distance.sameZone' => 'You are in the same time zone for now.',
          'distance.reunionDays' => ({required Object n}) => '${n} days until you see each other',
          'distance.reunionToday' => 'You see each other today',
          'distance.reunionTomorrow' => 'You see each other tomorrow',
          'distance.noReunionTitle' => 'No reunion date',
          'distance.noReunionText' =>
            'Save a “Reunion” in your dates and the countdown shows here.',
          'distance.addReunion' => 'Save a date',
          'distance.errorTitle' => 'Couldn\'t load',
          'distance.errorText' => 'Try again in a moment.',
          'fightStyle.exerciseTitle' => 'How I react in a fight',
          'fightStyle.exerciseHighlight' => 'react',
          'fightStyle.exerciseSubtitle' => 'Six quick questions, just for you.',
          'fightStyle.questionOf' => ({
            required Object current,
            required Object total,
          }) => 'Question ${current} of ${total}',
          'fightStyle.questions.0' => 'When the conversation heats up, what do you do first?',
          'fightStyle.questions.1' => 'If your partner goes quiet mid-fight, you...',
          'fightStyle.questions.2' => 'After an argument, what usually happens?',
          'fightStyle.questions.3' => 'What bothers you most in a fight?',
          'fightStyle.questions.4' => 'When you notice you went too far, you...',
          'fightStyle.questions.5' => 'What helps you feel normal again?',
          'fightStyle.options1.pursue' => 'I keep talking until it\'s settled.',
          'fightStyle.options1.withdraw' => 'I need some time before going on.',
          'fightStyle.options1.repair' => 'I try to lighten the mood.',
          'fightStyle.options1.avoid' => 'I change the subject so it doesn\'t get worse.',
          'fightStyle.options1.other' => '',
          'fightStyle.options2.pursue' => 'I push for them to speak.',
          'fightStyle.options2.withdraw' => 'I go quiet too.',
          'fightStyle.options2.repair' => 'I calmly ask what happened.',
          'fightStyle.options2.avoid' => 'I leave it for later.',
          'fightStyle.options2.other' => '',
          'fightStyle.options3.pursue' => 'I look for the conversation right away.',
          'fightStyle.options3.withdraw' => 'I spend some time alone.',
          'fightStyle.options3.repair' => 'I think about what I can fix.',
          'fightStyle.options3.avoid' => 'I\'d rather not go back to it.',
          'fightStyle.options3.other' => '',
          'fightStyle.options4.pursue' => 'Getting no answer.',
          'fightStyle.options4.withdraw' => 'Feeling pressured.',
          'fightStyle.options4.repair' => 'Seeing that we don\'t understand each other.',
          'fightStyle.options4.avoid' => 'The conversation dragging on.',
          'fightStyle.options4.other' => '',
          'fightStyle.options5.pursue' => 'I talk even more to explain.',
          'fightStyle.options5.withdraw' => 'I close up until I calm down.',
          'fightStyle.options5.repair' => 'I apologize or suggest a way to fix it.',
          'fightStyle.options5.avoid' => 'I wait for it to cool down.',
          'fightStyle.options5.other' => '',
          'fightStyle.options6.pursue' => 'Finishing the conversation.',
          'fightStyle.options6.withdraw' => 'Some quiet time.',
          'fightStyle.options6.repair' => 'A small gesture of care.',
          'fightStyle.options6.avoid' => 'Carrying on with the day as if nothing happened.',
          'fightStyle.options6.other' => '',
          'fightStyle.continueAction' => 'Continue',
          'fightStyle.finishAction' => 'See result',
          'fightStyle.back' => 'Back',
          'fightStyle.privateNote' => 'Only you see your answers. Nothing is sent to your partner.',
          'fightStyle.resultTitle' => 'How you usually react',
          'fightStyle.resultHighlight' => 'react',
          'fightStyle.patternTag' => 'Your pattern',
          'fightStyle.descriptions.pursue' =>
            'You tend to seek the conversation right away, even while things are still hot.',
          'fightStyle.descriptions.withdraw' => 'You tend to step back first and come back later.',
          'fightStyle.descriptions.repair' =>
            'You tend to look for a way to fix things soon after a fight.',
          'fightStyle.descriptions.avoid' =>
            'You tend to set the subject aside so it doesn\'t get worse in the moment.',
          'fightStyle.descriptions.other' => '',
          'fightStyle.practices.pursue' => 'That helps you sort it out fast. Pausing before it gets worse and listening to the end is worth it.',
          'fightStyle.practices.withdraw' =>
            'That helps you pause before it gets worse. Pick a set way to come back.',
          'fightStyle.practices.repair' =>
            'That helps you return after a fight. A short apology often does it.',
          'fightStyle.practices.avoid' =>
            'That helps you pause before it gets worse. Choose a short moment to come back to it.',
          _ => null,
        } ??
        switch (path) {
          'fightStyle.practices.other' => '',
          'fightStyle.partnerSignal' => ({
            required Object name,
          }) => 'Agree on a signal with ${name} to come back.',
          'fightStyle.addToTools' => 'Add to my repair tools',
          'fightStyle.addedToTools' => 'Already in your repair tools',
          'fightStyle.keepMine' => 'Keep it to myself',
          'fightStyle.retake' => 'Take it again',
          'fightStyle.addedToast' => 'Added to your repair tools.',
          'fightStyle.loadErrorTitle' => 'Couldn\'t load',
          'fightStyle.loadErrorText' => 'Couldn\'t open your result right now. Try again.',
          'fightStyle.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'fightStyle.errors.other' => 'Couldn\'t save right now. Your answers are still here.',
          'fightStyle.addErrors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'fightStyle.addErrors.other' => 'Couldn\'t add it right now. Try again.',
          'firstSlip.title' => 'Start with one good thing',
          'firstSlip.titleHighlight' => 'one good thing',
          'firstSlip.subtitle' => 'What did your partner do lately that made you smile? 30 seconds is enough. No account yet.',
          'firstSlip.hint' => 'E.g. made coffee before I woke up',
          'firstSlip.textErrors.empty' => 'Write one good thing first.',
          'firstSlip.textErrors.tooLong' => 'Use at most 140 characters.',
          'firstSlip.localNote' => 'Stays saved on this phone only.',
          'firstSlip.save' => 'Save',
          'firstSlip.saveError' => 'Could not keep it right now. Try again.',
          'games.hub.title' => 'Play',
          'games.hub.subtitle' => 'Short games for the two of you. No scores and no winner.',
          'games.hub.guessLabel' => 'Guesses',
          'games.hub.talkLabel' => 'Conversation',
          'games.hub.challengeLabel' => 'Challenge',
          'games.hub.minutes' => ({required Object minutes}) => '${minutes} min',
          'games.hub.invitedTitle' => ({required Object name}) => '${name} invited you',
          'games.hub.invitedFallbackTitle' => 'Your partner invited you',
          'games.hub.join' => 'Join',
          'games.hub.stateWaiting' => ({required Object name}) => 'Waiting for ${name}',
          'games.hub.stateWaitingFallback' => 'Waiting for your partner',
          'games.hub.stateInvited' => 'Invited you',
          'games.hub.stateActive' => 'In progress',
          'games.hub.stateFinished' => 'Finished',
          'games.hub.stateCancelled' => 'Invitation cancelled',
          'games.hub.stateExpired' => 'Invitation expired',
          'games.hub.lockChip' => 'Needs both of you',
          'games.hub.noPartnerNote' =>
            'Games need both of you. When your partner joins, you can play.',
          'games.hub.refreshNote' =>
            'To see if anything changed, come back to the app or pull to refresh.',
          'games.hub.loadErrorTitle' => 'Could not open the games',
          'games.hub.loadErrorText' => 'Nothing was lost. Try again.',
          'games.hub.questionCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 question',
                  other: '${count} questions',
                ),
          'games.hub.guessCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 guess',
                  other: '${count} guesses',
                ),
          'games.kinds.meOrYou.title' => 'Me or you',
          'games.kinds.meOrYou.intro' =>
            'Answer separately who fits each phrase better. Then see where you thought alike.',
          'games.kinds.howWell.title' => 'How well you know me',
          'games.kinds.howWell.intro' => 'Each of you answers about yourself and guesses the other\'s answer. Then comes the conversation.',
          'games.kinds.twentyQuestions.title' => '20 questions',
          'games.kinds.twentyQuestions.intro' =>
            'Light questions to answer in private and reveal together.',
          'games.kinds.neverHaveWe.title' => 'Never have we',
          'games.kinds.neverHaveWe.intro' => 'Things you have never done together. Each of you answers in private and you see both sides at the end.',
          'games.kinds.mission.title' => 'Date mission',
          'games.kinds.mission.intro' =>
            'A date idea to do together and a short reflection afterwards.',
          'games.start.noWinnerNote' => 'No winner, no points.',
          'games.start.cta' => ({required Object name}) => 'Invite ${name}',
          'games.start.ctaFallback' => 'Invite your partner',
          'games.start.cancelledNote' =>
            'The last invitation was cancelled. You can start again whenever you like.',
          'games.start.expiredNote' =>
            'The previous invitation expired. Invite again whenever you like.',
          'games.start.noContentTitle' => 'This game has no questions yet',
          'games.start.noContentText' => 'There is no content to play yet. Come back soon.',
          'games.invitation.title' => ({required Object name}) => '${name} invited you',
          'games.invitation.titleFallback' => 'Your partner invited you',
          'games.invitation.join' => 'Play now',
          'games.invitation.later' => 'Later',
          'games.waiting.text' => ({
            required Object name,
          }) => 'Invitation sent to ${name}. It starts when they join.',
          'games.waiting.textFallback' => 'Invitation sent. It starts when your partner joins.',
          'games.waiting.status' => 'Waiting…',
          'games.waiting.window' => 'The invitation waits for up to 48 hours.',
          'games.waiting.checkAgain' => 'Check if they joined',
          'games.waiting.cancel' => 'Cancel the invitation',
          'games.active.title' => 'The game has started',
          'games.active.text' => 'Both of you are in. This game\'s screens appear here.',
          'games.active.cancel' => 'End the game',
          'games.playing.progress' => ({
            required Object current,
            required Object total,
          }) => 'Question ${current} of ${total}',
          'games.playing.you' => 'You',
          'games.playing.partnerFallback' => 'Your partner',
          'games.playing.submit' => 'Send answer',
          'games.playing.skip' => 'Skip this one',
          'games.playing.guessAboutYou' => 'About you',
          'games.playing.guessAboutPartner' => ({required Object name}) => 'About ${name}',
          'games.playing.guessAboutPartnerFallback' => 'About your partner',
          'games.playing.guessPrompt' => ({required Object name}) => 'What did ${name} answer?',
          'games.playing.guessPromptFallback' => 'What did your partner answer?',
          'games.playing.guessYourGuess' => 'Your guess',
          'games.playing.answerHint' => 'Answer as you would.',
          'games.playing.guessHint' => 'Guess what they answered.',
          'games.playing.talkHint' =>
            'Write your answer. Only you can read it until you both finish.',
          'games.playing.talkNote' => 'Your partner only sees this after both of you answer.',
          'games.date.start' => 'Start the date',
          'games.date.startNote' => 'Do the mission together, then come back and tell how it was.',
          'games.date.reflectionTitle' => 'How was it?',
          'games.date.reflectionText' =>
            'Pick what happened. Your partner sees it only after you both answer.',
          'games.reflections.great' => 'It was great',
          'games.reflections.ok' => 'It was nice',
          'games.reflections.did_not_happen' => 'It did not happen',
          'games.reflections.other' => 'No answer',
          'games.waitingPartner.title' => 'You answered everything',
          'games.waitingPartner.text' => ({
            required Object name,
          }) => 'Now it is just waiting for ${name}. Nothing you wrote appears before both of you finish.',
          'games.waitingPartner.textFallback' => 'Now it is just waiting for your partner. Nothing you wrote appears before both of you finish.',
          'games.waitingPartner.answersTitle' => 'What you saved',
          'games.waitingPartner.checkAgain' => 'Check again',
          'games.waitingPartner.cancel' => 'End the game',
          'games.finished.title' => 'That was a good conversation',
          'games.finished.text' => 'No score, no winner. Just the two of you.',
          'games.finished.you' => 'You',
          'games.finished.yourGuess' => 'Your guess',
          'games.finished.partnerGuess' => 'Their guess',
          'games.finished.matched' => 'Matched',
          'games.finished.noAnswer' => 'No answer',
          'games.finished.both' => 'Both of you',
          'games.finished.agreed' => 'You both agreed',
          'games.finished.back' => 'Back',
          'games.notFound.title' => 'This game does not exist',
          'games.notFound.text' =>
            'It may have changed or never existed. Go back and pick another one.',
          'games.notFound.action' => 'Go back',
          'games.cancel.title' => 'End the game?',
          'games.cancel.text' => 'The game ends for both of you. You can start another later.',
          'games.cancel.confirm' => 'End game',
          'games.cancel.keep' => 'Keep playing',
          'games.noPartner.title' => 'Games are for two',
          'games.noPartner.text' => 'When your partner joins, you can play together.',
          'games.common.close' => 'Close',
          'games.loadErrorTitle' => 'Could not open the game',
          'games.loadErrorText' => 'Nothing was lost. Try again.',
          'games.errors.NOT_PAIRED' => 'Games need both of you connected.',
          'games.errors.NOT_FOUND' => 'That game no longer exists. We\'ll refresh.',
          'games.errors.INVALID_GAME_ACTION' => 'That game changed. We\'ll refresh.',
          'games.errors.GAME_ALREADY_OPEN' =>
            'A game is already open. Finish or cancel it before inviting again.',
          'games.errors.GAME_NOT_COMPLETE' =>
            'Your partner is still answering. Try again when they finish.',
          'games.errors.INVALID_GAME_INDEX' => 'That question changed. We\'ll refresh.',
          'games.errors.other' => 'Could not do that right now. Try again.',
          'gifts.title' => 'Gift page',
          'gifts.subtitle' => 'A page your partner can see in the app. You choose what to share.',
          'gifts.myTitle' => 'My wishes',
          'gifts.partnerTitle' => 'From your partner',
          'gifts.emptyPageTitle' => 'No wishes yet',
          'gifts.emptyPageTextShared' => 'Add a wish, or wait for your partner to share one.',
          'gifts.emptyPageTextSolo' =>
            'Add what you would love to receive. It stays private until you pair.',
          'gifts.emptyMineTitle' => 'No wishes yet',
          'gifts.emptyMineText' => 'Add what you would love to receive.',
          'gifts.emptyPartnerTitle' => 'Nothing shared yet',
          'gifts.emptyPartnerText' => 'When your partner shares a wish, it shows up here.',
          'gifts.addTitle' => 'New wish',
          'gifts.editTitle' => 'Edit wish',
          'gifts.titleLabel' => 'Gift',
          'gifts.titleHint' => 'E.g. a book of poems',
          'gifts.titleErrors.empty' => 'Give the wish a name.',
          'gifts.titleErrors.tooLong' => 'Keep it to 120 characters or fewer.',
          'gifts.noteHint' => 'Size, color, where to find it.',
          'gifts.noteErrors.tooLong' => 'Keep the note under 1000 characters.',
          'gifts.budgetLabel' => 'Budget (optional)',
          'gifts.budgets.free' => 'Free',
          'gifts.budgets.low' => 'Low',
          'gifts.budgets.medium' => 'Medium',
          'gifts.budgets.high' => 'High',
          'gifts.budgets.other' => '',
          'gifts.noBudget' => 'No budget',
          'gifts.shared' => 'Shared',
          'gifts.private' => 'Private',
          'gifts.sharedHint' => 'Your partner can see this wish.',
          'gifts.privateHint' => 'Only you can see this wish.',
          'gifts.sharedNeedsPartner' => 'Pair with your partner to share a wish.',
          'gifts.save' => 'Save',
          'gifts.add' => 'Add',
          'gifts.delete' => 'Delete',
          'gifts.deleteTitle' => 'Delete this wish?',
          'gifts.deleteText' => 'It disappears for you and your partner.',
          'gifts.deleteConfirm' => 'Delete',
          'gifts.entryLabel' => 'GIFTS',
          'gifts.entryTitle' => 'Gift page',
          'gifts.entryText' => 'Wishes you choose to share, or keep to yourself.',
          'gifts.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'gifts.errors.other' => 'Couldn\'t do that right now. Try again.',
          'globalErrors.offline' => 'No connection. Your notes stay saved and sync later.',
          'globalErrors.errorTitle' => 'Something went wrong',
          'globalErrors.errorText' => 'Try again in a moment.',
          'globalErrors.networkTitle' => 'No connection',
          'globalErrors.networkText' => 'Check the connection and try again.',
          'globalErrors.timeoutTitle' => 'The connection took too long',
          'globalErrors.timeoutText' => 'Try again in a moment.',
          'globalErrors.rateTitle' => 'Easy there',
          'globalErrors.rateText' => 'Too many tries in a row. Wait a little and try again.',
          'globalErrors.notFoundTitle' => 'Not found',
          'globalErrors.notFoundText' => 'Maybe this is no longer available.',
          'globalErrors.retry' => 'Try again',
          'globalErrors.retryIn' => ({required Object seconds}) => 'Try in ${seconds}s',
          'globalErrors.updateTitle' => 'Update the app',
          'globalErrors.updateHighlight' => 'app',
          'globalErrors.updateText' => 'There is a new version. Update to continue.',
          'globalErrors.updateAction' => 'Update',
          'globalErrors.updateUnavailable' => 'Could not open the store. Update there.',
          'griefSupport.title' => 'We\'re with you',
          'griefSupport.highlight' => 'you',
          'griefSupport.text' => 'Your memories stay here, at your pace.',
          'griefSupport.seeSupport' => 'See support',
          'griefSupport.backHome' => 'Back to the start',
          'guides.hub.title' => 'Difficult conversations',
          'guides.hub.titleHighlight' => 'Difficult',
          'guides.hub.subtitle' => 'One step at a time, in private.',
          'guides.hub.privateNote' => 'Your notes stay with you. Nothing is sent to your partner.',
          'guides.hub.stepCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 step',
                  other: '${count} steps',
                ),
          'guides.hub.loadErrorTitle' => 'Could not open the topics',
          'guides.hub.loadErrorText' => 'Nothing was lost. Try again.',
          'guides.viewer.stepOf' => ({
            required Object current,
            required Object total,
          }) => 'Step ${current} of ${total}',
          'guides.viewer.answerHint' => 'Write whatever makes sense. It can stay blank.',
          'guides.viewer.stepNote' => 'Saved as you go. Only you can see it.',
          'guides.viewer.next' => 'Next',
          'guides.viewer.finish' => 'Finish',
          'guides.viewer.back' => 'Back',
          'guides.viewer.loadErrorTitle' => 'Could not open this conversation',
          'guides.viewer.loadErrorText' => 'Nothing was lost. Try again.',
          'guides.viewer.errors.other' => 'Could not save right now. Your answers are still here.',
          'guides.gate.title' => 'A sensitive topic',
          'guides.gate.text' => 'This topic is about intimacy and is meant for adults. You can go slowly or choose another topic whenever you like.',
          'guides.gate.cycleText' => 'This topic is about your body and mood through the month and is meant for adults. You can go slowly or choose another topic whenever you like.',
          'guides.gate.continueAction' => 'Continue',
          'guides.gate.otherAction' => 'See other topics',
          'guides.finish.title' => 'Your conversation is ready',
          'guides.finish.titleHighlight' => 'ready',
          'guides.finish.text' => 'Your notes are saved to your account, privately.',
          'guides.finish.finishSaved' => 'Saved only for you.',
          'guides.finish.start' => 'Start a conversation',
          'guides.finish.other' => 'Back to topics',
          'hardConversation.title' => 'Prepare a hard conversation',
          'hardConversation.stepOf' => ({
            required Object current,
            required Object total,
          }) => 'Step ${current} of ${total}',
          'hardConversation.whatTitle' => 'What happened?',
          'hardConversation.whatHint' => 'If you want, tell me in your own words',
          'hardConversation.whatIgnored' => 'She felt ignored',
          'hardConversation.whatMoney' => 'We fought about money',
          'hardConversation.whatMisunderstanding' => 'It was a misunderstanding',
          'hardConversation.whatOther' => 'Other: write it',
          'hardConversation.needTitle' => 'What do I need?',
          'hardConversation.needHint' => 'If you want, add something',
          'hardConversation.needHeard' => 'To be heard',
          'hardConversation.needApology' => 'To apologize',
          'hardConversation.needAgree' => 'To agree on something',
          'hardConversation.sayTitle' => 'How to say it',
          'hardConversation.sayIntro' => 'A starting point for you to edit before sending.',
          'hardConversation.sayHint' => 'Your opening sentence',
          'hardConversation.messageErrors.empty' => 'Write the sentence first',
          'hardConversation.messageErrors.tooLong' => 'This sentence is too long',
          'hardConversation.generating' => 'Writing a gentle opening…',
          'hardConversation.gentler' => 'More gentle',
          'hardConversation.moreDirect' => 'More direct',
          'hardConversation.copy' => 'Copy',
          'hardConversation.copied' => 'Copied',
          'hardConversation.sendAsNote' => 'Send as a note',
          'hardConversation.sent' => 'Note sent',
          'hardConversation.exit' => 'Leave',
          'hardConversation.next' => 'Next',
          'hardConversation.back' => 'Back',
          'hardConversation.needPause' => 'I need a pause',
          'hardConversation.retry' => 'Try again',
          'hardConversation.generationFailed' => 'Couldn\'t write a sentence right now.',
          'hardConversation.privateNote' =>
            'The mascot only sees what you write here. Your partner\'s data is never sent.',
          'hardConversation.offline' => 'You\'re offline. The opening sentence needs a connection.',
          'hardConversation.emptyTitle' => 'Couldn\'t load',
          'hardConversation.emptyText' => 'Try again in a moment.',
          'hardConversation.errors.CHAT_LIMIT' => 'Today\'s messages are used up.',
          'hardConversation.errors.CHAT_DISABLED' =>
            'The chat is off. Turn it on to use the mascot.',
          'hardConversation.errors.CHAT_UNAVAILABLE' => 'The chat is not available right now.',
          'hardConversation.errors.UPSTREAM' => 'Couldn\'t write a sentence right now. Try again.',
          'hardConversation.errors.NOT_PAIRED' =>
            'To send this, you need to be connected with your partner in the app.',
          'hardConversation.errors.other' => 'Couldn\'t do that right now. Try again.',
          'heavyDay.title' => 'Heavy-day notice',
          'heavyDay.gateTitle' => 'Heavy-day notice',
          'heavyDay.gateText' => 'Some days weigh more. You can tell your partner with one short sentence, without details. Your partner does not see your programs or what you write.',
          'heavyDay.activate' => 'Turn on',
          'heavyDay.notNow' => 'Not now',
          'heavyDay.noticeBody' => 'A delicate day. A little extra care helps.',
          'heavyDay.previewPartner' => ({
            required Object name,
          }) => '${name} would see: “A delicate day. A little extra care helps.”',
          'heavyDay.previewGeneric' =>
            'Your partner would see: “A delicate day. A little extra care helps.”',
          'heavyDay.frequencyAsk' => 'Each time',
          'heavyDay.frequencyAlways' => 'Always',
          'heavyDay.share' => 'Share',
          'heavyDay.cancel' => 'Don\'t share',
          'heavyDay.confirmationTitle' => ({required Object name}) => 'Notice sent to ${name}',
          'heavyDay.confirmationGeneric' => 'Notice sent',
          'heavyDay.confirmationHint' => 'Your partner sees it on the notes widget, if it is on.',
          'heavyDay.errorTitle' => 'Couldn\'t load',
          'heavyDay.errorText' => 'Couldn\'t do that right now. Try again.',
          'help.badDayTitle' => 'A hard day',
          'help.badDayText' => 'Three small things that may help right now. Nothing required.',
          'help.starterTitle' => 'Start a conversation',
          'help.starterText' => 'A question to open with, no rush.',
          'help.another' => 'Another',
          'help.emptyTitle' => 'Nothing here yet',
          'help.emptyText' => 'We\'re preparing more suggestions.',
          'help.errorTitle' => 'Couldn\'t load',
          'help.errorText' => 'Try again in a moment.',
          'helpSupport.title' => 'Help',
          'helpSupport.contactTitle' => 'Talk to support',
          'helpSupport.reportBug' => 'Report a bug',
          'helpSupport.faqTitle' => 'Common questions',
          'helpSupport.faqQuestions.replyTime' => 'When will I get an answer?',
          'helpSupport.faqQuestions.offline' => 'What if I send without internet?',
          'helpSupport.faqQuestions.privacy' => 'Who reads what I send?',
          'helpSupport.faqQuestions.reportBug' => 'How do I report a bug?',
          'helpSupport.faqAnswers.replyTime' => 'We reply within 2 business days.',
          'helpSupport.faqAnswers.offline' =>
            'Your message stays saved and goes out when you\'re online again.',
          'helpSupport.faqAnswers.privacy' =>
            'Only the support team. Nothing is shared with your partner.',
          'helpSupport.faqAnswers.reportBug' => 'Choose Bug in the form and tell us what happened.',
          'helpSupport.pendingNote' => 'A message is saved and will be sent when you\'re online.',
          'helpSupport.discardedNote' => 'A saved message couldn\'t be sent and was removed. Write to us again if it still matters.',
          'helpSupport.supportTitle' => 'Support',
          'helpSupport.supportHeading' => 'How can we help?',
          'helpSupport.supportHighlight' => 'help',
          'helpSupport.topics.account' => 'Account',
          'helpSupport.topics.billing' => 'Billing',
          'helpSupport.topics.bug' => 'Bug',
          'helpSupport.topics.other' => 'Other',
          'helpSupport.messageLabel' => 'Message',
          'helpSupport.messageHint' => 'Tell us what happened, with as much detail as you like.',
          'helpSupport.messageErrors.empty' => 'Write your message first',
          'helpSupport.messageErrors.tooLong' => 'The message is too long',
          'helpSupport.replyEmailLabel' => 'Reply email',
          'helpSupport.replyEmailHint' => 'you@email.com',
          'helpSupport.replyEmailErrors.invalid' => 'Check the email address.',
          'helpSupport.replyEmailErrors.tooLong' => 'This email is too long',
          'helpSupport.replyTime' => 'We reply within 2 business days.',
          'helpSupport.send' => 'Send',
          'helpSupport.sentTitle' => 'Message sent',
          'helpSupport.sentText' => 'Thanks. We reply within 2 business days.',
          'helpSupport.queuedTitle' => 'Saved',
          'helpSupport.queuedText' =>
            'We\'ll send it when you\'re back online. It hasn\'t been delivered yet.',
          'helpSupport.done' => 'Done',
          'helpSupport.errors.RATE_LIMITED' =>
            'You sent several messages today. Try again tomorrow.',
          'helpSupport.errors.noData' => 'Couldn\'t send right now. Your message is still here.',
          'helpSupport.errors.other' => 'Couldn\'t send right now. Your message is still here.',
          'helpSupport.discardTitle' => 'Discard this message?',
          'helpSupport.discardText' => 'What you wrote won\'t be saved.',
          'history.title' => 'Our history',
          'history.addMilestoneTooltip' => 'Add milestone',
          'history.togetherSinceLine' => ({required Object date}) => 'together since ${date}',
          'history.setStartDate' => 'Set when our story started',
          'history.beginningHeadline' => 'Starting out',
          'history.reunionCountdown' =>
            ({required num days}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  days,
                  one: '${days} day to go',
                  other: '${days} days to go',
                ),
          'history.durationFull' => ({
            required Object years,
            required Object yearsUnit,
            required Object months,
            required Object monthsUnit,
            required Object days,
            required Object daysUnit,
          }) => '${years} ${yearsUnit}, ${months} ${monthsUnit}\nand ${days} ${daysUnit}',
          'history.durationFullInline' => ({
            required Object years,
            required Object yearsUnit,
            required Object months,
            required Object monthsUnit,
            required Object days,
            required Object daysUnit,
          }) => '${years} ${yearsUnit}, ${months} ${monthsUnit} and ${days} ${daysUnit}',
          'history.durationMonthsDays' => ({
            required Object months,
            required Object monthsUnit,
            required Object days,
            required Object daysUnit,
          }) => '${months} ${monthsUnit} and ${days} ${daysUnit}',
          'history.durationDaysOnly' => ({
            required Object days,
            required Object daysUnit,
          }) => '${days} ${daysUnit}',
          'history.yearOne' => 'year',
          'history.yearMany' => 'years',
          'history.monthOne' => 'month',
          'history.monthMany' => 'months',
          'history.dayOne' => 'day',
          'history.dayMany' => 'days',
          'history.statDays' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'day',
                  other: 'days',
                ),
          'history.statWeekends' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'weekend',
                  other: 'weekends',
                ),
          'history.statChristmases' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Christmas',
                  other: 'Christmases',
                ),
          'history.statPlaces' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'place',
                  other: 'places',
                ),
          'history.storyDatesAction' => 'Story dates',
          'history.numbersAction' => 'In numbers',
          'history.variationsAction' => 'How the counter looks',
          'history.avatarAction' => 'Your avatar',
          'history.differentDatesBanner' => 'You chose different start dates',
          'history.differentDatesAction' => 'See dates',
          'history.timelineSection' => 'MILESTONES AND MEMORIES',
          'history.recentChip' => 'Recent',
          'history.unknownYearChip' => 'No date',
          'history.timelineRecentNote' => 'Showing your most recent milestones.',
          'history.loadEarlierYear' => ({required Object year}) => 'See ${year}',
          'history.unknownDateLabel' => 'Unknown date',
          'history.addMilestoneRow' => 'Add a milestone',
          'history.emptyTitle' => 'Start with your first milestone',
          'history.emptyText' => 'Save when you met or a special moment.',
          'history.suggestedFirstTitle' => 'We met',
          'history.suggestedFirstSub' => 'Suggested first milestone · tap to add',
          'history.monthsShort.0' => 'Jan',
          'history.monthsShort.1' => 'Feb',
          'history.monthsShort.2' => 'Mar',
          'history.monthsShort.3' => 'Apr',
          'history.monthsShort.4' => 'May',
          'history.monthsShort.5' => 'Jun',
          'history.monthsShort.6' => 'Jul',
          'history.monthsShort.7' => 'Aug',
          'history.monthsShort.8' => 'Sep',
          'history.monthsShort.9' => 'Oct',
          'history.monthsShort.10' => 'Nov',
          'history.monthsShort.11' => 'Dec',
          'history.monthsLong.0' => 'January',
          'history.monthsLong.1' => 'February',
          'history.monthsLong.2' => 'March',
          'history.monthsLong.3' => 'April',
          'history.monthsLong.4' => 'May',
          'history.monthsLong.5' => 'June',
          'history.monthsLong.6' => 'July',
          'history.monthsLong.7' => 'August',
          'history.monthsLong.8' => 'September',
          'history.monthsLong.9' => 'October',
          'history.monthsLong.10' => 'November',
          'history.monthsLong.11' => 'December',
          'history.fullDate' => ({
            required Object month,
            required Object day,
            required Object year,
          }) => '${month} ${day}, ${year}',
          'history.shortDayMonthYear' => ({
            required Object month,
            required Object day,
            required Object year,
          }) => '${month} ${day}, ${year}',
          'history.shortMonthYear' => ({
            required Object month,
            required Object year,
          }) => '${month} ${year}',
          'history.shortDayMonth' => ({
            required Object month,
            required Object day,
          }) => '${month} ${day}',
          'history.milestoneNewTitle' => 'New milestone',
          'history.milestoneDetailTitle' => 'Milestone details',
          'history.milestoneDefaultHighlight' => 'together',
          'history.milestoneTitleLabel' => 'What happened',
          'history.milestoneTitleHint' => 'E.g. First trip together',
          'history.milestoneTitleErrors.empty' => 'Say what happened',
          'history.milestoneTitleErrors.tooLong' => 'The title is too long',
          'history.milestonePlaceLabel' => 'Place (optional)',
          'history.milestonePlaceHint' => 'E.g. Paraty',
          'history.milestonePlaceErrors.tooLong' => 'The place is too long',
          'history.milestoneBodyHint' => 'A note about this moment (optional)',
          'history.milestoneBodyErrors.tooLong' => 'The note is too long',
          'history.milestoneKindLabel' => 'Milestone kind',
          'history.kindFirst' => 'First time',
          'history.kindTrip' => 'Trip',
          'history.kindHome' => 'Moved in together',
          'history.kindCustom' => 'Milestone',
          'history.unknownDateToggle' => 'Unknown date',
          'history.precisionDay' => 'Exact day',
          'history.precisionMonth' => 'Month and year',
          'history.precisionYear' => 'Year only',
          'history.dateRowLabel' => 'Date',
          'history.addedByRowLabel' => 'Added by',
          'history.addedByYou' => 'You',
          'history.visibilityRowLabel' => 'Who sees it',
          'history.visibilityBoth' => 'Both',
          'history.visibilityOnlyYou' => 'Only you',
          'history.deleteMilestone' => 'Delete',
          'history.deleteMilestoneTitle' => 'Delete this milestone?',
          'history.deleteMilestoneTextShared' => 'It will be removed from both of your stories.',
          'history.deleteMilestoneTextPrivate' => 'It will be removed from your story.',
          'history.deleteMilestoneConfirm' => 'Delete',
          'history.saveMilestone' => 'Save',
          'history.storyDatesTitle' => 'Dates of our story',
          'history.storyMet' => 'We met',
          'history.storyDating' => 'Started dating',
          'history.storyEngaged' => 'Got engaged',
          'history.storyMarried' => 'Got married',
          'history.storyAdd' => 'Add',
          'history.storyDateAddedBy' => ({required Object name}) => 'Added by ${name}',
          'history.storyDatesNote' => 'Everything is optional. The start date feeds the counter.',
          'history.variationsTitle' => 'How the counter looks',
          'history.variationDating' => 'Dating',
          'history.variationEngaged' => 'Engaged',
          'history.variationMarried' => 'Married',
          'history.variationBeginning' => 'Starting out',
          'history.variationLongDistance' => 'Long distance',
          'history.variationsPreviewNote' => 'Style preview. The time shown is your real total; per-phase counts need their own dates.',
          'history.avatarHeadline' => 'How do you appear?',
          'history.avatarHighlight' => 'appear',
          'history.avatarInitials' => 'Initials',
          'history.avatarInitialsNote' => 'Your avatar uses your initials.',
          'history.avatarNote' =>
            'Each person chooses their own. The app never pulls the other\'s photo.',
          'history.avatarContinue' => 'Continue',
          'history.numbersTitle' => 'In numbers',
          'history.numbersHeroDays' => ({required Object days}) => '${days} days',
          'history.numbersHeroEmpty' => 'In your own time',
          'history.numbersHeroEmptySub' => 'Set a start date whenever you want to track the days.',
          'history.numbersWeekends' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'weekend together',
                  other: 'weekends together',
                ),
          'history.numbersFullMoons' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'full moon',
                  other: 'full moons',
                ),
          'history.numbersChristmases' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Christmas together',
                  other: 'Christmases together',
                ),
          'history.numbersNextAnniversary' =>
            ({required num years, required Object suffix}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  years,
                  one: 'until ${years} year ${suffix}',
                  other: 'until ${years} years ${suffix}',
                ),
          'history.numbersSuffixDating' => 'dating',
          'history.numbersSuffixEngaged' => 'engaged',
          'history.numbersSuffixMarried' => 'married',
          'history.numbersSuffixTogether' => 'together',
          'history.numbersMonthsCount' =>
            ({required num months}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  months,
                  one: '${months} month',
                  other: '${months} months',
                ),
          'history.numbersDaysCount' =>
            ({required num days}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  days,
                  one: '${days} day',
                  other: '${days} days',
                ),
          'history.numbersPlacesSection' => 'PLACES THAT MATTERED',
          'history.numbersYearSection' => ({required Object year}) => 'YOUR YEAR (${year})',
          'history.numbersYearNote' => 'Only your own records this year.',
          'history.numbersFirstsCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'first time',
                  other: 'first times',
                ),
          'history.differentHeadline' => 'The dates differ',
          'history.differentHighlight' => 'differ',
          'history.differentSubtitle' => ({
            required Object partner,
          }) => 'You and ${partner} chose different start dates.',
          'history.differentYourDate' => 'Your date',
          'history.differentPartnerDate' => ({required Object partner}) => '${partner}\'s date',
          'history.differentNote' => 'Each sees their own. Nothing is changed without both.',
          'history.differentNoDates' => 'There are no start dates to compare yet.',
          'history.differentContinue' => 'Continue',
          'history.partnerFallback' => 'your partner',
          'history.errorTitle' => 'Couldn\'t load',
          'history.errorText' => 'Your story is still saved. Try again.',
          'history.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'history.errors.NOT_OWNER' => 'Only its author can edit or delete it.',
          'history.errors.other' => 'Couldn\'t do that right now. Try again.',
          'history.numbersMemoriesCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'saved memory',
                  other: 'saved memories',
                ),
          'history.numbersMemoriesRecent' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'recent memory',
                  other: 'recent memories',
                ),
          'history.numbersPlaces' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'place',
                  other: 'places',
                ),
          'history.readOnlyMilestone' =>
            'This milestone was added by someone else. Only its author can edit it.',
          'history.readOnlyMilestoneBy' => ({
            required Object name,
          }) => 'Added by ${name}. Only its author can edit it.',
          'ideaDetail.label' => 'Idea of the day',
          'ideaDetail.whyTitle' => 'Why this idea',
          'ideaDetail.yourPhase' => 'Your phase',
          'ideaDetail.yourGoal' => 'Your goal',
          'ideaDetail.willDo' => 'I will do it',
          'ideaDetail.done' => 'Noted. Nice!',
          'ideaDetail.another' => 'Another idea',
          'ideaDetail.later' => 'Later',
          'ideaDetail.laterTitle' => 'When should we remind you?',
          'ideaDetail.tonight' => 'Tonight',
          'ideaDetail.tomorrow' => 'Tomorrow morning',
          'ideaDetail.weekend' => 'This weekend',
          'ideaDetail.reminderSet' => 'Done. We will remind you with a gentle nudge.',
          'ideaDetail.reminderSetNotificationsOff' =>
            'Reminder saved. Turn notifications on in settings to receive it.',
          'ideaDetail.reminderError' => 'Could not save the reminder. Try again.',
          'ideaDetail.emptyTitle' => 'No ideas right now',
          'ideaDetail.emptyText' => 'Come back later. In the meantime, note a slip.',
          'ideaDetail.errorTitle' => 'Could not load the idea',
          'ideaDetail.errorText' => 'Try again in a moment.',
          'intro.skip' => 'Skip',
          'intro.continueButton' => 'Continue',
          'intro.phase.title' => 'Where are you two right now?',
          'intro.phase.titleHighlight' => 'right now',
          _ => null,
        } ??
        switch (path) {
          'intro.phase.subtitle' => 'Pick the closest one. You can change it later.',
          'intro.phase.options.dating' => 'Dating',
          'intro.phase.options.living_together' => 'Living together',
          'intro.phase.options.engaged' => 'Engaged',
          'intro.phase.options.married' => 'Married',
          'intro.phase.options.with_kids' => 'With kids',
          'intro.phase.options.long_distance' => 'Long distance',
          'intro.phase.options.with_parents' => 'Living with parents',
          'intro.phase.options.restarting' => 'Starting over',
          'intro.phase.options.other' => '',
          'intro.goals.title' => 'What do you want from the app?',
          'intro.goals.titleHighlight' => 'app',
          'intro.goals.subtitle' => 'Pick as many as you like.',
          'intro.goals.options.reconnect' => 'Reconnect',
          'intro.goals.options.fight_less' => 'Fight less',
          'intro.goals.options.keep_romance' => 'Keep the romance',
          'intro.goals.options.remember_dates' => 'Remember dates',
          'intro.goals.options.organize_routine' => 'Organise the routine',
          'intro.goals.options.just_record' => 'Just note the good things',
          'intro.goals.options.other' => '',
          'intro.theme.title' => 'Which colour suits you?',
          'intro.theme.titleHighlight' => 'colour',
          'intro.theme.subtitle' =>
            'You pick the colour, not the gender. The features are the same.',
          'intro.theme.rose' => 'Soft rose',
          'intro.theme.roseSupport' => 'Delicate and warm',
          'intro.theme.blue' => 'Soft blue',
          'intro.theme.blueSupport' => 'Calm and light',
          'intro.theme.neutral' => 'Neutral',
          'intro.theme.neutralSupport' => 'Paper and green',
          'intro.theme.footnote' => 'You can change it later in Settings, Appearance.',
          'invite.title' => ({required Object name}) => 'Invite ${name}',
          'invite.titleNoName' => 'Invite your person',
          'invite.messageIntro' => 'This message will be sent:',
          'invite.message' => ({
            required Object code,
          }) => 'I started something small for us. To connect in the app, use the code ${code}.',
          'invite.expiryNote' => ({
            required Object days,
          }) => 'The invite is valid for ${days} days. Only the latest invite you create works.',
          'invite.share' => 'Share invite',
          'invite.copy' => 'Copy invite',
          'invite.sentTitle' => 'Invite sent',
          'invite.sentHighlight' => 'sent',
          'invite.sentText' => ({
            required Object name,
          }) => '${name} has not joined yet. In the meantime you can use the app on your own.',
          'invite.sentTextNoName' =>
            'Your person has not joined yet. In the meantime you can use the app on your own.',
          'invite.resend' => 'Send again',
          'invite.revoke' => 'Revoke',
          'invite.errorTitle' => 'Could not create the invite',
          'invite.errors.ALREADY_PAIRED' => 'You are already connected with someone.',
          'invite.errors.RATE_LIMITED' => 'You created too many invites today. Try again tomorrow.',
          'invite.errors.NETWORK' => 'No connection. Check your internet and try again.',
          'invite.errors.other' => 'Something went wrong. Try again.',
          'language.language' => 'Language',
          'language.languagePortuguese' => 'Portuguese (Brazil)',
          'language.languageEnglish' => 'English',
          'language.comingSoon' => 'Coming soon',
          'language.languageNote' => 'English is finished later.',
          'language.saveError' => 'Could not save. Try again.',
          'learned.title' => 'What I learned',
          'learned.intro' => 'Things you chose to keep from the conversation. Only you see them.',
          'learned.pendingTitle' => 'To review',
          'learned.confirmedTitle' => 'Confirmed',
          'learned.targets.partnerFact' => 'About my partner',
          'learned.targets.date' => 'A date',
          'learned.targets.memory' => 'A memory',
          'learned.targets.commitment' => 'A promise',
          'learned.confirm' => 'Confirm',
          'learned.edit' => 'Edit',
          'learned.discard' => 'Discard',
          'learned.confirmTitle' => 'Confirm this learning?',
          'learned.confirmText' => 'It will show in What I learned. Only you see it.',
          'learned.discardTitle' => 'Discard this learning?',
          'learned.discardText' => 'It will not be saved.',
          'learned.discardConfirm' => 'Discard',
          'learned.editTitle' => 'Edit learning',
          'learned.editHint' => 'What you want to keep',
          'learned.textErrors.empty' => 'Write what you want to keep',
          'learned.textErrors.tooLong' => 'This is too long',
          'learned.save' => 'Save',
          'learned.partnerFactLabel' => 'From the conversation',
          'learned.updated' => 'Learning updated',
          'learned.emptyTitle' => 'Nothing kept yet',
          'learned.emptyText' =>
            'When you want, save a reply from the conversation to remember it later.',
          'learned.errorTitle' => 'Couldn\'t load',
          'learned.errorText' => 'Try again in a moment.',
          'learned.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'learned.errors.other' => 'Couldn\'t do that right now. Try again.',
          'lists.title' => 'Lists',
          'lists.subtitle' => 'Trips, places and films, shared or just for you.',
          'lists.newList' => 'New list',
          'lists.createTitle' => 'New list',
          'lists.titleLabel' => 'Name',
          'lists.titleHint' => 'E.g. Trips of our dreams',
          'lists.titleErrors.empty' => 'Give the list a name.',
          'lists.titleErrors.tooLong' => 'Use at most 80 characters.',
          'lists.kindLabel' => 'Type',
          'lists.visibilityLabel' => 'Who can see it',
          'lists.sharedHint' => 'You both can see and change this list.',
          'lists.privateHint' => 'Only you can see this list.',
          'lists.kinds.travel' => 'Travel',
          'lists.kinds.restaurants' => 'Restaurants',
          'lists.kinds.movies' => 'Movies',
          'lists.kinds.custom' => 'Other',
          'lists.kinds.other' => '',
          'lists.shared' => 'Shared',
          'lists.private' => 'Private',
          'lists.emptyTitle' => 'No lists yet',
          'lists.emptyTextShared' => 'Start a list of things you want to do together.',
          'lists.emptyTextPrivate' => 'Start a list of things you want to keep for yourself.',
          'lists.create' => 'Create list',
          'lists.rename' => 'Rename',
          'lists.delete' => 'Delete',
          'lists.renameTitle' => 'Rename list',
          'lists.save' => 'Save',
          'lists.deleteTitle' => 'Delete list?',
          'lists.deleteTextShared' => 'The list and everything in it will be gone for both of you.',
          'lists.deleteTextPrivate' => 'The list and everything in it will be gone for good.',
          'lists.deleteConfirm' => 'Delete',
          'lists.itemDeleteTitle' => 'Delete item?',
          'lists.itemDeleteTextShared' => 'This item will be gone for both of you.',
          'lists.itemDeleteTextPrivate' => 'This item will be gone for good.',
          'lists.itemDeleteConfirm' => 'Delete item',
          'lists.makePrivate' => 'Make private',
          'lists.shareWithPartner' => 'Share with your partner',
          'lists.addItem' => 'Add item',
          'lists.itemHint' => 'E.g. Lisbon',
          'lists.itemTitleErrors.empty' => 'Type the item name.',
          'lists.itemTitleErrors.tooLong' => 'Use at most 160 characters.',
          'lists.add' => 'Add',
          'lists.itemEmptyTitle' => 'Nothing here yet',
          'lists.itemEmptyTextShared' => 'Add the first thing you want to do together.',
          'lists.itemEmptyTextPrivate' => 'Add the first thing to this list.',
          'lists.statuses.dream' => 'Dream',
          'lists.statuses.planned' => 'Planned',
          'lists.statuses.done' => 'Done',
          'lists.statuses.other' => '',
          'lists.markDream' => 'Back to dreams',
          'lists.markPlanned' => 'Mark as planned',
          'lists.markDone' => 'Mark as done',
          'lists.moveUp' => 'Move up',
          'lists.moveDown' => 'Move down',
          'lists.itemOptions' => 'Item options',
          'lists.listOptions' => 'List options',
          'lists.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'lists.errors.other' => 'Couldn\'t do that right now. Try again.',
          'logistics.title' => 'Logistics',
          'logistics.subtitle' => 'The practical things, with nobody carrying them alone.',
          'logistics.hint' => 'E.g. call the plumber',
          'logistics.add' => 'Add',
          'logistics.me' => 'Me',
          'logistics.partner' => 'My partner',
          'logistics.both' => 'Both of us',
          'logistics.assignMe' => 'I\'ll take it',
          'logistics.delete' => 'Delete',
          'logistics.doneTitle' => 'Done',
          'logistics.emptyTitle' => 'Nothing here',
          'logistics.emptyText' => 'Add something practical you need to sort out.',
          'logistics.errorTitle' => 'Couldn\'t load',
          'logistics.errorText' => 'The list is still saved. Try again.',
          'logistics.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'logistics.errors.other' => 'Couldn\'t do that right now. Try again.',
          'loveStyle.entryLabel' => 'ONLY FOR YOU',
          'loveStyle.entryTitle' => 'What makes me feel loved',
          'loveStyle.entryText' => 'Six quick questions to notice what makes you feel loved.',
          'loveStyle.exerciseTitle' => 'How I feel loved',
          'loveStyle.exerciseHighlight' => 'loved',
          'loveStyle.exerciseSubtitle' => 'Six quick questions, just for you.',
          'loveStyle.questionOf' => ({
            required Object current,
            required Object total,
          }) => 'Question ${current} of ${total}',
          'loveStyle.questions.0' => 'What makes you feel loved the most?',
          'loveStyle.questions.1' => 'On a hard day, what comforts you the most?',
          'loveStyle.questions.2' => 'What do you notice first when your partner shows care?',
          'loveStyle.questions.3' => 'Which of these gestures warms your heart?',
          'loveStyle.questions.4' => 'What makes you feel important to someone?',
          'loveStyle.questions.5' => 'If you could choose one gesture for today, what would it be?',
          'loveStyle.options1.time' => 'Spending unhurried time together.',
          'loveStyle.options1.words' => 'Hearing that I matter.',
          'loveStyle.options1.acts' => 'Seeing the person help me with something.',
          'loveStyle.options1.gifts' => 'Getting a small gift for no reason.',
          'loveStyle.options1.touch' => 'A long hug.',
          'loveStyle.options1.other' => '',
          'loveStyle.options2.time' => 'Having someone nearby, with no rush to fix it.',
          'loveStyle.options2.words' => 'A message saying I\'m on their mind.',
          'loveStyle.options2.acts' => 'Someone taking a task off my hands.',
          'loveStyle.options2.gifts' => 'A small care that arrived by surprise.',
          'loveStyle.options2.touch' => 'A tight hug.',
          'loveStyle.options2.other' => '',
          'loveStyle.options3.time' => 'When the person puts the phone down to be with me.',
          'loveStyle.options3.words' => 'When the person praises something I did.',
          'loveStyle.options3.acts' => 'When the person notices what I need and does it.',
          'loveStyle.options3.gifts' => 'When the person remembers something I like.',
          'loveStyle.options3.touch' => 'When the person touches me lightly as they pass.',
          'loveStyle.options3.other' => '',
          'loveStyle.options4.time' => 'A quiet date, just the two of us.',
          'loveStyle.options4.words' => 'A conversation where I feel heard.',
          'loveStyle.options4.acts' => 'A small help with a task.',
          'loveStyle.options4.gifts' => 'A simple gift that has to do with me.',
          'loveStyle.options4.touch' => 'A caress on my hair or hand.',
          'loveStyle.options4.other' => '',
          'loveStyle.options5.time' => 'When someone chooses to spend time with me.',
          'loveStyle.options5.words' => 'When someone acknowledges what I do.',
          'loveStyle.options5.acts' => 'When someone makes my day easier.',
          'loveStyle.options5.gifts' => 'When someone remembers me with a detail.',
          'loveStyle.options5.touch' => 'When someone hugs me without needing to speak.',
          'loveStyle.options5.other' => '',
          'loveStyle.options6.time' => 'Saving a free evening for us.',
          'loveStyle.options6.words' => 'Writing a loving note.',
          'loveStyle.options6.acts' => 'Tackling a boring task together.',
          'loveStyle.options6.gifts' => 'Picking a small gift.',
          'loveStyle.options6.touch' => 'Holding hands.',
          'loveStyle.options6.other' => '',
          'loveStyle.continueAction' => 'Next',
          'loveStyle.finishAction' => 'See result',
          'loveStyle.back' => 'Back',
          'loveStyle.privateNote' =>
            'Only you see your answers. You choose whether to show the result.',
          'loveStyle.resultTitle' => 'What makes you feel loved',
          'loveStyle.resultHighlight' => 'loved',
          'loveStyle.resultSubtitle' =>
            'A description of what makes you feel loved, in your own way.',
          'loveStyle.topTag' => 'What fits you best',
          'loveStyle.descriptions.time' => 'You feel loved when you have real time with someone you care about: unhurried, no screens, just presence.',
          'loveStyle.descriptions.words' =>
            'You feel loved when you hear, honestly, what the other person feels for you.',
          'loveStyle.descriptions.acts' =>
            'You feel loved when someone notices what you need and helps without being asked.',
          'loveStyle.descriptions.gifts' =>
            'You feel loved when someone remembers you in a small detail, chosen with care.',
          'loveStyle.descriptions.touch' =>
            'You feel loved when a hug, a held hand or a caress says what words cannot.',
          'loveStyle.descriptions.other' => '',
          'loveStyle.shareDescriptions.time' =>
            'I feel loved when we spend unhurried time together, with no screens.',
          'loveStyle.shareDescriptions.words' =>
            'I feel loved when I hear, honestly, what you feel for me.',
          'loveStyle.shareDescriptions.acts' =>
            'I feel loved when you notice what I need and help without me asking.',
          'loveStyle.shareDescriptions.gifts' =>
            'I feel loved when you remember me in a small detail, chosen with care.',
          'loveStyle.shareDescriptions.touch' =>
            'I feel loved when a hug, a held hand or a caress says what words cannot.',
          'loveStyle.shareDescriptions.other' => '',
          'loveStyle.resultPrivacyNote' => 'Saved only for you. Showing it on your partner\'s widget is your choice, and you can undo it.',
          'loveStyle.saveManualAction' => 'Save to My manual',
          'loveStyle.savedManualAction' => 'Saved to My manual',
          'loveStyle.manualToast' => 'Saved to My manual.',
          'loveStyle.shareAction' => ({required Object name}) => 'Show ${name}',
          'loveStyle.revokeAction' => 'Remove from their widget',
          'loveStyle.shareToast' => 'It appears on their widget if they allow notes.',
          'loveStyle.revokeToast' => 'It\'s no longer on their widget.',
          'loveStyle.shareSoloNote' =>
            'When you\'re connected with a partner, you can show this on their widget.',
          'loveStyle.partnerFallback' => 'your partner',
          'loveStyle.pairingErrorNote' => 'Couldn\'t check your partner right now.',
          'loveStyle.retryPairing' => 'Try again',
          'loveStyle.retake' => 'Take it again',
          'loveStyle.loadErrorTitle' => 'Couldn\'t load',
          'loveStyle.loadErrorText' => 'Couldn\'t open your result right now. Try again.',
          'loveStyle.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'loveStyle.errors.other' => 'Couldn\'t save right now. Your answers are still here.',
          'loveStyle.manualErrors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'loveStyle.manualErrors.other' => 'Couldn\'t save to My manual right now. Try again.',
          'loveStyle.shareErrors.NOT_PAIRED' => 'You don\'t have a connected partner yet.',
          'loveStyle.shareErrors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'loveStyle.shareErrors.other' => 'Couldn\'t show it right now. Try again.',
          'loveStyle.revokeErrors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'loveStyle.revokeErrors.other' =>
            'Couldn\'t remove it from their widget right now. Try again.',
          'memories.title' => 'Memories',
          'memories.historyLabel' => 'OUR HISTORY',
          'memories.historyTitle' => 'Our history',
          'memories.historyText' => 'Milestones, dates, places and our story in numbers.',
          'memories.storyLabel' => 'SHARE',
          'memories.storyTitle' => 'Image to share',
          'memories.storyText' => 'Your numbers in an image, with only what you choose.',
          'memories.placesLabel' => 'PLACES',
          'memories.placesTitle' => 'Places you have been',
          'memories.placesText' => 'Only the name of the place, never the location.',
          'memories.placeLabel' => 'Place (optional)',
          'memories.placeHint' => 'E.g. Lisbon',
          'memories.placeAddressNote' =>
            'Prefer just the name of the place, with no address or number.',
          'memories.segmentTimeline' => 'Timeline',
          'memories.segmentJar' => 'Jar',
          'memories.jarEmpty' => 'When a slip feels good, keep it in the jar from its details.',
          'memories.jarAnother' => 'Another',
          'memories.jarClose' => 'Close',
          'memories.titleLabel' => 'A memory',
          'memories.titleHint' => 'E.g. our first dinner',
          'memories.titleErrors.empty' => 'Give this memory a title',
          'memories.titleErrors.tooLong' => 'The title is too long',
          'memories.placeErrors.tooLong' => 'The place is too long',
          'memories.bodyErrors.tooLong' => 'The note is too long',
          'memories.bodyHint' => 'Tell how it went (optional)',
          'memories.add' => 'Add a memory',
          'memories.save' => 'Save memory',
          'memories.delete' => 'Delete',
          'memories.deleteTitle' => 'Delete this memory?',
          'memories.deleteText' => 'It disappears from the timeline for both of you.',
          'memories.deleteConfirm' => 'Delete',
          'memories.detailPlace' => 'Place',
          'memories.detailBody' => 'How it went',
          'memories.monthsShort.0' => 'Jan',
          'memories.monthsShort.1' => 'Feb',
          'memories.monthsShort.2' => 'Mar',
          'memories.monthsShort.3' => 'Apr',
          'memories.monthsShort.4' => 'May',
          'memories.monthsShort.5' => 'Jun',
          'memories.monthsShort.6' => 'Jul',
          'memories.monthsShort.7' => 'Aug',
          'memories.monthsShort.8' => 'Sep',
          'memories.monthsShort.9' => 'Oct',
          'memories.monthsShort.10' => 'Nov',
          'memories.monthsShort.11' => 'Dec',
          'memories.dateLine' => ({
            required Object month,
            required Object day,
            required Object year,
          }) => '${month} ${day}, ${year}',
          'memories.emptyTitle' => 'No memories yet',
          'memories.emptyText' => 'Keep moments you want to look back on.',
          'memories.errorTitle' => 'Couldn\'t load',
          'memories.errorText' => 'Your memories are still saved. Try again.',
          'memories.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'memories.errors.other' => 'Couldn\'t do that right now. Your text is still here.',
          'memories.jarEmptyTitle' => 'The jar is empty',
          'memories.jarEmptyAction' => 'See my slips',
          'memories.moreTitle' => 'More',
          'mood.title' => 'How are you today?',
          'mood.titleHighlight' => 'today',
          'mood.subtitle' => 'One tap. The “I need…” tag is optional.',
          'mood.privateCue' => 'Only you see this',
          'mood.moods.happy' => 'Happy',
          'mood.moods.tired' => 'Tired',
          'mood.moods.sad' => 'Sad',
          'mood.moods.stressed' => 'Stressed',
          'mood.moods.loving' => 'Loving',
          'mood.moods.playful' => 'Playful',
          'mood.needTitle' => 'I need…',
          'mood.needs.listen' => 'To be heard',
          'mood.needs.opinion' => 'An opinion',
          'mood.needs.hug' => 'A hug',
          'mood.needs.space' => 'Some space',
          'mood.shareTitle' => 'What your partner sees',
          'mood.shareTitleNamed' => ({required Object name}) => 'What ${name} sees',
          'mood.shareSubtitle' => 'You decide. Nothing is shared by default.',
          'mood.share.none' => 'Keep private',
          'mood.share.mood' => 'Just my mood',
          'mood.share.mood_need' => 'Mood and what I need',
          'mood.shareSupport.none' => 'Nothing is shared.',
          'mood.shareSupport.mood' => 'Your partner sees the mood only.',
          'mood.shareSupport.mood_need' => 'Your partner sees the mood and the need.',
          'mood.privacyNote' =>
            'Nothing is shared by default. Your partner never sees a chart or a score.',
          'mood.save' => 'Save',
          'mood.saved' => 'Mood saved',
          'mood.errors.NETWORK' => 'Couldn\'t save your mood. Check your connection and try again.',
          'mood.errors.TIMEOUT' => 'Couldn\'t save your mood in time. Try again.',
          'mood.errors.other' => 'Couldn\'t save your mood. Try again.',
          'mood.entryCategory' => 'Mood of the day',
          'mood.entryTitle' => 'How are you today?',
          'mood.entryText' => 'One tap. Only you see it until you share.',
          'mood.partnerLabel' => 'Your partner\'s mood',
          'mood.partnerFallback' => 'Your partner',
          'mood.partnerHappy' => ({required Object name}) => '${name} is happy today',
          'mood.partnerTired' => ({required Object name}) => '${name} is out of energy today',
          'mood.partnerSad' => ({required Object name}) => '${name} is feeling low today',
          'mood.partnerStressed' => ({
            required Object name,
          }) => '${name} has a lot on their mind today',
          'mood.partnerLoving' => ({required Object name}) => '${name} is feeling tender today',
          'mood.partnerPlayful' => ({required Object name}) => '${name} is in a playful mood today',
          'mood.partnerNeedListen' => 'What helps: just listening.',
          'mood.partnerNeedOpinion' => 'What helps: an opinion.',
          'mood.partnerNeedHug' => 'What helps: a hug.',
          'mood.partnerNeedSpace' => 'What helps: some space.',
          'mood.homeTitle' => 'How are you?',
          'mood.homePrivacy' => 'Only you see it',
          'mood.homeMoods.happy' => 'Good',
          'mood.homeMoods.loving' => 'Loving',
          'mood.homeMoods.tired' => 'Tired',
          'mood.homeMoods.stressed' => 'Tense',
          'mood.homeMoods.sad' => 'Sad',
          'need.title' => 'I need…',
          'need.titleHighlight' => 'need',
          'need.subtitle' => 'Pick one thing. Your partner gets a gentle note, no pressure.',
          'need.options.hug' => 'A hug',
          'need.options.talk' => 'To talk',
          'need.options.help_home' => 'Help at home',
          'need.options.quiet' => 'Some quiet time',
          'need.options.time_together' => 'Time together',
          'need.options.rest' => 'To rest',
          'need.options.other' => '',
          'need.note' => 'It\'s not a demand. It\'s just a simple way to ask.',
          'need.send' => 'Send',
          'need.sent.title' => 'Sent',
          'need.sent.text' => 'Your partner will see it when they open the app.',
          'need.sent.done' => 'Done',
          'need.errors.NOT_PAIRED' =>
            'To send this, you need to be connected with your partner in the app.',
          'need.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'need.errors.other' => 'Couldn\'t send right now. Try again.',
          'notFound.title' => '404',
          'notFound.description' => 'Page not found',
          'notFound.buttonBack' => 'Go back home',
          'notes.title' => 'A note or a drawing',
          'notes.intro' =>
            'A short note for your partner, or a drawing that stays in your sent list.',
          'notes.kinds.0' => 'Note',
          'notes.kinds.1' => 'Drawing',
          'notes.noteHint' => 'E.g. good luck at today\'s meeting',
          'notes.textErrors.empty' => 'Write the note first',
          'notes.textErrors.tooLong' => 'This note is too long',
          'notes.canvasLabel' => 'Drawing area',
          'notes.pens.0' => 'Black',
          'notes.pens.1' => 'Orange',
          'notes.pens.2' => 'Purple',
          'notes.pens.3' => 'Green',
          'notes.eraser' => 'Eraser',
          'notes.undo' => 'Undo',
          'notes.clear' => 'Clear',
          'notes.emptyDrawing' => 'Draw something to be able to send it.',
          'notes.widgetLabel' => 'Send to the widget',
          'notes.widgetText' => 'It appears on their widget if they allow notes.',
          'notes.drawingHint' =>
            'Drawings stay in your sent list. Widget notes are text-only for now.',
          'notes.unpairedTitle' => 'Connect with your partner',
          'notes.unpairedText' =>
            'You need to be connected with your partner to send a note or drawing.',
          'notes.send' => 'Send',
          'notes.sent' => 'Sent',
          'notes.sentTitle' => 'Sent by you',
          'notes.justNow' => 'Just now',
          'notes.minutesAgo' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 min ago',
                  other: '${count} min ago',
                ),
          'notes.hoursAgo' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 h ago',
                  other: '${count} h ago',
                ),
          'notes.daysAgo' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 day ago',
                  other: '${count} days ago',
                ),
          'notes.drawingAlt' => 'Drawing',
          'notes.delete' => 'Delete',
          'notes.deleteConfirmTitle' => 'Delete this?',
          'notes.deleteConfirmText' =>
            'It leaves your sent list. Notes also leave your partner\'s widget.',
          'notes.deleteConfirm' => 'Delete now',
          'notes.deleted' => 'Deleted',
          'notes.deleteError' => 'Couldn\'t delete right now. Try again.',
          'notes.emptyTitle' => 'Nothing sent yet',
          'notes.emptyText' => 'When you send a note or a drawing, it shows up here.',
          'notes.errorTitle' => 'Couldn\'t load',
          'notes.errorText' => 'Try again in a moment.',
          'notes.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'notes.errors.NOT_PAIRED' =>
            'To send this, you need to be connected with your partner in the app.',
          'notes.errors.other' => 'Couldn\'t send right now. What you wrote is still here.',
          'notificationPermission.label' => 'Reminders',
          'notificationPermission.title' => 'Gentle reminders?',
          'notificationPermission.titleHighlight' => 'Gentle',
          'notificationPermission.pointLimit' => 'At most 1 or 2 a day.',
          'notificationPermission.pointPrivate' => 'They never show names on the lock screen.',
          'notificationPermission.pointChoice' => 'You choose what arrives and when.',
          'notificationPermission.changeLater' => 'You can change this whenever you like.',
          'notificationPermission.notNow' => 'Not now',
          'notificationPermission.allow' => 'Allow',
          'notificationPermission.offBanner' => 'Reminders are off. Turn them on in settings.',
          'notificationPermission.close' => 'Close',
          'notificationPreferences.title' => 'Notifications',
          'notificationPreferences.subtitle' => 'Choose what arrives and when. No pressure.',
          'notificationPreferences.systemOff' =>
            'Notifications are off on this phone. Your choices apply once you turn them on.',
          'notificationPreferences.openSystem' => 'Open settings',
          'notificationPreferences.all' => 'Receive notifications',
          'notificationPreferences.allText' => 'Turn off to pause everything.',
          'notificationPreferences.typesTitle' => 'What you want to receive',
          'notificationPreferences.types.card_ready' => 'Card ready',
          'notificationPreferences.types.card_received' => 'Card received',
          'notificationPreferences.types.card_reaction' => 'Reply to your card',
          'notificationPreferences.types.daily_idea' => 'Idea of the day',
          'notificationPreferences.types.date_coming' => 'Dates coming up',
          'notificationPreferences.types.other' => '',
          'notificationPreferences.cardTitle' => 'Sunday card',
          'notificationPreferences.cardDay' => 'Day',
          'notificationPreferences.cardHour' => 'Time',
          'notificationPreferences.days.0' => 'Sunday',
          'notificationPreferences.days.1' => 'Monday',
          'notificationPreferences.days.2' => 'Tuesday',
          'notificationPreferences.days.3' => 'Wednesday',
          'notificationPreferences.days.4' => 'Thursday',
          'notificationPreferences.days.5' => 'Friday',
          'notificationPreferences.days.6' => 'Saturday',
          'notificationPreferences.hourFormat' => ({required Object hour}) => '${hour}:00',
          'notificationPreferences.previewTitle' => 'How a notification looks',
          'notificationPreferences.previewText' => 'Always short, with no personal details.',
          'notificationPreferences.loadErrorTitle' => 'Couldn\'t open your preferences',
          'notificationPreferences.loadErrorText' => 'They are still saved. Try again.',
          'notificationPreferences.errors.RATE_LIMITED' =>
            'Too many attempts in a row. Wait a moment.',
          'notificationPreferences.errors.other' =>
            'Couldn\'t save right now. Your previous choice was kept.',
          'partnerProfile.title' => 'About your partner',
          'partnerProfile.privateNote' => 'Only you see these notes. They never show in notifications, widgets or to your partner.',
          'partnerProfile.categories.likes' => 'Likes',
          'partnerProfile.categories.dislikes' => 'Dislikes',
          'partnerProfile.categories.sizes' => 'Sizes',
          'partnerProfile.categories.health' => 'Health',
          'partnerProfile.categories.comfort' => 'Comfort',
          'partnerProfile.categories.people' => 'People',
          'partnerProfile.categories.other' => 'Other',
          'partnerProfile.labelLabel' => 'Topic',
          'partnerProfile.labelHint' => 'E.g. coffee',
          'partnerProfile.labelErrors.empty' => 'Give the note a topic.',
          'partnerProfile.labelErrors.tooLong' => 'Use at most 80 characters.',
          'partnerProfile.valueHint' => 'E.g. no sugar, very hot',
          'partnerProfile.valueErrors.empty' => 'Write what you want to remember.',
          'partnerProfile.valueErrors.tooLong' => 'Use at most 500 characters.',
          'partnerProfile.save' => 'Save note',
          'partnerProfile.delete' => 'Delete',
          'partnerProfile.emptyTitle' => 'No notes yet',
          'partnerProfile.emptyText' => 'Small details help you pick a gift or a gesture.',
          'partnerProfile.errorTitle' => 'Couldn\'t load',
          'partnerProfile.errorText' => 'Your notes are still saved. Try again.',
          'partnerProfile.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'partnerProfile.errors.other' => 'Couldn\'t do that right now. Your text is still here.',
          'partnerStep.title' => 'Want to bring your partner?',
          'partnerStep.titleHighlight' => 'partner',
          'partnerStep.subtitle' => 'The app works on your own. Invite whenever you want.',
          'partnerStep.inviteTitle' => 'Send an invite',
          'partnerStep.inviteSupport' => 'Your person joins with a code',
          'partnerStep.aloneTitle' => 'Start on my own for now',
          'partnerStep.aloneSupport' => 'Your slips stay with you only',
          'partnerStep.haveCode' => 'I have an invite code',
          'partnerStep.continueButton' => 'Continue',
          'pause.title' => 'Ask for some space',
          'pause.titleHighlight' => 'space',
          'pause.subtitle' => 'A short, kind message. Your partner sees only what you write.',
          'pause.presets.space' => 'I need some time to breathe. I\'ll be back soon.',
          'pause.presets.later' => 'Can we talk later, calmly?',
          'pause.presets.calm' => 'I want to listen well. I need to calm down first.',
          'pause.presets.other' => '',
          'pause.hint' => 'Write my own',
          'pause.messageErrors.empty' => 'Write a short message',
          'pause.messageErrors.tooLong' => 'The message is too long',
          'pause.returnTitle' => 'I\'ll be back in',
          'pause.returns.oneHour' => '1 hour',
          'pause.returns.threeHours' => '3 hours',
          'pause.returns.eightHours' => '8 hours',
          'pause.returns.tomorrow' => 'Tomorrow',
          'pause.returns.other' => '',
          'pause.note' => 'You both see Today on pause. You can come back whenever you like.',
          'pause.send' => 'Send and pause',
          _ => null,
        } ??
        switch (path) {
          'pause.sentTitle' => 'Pause sent',
          'pause.sentText' =>
            'Today is on pause for both of you. When you\'re ready, come back there.',
          'pause.done' => 'Done',
          'pause.errors.INVALID_RETURN_TIME' => 'That return time doesn\'t work. Pick another.',
          'pause.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'pause.errors.other' => 'Couldn\'t send right now. Your message is still here.',
          'places.title' => 'Places',
          'places.privacyNote' =>
            'Only the name of the place. The app never reads or stores your location.',
          'places.memoryOne' => '1 memory',
          'places.memoryMany' => ({required Object count}) => '${count} memories',
          'places.monthsShort.0' => 'Jan',
          'places.monthsShort.1' => 'Feb',
          'places.monthsShort.2' => 'Mar',
          'places.monthsShort.3' => 'Apr',
          'places.monthsShort.4' => 'May',
          'places.monthsShort.5' => 'Jun',
          'places.monthsShort.6' => 'Jul',
          'places.monthsShort.7' => 'Aug',
          'places.monthsShort.8' => 'Sep',
          'places.monthsShort.9' => 'Oct',
          'places.monthsShort.10' => 'Nov',
          'places.monthsShort.11' => 'Dec',
          'places.dateLine' => ({
            required Object month,
            required Object day,
            required Object year,
          }) => '${month} ${day}, ${year}',
          'places.emptyTitle' => 'No places yet',
          'places.emptyText' =>
            'When you save a memory, write the name of the place and it shows up here.',
          'places.detailEmptyTitle' => 'Nothing at this place',
          'places.detailEmptyText' => 'The memories of this place are not here anymore.',
          'places.errorTitle' => 'Couldn\'t load',
          'places.errorText' => 'Your memories are still saved. Try again.',
          'plus.title' => 'Repara Plus',
          'plus.subtitle' => 'Compare calmly. The free plan stays whole for the essentials.',
          'plus.activeTitle' => 'You have Plus',
          'plus.activeText' => 'Thank you. Everything is unlocked for you and your partner.',
          'plus.paidByPartner' => 'Your partner has Plus and it covers you both.',
          'plus.freeLeft' => ({
            required Object slips,
            required Object cards,
          }) => 'This month you have ${slips} slips and ${cards} sent cards left on the free plan.',
          'plus.freeName' => 'Free',
          'plus.freeFeatures' => 'Slips every month, one sent card a month, repair, pause, safety and everything you already saved.',
          'plus.plusName' => 'Plus',
          'plus.plusFeatures' => 'More slips and cards each month and more for both of you, covering you and your partner.',
          'plus.monthly' => 'Monthly',
          'plus.yearly' => 'Yearly',
          'plus.giftPlan' => 'Gift',
          'plus.storeTitle' => 'Couldn\'t load the prices',
          'plus.storeText' => 'The store didn\'t answer. Nothing was charged. Try again.',
          'plus.subscribe' => 'Subscribe',
          'plus.started' => 'Plus is on. Thank you.',
          'plus.pending' => 'Purchase received. We\'re confirming, Plus will show up shortly.',
          'plus.purchaseError' => 'Couldn\'t complete the purchase. Nothing was charged.',
          'plus.billingTitle' => 'Payment problem',
          'plus.billingText' => 'The last payment didn\'t go through. Plus stays on for now. Open your subscriptions in the store and update the payment method.',
          'plus.alwaysFree' => 'Safety, pause and unpair are never locked.',
          'plus.lockLabel' => 'PLUS',
          'plus.lockText' => 'Available with Plus. Tap to see the plans.',
          'plus.errorTitle' => 'Couldn\'t load',
          'plus.errorText' => 'Try again in a moment.',
          'plus.manageTitle' => 'Manage Plus',
          'plus.planRow' => 'Plan',
          'plus.statusRow' => 'Status',
          'plus.coversRow' => 'Covers',
          'plus.coversBoth' => 'You and your partner',
          'plus.coveredByPartner' => 'Your partner',
          'plus.plusActive' => 'Plus active',
          'plus.statusActive' => 'Active',
          'plus.statusTrialing' => 'Trial',
          'plus.statusGrace' => 'Payment pending',
          'plus.statusBillingIssue' => 'Payment problem',
          'plus.manageInStore' => 'Manage in store',
          'plus.seePlus' => 'See Plus',
          'plus.managePlan' => 'Manage plan',
          'plus.restorePurchases' => 'Restore purchases',
          'plus.partnerPays' => 'Your partner looks after this subscription.',
          'plus.partnerCancel' =>
            'If either partner cancels, Plus ends for both, with a clear notice.',
          'plus.storeIssueTitle' => 'The store didn\'t open',
          'plus.restoreLoadingTitle' => 'Restoring purchases',
          'plus.restoreLoadingText' => 'This takes a few seconds.',
          'plus.restoredTitle' => 'Purchases restored',
          'plus.restoredHighlight' => 'restored',
          'plus.restoredText' => 'We found your Plus in the store.',
          'plus.pendingRestoreTitle' => 'We found a purchase',
          'plus.pendingRestoreHighlight' => 'purchase',
          'plus.pendingRestoreText' =>
            'It can take a moment, or sign in with the account that bought it.',
          'plus.nothingTitle' => 'Nothing to restore',
          'plus.nothingHighlight' => 'restore',
          'plus.nothingText' => 'We found no active purchases in this store. If you subscribed with another account, sign in with it and try again.',
          'plus.restoreFailedTitle' => 'Couldn\'t restore',
          'plus.restoreFailedHighlight' => 'restore',
          'plus.tryAgain' => 'Try again',
          'plus.done' => 'Done',
          'plus.errors.storeUnavailable' => 'The store isn\'t available on this device right now.',
          'plus.errors.manageUnavailable' => 'There\'s no store page for this subscription here.',
          'plus.errors.other' => 'Couldn\'t do that right now. Try again.',
          'privacy.title' => 'Privacy and security',
          'privacy.discreetMode' => 'Discreet mode',
          'privacy.partnerTitle' => 'What your partner sees',
          'privacy.partnerSlips' => 'Sent slips',
          'privacy.partnerSlipsText' => 'Only what you send',
          'privacy.partnerPrivateSlips' => 'Private slips',
          'privacy.partnerTemperature' => 'Temperature',
          'privacy.partnerJournal' => 'Journal',
          'privacy.partnerPause' => 'Pause',
          'privacy.partnerPauseText' => 'The message you wrote',
          'privacy.never' => 'Never',
          'privacy.partnerNote' => 'Whoever makes the data decides who sees it.',
          'privacy.ourTitle' => 'What we can see',
          'privacy.ourEncrypted' => 'Your content is encrypted in transit.',
          'privacy.ourPrivate' => 'The team cannot read your private notes.',
          'privacy.ourAnalytics' => 'Analytics: counts only.',
          'privacy.ourPlain' => 'This page in plain language.',
          'privacy.consents' => 'Consents',
          'privacy.sensitiveData' => 'Sensitive data',
          'privacy.analytics' => 'Analytics',
          'privacy.marketing' => 'Marketing',
          'privacy.ai' => 'AI (when available)',
          'privacy.terms' => 'Terms',
          'privacy.required' => 'Required',
          'privacy.consentsNote' => 'Changes apply now.',
          'privacy.saveError' => 'Could not save now. Try again.',
          'privacy.errorTitle' => 'Could not load the consents',
          'privacy.errorText' => 'Try again in a moment.',
          'privacy.sensitiveTracks' => 'Sensitive tracks and notices',
          'privacy.heavyDayNotice' => 'Heavy-day notice',
          'profileDetails.title' => 'Profile',
          'profileDetails.nameLabel' => 'Your name',
          'profileDetails.nameHint' => 'Marina',
          'profileDetails.nameErrors.empty' => 'Your name cannot be empty.',
          'profileDetails.nameErrors.tooLong' => 'Use at most 30 characters.',
          'profileDetails.pronounsLabel' => 'Pronouns',
          'profileDetails.pronounsHint' => 'Optional',
          'profileDetails.pronounsErrors.tooLong' => 'Use at most 30 characters.',
          'profileDetails.timeZoneLabel' => 'Time zone',
          'profileDetails.timeZonePlaceholder' => 'Pick a time zone',
          'profileDetails.loginLabel' => 'Login',
          'profileDetails.loginAccount' => 'Account',
          'profileDetails.loginEmail' => 'Email',
          'profileDetails.loginApple' => 'Apple',
          'profileDetails.loginGoogle' => 'Google',
          'profileDetails.photoNote' => 'Photo upload is not available yet.',
          'profileDetails.saved' => 'Saved',
          'profileDetails.loadErrorTitle' => 'Could not load your profile',
          'profileDetails.loadErrorText' => 'Check your connection and try again.',
          'profileDetails.timeZones.America/Sao_Paulo' => 'São Paulo',
          'profileDetails.timeZones.America/Argentina/Buenos_Aires' => 'Buenos Aires',
          'profileDetails.timeZones.America/Bogota' => 'Bogotá',
          'profileDetails.timeZones.America/Mexico_City' => 'Mexico City',
          'profileDetails.timeZones.America/New_York' => 'New York',
          'profileDetails.timeZones.America/Los_Angeles' => 'Los Angeles',
          'profileDetails.timeZones.Europe/Lisbon' => 'Lisbon',
          'profileDetails.timeZones.Europe/London' => 'London',
          'profileDetails.timeZones.Europe/Madrid' => 'Madrid',
          'profileDetails.timeZones.Europe/Paris' => 'Paris',
          'profileDetails.timeZones.Europe/Berlin' => 'Berlin',
          'profileDetails.timeZones.Africa/Luanda' => 'Luanda',
          'profileDetails.timeZones.Asia/Tokyo' => 'Tokyo',
          'profileDetails.timeZones.Australia/Sydney' => 'Sydney',
          'profileDetails.timeZones.UTC' => 'UTC',
          'profileDetails.errors.NETWORK' => 'No connection. Try again.',
          'profileDetails.errors.other' => 'Could not save right now. Try again.',
          'profileSetup.title' => 'The basics',
          'profileSetup.titleHighlight' => 'basics',
          'profileSetup.subtitle' =>
            'Used for the words in the app and for the first date of your story.',
          'profileSetup.nameLabel' => 'Your name',
          'profileSetup.nameHint' => 'Marina',
          'profileSetup.nameErrors.empty' => 'Your name cannot be empty.',
          'profileSetup.nameErrors.tooLong' => 'Use at most 30 characters.',
          'profileSetup.partnerNameLabel' => 'Partner\'s name',
          'profileSetup.partnerNameHint' => 'Ricardo',
          'profileSetup.partnerNameErrors.tooLong' => 'Use at most 30 characters.',
          'profileSetup.partnerNameNote' => 'Your partner\'s name stays on your account only.',
          'profileSetup.themeLabel' => 'Your app colour',
          'profileSetup.themeRose' => 'Rose',
          'profileSetup.themeBlue' => 'Blue',
          'profileSetup.themeNeutral' => 'Neutral',
          'profileSetup.dateLabel' => 'When did you start?',
          'profileSetup.dateHint' => 'Pick a date',
          'profileSetup.dateFormat' => ({
            required Object month,
            required Object day,
            required Object year,
          }) => '${month} ${day}, ${year}',
          'profileSetup.months.0' => 'January',
          'profileSetup.months.1' => 'February',
          'profileSetup.months.2' => 'March',
          'profileSetup.months.3' => 'April',
          'profileSetup.months.4' => 'May',
          'profileSetup.months.5' => 'June',
          'profileSetup.months.6' => 'July',
          'profileSetup.months.7' => 'August',
          'profileSetup.months.8' => 'September',
          'profileSetup.months.9' => 'October',
          'profileSetup.months.10' => 'November',
          'profileSetup.months.11' => 'December',
          'profileSetup.continueButton' => 'Continue',
          'profileSetup.errors.INVALID_DATE' =>
            'That date does not look right. Pick one between 1950 and today.',
          'profileSetup.errors.NETWORK' => 'No connection. Your answers are still here, try again.',
          'profileSetup.errors.other' => 'Could not save right now. Try again.',
          'programs.label' => 'PROGRAMS',
          'programs.title' => 'Programs',
          'programs.entryText' => 'Short guided programs, at your own pace.',
          'programs.hubSubtitle' => 'One idea a day. No rush, no pressure.',
          'programs.free' => 'FREE',
          'programs.plus' => 'PLUS',
          'programs.lessonCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 lesson',
                  other: '${count} lessons',
                ),
          'programs.noLessons' => 'Lessons coming',
          'programs.emptyTitle' => 'No programs here yet',
          'programs.emptyText' => 'New programs are on the way. Come back whenever you like.',
          'programs.errorTitle' => 'Couldn\'t load',
          'programs.errorText' => 'The programs are still here. Try again.',
          'programs.diaryLabel' => 'JUST ME',
          'programs.diaryTitle' => 'Diary',
          'programs.diaryText' => 'A private place to write how you are.',
          'programs.start' => 'Start',
          'programs.kContinue' => 'Continue',
          'programs.restart' => 'Start over',
          'programs.restartConfirmTitle' => 'Start over?',
          'programs.restartConfirmText' =>
            'This clears your lesson marks and returns to the first lesson.',
          'programs.restartConfirm' => 'Start over',
          'programs.completed' => 'Completed',
          'programs.lessonsTitle' => 'Lessons',
          'programs.lessonsComingTitle' => 'Lessons coming',
          'programs.lessonsComingText' => 'This program is still being prepared. Come back soon.',
          'programs.lessonGoneTitle' => 'Lesson not here',
          'programs.lessonGoneText' =>
            'This day is no longer part of the program. Choose another lesson.',
          'programs.dayOneHint' => 'The first lesson is always open in this program.',
          'programs.dayLabel' => ({required Object day}) => 'Day ${day}',
          'programs.shortRead' => 'A short idea for today.',
          'programs.ready' => 'Done',
          'programs.saveForLater' => 'Save for later',
          'programs.saved' => 'Saved for later.',
          'programs.savedTag' => 'Saved',
          'programs.lockedTitle' => 'Plus lesson',
          'programs.lockedLessonText' => 'This lesson is part of Plus.',
          'programs.lockedProgramText' => 'This program is part of Plus.',
          'programs.completeTitle' => 'Well done',
          'programs.completeText' => ({required Object title}) => 'You completed ${title}.',
          'programs.completeHint' => 'Choose another whenever you want.',
          'programs.seePrograms' => 'See programs',
          'programs.diaryPrivacy' => 'Just me. Never shared.',
          'programs.diaryPrompt' => 'Today I felt...',
          'programs.diaryHint' => 'Write without hurry. Only you can see this.',
          'programs.diaryBodyErrors.empty' => 'Write a little before saving',
          'programs.diaryBodyErrors.tooLong' => 'The entry is too long',
          'programs.diarySave' => 'Save',
          'programs.diaryNew' => 'New entry',
          'programs.diaryEdit' => 'Edit',
          'programs.diaryDelete' => 'Delete',
          'programs.diaryDeleteTitle' => 'Delete this entry?',
          'programs.diaryDeleteText' => 'This can\'t be undone.',
          'programs.diaryDeleteConfirm' => 'Delete',
          'programs.diaryCapHint' => 'Showing your last 100 entries.',
          'programs.diaryEmptyTitle' => 'Nothing written yet',
          'programs.diaryEmptyText' => 'When you want, write how you are. Only you can see it.',
          'programs.diaryErrorTitle' => 'Couldn\'t load',
          'programs.diaryErrorText' => 'Your entries are still saved. Try again.',
          'programs.monthsShort.0' => 'Jan',
          'programs.monthsShort.1' => 'Feb',
          'programs.monthsShort.2' => 'Mar',
          'programs.monthsShort.3' => 'Apr',
          'programs.monthsShort.4' => 'May',
          'programs.monthsShort.5' => 'Jun',
          'programs.monthsShort.6' => 'Jul',
          'programs.monthsShort.7' => 'Aug',
          'programs.monthsShort.8' => 'Sep',
          'programs.monthsShort.9' => 'Oct',
          'programs.monthsShort.10' => 'Nov',
          'programs.monthsShort.11' => 'Dec',
          'programs.dateLine' => ({
            required Object month,
            required Object day,
            required Object year,
          }) => '${month} ${day}, ${year}',
          'programs.moods.calm' => 'At peace',
          'programs.moods.tender' => 'Held',
          'programs.moods.tired' => 'Tired',
          'programs.moods.heavy' => 'Heavy',
          'programs.moods.other' => 'How I am',
          'programs.lessonErrors.other' => 'Couldn\'t do that right now. Try again.',
          'programs.diaryErrors.other' => 'Couldn\'t save right now. Your text is still here.',
          'programs.sensitive' => 'SENSITIVE',
          'programs.sensitiveGateTitle' => 'A track just for you',
          'programs.sensitiveGateText' => 'These lessons talk about grief, illness and trust. Your partner does not see that you joined or what you read. You can leave whenever you want.',
          'programs.sensitiveGateAction' => 'Join this track',
          'programs.sensitiveConsentTitle' => 'Join this track?',
          'programs.sensitiveConsentText' => 'These lessons talk about grief, illness and trust. They stay just for you: your partner does not see your participation. You can withdraw this consent in Privacy and security.',
          'programs.sensitiveConsentConfirm' => 'Join',
          'programs.sensitiveConsentCancel' => 'Not now',
          'programs.sensitiveLessonLockedTitle' => 'Sensitive track',
          'programs.sensitiveLessonLockedText' =>
            'To open this lesson, turn on the sensitive tracks consent.',
          'programs.freeNote' => 'Free shows only the first lesson.',
          'questions.tag' => 'Question for you two',
          'questions.eyebrow' => 'Question of the day',
          'questions.answerCta' => 'Answer',
          'questions.editCta' => 'Edit my answer',
          'questions.answerHint' => 'Write as much or as little as you want.',
          'questions.answerErrors.empty' => 'Write an answer',
          'questions.answerErrors.tooLong' => 'The answer is too long',
          'questions.privateNote' => 'Only you can see this until your partner answers too.',
          'questions.partnerAnsweredNote' =>
            'Your partner already answered. Send yours to see both.',
          'questions.soloNote' =>
            'Your answer stays private. Your partner will see it after you connect.',
          'questions.save' => 'Send',
          'questions.cancel' => 'Cancel',
          'questions.waitingTitle' => 'Your answer is saved',
          'questions.waitingText' => 'It appears here when your partner answers too.',
          'questions.waitingSoloText' =>
            'When your partner joins, they will see your answer and you can see theirs.',
          'questions.checkAgain' => 'Check again',
          'questions.voiceSoon' => 'Voice note',
          'questions.voiceSoonNote' => 'For now answers are written. Voice will come later.',
          'questions.revealTitle' => 'Your answers together',
          'questions.revealHighlight' => 'together',
          'questions.revealSubtitle' => 'Now that you both answered, you can see each one.',
          'questions.revealNote' => 'No scores. Just what each of you wrote.',
          'questions.you' => 'You',
          'questions.partnerFallback' => 'Your partner',
          'questions.discardTitle' => 'Discard this answer?',
          'questions.discardText' => 'The text you wrote was not saved.',
          'questions.discard' => 'Discard',
          'questions.keepWriting' => 'Keep writing',
          'questions.loadErrorTitle' => 'Couldn\'t open the question',
          'questions.loadErrorText' => 'Nothing was lost. Try again.',
          'questions.close' => 'Close',
          'questions.errors.other' => 'Couldn\'t save that now. Try again.',
          'questionsEntry.label' => 'QUESTION OF THE DAY',
          'questionsEntry.title' => 'Question of the day',
          'questionsEntry.text' => 'One question for both of you to answer.',
          'quickSlip.dateLine' => ({
            required Object weekday,
            required Object month,
            required Object day,
          }) => '${weekday}, ${month} ${day}',
          'quickSlip.weekdays.0' => 'Monday',
          'quickSlip.weekdays.1' => 'Tuesday',
          'quickSlip.weekdays.2' => 'Wednesday',
          'quickSlip.weekdays.3' => 'Thursday',
          'quickSlip.weekdays.4' => 'Friday',
          'quickSlip.weekdays.5' => 'Saturday',
          'quickSlip.weekdays.6' => 'Sunday',
          'quickSlip.monthsShort.0' => 'Jan',
          'quickSlip.monthsShort.1' => 'Feb',
          'quickSlip.monthsShort.2' => 'Mar',
          'quickSlip.monthsShort.3' => 'Apr',
          'quickSlip.monthsShort.4' => 'May',
          'quickSlip.monthsShort.5' => 'Jun',
          'quickSlip.monthsShort.6' => 'Jul',
          'quickSlip.monthsShort.7' => 'Aug',
          'quickSlip.monthsShort.8' => 'Sep',
          'quickSlip.monthsShort.9' => 'Oct',
          'quickSlip.monthsShort.10' => 'Nov',
          'quickSlip.monthsShort.11' => 'Dec',
          'quickSlip.title' => 'What made you happy?',
          'quickSlip.titleHighlight' => 'happy',
          'quickSlip.subtitle' => 'One line is enough. 30 seconds.',
          'quickSlip.hint' => 'E.g. made coffee before I woke up',
          'quickSlip.textErrors.empty' => 'Write the slip first',
          'quickSlip.textErrors.tooLong' => 'This slip is too long',
          'quickSlip.categories.said' => 'Said something',
          'quickSlip.categories.did' => 'Did something',
          'quickSlip.categories.noticed' => 'Noticed me',
          'quickSlip.categories.helped' => 'Helped me',
          'quickSlip.categories.other' => '',
          'quickSlip.privacyNote' =>
            'It stays private. On Sunday you choose what goes on the card.',
          'quickSlip.save' => 'Save',
          'quickSlip.saved.title' => 'Saved',
          'quickSlip.saved.added' => 'Slip added to this week.',
          'quickSlip.saved.queued' =>
            'Saved on this phone. We send it when the connection is back.',
          'quickSlip.saved.undoHint' => 'Undo for 30 seconds.',
          'quickSlip.saved.undo' => 'Undo',
          'quickSlip.saved.done' => 'Done',
          'quickSlip.errors.FREE_LIMIT_REACHED' => 'You reached the free plan\'s slip limit.',
          'quickSlip.errors.RATE_LIMITED' => 'Too many tries in a row. Wait a moment.',
          'quickSlip.errors.other' =>
            'Could not save right now. Your text is still here, try again.',
          'received.kinds.repair' => 'Repair card',
          'received.kinds.need' => 'I need…',
          'received.kinds.miss_us' => 'Missing you',
          'received.kinds.hug' => 'A hug',
          'received.kinds.distance' => 'A little distance',
          'received.kinds.heavy_day' => 'A heavy day',
          'received.kinds.good_news' => 'Good news',
          'received.kinds.other' => '',
          'received.fromPartner' => 'From your partner',
          'received.privateFirst' => 'Your answer is private first. There is no right or wrong.',
          'received.responses.talk' => 'Yes, let\'s talk',
          'received.responses.more_time' => 'I need a bit more time',
          'received.responses.later' => 'I\'ll answer later',
          'received.responses.other' => '',
          'received.seen' => 'Got it',
          'received.doneTitle' => 'All good',
          'received.doneText' => 'Thanks for reading it calmly.',
          'received.emptyTitle' => 'Nothing new',
          'received.emptyText' => 'When your partner sends something, it shows up here.',
          'received.close' => 'Close',
          'received.errorTitle' => 'Couldn\'t open this',
          'received.errorText' => 'Nothing was lost. Try again.',
          'received.errors.NOT_FOUND' => 'That message isn\'t here anymore.',
          'received.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'received.errors.other' => 'Couldn\'t answer right now. Try again.',
          'relationshipChanged.title' => 'Something changed?',
          'relationshipChanged.highlight' => 'changed',
          'relationshipChanged.subtitle' => 'Take your time. This only changes what the app shows.',
          'relationshipChanged.optionEnded' => 'We broke up',
          'relationshipChanged.optionBereaved' => 'I lost them',
          'relationshipChanged.optionOnBreak' => 'A break',
          'relationshipChanged.optionTogether' => 'Everything is fine',
          'relationshipChanged.continueLabel' => 'Continue',
          'relationshipChanged.saved' => 'Saved',
          'relationshipChanged.errors.NETWORK' => 'No connection. Try again.',
          'relationshipChanged.errors.other' => 'Could not save right now. Try again.',
          'relationshipSettings.title' => 'Relationship',
          'relationshipSettings.phaseLabel' => 'Phase',
          'relationshipSettings.phasePlaceholder' => 'Pick a phase',
          'relationshipSettings.phases.beginning' => 'Just starting',
          'relationshipSettings.phases.dating' => 'Dating',
          'relationshipSettings.phases.living_together' => 'Living together',
          'relationshipSettings.phases.engaged' => 'Engaged',
          'relationshipSettings.phases.married' => 'Married',
          'relationshipSettings.phases.with_kids' => 'With kids',
          'relationshipSettings.phases.long_distance' => 'Long distance',
          'relationshipSettings.phases.with_parents' => 'Living with parents',
          'relationshipSettings.phases.restarting' => 'Starting over',
          'relationshipSettings.dateLabel' => 'Together since',
          'relationshipSettings.dateHint' => 'Pick a date',
          'relationshipSettings.dateFormat' => ({
            required Object month,
            required Object day,
            required Object year,
          }) => '${month} ${day}, ${year}',
          'relationshipSettings.months.0' => 'January',
          'relationshipSettings.months.1' => 'February',
          'relationshipSettings.months.2' => 'March',
          'relationshipSettings.months.3' => 'April',
          'relationshipSettings.months.4' => 'May',
          'relationshipSettings.months.5' => 'June',
          'relationshipSettings.months.6' => 'July',
          'relationshipSettings.months.7' => 'August',
          'relationshipSettings.months.8' => 'September',
          'relationshipSettings.months.9' => 'October',
          'relationshipSettings.months.10' => 'November',
          'relationshipSettings.months.11' => 'December',
          'relationshipSettings.futureDateNote' =>
            'A future date is fine; the countdown just starts later.',
          'relationshipSettings.partnerLabel' => 'Partner',
          'relationshipSettings.invitePartner' => 'Invite your partner',
          'relationshipSettings.partnerError' => 'Could not load your partner.',
          'relationshipSettings.partnerRetry' => 'Try again',
          'relationshipSettings.phaseNote' => 'The phase only changes the words.',
          'relationshipSettings.saved' => 'Saved',
          'relationshipSettings.loadErrorTitle' => 'Could not load the relationship',
          'relationshipSettings.loadErrorText' => 'Check your connection and try again.',
          'relationshipSettings.errors.NETWORK' => 'No connection. Try again.',
          'relationshipSettings.errors.other' => 'Could not save right now. Try again.',
          'relationshipSettings.changedPrompt' => 'Something changed between you two?',
          'relationshipSettings.changedSubtitle' => 'Update what the app shows',
          'reminders.title' => 'Repara',
          'reminders.dailyIdea' => 'A small idea for today.',
          'reminders.dates' => 'A date is coming up.',
          'reminders.weeklyCard' => 'Your card is ready.',
          'reminders.discreet' => 'Open the app to see.',
          'repair.calm.title' => 'A moment to breathe',
          'repair.calm.titleHighlight' => 'breathe',
          'repair.calm.cadence' =>
            'Breathe in slowly for 4. Breathe out slowly for 6. Repeat at your own pace.',
          'repair.calm.text' => 'There\'s no rush and no timer. Leave whenever you like.',
          'repair.calm.ready' => 'I feel calmer',
          'repair.calm.leave' => 'Leave',
          'repair.calm.askPause' => 'Ask my partner for some space',
          'repair.softStart.title' => 'Start softly',
          'repair.softStart.titleHighlight' => 'softly',
          'repair.softStart.subtitle' => 'A blame-free template to open the conversation.',
          'repair.softStart.feeling' => 'I feel…',
          'repair.softStart.feelingHint' => 'E.g. tired',
          'repair.softStart.feelingErrors.empty' => 'Say how you feel',
          'repair.softStart.situation' => 'When…',
          'repair.softStart.situationHint' => 'E.g. the dishes wait until later',
          'repair.softStart.situationErrors.empty' => 'Say when it happens',
          'repair.softStart.need' => 'I need…',
          'repair.softStart.needHint' => 'E.g. a little help',
          'repair.softStart.needErrors.empty' => 'Say what you need',
          'repair.softStart.template' => ({
            required Object feeling,
            required Object situation,
            required Object need,
          }) => 'I feel ${feeling} when ${situation}. I need ${need}.',
          'repair.softStart.use' => 'Use this template',
          'repair.quick.title' => 'A small repair',
          'repair.quick.titleHighlight' => 'repair',
          'repair.quick.subtitle' => 'One tap sends. You can change the text first.',
          'repair.quick.presets.tone' => 'Sorry for my tone.',
          'repair.quick.presets.restart' => 'Can we start over?',
          'repair.quick.presets.five_minutes' => 'I need five minutes.',
          'repair.quick.presets.love' => 'I love you, even now.',
          'repair.quick.presets.other' => '',
          'repair.quick.hint' => 'Write my own',
          'repair.quick.textErrors.empty' => 'Write a message',
          'repair.quick.textErrors.tooLong' => 'The message is too long',
          'repair.quick.send' => 'Send',
          'repair.quick.sentTitle' => 'Sent',
          'repair.quick.sentText' => 'Your partner will see it when they open the app.',
          'repair.quick.done' => 'Done',
          'repair.quick.errors.NOT_PAIRED' =>
            'To send this, you need to be connected with your partner in the app.',
          'repair.quick.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'repair.quick.errors.other' => 'Couldn\'t send right now. Your message is still here.',
          'repair.guided.stepOf' => ({
            required Object current,
            required Object total,
          }) => 'Step ${current} of ${total}',
          'repair.guided.stepTitles.0' => 'What happened?',
          'repair.guided.stepTitles.1' => 'What do you need?',
          'repair.guided.stepTitles.2' => 'What can you offer?',
          'repair.guided.stepHighlights.0' => 'happened',
          'repair.guided.stepHighlights.1' => 'need',
          'repair.guided.stepHighlights.2' => 'offer',
          'repair.guided.stepHints.0' => 'In your own words, without blaming anyone.',
          'repair.guided.stepHints.1' => 'One thing that would help right now.',
          'repair.guided.stepHints.2' => 'Something small and sincere.',
          'repair.guided.private' => 'Only you see this. Nothing is sent to your partner.',
          'repair.guided.next' => 'Continue',
          'repair.guided.back' => 'Back',
          'repair.guided.later' => 'Save for later',
          'repair.guided.savedLater' => 'Saved. You\'ll pick up where you left off.',
          'repair.guided.finalTitle' => 'How are you now?',
          'repair.guided.finalHighlight' => 'now',
          'repair.guided.feelings.calmer' => 'Calmer',
          'repair.guided.feelings.still_tense' => 'Still tense',
          'repair.guided.feelings.need_more_time' => 'I need more time',
          'repair.guided.feelings.other' => '',
          'repair.guided.followUpTitle' => 'Want a reminder to check in on how you are?',
          'repair.guided.followUps.none' => 'No need',
          'repair.guided.followUps.tomorrow' => 'Tomorrow',
          'repair.guided.followUps.inThreeDays' => 'In 3 days',
          'repair.guided.followUps.other' => '',
          'repair.guided.followUpNote' =>
            'The reminder is short and says nothing about what happened.',
          'repair.guided.finish' => 'Finish',
          'repair.guided.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'repair.guided.errors.other' => 'Couldn\'t save right now. Your answers are still here.',
          'repair.guided.loadErrorTitle' => 'Couldn\'t open this',
          'repair.guided.loadErrorText' => 'Nothing was lost. Try again.',
          'repair.learning.title' => 'What did you learn?',
          'repair.learning.titleHighlight' => 'learn',
          'repair.learning.subtitle' => 'It stays with you and can be deleted whenever you like.',
          _ => null,
        } ??
        switch (path) {
          'repair.learning.kinds.trigger' => 'What bothers me',
          'repair.learning.kinds.need' => 'What I need',
          'repair.learning.kinds.good_fix' => 'What helped',
          'repair.learning.kinds.other' => '',
          'repair.learning.hint' => 'Write one or two sentences',
          'repair.learning.noteErrors.empty' => 'Write what you learned',
          'repair.learning.noteErrors.tooLong' => 'The note is too long',
          'repair.learning.save' => 'Save',
          'repair.learning.listTitle' => 'Your learnings',
          'repair.learning.delete' => 'Delete',
          'repair.learning.emptyTitle' => 'Nothing yet',
          'repair.learning.emptyText' => 'When you write a learning, it shows up here.',
          'repair.learning.errorTitle' => 'Couldn\'t load',
          'repair.learning.errorText' => 'Your learnings are still saved. Try again.',
          'repair.learning.done' => 'Done',
          'repair.learning.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'repair.learning.errors.other' => 'Couldn\'t save right now. Your text is still here.',
          'repair.next.pause' => 'Breathe a little',
          'repair.next.guided' => 'Start the guided repair',
          'repair.next.quick' => 'Send a repair',
          'rituals.title' => 'Rituals',
          'rituals.subtitle' => 'Small habits you want to protect. No streaks, no pressure.',
          'rituals.emptyTitle' => 'No rituals yet',
          'rituals.emptyText' => 'A Friday dinner, a Sunday walk. What do you want to protect?',
          'rituals.create' => 'Create a ritual',
          'rituals.didIt' => 'We did it',
          'rituals.warm' => 'That\'s lovely. A moment for the two of you.',
          'rituals.cadences.daily' => 'Every day',
          'rituals.cadences.weekly' => 'Every week',
          'rituals.cadences.biweekly' => 'Every two weeks',
          'rituals.cadences.monthly' => 'Every month',
          'rituals.cadences.other' => '',
          'rituals.cadenceOn' => ({
            required Object cadence,
            required Object weekday,
          }) => '${cadence}, ${weekday}',
          'rituals.weekdays.0' => 'Sunday',
          'rituals.weekdays.1' => 'Monday',
          'rituals.weekdays.2' => 'Tuesday',
          'rituals.weekdays.3' => 'Wednesday',
          'rituals.weekdays.4' => 'Thursday',
          'rituals.weekdays.5' => 'Friday',
          'rituals.weekdays.6' => 'Saturday',
          'rituals.createTitle' => 'New ritual',
          'rituals.editTitle' => 'Your ritual',
          'rituals.nameLabel' => 'Name',
          'rituals.nameHint' => 'E.g. Friday dinner',
          'rituals.cadenceLabel' => 'How often',
          'rituals.weekdayLabel' => 'On which day',
          'rituals.hourLabel' => 'What time',
          'rituals.hourFormat' => ({required Object hour}) => '${hour}:00',
          'rituals.reminderTitle' => 'Reminder',
          'rituals.reminderText' => 'A short notice on this phone, with no details.',
          'rituals.save' => 'Save',
          'rituals.archive' => 'Archive',
          'rituals.archiveTitle' => 'Archive this ritual?',
          'rituals.archiveText' => 'It leaves the list. The history stays saved.',
          'rituals.errorTitle' => 'Couldn\'t open this',
          'rituals.errorText' => 'Nothing was lost. Try again.',
          'rituals.errors.NOT_FOUND' => 'That ritual isn\'t here anymore.',
          'rituals.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'rituals.errors.other' => 'Couldn\'t do that right now. Try again.',
          'safeMode.title' => 'Safe mode',
          'safeMode.text' => 'For when the app needs to stay discreet on this phone.',
          'safeMode.toggle' => 'Hide the app',
          'safeMode.toggleText' => 'When you switch apps, the screen goes blank.',
          'safeMode.localOnly' => 'This stays only on this phone. Nothing is sent or recorded.',
          'safeMode.quickExit' => 'Leave now',
          'safety.entry' => 'Safety and support',
          'sessionExpired.title' => 'Your session ended',
          'sessionExpired.highlight' => 'ended',
          'sessionExpired.text' => 'Sign in again to continue. Your data is safe.',
          'sessionExpired.action' => 'Sign in',
          'settingsHome.title' => 'Settings',
          'settingsHome.safety' => 'Safety and support',
          'settingsHome.safetyStatus' => 'Safe mode',
          'settingsHome.profile' => 'Profile',
          'settingsHome.relationship' => 'Relationship',
          'settingsHome.connected' => 'You are connected',
          'settingsHome.invitePartner' => 'Invite your partner',
          'settingsHome.notifications' => 'Notifications',
          'settingsHome.devices' => 'Devices',
          'settingsHome.on' => 'On in the app',
          'settingsHome.off' => 'Off in the app',
          'settingsHome.plan' => 'Plan',
          'settingsHome.planFree' => 'Free',
          'settingsHome.planPlus' => 'Plus',
          'settingsHome.spice' => 'Moments for two',
          'settingsHome.discreet' => 'Discreet mode',
          'settingsHome.discreetOn' => 'On',
          'settingsHome.discreetOff' => 'Off',
          'settingsHome.privacy' => 'Privacy and security',
          'settingsHome.privacyStatus' => 'Who sees what',
          'settingsHome.signOut' => 'Sign out',
          'settingsHome.deleteAccount' => 'Delete account',
          'settingsHome.pendingBanner' => ({
            required Object date,
          }) => 'Your account will be deleted on ${date}.',
          'settingsHome.pendingAction' => 'See',
          'settingsHome.pendingBannerSimple' => 'Your account will be deleted soon.',
          'settingsHome.help' => 'Help and support',
          'settingsHome.helpStatus' => 'FAQ and contact',
          'settingsHome.appPreferences' => 'App preferences',
          'settingsHome.appPreferencesStatus' => 'Appearance, text and language',
          'settingsHome.weeklyCard' => 'Weekly card',
          'settingsHome.language' => 'Language',
          'settingsHome.accountSection' => 'Account',
          'settingsHome.preferencesSection' => 'Preferences',
          'settingsHome.privacySection' => 'Privacy and help',
          'settingsHome.connectedWith' => ({required Object name}) => 'Connected with ${name}',
          'slipDetail.dateLine' => ({
            required Object weekday,
            required Object month,
            required Object day,
          }) => '${weekday}, ${month} ${day}',
          'slipDetail.weekdays.0' => 'Monday',
          'slipDetail.weekdays.1' => 'Tuesday',
          'slipDetail.weekdays.2' => 'Wednesday',
          'slipDetail.weekdays.3' => 'Thursday',
          'slipDetail.weekdays.4' => 'Friday',
          'slipDetail.weekdays.5' => 'Saturday',
          'slipDetail.weekdays.6' => 'Sunday',
          'slipDetail.monthsShort.0' => 'Jan',
          'slipDetail.monthsShort.1' => 'Feb',
          'slipDetail.monthsShort.2' => 'Mar',
          'slipDetail.monthsShort.3' => 'Apr',
          'slipDetail.monthsShort.4' => 'May',
          'slipDetail.monthsShort.5' => 'Jun',
          'slipDetail.monthsShort.6' => 'Jul',
          'slipDetail.monthsShort.7' => 'Aug',
          'slipDetail.monthsShort.8' => 'Sep',
          'slipDetail.monthsShort.9' => 'Oct',
          'slipDetail.monthsShort.10' => 'Nov',
          'slipDetail.monthsShort.11' => 'Dec',
          'slipDetail.kinds.quick' => 'Quick',
          'slipDetail.kinds.specific' => 'Specific',
          'slipDetail.kinds.if_then' => 'If… then',
          'slipDetail.kinds.invisible' => 'Invisible',
          'slipDetail.kinds.other' => '',
          'slipDetail.private' => 'Only you see this slip.',
          'slipDetail.archived' => 'Archived',
          'slipDetail.feeling' => 'How you felt',
          'slipDetail.plan' => 'Then I…',
          'slipDetail.jarTitle' => 'Keep in the jar',
          'slipDetail.jarText' => 'To open on a bad day. Only you see it.',
          'slipDetail.cardTitle' => 'Who sees this',
          'slipDetail.cardOff' => 'Only me',
          'slipDetail.cardOffText' => 'Stays in your week and does not go in the card.',
          'slipDetail.cardOn' => 'Can go in the card',
          'slipDetail.cardOnText' => 'On Sunday you choose whether it goes.',
          'slipDetail.cardInvisible' => 'Invisible slips never go in a card.',
          'slipDetail.previewTitle' => 'What your partner would read',
          'slipDetail.previewText' => 'If this slip goes in the card, this is the text that shows.',
          'slipDetail.sentNote' => 'This slip already went in a card. The sent card keeps the earlier copy, even if you edit or delete it here.',
          'slipDetail.draftBodyErrors.empty' => 'Write the slip first',
          'slipDetail.draftBodyErrors.tooLong' => 'This slip is too long',
          'slipDetail.edit' => 'Edit',
          'slipDetail.editSave' => 'Save',
          'slipDetail.editCancel' => 'Cancel',
          'slipDetail.archive' => 'Archive',
          'slipDetail.restore' => 'Restore',
          'slipDetail.delete' => 'Delete',
          'slipDetail.deleteTitle' => 'Delete this slip?',
          'slipDetail.deleteText' => 'It will be removed from your week and your timeline.',
          'slipDetail.deleteConfirm' => 'Delete',
          'slipDetail.saved' => 'Saved',
          'slipDetail.archivedToast' => 'Archived',
          'slipDetail.deleted' => 'Slip deleted',
          'slipDetail.notFoundTitle' => 'This slip no longer exists',
          'slipDetail.notFoundText' => 'It may have been deleted.',
          'slipDetail.errorTitle' => 'Couldn\'t open this slip',
          'slipDetail.errorText' => 'It is still saved. Try again.',
          'slipDetail.errors.SLIP_NOT_FOUND' => 'This slip no longer exists.',
          'slipDetail.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'slipDetail.errors.other' => 'Couldn\'t do that right now. Try again.',
          'slipDetail.discardTitle' => 'Discard this slip?',
          'slipKind.switcherTitle' => 'Other ways to write it down',
          'slipKind.quickEntry' => 'Quick',
          'slipKind.needEntry' => 'I need…',
          'slipKind.kinds.specific' => 'Specific',
          'slipKind.kinds.if_then' => 'If… then',
          'slipKind.kinds.invisible' => 'Invisible',
          'slipKind.kinds.other' => '',
          'slipKind.specific.title' => 'What exactly did they do?',
          'slipKind.specific.titleHighlight' => 'exactly',
          'slipKind.specific.subtitle' => 'Details help you remember why it mattered.',
          'slipKind.specific.hint' => 'E.g. took out the trash without being asked',
          'slipKind.specific.feelingLabel' => 'How did you feel?',
          'slipKind.specific.feelingHint' => 'Optional',
          'slipKind.ifThen.title' => 'Want to tell them?',
          'slipKind.ifThen.titleHighlight' => 'tell',
          'slipKind.ifThen.subtitle' => 'A small plan: when this happens, you do that.',
          'slipKind.ifThen.ifLabel' => 'If…',
          'slipKind.ifThen.ifHint' => 'E.g. I feel overwhelmed',
          'slipKind.ifThen.thenLabel' => 'Then…',
          'slipKind.ifThen.thenHint' => 'E.g. I ask for 10 minutes alone',
          'slipKind.invisible.title' => 'Things nobody notices',
          'slipKind.invisible.titleHighlight' => 'nobody notices',
          'slipKind.invisible.subtitle' => 'Only for you. This never goes into a card.',
          'slipKind.invisible.hint' => 'E.g. remembered the kids\' appointment',
          'slipKind.invisible.areaLabel' => 'What kind of work?',
          'slipKind.invisible.private' => 'Stays with you and never enters a card.',
          'slipKind.workAreas.planning' => 'Planning',
          'slipKind.workAreas.dates' => 'Dates',
          'slipKind.workAreas.kitchen' => 'Kitchen',
          'slipKind.workAreas.cleaning' => 'Cleaning',
          'slipKind.workAreas.kids' => 'Kids',
          'slipKind.workAreas.emotional' => 'Emotional',
          'slipKind.workAreas.finances' => 'Finances',
          'slipKind.workAreas.other' => 'Other',
          'slipKind.textErrors.empty' => 'Write the slip first',
          'slipKind.textErrors.tooLong' => 'This slip is too long',
          'slipKind.feelingErrors.tooLong' => 'This is too long',
          'slipKind.planErrors.empty' => 'Say what you will do',
          'slipKind.planErrors.tooLong' => 'This is too long',
          'slipKind.save' => 'Save',
          'slipKind.saved.title' => 'Saved',
          'slipKind.saved.added' => 'Written down.',
          'slipKind.saved.queued' =>
            'Saved on this phone. We\'ll send it when the connection is back.',
          'slipKind.saved.done' => 'Done',
          'slipKind.errors.FREE_LIMIT_REACHED' => 'You reached the free plan\'s slip limit.',
          'slipKind.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'slipKind.errors.other' =>
            'Couldn\'t save right now. Your text is still here, try again.',
          'slipsList.title' => 'Slips',
          'slipsList.scopeWeek' => 'This week',
          'slipsList.scopeAll' => 'All',
          'slipsList.search' => 'Search',
          'slipsList.searchClose' => 'Close search',
          'slipsList.searchHint' => 'Search your slips',
          'slipsList.searchEmptyTitle' => 'Nothing found',
          'slipsList.searchEmptyText' => 'Try another word.',
          'slipsList.thisWeek' => 'This week',
          'slipsList.lastWeek' => 'Last week',
          'slipsList.weekRange' => ({
            required Object start,
            required Object end,
          }) => '${start} – ${end}',
          'slipsList.dateShort' => ({
            required Object month,
            required Object day,
          }) => '${month} ${day}',
          'slipsList.dayLine' => ({
            required Object weekday,
            required Object category,
          }) => '${weekday} · ${category}',
          'slipsList.weekdaysShort.0' => 'Mon',
          'slipsList.weekdaysShort.1' => 'Tue',
          'slipsList.weekdaysShort.2' => 'Wed',
          'slipsList.weekdaysShort.3' => 'Thu',
          'slipsList.weekdaysShort.4' => 'Fri',
          'slipsList.weekdaysShort.5' => 'Sat',
          'slipsList.weekdaysShort.6' => 'Sun',
          'slipsList.monthsShort.0' => 'Jan',
          'slipsList.monthsShort.1' => 'Feb',
          'slipsList.monthsShort.2' => 'Mar',
          'slipsList.monthsShort.3' => 'Apr',
          'slipsList.monthsShort.4' => 'May',
          'slipsList.monthsShort.5' => 'Jun',
          'slipsList.monthsShort.6' => 'Jul',
          'slipsList.monthsShort.7' => 'Aug',
          'slipsList.monthsShort.8' => 'Sep',
          'slipsList.monthsShort.9' => 'Oct',
          'slipsList.monthsShort.10' => 'Nov',
          'slipsList.monthsShort.11' => 'Dec',
          'slipsList.categories.said' => 'Said something',
          'slipsList.categories.did' => 'Did something',
          'slipsList.categories.noticed' => 'Noticed me',
          'slipsList.categories.helped' => 'Helped',
          'slipsList.categories.other' => '',
          'slipsList.pastCards' => 'Past cards',
          'slipsList.emptyTitle' => 'Nothing yet',
          'slipsList.emptyText' => 'A slip is one good thing, in one line.',
          'slipsList.emptyAction' => 'Add a slip',
          'slipsList.errorTitle' => 'Could not load your slips',
          'slipsList.errorText' => 'They are still saved. Try again.',
          'spice.title' => 'Moments for two',
          'spice.offText' => 'This section is hidden by default, behind this setting. It is light, playful cards, nothing explicit. They only show up when you both turn it on, and either of you can turn it off at any time, without notice.',
          'spice.turnOn' => 'Turn on',
          'spice.notNow' => 'Not now',
          'spice.waitingText' => 'You both need to accept. Nothing is sent to your partner; when they turn it on too, the cards show up here.',
          'spice.readyText' => 'Light cards for the two of you. Do it or skip it, no pressure.',
          'spice.drawCard' => 'Draw a card',
          'spice.turnOff' => 'Turn off',
          'spice.errorTitle' => 'Couldn\'t load',
          'spice.errorText' => 'Try again in a moment.',
          'spice.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'spice.errors.other' => 'Couldn\'t change that right now. Try again.',
          'story.title' => 'Image to share',
          'story.privacyNote' =>
            'The image is made on your device and carries no names or text unless you choose.',
          'story.days' => 'days',
          'story.together' => 'together',
          'story.namesLabel' => 'Include the names',
          'story.namesText' => 'Off by default.',
          'story.phraseLabel' => 'A line (optional)',
          'story.phraseHint' => 'E.g. so much still ahead',
          'story.share' => 'Share image',
          'story.emptyTitle' => 'Your date is missing',
          'story.emptyText' =>
            'Set since when you are together in Our history to create the image.',
          'story.errorTitle' => 'Couldn\'t load',
          'story.errorText' => 'Try again in a moment.',
          'story.errors.other' => 'Couldn\'t share right now. Try again.',
          'sundayCard.title' => 'Your card',
          'sundayCard.edit' => 'Edit',
          'sundayCard.save' => 'Save',
          'sundayCard.cancel' => 'Cancel',
          'sundayCard.noteLabel' => 'Closing note',
          'sundayCard.noteHint' => 'Thank you for this week.',
          'sundayCard.moveUp' => 'Move up',
          'sundayCard.moveDown' => 'Move down',
          'sundayCard.remove' => 'Remove from card',
          'sundayCard.emptyTitle' => 'A week without slips',
          'sundayCard.emptyText' => 'Note one good thing and it goes on the Sunday card.',
          'sundayCard.emptyAction' => 'Note a slip',
          'sundayCard.errorTitle' => 'Could not load the card',
          'sundayCard.errorText' => 'Your slips are still saved. Try again.',
          'sundayCard.saveError' => 'Could not save the card. Try again.',
          'sundayCard.openFromToday' => 'See the draft',
          'sundayCard.deliverError' =>
            'Could not send right now. The card is still here, try again.',
          'sundayCard.send.action' => 'Send',
          'sundayCard.send.invite' => 'Invite to send',
          'sundayCard.send.needsPartner' =>
            'To send the card in the app, your person has to be connected.',
          'sundayCard.send.title' => 'Send the card?',
          'sundayCard.send.text' => ({
            required Object name,
          }) => '${name} receives it now. Once sent, the card does not change.',
          'sundayCard.send.textNoName' =>
            'Your person receives it now. Once sent, the card does not change.',
          'sundayCard.send.confirm' => 'Send',
          'sundayCard.hold.action' => 'Hold this week',
          'sundayCard.hold.title' => 'Hold this week?',
          'sundayCard.hold.text' =>
            'The card is kept and nothing is lost. You can send it whenever you like.',
          'sundayCard.hold.confirm' => 'Hold',
          'sundayCard.held.title' => 'Held this week',
          'sundayCard.held.titleHighlight' => 'Held',
          'sundayCard.held.text' => 'Your card waits. Send it when you are ready. Nothing is lost.',
          'sundayCard.held.keepHolding' => 'Keep holding',
          'sundayCard.held.sendAnyway' => 'Send anyway',
          'sundayCard.sent.title' => 'Sent',
          'sundayCard.sent.text' => ({required Object name}) => 'The card went to ${name}.',
          'sundayCard.sent.textNoName' => 'The card went to your person.',
          'sundayCard.sent.done' => 'Done',
          'tabs.today' => 'Today',
          'tabs.slips' => 'Slips',
          'tabs.together' => 'Together',
          'tabs.memories' => 'Memories',
          'tabs.capture' => 'New slip',
          'tabs.soonTitle' => 'Under construction',
          'tabs.soonText' => 'This part of the app is still being prepared.',
          'tabs.segmentTogether' => 'Us',
          'tabs.forMeFooter' => 'Private tools. Never shared.',
          'tabs.segmentForMe' => 'For me',
          'tabs.checkinLabel' => 'CHECK-IN',
          'tabs.checkinTitle' => 'Weekly check-in',
          'tabs.checkinText' => 'A short conversation, private first.',
          'tabs.logisticsLabel' => 'PRACTICAL',
          'tabs.logisticsTitle' => 'Logistics meeting',
          'tabs.logisticsText' => 'The practical things, with nobody carrying them alone.',
          'tabs.listsLabel' => 'LISTS',
          'tabs.listsTitle' => 'Lists',
          'tabs.listsEmpty' => 'No lists yet. Start one together.',
          'tabs.listsEmptyPrivate' => 'No lists yet. Start one of your own.',
          'tabs.listsSharedCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 list, shared',
                  other: '${count} lists, shared',
                ),
          'tabs.listsPrivateCount' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 list, private',
                  other: '${count} lists, private',
                ),
          'tabs.soloNote' => 'When your partner joins, shared things show up here.',
          'tabs.ritualsLabel' => 'ROUTINE',
          'tabs.ritualsTitle' => 'Rituals',
          'tabs.ritualsText' => 'Small habits you want to protect.',
          'tabs.dateNightLabel' => 'DATE',
          'tabs.dateNightTitle' => 'Date night',
          'tabs.dateNightText' => 'Ideas for the two of you, picked together.',
          'tabs.partnerLabel' => 'JUST FOR YOU',
          'tabs.partnerTitle' => 'About your partner',
          'tabs.partnerText' => 'Private notes to remember what they like.',
          'tabs.chatLabel' => 'TALK',
          'tabs.chatTitle' => 'Mascot',
          'tabs.chatText' => 'A calm conversation that is not kept.',
          'tabs.hardTalkLabel' => 'HARD CONVERSATION',
          'tabs.hardTalkTitle' => 'Prepare a hard conversation',
          'tabs.hardTalkText' => 'The mascot helps you sort out what to say.',
          'tabs.notesLabel' => 'FOR YOUR PARTNER',
          'tabs.notesTitle' => 'A note or a drawing',
          'tabs.notesText' => 'Send something short and kind, whenever you like.',
          'tabs.usLabel' => 'US',
          'tabs.usTitle' => 'I miss us',
          'tabs.usText' => 'A light tap for your partner, no pressure.',
          'tabs.touchLabel' => 'TOUCH',
          'tabs.touchTitle' => 'Touch cards',
          'tabs.touchText' => 'Neutral, to do or skip.',
          'tabs.distanceLabel' => 'DISTANCE',
          'tabs.distanceTitle' => 'Our two clocks',
          'tabs.distanceText' => 'Time zones and the countdown to seeing each other.',
          'tabs.parentsLabel' => 'WITH PARENTS',
          'tabs.parentsTitle' => 'Five minutes for us',
          'tabs.parentsText' => 'A short moment just for the two of you, even in a full house.',
          'tabs.capsulesLabel' => 'TIME CAPSULE',
          'tabs.capsulesTitle' => 'A message to the future',
          'tabs.capsulesText' => 'Stays closed until the day you choose.',
          'tabs.datesLabel' => 'DATES',
          'tabs.datesTitle' => 'Important dates',
          'tabs.datesText' => 'Birthdays, gifts and holidays, with a heads-up.',
          'tabs.badDayLabel' => 'HELP',
          'tabs.badDayTitle' => 'A hard day',
          'tabs.badDayText' => 'Three small things to do right now.',
          'tabs.starterLabel' => 'TALK',
          'tabs.starterTitle' => 'Start a conversation',
          'tabs.starterText' => 'A question to open with, no rush.',
          'tabs.dayLabel' => 'DAY',
          'tabs.dayTitle' => 'Day by day',
          'tabs.dayText' => 'What matters on each day.',
          'tabs.plusLabel' => 'PLAN',
          'tabs.plusTitle' => 'Free and Plus',
          'tabs.plusText' => 'What each plan includes, no pressure.',
          'tabs.temperatureLabel' => 'BETWEEN YOU',
          'tabs.temperatureTitle' => 'How is it between you?',
          'tabs.temperatureText' => 'A private check-in, never a score.',
          'tabs.learningLabel' => 'JUST FOR YOU',
          'tabs.learningTitle' => 'What you learned',
          'tabs.learningText' => 'Private notes you can delete.',
          'tabs.fightStyleLabel' => 'JUST FOR YOU',
          'tabs.fightStyleTitle' => 'How I react in a fight',
          'tabs.fightStyleText' => 'A short, private reflection on your own way.',
          'tabs.guidesLabel' => 'CONVERSATIONS',
          'tabs.guidesTitle' => 'Difficult conversations',
          'tabs.guidesText' => 'One step at a time, just for you.',
          'tabs.gamesLabel' => 'GAMES',
          'tabs.gamesTitle' => 'Play together',
          'tabs.gamesText' => 'Short games, no scores and no winner.',
          'tabs.gamesLock' => 'Needs both of you',
          'tabs.sectionForYou' => 'For you two',
          'tabs.sectionTools' => 'Tools',
          'tabs.sectionMore' => 'More',
          'tabs.sectionPrivate' => 'Only yours',
          'tabs.sectionPatterns' => 'My patterns',
          'tabs.logisticsMeta' => '15 min · weekly',
          'tabs.ritualsMeta' => 'Small habits',
          'tabs.dateNightMeta' => 'For you two',
          'tabs.programsMeta' => 'Micro-lessons',
          'tabs.checkinMeta' => 'Once a week',
          'tabs.questionMeta' => 'One for both',
          'tabs.gamesMeta' => 'No score',
          'tabs.datesMeta' => 'With a heads-up',
          'tabs.giftsMeta' => 'Only for you',
          'tabs.guidesMeta' => 'One step at a time',
          'tabs.starterMeta' => 'One question',
          'tabs.dayMeta' => 'One day at a time',
          'tabs.capsulesMeta' => 'For the future',
          'tabs.temperatureMeta' => 'Private, no score',
          'tabs.widgetsMeta' => 'On the home screen',
          'tabs.usMeta' => 'One touch',
          'tabs.touchMeta' => 'Neutral cards',
          'tabs.badDayMeta' => 'Three small things',
          'tabs.distanceMeta' => 'Time zones and reunion',
          'tabs.parentsMeta' => 'Five minutes',
          'tabs.diaryMeta' => 'Only yours',
          'tabs.hardTalkMeta' => 'Notes before you talk',
          'tabs.notesMeta' => 'When you want',
          'tabs.learningMeta' => 'Private notes',
          'tabs.partnerMeta' => 'Only for you',
          'tabs.fightStyleMeta' => 'How you react',
          'tabs.loveStyleMeta' => 'How you feel loved',
          'tabs.chatMeta' => 'A calm conversation',
          'tabs.listsNone' => 'None yet',
          'temperature.levelTitle' => 'How is it between you?',
          'temperature.levelHighlight' => 'between you',
          'temperature.levelNote' => 'Private. Never becomes a score.',
          'temperature.levels.good' => 'Good',
          'temperature.levels.so_so' => 'So-so',
          'temperature.levels.turbulent' => 'Turbulent',
          'temperature.levels.fight' => 'An argument',
          'temperature.levels.other' => '',
          'temperature.continueAction' => 'Continue',
          'temperature.back' => 'Back',
          'temperature.skip' => 'Not now',
          'temperature.intensityTitle' => 'How strong is it?',
          'temperature.intensityHighlight' => 'strong',
          'temperature.intensityHint' => 'Under 7 you can talk. Over 7, take a pause first.',
          'temperature.intensityHigh' => 'High value: how about a pause first?',
          'temperature.intensityLow' => 'Mild',
          'temperature.intensityTop' => 'Very strong',
          'temperature.intensityLabel' => 'Intensity',
          'temperature.result.good.title' => 'That\'s good',
          'temperature.result.good.text' => 'Saved just for you. Carry on with your day.',
          'temperature.result.pause.title' => 'First, breathe',
          'temperature.result.pause.text' => 'When it\'s very hot, waiting helps. Some time apart is worth it before any conversation.',
          'temperature.result.guided.title' => 'You can talk with care',
          'temperature.result.guided.text' => 'One step at a time, at your pace.',
          'temperature.result.quick.title' => 'A small fix is enough',
          'temperature.result.quick.text' => 'Something light and quick can do it.',
          'temperature.result.done' => 'Done',
          'temperature.errors.RATE_LIMITED' => 'Too many attempts in a row. Wait a moment.',
          'temperature.errors.other' => 'Couldn\'t save right now. Your answers are still here.',
          'timeInApp.title' => 'Time in the app',
          'timeInApp.titleHighlight' => 'app',
          'timeInApp.text' => 'We hide cards and reminders until you come back.',
          'timeInApp.pause' => 'Pause the app',
          'timeInApp.cancel' => 'Cancel',
          'today.greetingMorning' => ({required Object name}) => 'Good morning, ${name}',
          'today.greetingAfternoon' => ({required Object name}) => 'Good afternoon, ${name}',
          'today.greetingEvening' => ({required Object name}) => 'Good evening, ${name}',
          'today.greetingNoName' => 'Hello',
          'today.dateLine' => ({
            required Object weekday,
            required Object month,
            required Object day,
          }) => '${weekday}, ${month} ${day}',
          'today.weekdays.0' => 'Monday',
          'today.weekdays.1' => 'Tuesday',
          'today.weekdays.2' => 'Wednesday',
          'today.weekdays.3' => 'Thursday',
          'today.weekdays.4' => 'Friday',
          'today.weekdays.5' => 'Saturday',
          'today.weekdays.6' => 'Sunday',
          'today.months.0' => 'January',
          'today.months.1' => 'February',
          'today.months.2' => 'March',
          'today.months.3' => 'April',
          'today.months.4' => 'May',
          'today.months.5' => 'June',
          'today.months.6' => 'July',
          'today.months.7' => 'August',
          'today.months.8' => 'September',
          'today.months.9' => 'October',
          'today.months.10' => 'November',
          'today.months.11' => 'December',
          'today.togetherYears' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 year',
                  other: '${count} years',
                ),
          'today.togetherMonths' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 month',
                  other: '${count} months',
                ),
          'today.togetherDays' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 day',
                  other: '${count} days',
                ),
          'today.togetherChipAction' => 'Open our story',
          'today.togetherJoin' => ({
            required Object first,
            required Object second,
          }) => '${first} and ${second}',
          'today.invitePerson' => 'Invite your person',
          'today.pendingInviteTitle' => 'Invite sent',
          'today.pendingInviteText' => 'They have not joined yet. Send again or revoke.',
          'today.pendingInviteAction' => 'See invite',
          'today.answer' => 'Answer',
          'today.slipsThisWeek' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  zero: 'No slips yet',
                  one: '1 slip this week',
                  other: '${count} slips this week',
                ),
          'today.weekHintEmpty' => 'no rush',
          'today.weekHint' => 'card on Sunday',
          _ => null,
        } ??
        switch (path) {
          'today.forToday' => 'For today',
          'today.ideaLabel' => 'Idea of the day',
          'today.slipsThisWeekPrivate' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  zero: 'Your private slips: none this week',
                  one: 'Your private slips: 1 this week',
                  other: 'Your private slips: ${count} this week',
                ),
          'today.sundayCardLabel' => 'Sunday card',
          'today.sundayCardTitle' => 'Your card for this week',
          'today.inviteCardLabel' => 'Invite',
          'today.inviteCardTitle' => ({required Object name}) => 'Invite ${name}',
          'today.inviteCardTitleNoName' => 'Invite your person',
          'today.inviteCardText' => 'Shared cards and tools need both of you.',
          'today.privateTag' => 'Only yours',
          'today.privateQuestion' => 'How was your day, really?',
          'today.privateHighlight' => 'day',
          'today.privateAction' => 'Note a slip',
          'today.emptyWeekTag' => 'No rush',
          'today.emptyWeekQuestion' => 'What was one good thing today?',
          'today.emptyWeekHighlight' => 'good',
          'today.emptyWeekAction' => 'Note a slip',
          'today.nothingReceived' => 'No new cards. No rush.',
          'today.cardReceived' => 'You received a card',
          'today.cardReceivedAction' => 'See card',
          'today.firstDayLabel' => 'Getting started',
          'today.firstDayGreeting' => ({required Object name}) => 'Hi, ${name}',
          'today.firstDaySubtitle' => 'so glad you are here',
          'today.firstDayTag' => 'Good start',
          'today.firstDayTitle' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'You have 1 slip.',
                  other: 'You have ${count} slips.',
                ),
          'today.firstDayHighlight' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '1 slip',
                  other: '${count} slips',
                ),
          'today.firstDayText' =>
            'A slip is one good thing, in one line. On Sunday they become a card.',
          'today.firstDayAction' => 'Note one more',
          'today.errorTitle' => 'Could not load Today',
          'today.errorText' => 'Your slips are safe. Try again.',
          'today.cardReceivedNamed' => ({required Object name}) => '${name} sent you a card',
          'today.pauseOwnTitle' => 'You asked for some space',
          'today.pauseOwnText' => ({
            required Object time,
          }) => 'You\'re back around ${time}. Nothing to do right now.',
          'today.pausePartnerTitle' => 'Your partner asked for some space',
          'today.pausePartnerText' => 'No rush. There\'s nothing to do right now.',
          'today.signalReceived' => 'Your partner sent you a message',
          'today.signalReceivedAction' => 'View',
          'today.pauseBack' => 'Come back now',
          'today.pauseBackRepair' => 'Come back and repair',
          'today.pauseWriteSlip' => 'Write a slip',
          'today.weekHintToday' => 'card goes out today, 18:00',
          'unpair.appBarTitle' => 'Unpair',
          'unpair.title' => ({required Object name}) => 'Unpair from ${name}?',
          'unpair.text' => 'Shared cards and lists stop. Your notes stay with you.',
          'unpair.confirm' => 'Unpair',
          'unpair.cancel' => 'Cancel',
          'unpair.unnamedPartner' => 'your person',
          'unpair.done.title' => 'Unpaired',
          'unpair.done.highlight' => 'Unpaired',
          'unpair.done.text' => 'Your own data stays yours.',
          'unpair.done.keepOption' => 'Keep a copy of the shared items',
          'unpair.done.deleteOption' => 'Delete shared items',
          'unpair.done.plusNote' => 'The Plus that covered your partner ends.',
          'unpair.done.continueLabel' => 'Continue',
          'unpair.relationship.title' => 'Relationship',
          'unpair.relationship.unpair' => ({required Object name}) => 'Unpair from ${name}',
          'unpair.relationship.ended' => 'The relationship ended',
          'unpair.breakup.appBarTitle' => 'We broke up',
          'unpair.breakup.title' => 'I am sorry',
          'unpair.breakup.highlight' => 'sorry',
          'unpair.breakup.text' =>
            'You decide what to keep. Nothing is deleted without you wanting it.',
          'unpair.breakup.cancel' => 'Cancel',
          'unpair.breakup.continueLabel' => 'Continue',
          'unpair.partnerNotice.title' => ({required Object name}) => '${name} unpaired',
          'unpair.partnerNotice.titleNoName' => 'Your partner unpaired',
          'unpair.partnerNotice.highlight' => 'unpaired',
          'unpair.partnerNotice.text' => 'Your data stays yours. Shared cards stopped.',
          'unpair.partnerNotice.ok' => 'Ok',
          'unpair.errors.NETWORK' => 'No connection. Check your internet and try again.',
          'unpair.errors.STILL_PAIRED' => 'The relationship is still active. Try again.',
          'unpair.errors.other' => 'Could not unpair right now. Try again.',
          'welcome.headline' => 'Small good things, said out loud.',
          'welcome.headlineHighlight' => 'said out loud',
          'welcome.subtitle' => 'A light way to notice what the other does well, every week.',
          'welcome.start' => 'Get started',
          'welcome.haveAccount' => 'I already have an account',
          'welcome.debugSignIn' => 'Sign in (debug)',
          'widgets.settingsTitle' => 'Widgets',
          'widgets.settingsSubtitle' => 'Home screen',
          'widgets.juntosCategory' => 'HOME SCREEN',
          'widgets.juntosTitle' => 'Repara widgets',
          'widgets.juntosSubtitle' => 'Calm reminders for you or for the two of you.',
          'widgets.galleryTitle' => 'Widgets',
          'widgets.segmentOwn' => 'Just mine',
          'widgets.segmentCouple' => 'Couple',
          'widgets.howToAddAction' => 'How to add to screen',
          'widgets.configureAction' => 'Configure',
          'widgets.ownSlipLabel' => 'LOG SLIP',
          'widgets.ownSlipTitle' => '+ Slip',
          'widgets.ownSlipSubtitle' => 'Tap to log',
          'widgets.ownIdeaLabel' => 'DAILY IDEA',
          'widgets.ownIdeaDefault' => 'Leave a small note today',
          'widgets.ownIdeaHint' => 'Tap to open',
          'widgets.ownJarLabel' => 'BAD DAY JAR',
          'widgets.ownJarTitle' => 'Open a saved slip',
          'widgets.ownJarPrivacy' => 'Private: only on your device',
          'widgets.lockScreenLabel' => 'LOCK SCREEN',
          'widgets.lockScreenDefault' => 'Calm reminder · No names',
          'widgets.coupleCounterLabel' => 'COUNTER',
          'widgets.coupleCounterUnset' => 'Set your relationship date to see days together',
          'widgets.coupleCounterDays' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '${count} day together',
                  other: '${count} days together',
                ),
          'widgets.couplePhotosLabel' => 'COUPLE PHOTOS · PLUS',
          'widgets.couplePhotosPrompt' => 'Choose a photo of you two',
          'widgets.couplePhotosPlusHint' => 'Available with Plus',
          'widgets.partnerNoteLabel' => 'PARTNER NOTE',
          'widgets.partnerNoteEmpty' => 'No new note right now',
          'widgets.partnerNoteFrom' => ({required Object name}) => 'From ${name}',
          'widgets.partnerNoteFromDefault' => 'From your partner',
          'widgets.cardEncounterLabel' => 'CARD & DATE',
          'widgets.cardStateReady' => 'A card arrived · Tap to open',
          'widgets.cardStateSent' => 'Card sent · Waiting for Sunday',
          'widgets.cardStatePause' => 'Pause in progress',
          'widgets.cardStateNone' => 'Sunday card in preparation',
          'widgets.discreetBanner' =>
            'Discreet mode is on: names, photos and notes are hidden in widgets.',
          'widgets.unpairedBanner' => 'No partner connected: couple widgets show a neutral state.',
          'widgets.offlineBanner' => 'Showing the last saved data. Updates when back online.',
          'widgets.howToAddTitle' => 'How to add',
          'widgets.howToAddStep1Title' => 'Hold the home screen',
          'widgets.howToAddStep1Body' => 'Touch and hold an empty space until the icons jiggle.',
          'widgets.howToAddStep2Title' => 'Tap the + button',
          'widgets.howToAddStep2Body' => 'In the top corner, search for QS-Flutter.',
          'widgets.howToAddStep3Title' => 'Pick a size',
          'widgets.howToAddStep3Body' => 'Small or medium.',
          'widgets.howToAddAndroidLockNote' => 'On modern Android, widgets live on the home screen. The lock screen only shows neutral notification icons.',
          'widgets.howToAddIosLockNote' =>
            'On iOS 16 or newer, you can also add the lock-screen widget.',
          'widgets.howToAddDone' => 'Got it',
          'widgets.configureTitle' => 'Configure widget',
          'widgets.configurePreviewLabel' => 'PREVIEW',
          'widgets.configureContentSection' => 'Content',
          'widgets.configureContentFavorites' => 'Favorites',
          'widgets.configureContentRecent' => 'Recent',
          'widgets.configureContentDailyIdea' => 'Daily idea',
          'widgets.configureRotationSection' => 'Photo rotation',
          'widgets.configureRotationDaily' => 'Every day',
          'widgets.configureRotationSixHours' => 'Every 6h',
          'widgets.configureRotationManual' => 'Manual',
          'widgets.configurePrivacySection' => 'Privacy',
          'widgets.configureShowNames' => 'Show names',
          'widgets.configureHideInDiscreet' => 'Hide in discreet mode',
          'widgets.configureAllowPartnerNotes' => 'Allow partner notes',
          'widgets.configureOnLockScreen' => 'Allow on lock screen',
          'widgets.configureSave' => 'Save',
          'widgets.configureSavedToast' => 'Widget preferences saved.',
          'widgets.loadErrorTitle' => 'Could not load widgets',
          'widgets.loadErrorBody' => 'Check your connection and try again.',
          'widgets.retryAction' => 'Try again',
          'widgets.themeLight' => 'Light',
          'widgets.themeDark' => 'Dark',
          'widgets.discreetReminderLabel' => 'Reminder',
          'widgets.discreetNeutralBody' => 'Neutral text',
          'widgets.signedOutLabel' => 'Repara',
          'widgets.signedOutBody' => 'Tap to sign in',
          'widgets.ownSmallPageTitle' => 'Widget · Mine (small)',
          'widgets.ownSmallSlipAction' => 'Log',
          'widgets.ownSmallDateDefaultTitle' => 'Next date',
          'widgets.ownSmallDateDays' =>
            ({required num count}) =>
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '${count} day',
                  other: '${count} days',
                ),
          'widgets.ownSmallMoodLabel' => 'MOOD',
          'widgets.ownSmallMoodPrompt' => 'How are you?',
          'widgets.ownSmallMoodOptions' => 'Happy · Tired · Sad',
          'widgets.ownSmallRitualLabel' => 'RITUAL',
          'widgets.ownSmallRitualDefaultTitle' => 'Sunday walk',
          'widgets.ownSmallRitualDefaultTime' => 'Sun · 10:00',
          'widgets.ownMediumPageTitle' => 'Widget · Mine (medium)',
          'widgets.ownMediumIdeaAction' => 'Tap to view',
          'widgets.ownMediumJarTitle' => 'Tap to open a saved slip',
          'widgets.ownMediumJarPrivacy' => 'Private: only appears on your device',
          'widgets.lockScreenPageTitle' => 'Lock screen',
          'widgets.lockScreenClockTime' => '19:38',
          'widgets.lockScreenClockDate' => 'Friday, April 10',
          'widgets.lockScreenPauseTitle' => 'Pause in progress',
          'widgets.lockScreenPauseUntil' => ({required Object time}) => 'until ${time}',
          'widgets.lockScreenPauseUntilDefault' => 'until 20:00',
          'widgets.lockScreenReadyAction' => 'I am ready',
          'widgets.lockScreenGenericPhrase' => 'Calm moment',
          'widgets.lockScreenDiscreetPhrase' => 'Reminder',
          'widgets.lockScreenPrivacyRule' => 'Never shows names or messages on the lock screen.',
          'widgets.lockScreenDisabledNote' =>
            'The lock-screen widget is turned off in widget settings.',
          'widgets.lockScreenFamiliesTitle' => 'iOS formats (Circular, Rectangular and Inline)',
          'widgets.counterPageTitle' => 'Widget · Counter',
          'widgets.counterYearsMonthsTitle' => ({
            required Object years,
            required Object months,
          }) => '${years} years · ${months} months',
          'widgets.counterMonthsDaysSubtitle' => ({
            required Object months,
            required Object days,
          }) => '${months} months · ${days} days',
          'widgets.counterStatusDating' => 'Dating',
          'widgets.counterStatusLivingTogether' => 'Living together',
          'widgets.counterStatusMarried' => 'Married',
          'widgets.counterStatusTogether' => 'Together',
          'widgets.counterMidnightNote' => 'The counter updates automatically at local midnight.',
          'widgets.counterSetDateAction' => 'Set relationship date',
          'widgets.photosPageTitle' => 'Widget · Couple photos',
          'widgets.photosPlusBadge' => 'PLUS',
          'widgets.photosNeutralFallbackNote' => 'When no local photo is cached (or in discreet mode), the widget shows only a neutral card with your time together.',
          'widgets.photosUnlockPlusAction' => 'Explore Plus',
          'widgets.photosChooseAction' => 'Choose photo',
          'widgets.photosRemoveAction' => 'Remove photo',
          'widgets.photosSavedToast' => 'Photo saved to the widget.',
          'widgets.photosRemovedToast' => 'Photo removed from the widget.',
          'widgets.partnerNotePageTitle' => 'Partner note',
          'widgets.partnerNoteMediumSection' => 'Medium',
          'widgets.partnerNoteReplyHint' => 'Reply with a heart',
          'widgets.partnerNoteDrawingPlaceholder' => 'drawing',
          'widgets.partnerNoteSafeNote' =>
            'Only notes your partner marked as widget-safe appear here.',
          'widgets.partnerNoteDisabledNote' =>
            'You turned off partner notes on widgets. Enable below if you want to show them.',
          'widgets.cardEncounterPageTitle' => 'Card & next date',
          'widgets.cardWeeklyLabel' => 'Weekly card',
          'widgets.cardReadyTitle' => 'A card arrived',
          'widgets.cardReadySubtitle' => 'Tap to open',
          'widgets.cardSentTitle' => 'Card sent',
          'widgets.cardSentSubtitle' => 'Waiting for Sunday',
          'widgets.cardNoneTitle' => 'Sunday card',
          'widgets.cardNoneSubtitle' => 'In preparation',
          'widgets.cardPauseTitle' => 'Pause in progress',
          'widgets.cardPauseSubtitle' => 'Tap when ready',
          'widgets.nextEncounterLabel' => 'Next date',
          'widgets.nextEncounterEmptyTitle' => 'No upcoming date',
          'widgets.nextEncounterEmptySubtitle' => 'Tap to schedule',
          'widgets.cardEncounterPrivacyNote' =>
            'This widget only shows card status and the next date — never names or card text.',
          'widgets.statesPageTitle' => 'Widget states',
          'widgets.statesAction' => 'View states (discreet & unpaired)',
          'widgets.statesDiscreetSection' => 'Discreet mode',
          'widgets.statesDiscreetToggle' => 'Enable discreet mode now',
          'widgets.statesUnpairedSection' => 'No partner',
          'widgets.statesUnpairedTitle' => 'Invite to see here',
          'widgets.statesUnpairedAction' => 'Invite',
          'widgets.statesOfflineSection' => 'Offline',
          'widgets.statesOfflineTitle' => 'Showing the last saved data',
          'widgets.statesOfflineSubtitle' => 'Updates when back online',
          'widgets.statesPrecedenceNote' => 'When both discreet mode and no-partner are active at the same time, widgets always degrade to the most neutral variant (Reminder).',
          'widgets.errors.WIDGET_PREFERENCES_SAVE_FAILED' =>
            'Could not save widget preferences right now.',
          'widgets.errors.COUPLE_PHOTO_LOAD_FAILED' => 'Could not load the couple photo right now.',
          'widgets.errors.COUPLE_PHOTO_UPLOAD_FAILED' =>
            'Could not save the couple photo right now.',
          'widgets.errors.COUPLE_PHOTO_REMOVE_FAILED' =>
            'Could not remove the couple photo right now.',
          'widgets.errors.COUPLE_PHOTO_INVALID' =>
            'Choose a JPG, PNG, WebP or HEIC image up to 8 MB.',
          'widgets.errors.COUPLE_PHOTO_READ_FAILED' => 'Could not read the selected file.',
          'widgets.errors.COUPLE_PHOTO_PICK_FAILED' => 'Could not open the photo picker.',
          'widgets.errors.COUPLE_PHOTO_SIGNED_OUT' => 'Sign in to choose a couple photo.',
          'widgets.errors.COUPLE_PHOTO_NOT_PAIRED' =>
            'Connect with your partner to choose a couple photo.',
          'widgets.errors.other' => 'Could not save widget preferences right now.',
          _ => null,
        };
  }
}
