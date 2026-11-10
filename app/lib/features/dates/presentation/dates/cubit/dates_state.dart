part of 'dates_cubit.dart';

final class const DatesState({
  final DatesView view = DatesView.dates,
  final Resource<List<ImportantDate>> dates = const Loading(),
  final Resource<List<GiftIdea>> gifts = const Loading(),
  final Resource<List<Holiday>> holidays = const Loading(),
  final String title = '',
  final String kind = 'birthday',
  final int? month,
  final int? day,
  final String year = '',
  final String giftTitle = '',
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// The typed year, or null when it is empty or not a plausible year.
  int? get yearValue {
    final value = int.tryParse(year.trim());

    return value != null && value >= 1900 && value <= 2200 ? value : null;
  }

  /// Whether the date being typed can be saved.
  bool get canSaveDate {
    final month = this.month;
    final day = this.day;
    final yearIsValid = year.trim().isEmpty || yearValue != null;

    return title.trim().isNotEmpty &&
        title.length <= dateTitleMaxLength &&
        month != null &&
        day != null &&
        isValidMonthDay(month, day) &&
        yearIsValid;
  }

  DatesState copyWith({
    DatesView? view,
    Resource<List<ImportantDate>>? dates,
    Resource<List<GiftIdea>>? gifts,
    Resource<List<Holiday>>? holidays,
    String? title,
    String? kind,
    int? month,
    int? day,
    String? year,
    String? giftTitle,
    Resource<void>? saveAction,
  }) {
    return DatesState(
      view: view ?? this.view,
      dates: dates ?? this.dates,
      gifts: gifts ?? this.gifts,
      holidays: holidays ?? this.holidays,
      title: title ?? this.title,
      kind: kind ?? this.kind,
      month: month ?? this.month,
      day: day ?? this.day,
      year: year ?? this.year,
      giftTitle: giftTitle ?? this.giftTitle,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [
    view,
    dates,
    gifts,
    holidays,
    title,
    kind,
    month,
    day,
    year,
    giftTitle,
    saveAction,
  ];
}
