import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/fragments/generated/CardFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/slips/data/mappers/slip_enum_mapper.dart';

extension CardFragmentMapper on FragmentCardFragment {
  SundayCard toModel() => SundayCard(
    id: id,
    status: status.name,
    weekStart: weekStart,
    note: note,
    sentAt: sentAt,
    items: [
      for (final edge in items?.edges ?? const <FragmentCardFragmentitemsedges>[])
        CardItem(
          slipId: edge.node.slipId ?? '',
          body: edge.node.body,
          category: edge.node.slip?.category?.toModel(),
          writtenAt: edge.node.slip?.createdAt,
        ),
    ],
  );
}
