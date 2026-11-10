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
  late final _Translations$common$pt common = _Translations$common$pt._(_root);
  @override
  late final _Translations$input$pt input = _Translations$input$pt._(_root);
  @override
  late final _Translations$navigation$pt navigation = _Translations$navigation$pt._(_root);
}

// Path: common
class _Translations$common$pt extends Translations$common$en {
  _Translations$common$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get loading => 'Carregando';
  @override
  String get cancel => 'Cancelar';
}

// Path: input
class _Translations$input$pt extends Translations$input$en {
  _Translations$input$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get showPassword => 'Mostrar senha';
  @override
  String get hidePassword => 'Ocultar senha';
  @override
  String get search => 'Buscar';
  @override
  String get noOptions => 'Nenhuma opção';
  @override
  String get confirm => 'Confirmar';
  @override
  String get day => 'Dia';
  @override
  String get month => 'Mês';
  @override
  String get year => 'Ano';
  @override
  String get hour => 'Hora';
  @override
  String get minute => 'Minuto';
  @override
  String get increase => 'Aumentar';
  @override
  String get decrease => 'Diminuir';
  @override
  late final _Translations$input$calendar$pt calendar = _Translations$input$calendar$pt._(_root);
}

// Path: navigation
class _Translations$navigation$pt extends Translations$navigation$en {
  _Translations$navigation$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String stepOf({required Object current, required Object total}) => 'Etapa ${current} de ${total}';
}

// Path: input.calendar
class _Translations$input$calendar$pt extends Translations$input$calendar$en {
  _Translations$input$calendar$pt._(TranslationsPt root) : this._root = root, super.internal(root);

  final TranslationsPt _root; // ignore: unused_field

  // Translations
  @override
  String get previousMonth => 'Mês anterior';
  @override
  String get nextMonth => 'Próximo mês';
  @override
  String get today => 'Hoje';
  @override
  String get unavailable => 'Indisponível';
  @override
  String monthYear({required Object month, required Object year}) => '${month} de ${year}';
  @override
  String date({required Object day, required Object month, required Object year}) =>
      '${day} de ${month} de ${year}';
  @override
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
  @override
  List<String> get weekdays => ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'common.loading' => 'Carregando',
      'common.cancel' => 'Cancelar',
      'input.showPassword' => 'Mostrar senha',
      'input.hidePassword' => 'Ocultar senha',
      'input.search' => 'Buscar',
      'input.noOptions' => 'Nenhuma opção',
      'input.confirm' => 'Confirmar',
      'input.day' => 'Dia',
      'input.month' => 'Mês',
      'input.year' => 'Ano',
      'input.hour' => 'Hora',
      'input.minute' => 'Minuto',
      'input.increase' => 'Aumentar',
      'input.decrease' => 'Diminuir',
      'input.calendar.previousMonth' => 'Mês anterior',
      'input.calendar.nextMonth' => 'Próximo mês',
      'input.calendar.today' => 'Hoje',
      'input.calendar.unavailable' => 'Indisponível',
      'input.calendar.monthYear' => ({
        required Object month,
        required Object year,
      }) => '${month} de ${year}',
      'input.calendar.date' => ({
        required Object day,
        required Object month,
        required Object year,
      }) => '${day} de ${month} de ${year}',
      'input.calendar.months.0' => 'janeiro',
      'input.calendar.months.1' => 'fevereiro',
      'input.calendar.months.2' => 'março',
      'input.calendar.months.3' => 'abril',
      'input.calendar.months.4' => 'maio',
      'input.calendar.months.5' => 'junho',
      'input.calendar.months.6' => 'julho',
      'input.calendar.months.7' => 'agosto',
      'input.calendar.months.8' => 'setembro',
      'input.calendar.months.9' => 'outubro',
      'input.calendar.months.10' => 'novembro',
      'input.calendar.months.11' => 'dezembro',
      'input.calendar.weekdays.0' => 'D',
      'input.calendar.weekdays.1' => 'S',
      'input.calendar.weekdays.2' => 'T',
      'input.calendar.weekdays.3' => 'Q',
      'input.calendar.weekdays.4' => 'Q',
      'input.calendar.weekdays.5' => 'S',
      'input.calendar.weekdays.6' => 'S',
      'navigation.stepOf' => ({
        required Object current,
        required Object total,
      }) => 'Etapa ${current} de ${total}',
      _ => null,
    };
  }
}
