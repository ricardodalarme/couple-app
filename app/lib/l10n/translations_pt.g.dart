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
  late final Translations$common$pt common = Translations$common$pt.internal(_root);
  late final Translations$notFound$pt notFound = Translations$notFound$pt.internal(_root);
  late final Translations$tabs$pt tabs = Translations$tabs$pt.internal(_root);
  late final Translations$welcome$pt welcome = Translations$welcome$pt.internal(_root);
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

  /// pt: 'Guarde o que é bom. Entregue no domingo.'
  String get tagline => 'Guarde o que é bom. Entregue no domingo.';

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
      'tabs.today' => 'Hoje',
      'tabs.slips' => 'Slips',
      'tabs.together' => 'Juntos',
      'tabs.memories' => 'Memórias',
      'tabs.capture' => 'Novo slip',
      'tabs.soonTitle' => 'Em construção',
      'tabs.soonText' => 'Esta parte do app ainda está sendo preparada.',
      'welcome.tagline' => 'Guarde o que é bom. Entregue no domingo.',
      'welcome.debugSignIn' => 'Entrar (debug)',
      _ => null,
    };
  }
}
