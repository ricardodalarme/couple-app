import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/fragments/generated/ListFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/fragments/generated/ListItemFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/mappers/list_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';

extension ListFragmentMapper on FragmentListFragment {
  CoupleList toModel() => CoupleList(
    id: id,
    title: title,
    kind: kind.toModel(),
    isMine: isMine ?? false,
    isShared: isShared ?? false,
  );
}

extension ListItemFragmentMapper on FragmentListItemFragment {
  ListItem toModel() =>
      ListItem(id: id, listId: listId, title: title, status: status.toModel(), position: position);
}
