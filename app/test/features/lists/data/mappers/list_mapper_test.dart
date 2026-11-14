import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/fragments/generated/ListFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/fragments/generated/ListItemFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/mappers/list_mapper.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_item_status.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_kind.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps a list with the flags the server computed', () {
    final list = FragmentListFragment(
      id: 'l1',
      title: 'Viagens',
      kind: EnumListKind.travel,
      isMine: true,
      isShared: true,
    ).toModel();

    expect(list.id, 'l1');
    expect(list.title, 'Viagens');
    expect(list.kind, ListKind.travel);
    expect(list.isMine, isTrue);
    expect(list.isShared, isTrue);
  });

  test('a flag the server did not return is false', () {
    final list = FragmentListFragment(
      id: 'l1',
      title: 'Viagens',
      kind: EnumListKind.travel,
    ).toModel();

    expect(list.isMine, isFalse);
    expect(list.isShared, isFalse);
  });

  test('maps a list item', () {
    final item = FragmentListItemFragment(
      id: 'i1',
      listId: 'l1',
      title: 'Lisboa',
      status: EnumListItemStatus.planned,
      position: 2,
    ).toModel();

    expect(item.id, 'i1');
    expect(item.listId, 'l1');
    expect(item.status, ListItemStatus.planned);
    expect(item.position, 2);
  });
}
