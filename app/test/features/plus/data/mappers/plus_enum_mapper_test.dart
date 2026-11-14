import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/plus/data/mappers/plus_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_plan.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every plan maps to its own domain value', () {
    expect(EnumEntitlementPlan.plus_monthly.toModel(), PlusPlan.monthly);
    expect(EnumEntitlementPlan.plus_annual.toModel(), PlusPlan.annual);
    expect(EnumEntitlementPlan.plus_gift.toModel(), PlusPlan.gift);
  });

  test('every status maps to its own domain value', () {
    expect(EnumEntitlementStatus.trialing.toModel(), PlusStatus.trialing);
    expect(EnumEntitlementStatus.active.toModel(), PlusStatus.active);
    expect(EnumEntitlementStatus.grace.toModel(), PlusStatus.grace);
    expect(EnumEntitlementStatus.billing_issue.toModel(), PlusStatus.billingIssue);
    expect(EnumEntitlementStatus.expired.toModel(), PlusStatus.expired);
    expect(EnumEntitlementStatus.refunded.toModel(), PlusStatus.refunded);
  });

  test('an unknown plan or status reads as null', () {
    expect(EnumEntitlementPlan.$unknown.toModel(), isNull);
    expect(EnumEntitlementStatus.$unknown.toModel(), isNull);
  });
}
