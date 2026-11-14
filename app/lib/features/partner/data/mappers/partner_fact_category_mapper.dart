import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/partner/data/models/partner_fact_category.dart';

extension EnumPartnerFactCategoryMapper on EnumPartnerFactCategory {
  PartnerFactCategory? toModel() => switch (this) {
    EnumPartnerFactCategory.likes => PartnerFactCategory.likes,
    EnumPartnerFactCategory.dislikes => PartnerFactCategory.dislikes,
    EnumPartnerFactCategory.sizes => PartnerFactCategory.sizes,
    EnumPartnerFactCategory.health => PartnerFactCategory.health,
    EnumPartnerFactCategory.comfort => PartnerFactCategory.comfort,
    EnumPartnerFactCategory.people => PartnerFactCategory.people,
    EnumPartnerFactCategory.other => PartnerFactCategory.other,
    EnumPartnerFactCategory.$unknown => null,
  };
}

extension PartnerFactCategoryMapper on PartnerFactCategory {
  EnumPartnerFactCategory toRemote() => switch (this) {
    PartnerFactCategory.likes => EnumPartnerFactCategory.likes,
    PartnerFactCategory.dislikes => EnumPartnerFactCategory.dislikes,
    PartnerFactCategory.sizes => EnumPartnerFactCategory.sizes,
    PartnerFactCategory.health => EnumPartnerFactCategory.health,
    PartnerFactCategory.comfort => EnumPartnerFactCategory.comfort,
    PartnerFactCategory.people => EnumPartnerFactCategory.people,
    PartnerFactCategory.other => EnumPartnerFactCategory.other,
  };
}
