---
name: design-system
description: Builds UI in the app with the design_system package and decides what belongs in it. Covers the no-Material-in-app rule, semantic colors, text styles and tokens, page layout idioms (BaseView, content widgets, lists, empty and loading states, toasts, sheets), creating or promoting a Base component, and the boundary between design_system and common_ui. Use whenever writing widgets, layout or styling in app/lib, when creating, reviewing, promoting or demoting a reusable widget, or when asked about colors, spacing, theme, icons, buttons, cards or a visual component.
---

# Design system

`packages/design_system` is the only UI layer the app uses. Material and Cupertino exist inside that package only, which keeps
the app consistent and skinnable. Read the source before assuming a token or component exists; the code, not this file, is the
inventory:

- `lib/src/tokens/` space, radius, border, color, typography, motion, icon size, shadows, layers
- `lib/src/theme/` `AppTheme`, `AppThemeHost`, `AppPressable`, `BaseApp`
- `lib/src/components/<group>/` the `Base*` components; `lib/src/templates/` the content widgets and `BaseSheetTemplate`
- `lib/src/icons/` generated `AppIcons`; `lib/design_system.dart` the barrel (if it is not exported there, app code cannot use it)
- `packages/common_ui/` shared non-design widgets (`BaseListView`, `InfiniteListView`, `SkeletonizerResourceWidget`, `WebView`)
  and the generated `Assets`

To decide where a new reusable widget belongs, or whether to promote one, read [component-boundary.md](references/component-boundary.md).

## Rules

1. In `app/lib`, never import `flutter/material.dart`, `flutter/cupertino.dart` or `material_ui`. Import
   `package:design_system/design_system.dart`, which re-exports `flutter/widgets.dart`, `ThemeMode`, `GlobalMaterialLocalizations`,
   `skeletonizer`, `flutter_svg`, `cached_network_image_ce`, the icons, the tokens and every `Base*` component. Never use
   `Scaffold`, `AppBar`, `MaterialApp` or `AutoTabsScaffold` in app code; `BaseView` and `BaseApp` own them.
2. Colors come from `context.colors`, text from `context.text`; never `Color(0xFF...)`, `Colors.*` or numeric font sizes. Fixed
   status and category colors come from `AppPalette`, `AppStatus` and `AppCategory`; a brand-only value is a named local constant.
3. Spacing, radii, borders, timing and icon sizes come from `AppSpace`, `AppRadius`, `AppBorder`, `AppMotion` and `AppIconSize`
   (`AppSpace.s16`, `AppRadius.card`, `AppMotion.fast`), never magic numbers. Page gutters are `AppSpace.screenMargin`.
4. Interactive controls are at least 44pt (`AppIconSize.touch`) with a visible focus state in every variant. Copy is sentence case,
   except micro-labels (eyebrows, badges, tags).
5. Keep a widget feature-local until it earns promotion. `Base*` names exist only in `design_system`; new shared widgets in
   `common_ui` do not take the prefix.
6. Use Dart primary constructors, and never hand-edit the generated icon files (`lib/src/icons/app_icons.dart`, the font, `icons/`,
   `tool/generate_icons.dart`).
7. All text comes from slang. Design-system strings use `context.designSystemL10nOrBase` (see `localization`); never hardcode a
   user-facing or screen-reader string in the package.

Only `AppTheme.light(variant)` exists (variants `rose`, `blue`, `neutral`); there is no dark theme. Read the active variant with
`AppThemeScope.of(context)`. `context.isWide` is the only breakpoint helper.

## Layout idioms

- **Page:** `BaseView(appBar: BaseAppBar(...), body: ...)`. `BaseView` installs the scaffold, background and safe area and adds no
  padding. `appBar` defaults to a bare `BaseAppBar` (the back button appears when the route can pop, so pass no `onBack`); pass
  `appBar: null` only when the screen owns the full screen, and `onClose` only for a modal-style dismissal.
- **Body:** a content widget for scrolling pages (`BaseFlowContent` for a one-task form with a fixed footer, `BaseStackedContent` for
  scrolling content with an optional footer, `BaseMomentContent` for a centered outcome, `BaseTabContent` only when the page owns its tab
  bar), or the page's own viewport for infinite lists, `WebView`, `PageView` and dynamic lists. Modal sheets use `BaseSheetTemplate`.
- **Lists:** `BaseListView` (owns the empty state through `emptyBuilder` and pull-to-refresh) for static lists, `InfiniteListView`
  only when `hasNextPage` can change.
- **Empty and failure:** `BaseEmptyState(title, text, actionText, onAction, face)`; a failed read uses `FaceKind.sad` and a retry (in
  features, `AppErrorView`). Never reintroduce `EmptyIndicator` or `ErrorIndicator`.
- **Loading:** `BaseLoadingDots`, or `SkeletonizerResourceWidget` for a `Resource<T>`; pull-to-refresh is `BaseRefreshable`, for network
  lists only. Never `CircularProgressIndicator`, `CupertinoActivityIndicator` or a `RefreshIndicator` spinner.
- **Feedback:** `BaseToast.show(context, message)` (variant `error` for a background failure), `BaseSheet.show`,
  `BaseConfirmSheet.show`, `BaseDialog.show`. Never `showModalBottomSheet` or `showDialog`.
- **Text entry:** `BaseTextField` and `BaseTextArea` with `text:` and `onChanged:`. They are controlled when `text` is supplied and
  self-managed when it is null; do not reach for a `TextEditingController`.
- **Groups:** `BaseListGroup` with `BaseListTile` rows (`showsDivider: false`) under a `BaseSectionHeader(isLabel: true)`.
- **Gaps:** `SizedBox(height:)` in a column and `SizedBox(width:)` in a row; no `Gap`, no `SizedBox.square`.
- **Icons:** `AppIcon(icon: AppIcons.x, size: AppIconSize.md, semanticLabel: ...)` when the icon carries meaning; never `Icons.*`.
- **Assets:** files live under `packages/common_ui/assets/` and generate into `Assets`; render with `Assets.images.x.svg()`, never a
  path string.

## Creating a component

First apply the boundary test in [component-boundary.md](references/component-boundary.md); a scenario recipe (empty, error, page shell,
section, screen) is a shared widget, not a `Base*`. Then:

1. Create `packages/design_system/lib/src/components/<group>/base_<name>.dart` with a primary constructor, reading `context.colors`,
   `context.text` and the tokens. Material imports stay inside the component file, with `show:`, and only for a genuinely wrapped primitive.
2. Expose only the axes it has (`variant`, `tone`, `size`, boolean state) with sensible defaults.
3. Support skeletons by rendering from plain `Text` and `Icon` nodes, so `Skeletonizer` can transform the tree.
4. Export it from its group barrel (`components/<group>/<group>.dart`), add a Storybook example (see `storybook`) and a widget test at
   `packages/design_system/test/src/components/<group>/base_<name>_test.dart` using `test/helpers/widget_host.dart`.
5. Verify with `cd packages/design_system && flutter analyze --no-pub && flutter test --no-pub`, then `melos lint` from the root.

## Gotchas

- `Spacings`, `Borders`, `Durations`, `FontSizes`, `Breakpoints`, `Gap`, `context.palette` and `context.typography` do not exist; use
  `AppSpace`, `AppRadius` and `AppBorder`, `AppMotion`, `AppTypography`, `context.isWide`, `SizedBox`, `context.colors`, `context.text`.
- `BaseApp` owns the root `DefaultTextStyle`. Do not add another default text style, and do not wrap in `Material` to hide the
  yellow fallback underline.
- `BaseButton.primary` is full width; use another weight for an inline button.
- `BaseListTile` draws a divider by default; pass `showsDivider: false` outside a grouped list.
- `BaseAvatar` has no person-icon fallback: an empty photo renders an empty tinted circle.
- Component files in `design_system` may import Material; app files may not. The rule is a convention that reviewers enforce, not a lint.
- Widgetbook's inner `MaterialApp` sits outside the `BaseApp` tree, so its `appBuilder` wraps examples in `Localizations` with the same delegates.
