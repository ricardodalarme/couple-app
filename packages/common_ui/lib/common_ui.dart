/// Shared widgets that are not part of the design system.
///
/// Lists, the resource-state renderer, the web view and generated assets live
/// here because they depend on app-level types or third-party packages.
library;

export 'src/generated/assets.gen.dart';
export 'src/widgets/base_list_view.dart';
export 'src/widgets/infinite_list_view.dart';
export 'src/widgets/skeletonizer_resource_widget.dart';
export 'src/widgets/web_view.dart';
