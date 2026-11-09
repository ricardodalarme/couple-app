---
name: design-system
description: Build UI in the app with the ui design system, and decide what belongs in it. Covers the component-vs-pattern boundary (Base* components in packages/ui vs shared widgets in app/lib/features/_shared), the real tokens and theme (AppSpace, AppRadius, AppBorder, AppPalette, AppTypography, AppMotion, context.colors, context.text, AppThemeHost), placement and promotion rules, and the no-Material-in-app rule. Use whenever writing widgets, layout, or styling in app/lib; when creating, reviewing, promoting, or demoting a reusable widget; when someone proposes a new Base* component; or when the user asks about colors, spacing, theme, buttons, cards, icons, or a visual component. NEVER import flutter/material or flutter/cupertino in app code.
---

# Design system

`packages/ui` is the only UI layer the app may use. Material and Cupertino exist
**inside that package only**, which keeps the app skinnable and consistent.

Read the source before assuming a token or component exists:

- `packages/ui/lib/src/tokens/` — space, radius, border, colour, typography, motion, icon size, shadows, stacking
- `packages/ui/lib/src/theme/` — `AppTheme`, `AppThemeHost` / `AppThemeScope` / `AppThemed`, `AppPressable`
- `packages/ui/lib/src/components/` — the `Base*` inventory, grouped by role
- `packages/ui/lib/src/components/navigation/` — page chrome: `BaseAppBar`, `BaseView`, `BaseSheet`, `BaseStepper`, `BaseTabBar`
- `packages/ui/lib/src/templates/` — the content widgets (`BaseFlowContent`, `BaseStackedContent`, `BaseMomentContent`, `BaseTabContent`) and the modal sheet (`BaseSheetTemplate`)
- `packages/ui/lib/src/widgets/` — utility widgets (`BaseListView`, `InfiniteListView`, `WebView`)
- `packages/ui/lib/src/icons/` — `AppIcon` and the generated `AppIcons`
- `packages/ui/lib/ui.dart` — the barrel; if it is not exported there, app code cannot use it

---

## 1. Component vs pattern — what goes where

Every reusable widget lives in exactly one of five layers. Getting the layer
wrong is what makes a design system rot: recipes masquerade as primitives and the
component file list becomes an app's junk drawer.

### Fast filter

**A component names one element (a noun). A pattern narrates a situation (a sentence).**

- "an input", "a card", "an avatar", "a divider", "a tab bar" -> component.
- "there is nothing here yet - do X", "something failed - retry", "the page frame", "a toast on top of the current screen" -> pattern.

`BaseSurfaceCard` is a noun (a surface with slots). An empty/error state is a
sentence ("nothing here yet", "something failed - retry"), which is why the app
does not keep an `EmptyIndicator`/`ErrorIndicator` pattern: the shipped
`BaseEmptyState` owns that scenario. Since "an empty state" is *also* a noun, the
mnemonic is a fast filter, not the test. The test is below.

### The five layers

| # | Layer | Definition | Home | Naming |
| --- | --- | --- | --- | --- |
| 1 | **Foundation** | Design decisions as data - colour, type, space, radius, timing, stacking - plus the theme that installs them | `packages/ui/lib/src/tokens`, `.../theme` | `AppSpace`, `AppRadius`, `AppBorder`, `AppPalette`, `AppColors`, `AppTypography`, `AppMotion`, `AppShadows`, `AppTheme` |
| 2 | **Components** | Domain-blind **building blocks**: one element that owns a visual role and/or an interaction + accessibility contract | `packages/ui/lib/src/components/<group>/base_*.dart` | `Base*` |
| 3 | **Templates** | Multi-slot screen compositions for a named app moment | `packages/ui/lib/src/templates/` | `Base*Template` |
| 4 | **Patterns** (shared widgets) | **Recipes** that arrange components to solve a recurring app scenario | `app/lib/features/_shared/presentation/widgets/` | no `Base*` (`SkeletonizerResourceWidget`) |
| 5 | **Feature widgets** | UI owned by a single feature | `app/lib/features/<feature>/presentation/**` | feature-named or private |

The root is `BaseApp` / `BaseApp.router` in `packages/ui`: it installs
`MaterialApp` or `MaterialApp.router`, owns the root `DefaultTextStyle` from
`context.text.body`, and defaults its localization delegates to
`GlobalMaterialLocalizations.delegates` from `material_ui` (Material, Cupertino
and Widgets in one list). It keeps text outside Material surfaces from falling
back to Flutter's yellow underline style. `app/lib/app.dart` composes
`AppThemeHost → BaseApp.router`. Every page starts with `BaseView`, the
padding-free page shell. Its `appBar` slot takes the page header
(usually `BaseAppBar`) and its `body` slot takes the page content: a `ui`
content widget for scrolling pages, or the page's own viewport for infinite
lists, `WebView`, `PageView` and dynamic lists. The barrel re-exports
`ThemeMode` and `GlobalMaterialLocalizations` from `material_ui`; app code never
uses Material `Scaffold` or `AppBar`. Modal surfaces use their own static entry
points: `BaseSheet.show`,
`BaseConfirmSheet.show`, `BaseDialog.show`, and `BaseToast.show`.

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
   `context.colors` / `context.text`; correct in all three light variants, at
   200% text scale, and with the platform's reduced-motion setting.

- Fail **1 or 4** -> app widget (shared if cross-feature, else feature-local).
- Fail **2** -> **pattern** in `_shared`.
- Fail **3** -> if it is a recipe, pattern; if it is a pass-through wrapper, delete it.

### Promotion gates (not classification)

- **Earned.** >=3 *production* call sites across >=2 features (exclude Storybook
  and tests), or it is a standard primitive: button, field, checkbox, radio,
  switch, select, menu, dialog, sheet, toast, tooltip, tabs, nav bar, progress,
  avatar, divider, card, badge, tag, list tile. The allow-list says what *may*
  exist; it is not a claim that it all does.
- **Shipped.** Promotion requires a Storybook example and a test; a pure layout
  wrapper may be covered by its consumer.

### The contract

A `ui` component **MUST** be domain-blind, render from slots, implement exactly
one element, own its states/accessibility/visual role, be theme-complete, and
ship with docs, a Storybook example, and a test. It **MUST NOT** encode a
workflow, a screen state, or product copy; compose siblings into a "section" or
"screen" recipe; exist only to dedupe one or two call sites; duplicate a noun
another component already owns (merge behind one name with a variant); or be a
wrapper that adds neither behaviour nor a token-backed visual role.

### Placement and naming

- `Base*` is reserved for `packages/ui/lib/src/components/<group>/`.
  App code - including `_shared` - never uses it. **If it is a pattern it must not
  be called `Base*`**; the prefix is the signal that a widget is a primitive.
- Patterns go to `app/lib/features/_shared/presentation/widgets/` (or
  `.../helpers/` for non-widget helpers) and take a descriptive, non-`Base` name.
- A widget used by one feature stays in `presentation/<sub>/widgets/` until it
  earns promotion.

### Worked examples

| Widget | Verdict | Why |
| --- | --- | --- |
| `BaseSurfaceCard` | Component | Noun: a surface with a header and a `child` slot |
| `BaseButton` | Component | Noun: one action with five weights and loading/disabled behaviour |
| `BaseAvatar` | Component | Noun: a circular image or initial |
| `BaseDivider` | Component | Noun: a rule, optionally with a centred label |
| `BaseListTile` | Component | Noun: a row with leading/title/subtitle/trailing slots |
| `BaseTabBar` | Component | Noun: the fixed bottom bar with items |
| `BaseApp` | **Root host** | Installs `MaterialApp`/`.router` and the root `DefaultTextStyle` |
| `BaseEmptyState` | Component | Noun: the dashed empty/failure invitation with an optional action |
| `BaseView` | **Page shell** | Page canvas: scaffold, background, safe area and an `appBar`; the body has no padding |
| `SkeletonizerResourceWidget` | **Pattern** | Encodes the loading/success/failure resource scenario with a fake value and semantics |
| `InfiniteListView` | **Widget** | Pagination + pull-to-refresh utility, not a component noun |
| `WebView` | **Widget** | Thin utility that loads a URL in the platform web view |

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
2. Import UI from `package:ui/ui.dart`. The barrel re-exports
   `flutter/widgets.dart`, `ThemeMode` and `GlobalMaterialLocalizations` from
   `material_ui`, `skeletonizer`, `flutter_svg`, `cached_network_image_ce`,
   every `Base*` component, the templates, the utility widgets,
   `AppIcon`/`AppIcons`, `AppTheme`, `AppThemeHost`, `AppPressable`, and the
   token constants. Never import `material_ui`, `flutter_svg`, or
   `cached_network_image_ce` directly in `app/lib`.
3. Apply the boundary test (section 1) before creating anything reusable. A
   **component** goes in `packages/ui/lib/src/components/<group>/base_<name>.dart`,
   exported from that group's barrel, with a Storybook example and a test. A
   **pattern** goes in `app/lib/features/_shared` and never takes the `Base*`
   prefix.
4. Use semantic colors (`context.colors`) and text styles (`context.text`) -
   never raw `Color(0xFF...)`, `Colors.*`, or numeric font sizes. Brand-only
   values (the Google blue in `SocialButton`) are named local constants.
5. Use token constants for spacing, radii, borders, timing and icon sizes:
   `AppSpace.s16`, `AppRadius.card`, `AppBorder.hair`, `AppMotion.fast`,
   `AppIconSize.md` - never magic numbers.
6. Keep a widget feature-local until it earns promotion to a pattern or a component.
7. Interactive controls are **>=44pt** (`AppIconSize.touch`) with a visible focus
   state in every variant; copy is **sentence case** except micro-labels
   (eyebrows, badges, tags), which may be uppercase.
8. Every class uses a **primary constructor**: the constructor sits in the class
   header with fields declared inline, never a separate body that only assigns
   fields. This covers widgets, cubits, states, pages, and services.
9. Never hand-edit `packages/ui/lib/src/icons/app_icons.dart`,
   `packages/ui/assets/fonts/app_icons.ttf`, `packages/ui/icons/`, or
   `packages/ui/tool/generate_icons.dart`; the icon font is generated.

## 3. Axis vocabulary — variant / tone / size

There is **no shared tone enum** and no cross-component axis vocabulary in the
package. Components stay flat and own whatever enum they need.

| Axis | Question it answers | Where it lives | Example in the repo |
| --- | --- | --- | --- |
| `variant` | Which skin / emphasis? (same behaviour, same meaning) | a per-component enum | `BaseButtonVariant`, `BaseBannerVariant`, `BaseBubbleVariant` |
| `tone` | What does it mean? (semantic status) | a per-component enum, colours from `AppStatus` / `AppPalette` | `BaseBannerTone` (`BaseTopNotice`) |
| `size` | How big / dense? | a per-component enum or a plain `double` | `BaseAvatar(size: 40)`, `BaseIconTileSize` |
| state | What is it doing right now? | plain boolean props | `isLoading`, `isEnabled`, `value`, `isSelected` |

Rules:

- Only expose an axis the component actually has. One word per axis everywhere.
- `variant` vs `tone`: colour expressing emphasis -> `variant`; colour expressing
  meaning -> `tone`. They are orthogonal.
- If a value changes behaviour, it is a different component, not a `variant`.
- Never a boolean for an axis that can grow; booleans are only genuine on/off
  state.
- New components do not add a `type` enum; name the enum after the axis
  (`BaseButtonVariant`, not `BaseButtonType`). `BaseTextFieldType` is a
  pre-existing exception, not a precedent.
- Use **dot shorthand** for enum arguments: `type: .password`, `variant: .error`.

## 4. Inventory

The inventory is the directory itself: `packages/ui/lib/src/components/`.
Read the constructor before using a prop - do not guess.

**Actions:** `BaseButton` (`.primary`, `.secondary`, `.text`, `.destructive`,
`.compact`), `BaseRoundButton`, `BaseTextLink`

**Input:** `BaseTextField`, `BaseTextArea`, `BaseSelect`, `BaseCheckbox`,
`BaseRadio`, `BaseOptionTile`, `BaseChoiceChip`, `BaseSegmented`, `BaseSwitch`,
`BaseSlider`, `BaseDateField`, `BaseCalendarGrid`

**Navigation:** `BaseTabBar` + `BaseTabBarItem`, `BaseAppBar`, `BaseSheet`,
`BaseStepper`

**Identity:** `BaseAvatar`, `BaseAvatarPair`, `BaseIconTile`,
`BaseImagePlaceholder`, `BasePlusBadge`

**Surfaces:** `BaseSurfaceCard`, `BaseListCard`, `BaseFeatureCard`,
`BaseCategoryLabel`, `BaseTag`, `BaseBubble`, `BaseDivider`, `BaseFace`

**Feedback:** `BaseBanner`, `BaseTopNotice`, `BaseDialog`, `BaseConfirmSheet`,
`BaseToast`, `BaseTooltip`, `BaseRefreshable`, `BaseLoadingDots`,
`BaseEmptyState`, `BaseListTile`, `BaseListGroup`, `BaseNote`,
`BaseSectionHeader`

Shapes worth knowing:

- `BaseButton(text:, onPressed:, variant:)` - full width for `.primary`; use
  `.secondary` / `.text` / `.compact` for inline actions.
- `BaseTextField(text:, onChanged:, ...)` and `BaseTextArea(text:, onChanged:, ...)` -
  pass `text` for a controlled field; a parent rebuild with a different `text`
  syncs it. Leave `text` null to let the field own its value.
- `BaseDivider()` / `BaseDivider(label: text)` - no margins; wrap in `Padding`.
- `BaseListTile(title:, subtitle:, icon:, leading:, value:, showsChevron:,
  isDestructive:, trailing:, control:, isLoose:, onTap:, showsDivider:)`.
- `BaseTabBar(items:, currentIndex:, onSelected:)` with `BaseTabBarItem(icon:,
  label:)`.
- `BaseSelect(label:, options:, value:, onChanged:, placeholder:, errorText:,
  isCompact:)` - the 54pt field that opens a sheet; 40pt pill when compact.
- `BaseTextField` + `BaseSelect` share the `value`/`onChanged` contract.
- `BaseRefreshable(onRefresh:, child:)` - pull-to-refresh with its own arc
  ring indicator; use it for network lists, never for forms or sheets.
- `BaseListView(itemCount:, itemBuilder:, emptyBuilder:, controller:, onRefresh:)`
  - the default list; `InfiniteListView` only adds pagination.
- `BaseLoadingDots(dotSize:, gap:, color:, semanticLabel:)` - the general
  loading animation; `BaseRefreshable` owns its own refresh ring. No
  `CircularProgressIndicator` or spinner anywhere.
- `BaseToast(message:, variant:, actionLabel:, onAction:, onDismissed:)` -
  `neutral` and `error`; app code calls
  `BaseToast.show(context, message)`, which returns a dismiss callback.
- `BaseSheet.show(context:, child:, title:, subtitle:, primaryAction:,
  isDismissible:)` - the modal sheet entry point.
- `BaseConfirmSheet.show(context:, title:, text:, confirmText:, ...)` and
  `BaseDialog.show(context:, title:, primaryText:, ...)` - confirmation and
  decision entry points.
- `BaseAvatar(initials:, imageUrl:, size:, isPartner:, isEmpty:, hasRing:)` - no
  person-icon fallback; an empty photo is an empty tinted circle.
- `BaseOptionTile(title:, support:, leading:, isSelected:, onTap:, control:)` -
  the radio/checkbox tile; replaces `RadioListTile`.
- `BaseTag(text:)` - one style; status labels use `BaseCategoryLabel` or
  `BaseChoiceChip`.

The shared pattern currently in `app/lib/features/_shared/presentation/widgets/`:
`SkeletonizerResourceWidget`.

## 5. Tokens

```text
AppSpace: s2 s4 s6 s8 s10 s12 s14 s16 s18 s20 s22 s24 s26 s28 s34 s44 s120
          screenMargin=20, screenTop=14, sectionGap=28, cardGap=12,
          footerBottom=34, scrollTail=120, maxContentWidth=560,
          tabBarHeight=84, minWidth=320, compactWidth=360
AppRadius: xs=3, sm=7, md=12, lg=14, xl=18, xxl=20, card=28, ring=34,
           sheet=30, dialog=30, pill=999
AppBorder: hair=1, inner=1, selected=1.5, dashed=1.5, focus=2,
           focusOffset=2, error=1.5, dashPattern=[4,3]
AppMotion: fast=120ms, base=220ms, slow=360ms, reduced=150ms, stagger=80ms,
           squiggleDraw=400ms; baseCurve, fastCurve; pressedScale=.97
AppIconSize: xs=15, sm=18, md=20, lg=22, xl=26, touch=44
```

What does **not** exist, so do not write it:

- No dark theme. `AppTheme.light(variant)` is the only theme; `ThemeMode.light`
  is passed to `MaterialApp`.
- No `Breakpoints` class. Use `context.isWide` (window width > 600) or
  `AppSpace.minWidth` / `AppSpace.compactWidth`.
- No `FontSizes` class. Sizes live in `AppTypography`.
- No `Colors.*`, `Spacings`, `Borders`, `Durations` or `Gap`; those belonged to
  the deleted legacy design system.
- No elevation tokens beyond `AppShadows` (`ring`, `face`, `paper`, `knob`,
  `selected`). Never a coloured shadow.
- No arbitrary palette values in app code: `context.colors` is the vocabulary;
  fixed category/status roles come from `AppPalette` / `AppCategory` /
  `AppStatus`.

## 6. Theme access

```dart
final colors = context.colors;   // semantic roles
final text = context.text;       // type scale

Text('Card title', style: text.titleSm.copyWith(color: colors.textPrimary));
```

**Colour roles (all of them):** `bgScreen`, `bgSurface`, `bgRing`, `bgTabBar`,
`borderDefault`, `borderSelected`, `textPrimary`, `textSecondary`,
`textPlaceholder`, `textOnAction`, `accentHighlight`, `accentLabel`,
`accentSoft`, `accentOnSoft`, `washStrong`, `washLight`, `actionPrimary`,
`actionPrimaryPressed`, `iconDefault`, `iconMuted`, `scrim`.

**Typography roles:** `display` (34), `titleXl` (30), `titleLg` (28),
`question` (26), `titleMd` (23), `titleSm` (17), `titleXs` (16),
`bodyLg` (20), `body` (16), `bodySm` (15), `caption` (13.5), `label` (13),
`micro` (12), `tab` (10.5), `hand` (Caveat).

**Other context helpers:** `context.screenMargin`, `context.isWide`,
`context.reduceMotion`, `context.motionDuration(duration)`,
`context.pressScale`.

Themes: `AppTheme.light(AppThemeVariant.rose|blue|neutral)`. The active variant
is read with `AppThemeScope.of(context)` and switched with
`AppThemeScope.set(context, variant)`; `AppThemeHost` owns the state and
rebuilds the app. Persist the choice through `SettingsRepository` using
`Settings.themeVariant` (the dev-menu theme selector is the reference). There is
no `ThemeModeProvider` and no dark mode.

## 7. Creating a new component

When no `Base*` component fits:

0. Apply the boundary test (section 1). If it is a scenario recipe (empty,
   error/retry, page shell, section, screen), it is a shared widget in
   `app/lib/features/_shared` - do not create a `Base*` for it.
1. File `packages/ui/lib/src/components/<group>/base_<name>.dart`.
2. Write the class with a **primary constructor** - the constructor lives in the
   class header and fields are declared inline as `required final`/`final`.
3. Read `context.colors` / `context.text`; use `AppSpace`, `AppRadius`,
   `AppBorder`, `AppMotion`, `AppIconSize`, `AppShadows`.

```dart
// packages/ui/lib/src/components/surfaces/base_tag.dart
import 'package:ui/ui.dart';

class const BaseTag({required final String text, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.s12),
      decoration: BoxDecoration(
        color: context.colors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: AppBorders.hair(context.colors.borderDefault),
      ),
      child: Text(text, style: context.text.label),
    );
  }
}
```

4. Keep Material imports local to the component file, with `show:` and only when
   the component genuinely wraps a Material primitive.
5. Expose only the axes from section 3, and keep defaults sensible.
6. Support skeletons where relevant: render from plain `Text` and `Icon` nodes so
   `Skeletonizer` can transform the tree, and let callers build the placeholder
   list from a model `fake`.
7. Add the file to its group barrel (`components/<group>/<group>.dart`); that
   barrel is exported by `lib/ui.dart`.
8. Add a Storybook example under
   `app/lib/features/dev_menu/storybook/examples/catalog/<category>/` and register
   it in that category's `*_examples.dart`.
9. Add a widget test at
   `packages/ui/test/src/components/<group>/base_<name>_test.dart` using the
   helpers in `packages/ui/test/helpers/widget_host.dart`.
10. Verify: `cd packages/ui && flutter analyze --no-pub && flutter test --no-pub`,
    then `melos analyze` from the repo root.

## 8. Layout idioms

- Every page starts with `BaseView(appBar: BaseAppBar(...), body: ...)`.
  It installs the scaffold, background and safe area with no padding; the
  `appBar` slot owns the header and the `body` slot owns the content. `appBar`
  defaults to a bare `BaseAppBar`; pass `appBar: null` only when the
  screen owns the full screen.
- Scrolling pages use the matching `ui` content widget:
  `BaseFlowContent` for one-task forms with a fixed footer, `BaseStackedContent`
  for scrolling content with an optional footer, `BaseMomentContent` for
  centred outcomes, and `BaseTabContent` only when the page owns its tab bar.
  `BaseAppBar` adds the back button automatically when the route can pop, so
  pages pass no `onBack`; use `onClose` only for a modal-style dismissal.
  `BaseView` handles keyboard insets through `resizeToAvoidBottomInset`.
- Viewport-owning screens put the viewport directly in `BaseView.body` for
  infinite lists, `WebView`, `PageView` and dynamic `ListView`s, with the same
  `BaseAppBar` in `appBar`.
- Modal sheets keep `BaseSheetTemplate`; it is the sheet surface, not a page.
- Static lists: `BaseListView(itemCount:, itemBuilder:, onRefresh:, padding:,
  separator:, controller:, emptyBuilder:, refreshLabel:)`. It owns the empty
  state (pass one `BaseEmptyState`) and pull-to-refresh.
- Paginated lists: `InfiniteListView(...)` composes `BaseListView` and adds the
  loading footer and fetch trigger. Use it only when `hasNextPage` can change;
  otherwise use `BaseListView` and skip the no-op pagination arguments.
- Empty and failure states: `BaseEmptyState(title:, text:, actionText:, onAction:,
  face:)`. Use `FaceKind.sad` and a retry action for a failed read; never
  reintroduce `EmptyIndicator`/`ErrorIndicator`.
- Grouped menus: `BaseListGroup(children: [...])` with `BaseListTile` rows
  (`showsDivider: false`); use `BaseSectionHeader(isLabel: true)` above the group.
- Resource reads: `SkeletonizerResourceWidget` for a `Resource<T>`; use the
  `Skeletonizer` re-export from `ui` directly for one-off skeleton states.
- Text entry: `BaseTextField(text:, label:, errorText:, type:, onChanged:,
  onSubmitted:, textInputAction:)`; `type: .email` / `.password` / `.inviteCode`.
- Confirmations: `BaseToast.show(context, message)`; pick
  `BaseToastVariant.error` for background failures. Never use a spinner: use
  `BaseLoadingDots` for loading.
- Modal sheets and dialogs: `BaseSheet.show`, `BaseConfirmSheet.show`,
  `BaseDialog.show`. Do not call `showModalBottomSheet` or `showDialog`.
- Gaps: `SizedBox(height:)` inside a Column/list and `SizedBox(width:)` inside a
  Row. Never `Gap` and never `SizedBox.square`.
- Page gutters are `AppSpace.screenMargin`; content starts `AppSpace.screenTop`
  below the safe area; fixed footers sit `AppSpace.footerBottom` from the bottom.
- Icons: `AppIcon(icon: AppIcons.x, size: AppIconSize.md, semanticLabel: ...)`
  when the icon carries meaning; a decorative `Icon(AppIcons.x)` is fine. Never
  `Icons.*`.
- Assets: move files under `app/assets/images/` or `app/assets/logos/`, declare
  them in `app/pubspec.yaml`, and render with `SvgPicture.asset(...)` from the
  `ui` barrel. There is no `Assets.*` codegen in the app.

## 9. Gotchas

- `Icons`, `Spacings`, `Borders`, `Durations`, `FontSizes`, `Breakpoints`,
  `Gap`, `context.palette` and `context.typography` do not exist any more; use
  `AppIcons`, `AppSpace`, `AppRadius`/`AppBorder`, `AppMotion`,
  `AppTypography`, `context.isWide`, `SizedBox`, `context.colors`,
  `context.text`.
- `ThemeMode` and `GlobalMaterialLocalizations` come from the `ui` barrel.
  Never use `Scaffold`, `AppBar`, `MaterialApp` or `AutoTabsScaffold` in app
  files; `BaseView` and `BaseApp` own them.
- `BaseApp` owns the root `DefaultTextStyle(style: context.text.body)`. Do not
  add another default text style to every template or widget, and do not add a
  `Material` wrapper just to fix the yellow fallback underline.
- Localization is decoupled from `flutter_localizations`: use
  `GlobalMaterialLocalizations.delegates` from `material_ui`. `BaseApp` supplies
  it by default; Widgetbook's inner `MaterialApp` sits outside that tree, so its
  `appBuilder` must wrap examples in `Localizations` with the same delegates.
- There is no general spinner component. Loading is `BaseLoadingDots`;
  pull-to-refresh owns its arc ring inside `BaseRefreshable`. Do not
  reintroduce `CircularProgressIndicator` or `RefreshIndicator`'s spinner.
- `BaseTextField` is controlled when `text` is supplied and self-managed when it
  is null. Update a controlled value from `onChanged`; do not reach for a
  `TextEditingController`.
- `BaseListTile` draws a divider by default (`showsDivider: true`); pass `false`
  when the row is not part of a grouped list.
- `BaseDivider(label:)` has no vertical margins; wrap it in `Padding` when the
  old `startMargin`/`endMargin` mattered.
- `BaseNavigationBar`, `BaseAppBar`, `BaseCard`, `BaseIconButton`,
  `BaseTextButton`, `BaseTapper`, `BaseRadioListTile`, `BaseLoadingIndicator`,
  `BaseTagVariant` and `BaseTagEmphasis` were removed with the legacy design
  system. Use `BaseTabBar`, `BaseView`, `BaseSurfaceCard`/`BaseListCard`,
  `BaseRoundButton`, `BaseTextLink`, `AppPressable`,
  `AppPressable.semanticLabel`, `BaseOptionTile`, `BaseLoadingDots`,
  `BaseToast.show`, and `BaseTag(text:)`. `BaseTooltip` is current again.
- The app no longer has `EmptyIndicator`, `ErrorIndicator`, `FeedbackIndicator`,
  `SearchTextField`, or `CircleIconButton`. Use `BaseEmptyState` for empty and
  failure screens, `BaseTextField` for search/text entry, and
  `BaseListGroup`/`BaseListTile` for row lists.
- `BaseAvatar` has no person-icon fallback; an empty photo renders an empty
  tinted circle.
- `BaseButton.primary` is full width by default; wrap it or use another weight
  when you need an inline button.
- Do not hardcode colors, font sizes, radii, or durations - fixed status and
  category colours come from `AppPalette`, `AppStatus`, and `AppCategory`.
- Component files inside `packages/ui` may import Material/Cupertino; app files
  may not. The rule is convention, not lint-enforced - reviewers catch it.
- A widget used by one feature stays in that feature's `presentation/<sub>/widgets/`.

## 10. Auditing the library

Run this one component at a time for every
`packages/ui/lib/src/components/<group>/base_*.dart`:

1. Read its public API and behaviour - do not trust the name.
2. Write the **noun** and the **sentence** descriptions; the one that fits wins.
3. Run the five checks (section 1); note the **first** failing check.
4. Record: current path -> verdict (Foundation / Component / Template / Pattern / Feature) -> target path -> target name -> rationale (<= 12 words).
5. When checks 2 or 3 are genuinely ambiguous, mark **borderline** and state both
   readings instead of forcing a call.
