---
name: storybook
description: Add component and widget examples to the in-app Widgetbook (called "Storybook") at app/lib/features/dev_menu/storybook — create examples/<category>/<name>_example.dart with a WidgetbookUseCase and knobs, then register it in examples/examples.dart. Use when adding or changing a reusable component, a common_ui Base component, or a shared app widget that should have a visual example, or when the user says "storybook", "widgetbook", or "component gallery".
---

# Storybook (Widgetbook) in the app

The component gallery is an **in-app Widgetbook**, not a separate entrypoint. It
lives in the debug-only dev menu:

```text
app/lib/features/dev_menu/storybook/
├── storybook_page.dart        # Widgetbook widget, addons, appBuilder
├── theme_mode_addon.dart      # StorybookThemeModeAddon
└── examples/
    ├── examples.dart          # the single registry (register here)
    ├── components/
    │   ├── base_avatar_example.dart
    │   ├── base_button_example.dart
    │   ├── base_card_example.dart
    │   ├── base_divider_example.dart
    │   ├── base_icon_button_example.dart
    │   ├── base_list_tile_example.dart
    │   ├── base_loading_indicator_example.dart
    │   ├── base_navigation_bar_example.dart
    │   ├── base_snack_bar_example.dart
    │   ├── base_text_field_example.dart
    │   └── base_tooltip_example.dart
    ├── widgets/
    │   ├── error_indicator_example.dart
    │   ├── skeletonizer_resource_widget_example.dart
    │   └── social_button_example.dart
    └── theme/
        ├── colors_example.dart
        └── typography_example.dart
```

Anything in `packages/common_ui` that is a reusable design-system component should
have an example. Shared app widgets (`ErrorIndicator` and
`SkeletonizerResourceWidget` from `app/lib/features/_shared`, `SocialButton` from
a feature's `presentation/shared/widgets`) get one too. Categories in use:
`Components` (common_ui `Base*`), `Widgets` (shared app widgets), `Theme` (colors
and typography).

## Add an example

1. Create `examples/components/base_card_example.dart` — one `final WidgetbookNode`
   per file, named `<camelCase>Example`, holding a `WidgetbookUseCase`:

```dart
import 'package:common_ui/common_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode baseCardExample = WidgetbookUseCase(
  name: 'BaseCard',
  builder: (context) => BaseCard(
    title: context.knobs.stringOrNull(label: 'Title', initialValue: 'Card Title'),
    leading: context.knobs.boolean(label: 'Show leading icon')
        ? const Icon(Icons.info)
        : null,
    child: Text(
      context.knobs.string(label: 'Content', initialValue: 'This is the card content'),
    ),
  ),
);
```

2. Import it in `examples/examples.dart` and append it to the right folder's
   `children` list — that file is the only registry:

```dart
final List<WidgetbookNode> examples = [
  WidgetbookFolder(name: 'Components', children: [baseAvatarExample, baseButtonExample, …]),
  WidgetbookFolder(name: 'Widgets', children: [errorIndicatorExample, socialButtonExample]),
  WidgetbookFolder(name: 'Theme', children: [colorsExample, typographyExample]),
];
```

   Add a new `WidgetbookFolder` only when the example belongs to a genuinely new
   category.

3. Run it: launch the app in debug
   (`cd app && flutter run --dart-define-from-file ../.env.development --flavor development`,
   or VSCode F5), open the Dev menu (`kDebugMode` only), then tap **Storybook**.
   The page is pushed with `context.router.pushWidget(const StorybookPage())`.

## Knobs

Use `context.knobs.*` to expose the interesting props, as the existing examples
do:

| Knob | Usage |
| --- | --- |
| `boolean` | `context.knobs.boolean(label: 'Enabled', initialValue: true)` |
| `string` | `context.knobs.string(label: 'Text', initialValue: 'Example')` |
| `stringOrNull` | `context.knobs.stringOrNull(label: 'Title')` |
| `object.dropdown` | `context.knobs.object.dropdown(label: 'Type', options: SnackBarType.values)` |
| `objectOrNull.dropdown` | same, with a `null` choice |
| `double.slider` / `double.input` | numeric props like size or margins |
| `int.slider` | indices such as a selected tab |

Expose the props worth eyeballing, not every parameter. Keep examples static and
self-contained: **no cubits, no DI, no network** — use local callbacks and
`context.showSnackBar('Click success')` (from `BaseSnackBar`) for feedback. The
`SkeletonizerResourceWidget` example
(`examples/widgets/skeletonizer_resource_widget_example.dart`) does this with a
state knob that switches `Initial`/`Loading`/`Success`/`Failure` and a fake list
for the loading skeleton.

## Addons available in every example

`storybook_page.dart` configures exactly three addons: `StorybookThemeModeAddon`
(light / dark / system, synced into `ThemeModeProvider` by `theme_mode_addon.dart`),
`TextScaleAddon`, and `AlignmentAddon`. The `appBuilder` wraps each example in
`BaseApp(home: BaseView(hasAppBar: false, body: child))`.

Examples that read `context.palette` / `context.typography` therefore render
correctly in both themes and at enlarged text scale — use the tokens for visual
checks instead of hardcoded colors.

## Gotchas

- There is no standalone widgetbook `main.dart` and no `flutter run -t` target;
  the gallery only exists inside the debug app behind the dev menu.
- Register the node in `examples/examples.dart`, or it is invisible even though
  the file compiles. There is no category barrel and no second registry.
- One `final WidgetbookNode <camelCase>Example` per file, wrapping one
  `WidgetbookUseCase`; the use-case `name` should match the widget (`BaseCard`),
  not the file name.
- Builders receive the Widgetbook `BuildContext` — it has addons, plus whatever
  `appBuilder` provides. Do not assume a cubit, a repository, or route state is
  available.
- Import components from `package:common_ui/common_ui.dart`. Examples live in the
  app, so never import `flutter/material.dart` there.
- Keep `widgetbook` imports inside the dev-menu tree; production features must not
  depend on it.
- Shared app widgets — including patterns in `app/lib/features/_shared` — belong
  in the `Widgets` category; never register one under `Components` or give it a
  `Base*` name.
- Examples are read by whoever changes the component, so keep them compiling:
  update the example in the same change as the component's API.
