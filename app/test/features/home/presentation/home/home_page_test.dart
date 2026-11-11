import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/home/presentation/home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the shell tabs use the board icons, with capture in the middle', () {
    expect(homeTabIcons, [
      AppIcons.home,
      AppIcons.note,
      AppIcons.plus,
      AppIcons.rings,
      AppIcons.bookmark,
    ]);
  });

  test('slips, together and memories no longer share generic glyphs', () {
    expect(homeTabIcons, isNot(contains(AppIcons.heart)));
    expect(homeTabIcons, isNot(contains(AppIcons.users)));
    expect(homeTabIcons, isNot(contains(AppIcons.book)));
  });
}
