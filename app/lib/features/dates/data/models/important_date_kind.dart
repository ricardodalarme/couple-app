/// What an important date marks.
enum ImportantDateKind() {
  relationship,
  birthday,
  first,
  holiday,
  trip,
  reunion,
  custom,
}

/// The kinds a person can pick when adding a date by hand, in the order they are offered.
const List<ImportantDateKind> manualDateKinds = [
  ImportantDateKind.relationship,
  ImportantDateKind.birthday,
  ImportantDateKind.first,
  ImportantDateKind.trip,
  ImportantDateKind.reunion,
  ImportantDateKind.custom,
];

/// How an important date came to exist.
enum ImportantDateOrigin() {
  manual,
  auto,
  chat,
}
