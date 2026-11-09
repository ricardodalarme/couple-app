import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/banner_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/confirm_sheet_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/dialog_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/empty_state_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/list_group_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/loading_dots_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/note_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/refresh_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/section_header_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/skeleton_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/toast_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/tooltip_example.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/top_notice_example.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode feedbackExamples = WidgetbookFolder(
  name: 'Feedback and lists',
  children: [
    noteExample,
    toastExample,
    loadingDotsExample,
    refreshExample,
    tooltipExample,
    topNoticeExample,
    bannerExample,
    emptyStateExample,
    skeletonExample,
    confirmSheetExample,
    dialogExample,
    sectionHeaderExample,
    listGroupAndTileExample,
  ],
);
