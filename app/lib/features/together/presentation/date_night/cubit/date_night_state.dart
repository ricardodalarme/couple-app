part of 'date_night_cubit.dart';

final class const DateNightState({
  final Resource<List<DateIdea>> ideas = const Loading(),
  final List<DateIdeaSuggestion> suggestions = const [],
  final String title = '',
  final Resource<void> addAction = const Initial(),
  final Resource<void> changeAction = const Initial(),
}) with Equatable {
  /// Whether the typed idea can be saved.
  bool get canAdd => title.trim().isNotEmpty && title.length <= dateIdeaTitleMaxLength;

  DateNightState copyWith({
    Resource<List<DateIdea>>? ideas,
    List<DateIdeaSuggestion>? suggestions,
    String? title,
    Resource<void>? addAction,
    Resource<void>? changeAction,
  }) {
    return DateNightState(
      ideas: ideas ?? this.ideas,
      suggestions: suggestions ?? this.suggestions,
      title: title ?? this.title,
      addAction: addAction ?? this.addAction,
      changeAction: changeAction ?? this.changeAction,
    );
  }

  @override
  List<Object?> get props => [ideas, suggestions, title, addAction, changeAction];
}
