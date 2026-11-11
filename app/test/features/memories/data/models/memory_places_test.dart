import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Memory memory(String id, {String? place}) =>
      Memory(id: id, title: 'Memória $id', happenedOn: DateTime(2026), place: place);

  test('memories are grouped by place name, ignoring case and spacing', () {
    final places = groupByPlace([
      memory('1', place: 'Paraty'),
      memory('2', place: ' paraty '),
      memory('3', place: 'Lisboa'),
      memory('4'),
      memory('5', place: '   '),
    ]);

    expect(places.map((place) => place.name), ['Paraty', 'Lisboa']);
    expect(places.first.memories.map((memory) => memory.id), ['1', '2']);
  });

  test('the place with the most memories comes first', () {
    final places = groupByPlace([
      memory('1', place: 'Lisboa'),
      memory('2', place: 'Paraty'),
      memory('3', place: 'Paraty'),
    ]);

    expect(places.first.name, 'Paraty');
  });

  test('a place that reads like an address is noticed, a plain name is not', () {
    expect(looksLikeAddress('Rua das Flores, 120'), isTrue);
    expect(looksLikeAddress('Avenida Paulista'), isTrue);
    expect(looksLikeAddress('221B Baker Street'), isTrue);
    expect(looksLikeAddress('Paraty'), isFalse);
    expect(looksLikeAddress('Praia do Forte'), isFalse);
  });
}
