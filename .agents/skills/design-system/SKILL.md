---
name: design-system
description: Build UI in the app with the common_ui starter design system, and decide what belongs in it. Covers the component-vs-pattern boundary (Base* components in packages/common_ui vs shared widgets in app/lib/features/_shared), the real tokens and theme (Spacings, Borders, Durations, Breakpoints, FontSizes, context.palette, context.typography, ThemeModeProvider), placement and promotion rules, and the no-Material-in-app rule. Use whenever writing widgets, layout, or styling in app/lib; when creating, reviewing, promoting, or demoting a reusable widget; when someone proposes a new Base* component; or when the user asks about colors, spacing, theme, dark mode, buttons, cards, or a visual component. NEVER import flutter/material or flutter/cupertino in app code.
---

# Design system

`packages/common_ui` is the only UI layer the app may use. Material and Cupertino
exist **inside that package only**, which keeps the app skinnable and consistent.

Read the source before assuming a token or component exists:

- `packages/common_ui/lib/src/tokens/` — spacing, radius, duration, breakpoint, font size, raw colors
- `packages/common_ui/lib/src/theme/` — `AppTheme`, `Palette`, `Typography`
- `packages/common_ui/lib/src/components/` — the `Base*` inventory
- `packages/common_ui/lib/common_ui.dart` — the barrel; if it is not exported there, app code cannot use it

---

## 1. Component vs pattern — what goes where

Every reusable widget lives in exactly one of four layers. Getting the layer
wrong is what makes a design system rot: recipes masquerade as primitives and the
component file list becomes an app's junk drawer.

### Fast filter

**A component names one element (a noun). A pattern narrates a situation (a sentence).**

- "an input", "a card", "an avatar", "a divider", "a loading spinner" -> component.
- "there is nothing here yet - do X", "something failed - retry", "a list that loads more as you scroll" -> pattern.

`BaseCard` is a noun (a surface with slots). `EmptyIndicator` is a sentence
("nothing here yet"). Since "an empty state" is *also* a noun, the mnemonic is a
fast filter, not the test. The test is below.

### The four layers

| # | Layer | Definition | Home | Naming |
| --- | --- | --- | --- | --- |
| 1 | **Foundation** | Design decisions as data - colour, type, spacing, radius, timing, breakpoints - plus the theme that installs them | `packages/common_ui/lib/src/tokens`, `.../theme` | `Spacings`, `Borders`, `Durations`, `Breakpoints`, `FontSizes`, `Palette`, `Typography`, `AppTheme` |
| 2 | **Components** | Domain-blind **building blocks**: one element that owns a visual role and/or an interaction + accessibility contract | `packages/common_ui/lib/src/components/base_*.dart` | `Base*` |
| 3 | **Patterns** (shared widgets) | **Recipes** that arrange components to solve a recurring scenario | `app/lib/features/_shared/presentation/widgets/` | no `Base*` (`EmptyIndicator`, `ErrorIndicator`, `InfiniteListViewWidget`, `SkeletonizerResourceWidget`) |
| 4 | **Feature widgets** | UI owned by a single feature | `app/lib/features/<feature>/presentation/**` | feature-named or private |

The app shell (`BaseApp`, `BaseView`, `BaseAppBar`) still lives in `components/`:
it names a noun and owns its own visual contract.

### The test — a component must pass ALL five

1. **Domain-blind.** Its API mentions no product noun, model, route, DI lookup,
   or feature l10n key. An unrelated app could use it verbatim.
2. **A noun, not a sentence.** It implements *one* element with a slot for
   arbitrary content. Arranging a few child widgets is allowed when the
   arrangement *is* the element and owns the whole's visual role (a divider with
   a label, an avatar with a fallback). It is a pattern once the arrangement
   encodes a **scenario**: empty/error/retry, page chrome, section, screen.
3. **Decides something.** It owns interaction states (enabled, pressed, focused,
   loading, error, selected), an accessibility contract (roles, labels, tap
   targets), or a token-backed visual identity the consumer would otherwise
   re-implement. A wrapper that only forwards arguments fails this check.
4. **Slot/primitive-driven.** It renders from structured inputs (`child`, `icon`,
   `leading`, `title`, `count`). Plain `String` labels are fine; app copy and app
   models are not.
5. **Token-only, theme-complete.** Built from foundation tokens and
   `context.palette`/`context.typography`; correct in light and dark, at 200% text
   scale, and with the platform's reduced-motion setting.

- Fail **1 or 4** -> app widget (shared if cross-feature, else feature-local).
- Fail **2** -> **pattern** in `_shared`.
- Fail **3** -> if it is a recipe, pattern; if it is a pass-through wrapper, delete it.

### Promotion gates (not classification)

- **Earned.** >=3 *production* call sites across >=2 features (exclude Storybook
  and tests), or it is a standard primitive: button, field, checkbox, radio,
  switch, select, menu, dialog, sheet, snackbar, tooltip, FAB, tabs, nav bar,
  progress, avatar, divider, card, badge, tag, list tile. The allow-list says what
  *may* exist; it is not a claim that it all does.
- **Shipped.** Promotion requires a Storybook example and a test; a pure layout
  wrapper may be covered by its consumer.

### The contract

A `common_ui` component **MUST** be domain-blind, render from slots, implement
exactly one element, own its states/accessibility/visual role, be theme-complete,
and ship with docs, a Storybook example, and a test. It **MUST NOT** encode a
workflow, a screen state, or product copy; compose siblings into a "section" or
"screen" recipe; exist only to dedupe one or two call sites; duplicate a noun
another component already owns (merge behind one name with a variant); or be a
wrapper that adds neither behaviour nor a token-backed visual role.

### Placement and naming

- `Base*` is reserved for `packages/common_ui/lib/src/components/`.
  App code - including `_shared` - never uses it. **If it is a pattern it must not
  be called `Base*`**; the prefix is the signal that a widget is a primitive.
- Patterns go to `app/lib/features/_shared/presentation/widgets/` and take a
  descriptive, non-`Base` name.
- A widget used by one feature stays in `presentation/<sub>/widgets/` until it
  earns promotion.

### Worked examples

| Widget | Verdict | Why |
| --- | --- | --- |
| `BaseCard` | Component | Noun: a surface with a `child` slot, a title row and a leading slot |
| `BaseButton` | Component | Noun: full-width primary action owning loading/disabled behaviour |
| `BaseAvatar` | Component | Noun: a circular image with an icon fallback |
| `BaseDivider` | Component | Noun: a rule, optionally with a centred label |
| `BaseListTile` | Component | Noun: a row with leading/title/subtitle/trailing slots |
| `BaseView` | Component | Noun: the page frame (scaffold, safe area, app bar) |
| `EmptyIndicator` | **Pattern** | Encodes the no-data screen state: copy plus the placeholder art |
| `ErrorIndicator` | **Pattern** | Encodes failure plus a retry action |
| `FeedbackIndicator` | **Pattern** | Encodes a centred title/message outcome with no asset |
| `InfiniteListViewWidget` | **Pattern** | Encodes the paginated-list scroll scenario |
| `SkeletonizerResourceWidget` | **Pattern** | Encodes the loading/success/failure resource scenario with a fake value and semantics |
| `WebView` | **Pattern** | Wraps a third-party web view with app-level policy |

Dialog and sheet surfaces stay inside their component (`BaseBottomSheet`), not as
separate patterns: the component owns the surface.

### Anti-patterns

- A `Base*` name on a pattern.
- A component that is a pass-through wrapper.
- A component that hardcodes copy or branches on an app model.
- Two components that own the same noun or recipe.
- Promoting a widget because it happens to be used twice.
- Demoting a shipped component because its call-site count is low.

---

## 2. Hard rules

1. In `app/lib/**`, never import `package:flutter/material.dart` or
   `package:flutter/cupertino.dart`.
2. Import UI from `package:common_ui/common_ui.dart`. The barrel re-exports
   `flutter/widgets.dart`, `Icons`/`ThemeMode` from Material, `gap` (`Gap`),
   `skeletonizer`, every `Base*` component, `Assets.*`, `AppTheme`, `Typography`,
   `ThemeModeProvider`, and the token constants.
3. Apply the boundary test (section 1) before creating anything reusable. A
   **component** goes in `packages/common_ui/lib/src/components/base_<name>.dart`,
   exported from the barrel, with a Storybook example and a test. A **pattern**
   goes in `app/lib/features/_shared/presentation/widgets/` and never takes the
   `Base*` prefix.
4. Use semantic colors (`context.palette`) and text styles
   (`context.typography`) - never raw `Color(0xFF...)`, `Colors.*`, or numeric
   font sizes.
5. Use token constants for spacing, radii, and timing:
   `Gap(Spacings.large)`, `Borders.large`, `Durations.fast` - never magic numbers.
6. Keep a widget feature-local until it earns promotion to a pattern or a component.
7. Interactive controls are **>=48dp** with a visible focus state in both themes;
   copy is **sentence case** except micro-labels (eyebrows, badges, tags), which
   may be uppercase.
8. Every class uses a **primary constructor**: the constructor sits in the class
   header with fields declared inline, never a separate body that only assigns
   fields. This covers widgets, cubits, states, pages, and services.

## 3. Axis vocabulary — variant / tone / size

There is **no shared tone enum** and no cross-component axis vocabulary in the
package today. Components stay flat and own whatever enum they need.

| Axis | Question it answers | Where it lives | Example in the repo |
| --- | --- | --- | --- |
| `variant` | Which skin / emphasis? (same behaviour, same meaning) | a per-component enum | not yet needed |
| `tone` | What does it mean? (semantic status) | a per-component enum, colours from `context.palette` | `SnackBarType` (`info`, `success`, `error`) |
| `size` | How big / dense? | a per-component enum or a plain `double` | `BaseAvatar(size: 40)` |
| state | What is it doing right now? | plain boolean props | `isLoading`, `isEnabled`, `value` |

Rules:

- Only expose an axis the component actually has. One word per axis everywhere.
- `variant` vs `tone`: colour expressing emphasis -> `variant`; colour expressing
  meaning -> `tone`. They are orthogonal.
- If a value changes behaviour, it is a different component, not a `variant`.
- Never a boolean for an axis that can grow (`isOutlined` is a `variant` that has
  not been named yet); booleans are only genuine on/off state.
- New components do not add a `type` enum; name the enum after the axis
  (`BaseButtonVariant`, not `BaseButtonType`). `BaseTextFieldType` is a
  pre-existing exception in the barrel, not a precedent.
- Use **dot shorthand** for enum arguments: `type: .password`, `tone: .error`.

## 4. Inventory

The inventory is the directory itself: `packages/common_ui/lib/src/components/`.
Read the constructor before using a prop - do not guess.

`BaseApp` `BaseAppBar` `BaseAvatar` `BaseBottomSheet` `BaseButton` `BaseCard`
`BaseDivider` `BaseIconButton` `BaseListTile` `BaseListView` `BaseLoadingIndicator`
`BaseNavigationBar` `BasePullToRefresh` `BaseRadioListTile` `BaseSnackBar`
`BaseSwitch` `BaseTapper` `BaseTextButton` `BaseTextField` `BaseTooltip` `BaseView`

Shapes worth knowing:

- `BaseCard(child:, title:, leading:)` - the workhorse content surface.
- `BaseButton(text:, onPressed:, isLoading:, isEnabled:)` - full width, filled.
- `BaseDivider()` / `BaseDivider.text(text: ...)` - unnamed and `.text` constructors.
- `BaseListTile(title:, subtitle:, leading:, trailing:, onTap:)`.
- `BaseTextField(text:, label:, errorText:, type:, onChanged:, onSubmitted:)`.
- `BaseListView(itemCount:, itemBuilder:, separator:, padding:, emptyBuilder:, onRefresh:)`.
- `context.showSnackBar('...', type: SnackBarType.success)` - an extension exported by the package.
- `BaseApp(home:)` / `BaseApp.router(routerConfig:)` - installs `AppTheme.light` and `AppTheme.dark`.

Shared patterns currently in `app/lib/features/_shared/presentation/widgets/`:
`EmptyIndicator` `ErrorIndicator` `FeedbackIndicator` `InfiniteListViewWidget`
`SkeletonizerResourceWidget` `WebView`.
The Storybook registry also carries a `SocialButton` example from the
authentication feature - a feature widget, not a pattern.

## 5. Tokens

```text
Spacings: none=0, xxxsmall=1, xxsmall=2, xsmall=4, small=8, medium=12,
          large=16, xlarge=24, xxlarge=40, xxxlarge=64
Borders (radius): none=0, small=4, medium=8, large=16, xlarge=24
Durations: fast=100ms, regular=250ms, slow=500ms, xslow=800ms
Breakpoints: mobile=600, tablet=1024, desktop=1440
FontSizes: xsmall=10, small=12, medium=14, large=16, xlarge=20, xxlarge=24,
           xxxlarge=30
```

What does **not** exist, so do not write it:

- No elevation tokens and no shadow scale - use `Borders` radius plus
  `context.palette` surfaces for depth.
- No exported easing or curve tokens and no reduced-motion helper. `src/tokens/`
  does hold a curve file, but the barrel never exports it and nothing uses it -
  do not start depending on it. `Durations` is the timing vocabulary, and
  anything animated must be gated on `MediaQuery.disableAnimationsOf(context)`
  by hand.
- No `pill` radius (999) and no `instant` duration.
- No palette roles beyond the twelve listed in section 6 - there is no outline
  family, no surface-container ladder, no scrim, and no inverse roles.
- No configured font families; `Typography` styles carry size and weight only.

`tokens/colors.dart` still holds legacy numbered ramps (`gray50`..`pink900`).
They exist for source compatibility and are referenced by `Palette` only. App
code uses `context.palette`, never a ramp value.

## 6. Theme access

```dart
final palette = context.palette;        // Palette ThemeExtension (semantic colours)
final typography = context.typography;  // Typography ThemeExtension (text styles)

Text('Card title', style: typography.titleSmall.copyWith(color: palette.onContainer));
```

**Palette roles (all of them):** `primary`, `onPrimary`, `secondary`,
`onSecondary`, `background`, `onBackground`, `container`, `onContainer`,
`success`, `onSuccess`, `error`, `onError`.

**Typography roles:** `titleLarge` (30 bold), `titleMedium` (24 bold),
`titleSmall` (20 bold), `bodyLarge` (16), `bodyMedium` (14), `bodySmall` (12),
`labelLarge` (16 w500), `labelMedium` (14 w500), `labelSmall` (12 w500).

Light and dark install the same names with different values (`background` is
white in light, black in dark; `container` is `gray100`/`gray800`). Components
must render correctly in both. `context.palette` and `context.typography` are the
only theme access app code has - `Theme.of(context)` is internal to `common_ui`.

Theme mode: `ThemeModeProvider` supplies `InheritedThemeProvider` through
`ThemeModeProvider.of(context)` / `maybeOf(context)`; read `.themeMode` and call
`.setThemeMode(ThemeMode.dark)`. `BaseApp` reads it and hands it to
`MaterialApp`, so toggling the mode re-themes the app without touching
`main.dart`.

## 7. Creating a new component

When no `Base*` component fits:

0. Apply the boundary test (section 1). If it is a scenario recipe (empty,
   error/retry, cover, section, screen), it is a shared widget in
   `app/lib/features/_shared` - do not create a `Base*` for it.
1. File `packages/common_ui/lib/src/components/base_<name>.dart`.
2. Write the class with a **primary constructor** - the constructor lives in the
   class header and fields are declared inline as `required final`/`final`. Never
   add a separate constructor in the class body, and never a body that only
   assigns fields. Named constructors keep the same header form:
   `class const BaseTag.subtle({required final String label, super.key}) extends StatelessWidget`.

```dart
// packages/common_ui/lib/src/components/base_tag.dart
import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:common_ui/src/tokens/borders.dart';
import 'package:common_ui/src/tokens/spacings.dart';
import 'package:flutter/widgets.dart';

class const BaseTag({required final String label, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.palette.container,
        borderRadius: BorderRadius.circular(Borders.small),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacings.small,
          vertical: Spacings.xxsmall,
        ),
        child: Text(label, style: context.typography.labelSmall),
      ),
    );
  }
}
```

3. Read `context.palette` / `context.typography`; use `Spacings`/`Borders`/
   `Durations`; use `Gap(Spacings.x)` for gaps inside `Row`/`Column`.
4. Keep Material imports local to the component file, with `show`:
   `import 'package:flutter/material.dart' show FilledButton;`.
5. Expose only the axes from section 3, and keep defaults sensible.
6. Support skeletons where relevant: render from plain `Text` and `Icon` nodes so
   `Skeletonizer` can transform the tree, and let callers build the placeholder
   list from a model `fake` (see `PostsListPage`).
7. Export it from `packages/common_ui/lib/common_ui.dart`.
8. Add a Storybook example in `app/lib/features/dev_menu/storybook/examples/components/`
   and register it in `examples/examples.dart` under the right folder
   (`Components`, `Widgets`, `Theme`).
9. Add a widget test at `packages/common_ui/test/components/base_<name>_test.dart`
   using `tester.pumpApp(...)` from `../test_helpers/pump_app.dart`.
10. Verify: `cd packages/common_ui && flutter test`, then `melos analyze` from
    the repo root. Run `melos lint` before handing off.

## 8. Layout idioms

- Standard screen: `BaseView(title: ..., body: ...)`. It installs the scaffold,
  safe area, app bar and `palette.background`.
- Scrollable lists: `BaseListView(itemCount:, itemBuilder:, separator:, padding:,
  emptyBuilder:, onRefresh:)`. `separator: const Gap(Spacings.medium)` is the
  idiomatic row gap. `emptyBuilder` handles the zero-item case, and when
  `onRefresh` is set the empty state stays pull-to-refreshable.
- Gaps: `Gap(Spacings.x)` inside `Row`/`Column`, or `SizedBox` with only the
  dimension that matches the flex axis (never both). Page gutters are
  `EdgeInsets.all(Spacings.large)`; list rows use
  `EdgeInsets.symmetric(horizontal: Spacings.large, vertical: Spacings.medium)`.
- Assets: generated accessors from `Assets.*`
  (`Assets.images.placeholder.svg(width: 200)`). Add files under
  `packages/common_ui/assets/` and regenerate.

## 9. Gotchas

- `Icons`, `ThemeMode` come from the barrel. `TextInputType` and
  `TextInputAction` come from `package:flutter/services.dart` - no Material import
  needed for either.
- Do not hardcode colors, font sizes, radii, or durations - raw ramps in
  `tokens/colors.dart` are referenced only by `Palette`.
- Component files inside `common_ui` may import Material/Cupertino; app files may
  not. The rule is convention, not lint-enforced - reviewers catch it.
- `BaseButton` is full width (`double.infinity`). Wrap it in a constrained parent
  when you need an inline button.
- `BaseTextField` owns its controller: pass `text` and listen to `onChanged`; the
  widget resyncs when `text` changes. Use `type: .password` for obscured input.
- `BaseAvatar` requires an explicit `size`; it has no default.
- A widget used by one feature stays in that feature's `presentation/<sub>/widgets/`.

## 10. Auditing the library

Run this one component at a time for every
`packages/common_ui/lib/src/components/base_*.dart`:

1. Read its public API and behaviour - do not trust the name.
2. Write the **noun** and the **sentence** descriptions; the one that fits wins.
3. Run the five checks (section 1); note the **first** failing check.
4. Record: current path -> verdict (Foundation / Component / Pattern / Feature) ->
   target path -> target name -> rationale (<= 12 words).
5. When checks 2 or 3 are genuinely ambiguous, mark **borderline** and state both
   readings instead of forcing a call.
