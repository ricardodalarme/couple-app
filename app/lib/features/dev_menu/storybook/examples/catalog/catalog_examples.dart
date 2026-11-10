import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/actions/actions_examples.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/feedback/feedback_examples.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/foundations_examples.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/identity/identity_examples.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/input/input_examples.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/navigation/navigation_examples.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/surfaces/surfaces_examples.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/templates/templates_examples.dart';
import 'package:widgetbook/widgetbook.dart';

final List<WidgetbookNode> catalogExamples = [
  foundationsExamples,
  actionsExamples,
  navigationExamples,
  identityExamples,
  surfacesExamples,
  inputExamples,
  feedbackExamples,
  templatesExamples,
];
