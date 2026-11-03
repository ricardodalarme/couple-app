import 'package:common_ui/common_ui.dart';
import 'package:material_ui/material_ui.dart' as material show showModalBottomSheet;

typedef BottomSheetContentBuilder = Widget Function(BuildContext context);

extension ContextBottomSheetExtension on BuildContext {
  void showBottomSheet<T>(BottomSheetContentBuilder builder) {
    material.showModalBottomSheet<T>(context: this, builder: builder);
  }
}
