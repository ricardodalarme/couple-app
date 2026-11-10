---
name: storybook
description: Add component and widget examples to the in-app Widgetbook (called "Storybook") at app/lib/features/dev_menu/storybook — create examples/catalog/<category>/<name>_example.dart with a WidgetbookComponent and knobs, then register it in the category's examples file. Use when adding or changing a reusable component, a `design_system` Base component, or a shared app widget that should have a visual example, or when the user says "storybook", "widgetbook", or "component gallery".
---

# Storybook (Widgetbook) in the app

The component gallery is an **in-app Widgetbook**, not a separate entrypoint. It
lives in the debug-only dev menu:

```text
app/lib/features/dev_menu/storybook/
├── storybook_page.dart                     # Widgetbook widget and addons
├── helpers/
│   ├── addons/design_system_theme_addon.dart
│   └── widgets/gallery_widgets.dart        # GalleryPage / GallerySection / GalleryRow
└── examples/catalog/
    ├── catalog_examples.dart               # top-level registry
    ├── foundations/                        # colours, typography, tokens, icons, faces
    ├── actions/                            # BaseButton, BaseRoundButton, BaseTextLink
    ├── navigation/                         # BaseAppBar, BaseSheet, BaseStepper, BaseTabBar
    ├── identity/                           # BaseAvatar, BaseAvatarPair, BaseIconTile, …
    ├── surfaces/                           # BaseBubble, BaseDivider, BaseSurfaceCard, …
    ├── input/                              # BaseTextField, BaseCheckbox, BaseOptionTile, …
    ├── feedback/                           # BaseBanner, BaseToast, BaseRefreshable, …
    └── templates/                          # BaseFlowContent, BaseMomentContent, …
```

Anything in `packages/design_system` that is a reusable design-system component should have
an example. Shared widgets from `packages/common_ui` and feature widgets
such as `SocialButton` get one too, in the category that names their role.

## Add an example

1. Create `examples/catalog/<category>/<name>_example.dart` — one
   `final WidgetbookNode <camelCase>Example` per file, holding a
   `WidgetbookComponent` with one or more use cases:

```dart
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode buttonExample = WidgetbookComponent(
  name: 'BaseButton',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Weights and states',
      builder: (context) {
        final isLoading = context.knobs.boolean(label: 'Loading');

        return GalleryPage(
          title: 'Button',
          children: <Widget>[
            GallerySection(
              title: 'Primary',
              children: <Widget>[
                BaseButton.primary(text: 'Answer', onPressed: () {}, isLoading: isLoading),
              ],
            ),
          ],
        );
      },
    ),
  ],
);
```

2. Import it in the category's `*_examples.dart` and append it to that
   `WidgetbookFolder`'s `children`. Category files are aggregated by
   `examples/catalog/catalog_examples.dart` — that top-level list is the only
   registry:

```dart
final WidgetbookNode actionsExamples = WidgetbookFolder(
  name: 'Actions',
  children: <WidgetbookNode>[buttonExample],
);
```

   Add a new category folder only when the example belongs to a genuinely new
   role, and register the folder in `catalogExamples`.

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
| `object.dropdown` | `context.knobs.object.dropdown(label: 'Variant', options: BaseButtonVariant.values)` |
| `objectOrNull.dropdown` | same, with a `null` choice |
| `double.slider` / `double.input` | numeric props like size or margins |
| `int.slider` | indices such as a selected tab |

Expose the props worth eyeballing, not every parameter. Keep examples static and
self-contained: **no cubits, no DI, no network** — use local callbacks and
`BaseToast.show(context, 'Message')` for feedback.
The resource example uses a state knob that switches
`Initial`/`Loading`/`Success`/`Failure` and a fake value for the skeleton.

## Addons available in every example

`storybook_page.dart` configures exactly three addons:

- `DesignSystemThemeAddon` — switches `AppThemeVariant.rose/blue/neutral` and
  wraps the example in `AppThemed`.
- `TextScaleAddon` — checks enlarged text.
- `AlignmentAddon` — checks the layout at phone and tablet widths.

The `appBuilder` wraps each example in a `ColoredBox` with
`context.colors.bgScreen`. Examples therefore read `context.colors` /
`context.text` and render correctly in every theme at enlarged text scale — use
the tokens for visual checks instead of hardcoded colors.

## Gotchas

- There is no standalone widgetbook `main.dart` and no `flutter run -t` target;
  the gallery only exists inside the debug app behind the dev menu.
- Register the node in its category's `*_examples.dart`, or it is invisible even
  though the file compiles. There is no second registry.
- One `final WidgetbookNode <camelCase>Example` per file. A
  `WidgetbookComponent` groups several `WidgetbookUseCase`s of the same widget.
- Builders receive the Widgetbook `BuildContext` — it has addons, plus whatever
  `appBuilder` provides. Do not assume a cubit, a repository, or route state is
  available.
- Import components from `package:design_system/design_system.dart`. Examples live in the app, so never
  import `flutter/material.dart`, `flutter/cupertino.dart`, or `material_ui`.
- Keep `widgetbook` imports inside the dev-menu tree; production features must not
  depend on it.
- Shared widgets in `packages/common_ui` — and feature-local widgets — belong
  in the category that names their role; never register one as a `Base*`
  component.
- Examples are read by whoever changes the component, so keep them compiling:
  update the example in the same change as the component's API.
