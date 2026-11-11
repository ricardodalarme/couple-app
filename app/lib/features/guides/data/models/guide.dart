import 'package:equatable/equatable.dart';

/// A short line of guide content in both app languages.
final class const GuideText({required final String pt, required final String en}) with Equatable {
  String forLanguage(String languageCode) => languageCode == 'en' ? en : pt;

  @override
  List<Object?> get props => [pt, en];
}

/// A stable fingerprint of the authored prompt text.
String guideContentVersion(Iterable<String> prompts) {
  var hash = 0x811c9dc5;
  for (final prompt in prompts) {
    for (final codeUnit in prompt.codeUnits) {
      hash = ((hash ^ codeUnit) * 0x01000193) & 0xffffffff;
    }
    hash = ((hash ^ 0x1f) * 0x01000193) & 0xffffffff;
  }

  return hash.toRadixString(16).padLeft(8, '0');
}

/// A guide as authored, before the language is chosen.
final class const GuideDefinition({
  required final String slug,
  required final String guideType,
  required final GuideText title,
  required final GuideText description,
  required final List<GuideText> prompts,
  final bool isSensitive = false,
}) with Equatable {
  Guide localized(String languageCode) => Guide(
    slug: slug,
    guideType: guideType,
    title: title.forLanguage(languageCode),
    description: description.forLanguage(languageCode),
    prompts: [for (final prompt in prompts) prompt.forLanguage(languageCode)],
    contentVersion: guideContentVersion([for (final prompt in prompts) prompt.pt]),
    isSensitive: isSensitive,
  );

  @override
  List<Object?> get props => [slug, guideType, title, description, prompts, isSensitive];
}

/// A guide ready to show: one language and the steps in order.
final class const Guide({
  required final String slug,
  required final String guideType,
  required final String title,
  required final String description,
  required final List<String> prompts,
  required final String contentVersion,
  final bool isSensitive = false,
}) with Equatable {
  int get stepCount => prompts.length;

  @override
  List<Object?> get props => [
    slug,
    guideType,
    title,
    description,
    prompts,
    contentVersion,
    isSensitive,
  ];
}
