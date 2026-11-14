---
name: storybook
description: Adds component and widget examples to the in-app Widgetbook, called Storybook, in the debug dev menu. Covers creating an example file with a WidgetbookComponent and knobs, registering it in its category, and what examples may use. Use when adding or changing a design_system Base component, a shared common_ui widget or a reusable feature widget that should have a visual example, or when asked for storybook, widgetbook or a component gallery.
---

# Storybook (Widgetbook)

The gallery is an in-app Widgetbook, not a separate entrypoint. It lives under `app/lib/features/dev_menu/storybook/` and opens from
the debug-only Dev menu (**Storybook**, pushed with `context.router.pushWidget(const StorybookPage())`). Examples are in
`examples/catalog/<category>/`, one folder per role: `foundations`, `actions`, `navigation`, `identity`, `surfaces`, `input`,
`feedback`, `templates`. `examples/catalog/catalog_examples.dart` is the only registry, and `helpers/widgets/gallery_widgets.dart`
provides `GalleryPage`, `GallerySection` and `GalleryRow`.

Every reusable `design_system` component, every shared `common_ui` widget and reusable feature widgets (such as `SocialButton`)
get an example, in the category that names their role. A `common_ui` or feature widget is never registered as a `Base*` component.

## Adding an example

1. Create `examples/catalog/<category>/<name>_example.dart` with one `final WidgetbookNode <camelCase>Example` holding a
   `WidgetbookComponent` and one or more `WidgetbookUseCase`s:

```dart
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
              children: <Widget>[BaseButton.primary(text: 'Answer', onPressed: () {}, isLoading: isLoading)],
            ),
          ],
        );
      },
    ),
  ],
);
```

2. Import it in the category's `*_examples.dart` and add it to that `WidgetbookFolder`'s `children`. Without this the file compiles but
   the example is invisible. Add a new category folder only for a genuinely new role, and register it in `catalogExamples`.
3. Run the app in debug (`cd app && flutter run --dart-define-from-file ../.env.development --flavor development`), open the Dev
   menu and tap **Storybook**.

## What an example may use

- Knobs (`context.knobs.boolean`, `string`, `object.dropdown`, `double.slider`, and their `...OrNull` forms) for the props worth
  looking at, not every parameter.
- Static, self-contained content: **no cubits, no DI, no repositories, no network**. Use local callbacks and
  `BaseToast.show(context, 'Message')` for feedback. A resource example switches `Initial`, `Loading`, `Success` and `Failure` with a
  state knob and a fake value for the skeleton.
- The theme tokens (`context.colors`, `context.text`). Three addons wrap every example: `DesignSystemThemeAddon` (the
  `rose`/`blue`/`neutral` variants), `TextScaleAddon` (enlarged text) and `AlignmentAddon` (phone and tablet widths), so tokens render
  correctly everywhere and hardcoded colors do not.
- Imports from `package:design_system/design_system.dart`, never `flutter/material.dart`, `flutter/cupertino.dart` or `material_ui`.

## Gotchas

- There is no standalone Widgetbook `main.dart` or `flutter run -t` target.
- The builder's `BuildContext` has the addons and what `appBuilder` provides, nothing else: no cubit, repository or route state.
- Keep `widgetbook` imports inside the dev-menu tree; production features never depend on it.
- Update the example in the same change as the component's API, so the gallery keeps compiling.
