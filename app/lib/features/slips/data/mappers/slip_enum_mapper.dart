import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_category.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_work_area.dart';

extension EnumSlipCategoryMapper on EnumSlipCategory {
  SlipCategory? toModel() => switch (this) {
    EnumSlipCategory.said => SlipCategory.said,
    EnumSlipCategory.did => SlipCategory.did,
    EnumSlipCategory.noticed => SlipCategory.noticed,
    EnumSlipCategory.helped => SlipCategory.helped,
    EnumSlipCategory.$unknown => null,
  };
}

extension SlipCategoryMapper on SlipCategory {
  String toRpc() => toRemote().toJson();

  EnumSlipCategory toRemote() => switch (this) {
    SlipCategory.said => EnumSlipCategory.said,
    SlipCategory.did => EnumSlipCategory.did,
    SlipCategory.noticed => EnumSlipCategory.noticed,
    SlipCategory.helped => EnumSlipCategory.helped,
  };
}

extension EnumWorkAreaMapper on EnumWorkArea {
  SlipWorkArea? toModel() => switch (this) {
    EnumWorkArea.planning => SlipWorkArea.planning,
    EnumWorkArea.dates => SlipWorkArea.dates,
    EnumWorkArea.kitchen => SlipWorkArea.kitchen,
    EnumWorkArea.cleaning => SlipWorkArea.cleaning,
    EnumWorkArea.kids => SlipWorkArea.kids,
    EnumWorkArea.emotional => SlipWorkArea.emotional,
    EnumWorkArea.finances => SlipWorkArea.finances,
    EnumWorkArea.other => SlipWorkArea.other,
    EnumWorkArea.$unknown => null,
  };
}

extension SlipWorkAreaMapper on SlipWorkArea {
  String toRpc() => toRemote().toJson();

  EnumWorkArea toRemote() => switch (this) {
    SlipWorkArea.planning => EnumWorkArea.planning,
    SlipWorkArea.dates => EnumWorkArea.dates,
    SlipWorkArea.kitchen => EnumWorkArea.kitchen,
    SlipWorkArea.cleaning => EnumWorkArea.cleaning,
    SlipWorkArea.kids => EnumWorkArea.kids,
    SlipWorkArea.emotional => EnumWorkArea.emotional,
    SlipWorkArea.finances => EnumWorkArea.finances,
    SlipWorkArea.other => EnumWorkArea.other,
  };
}
