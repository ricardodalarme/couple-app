# Component boundary

Read this when creating, promoting, demoting or auditing a reusable widget. Getting the layer wrong is how a design system rots:
recipes pass as primitives and the component folder becomes a junk drawer.

## Contents

- The five layers
- The five-check test
- Promotion gates
- The contract
- Placement and naming
- Component API conventions (variant, tone, size)
- Worked examples and anti-patterns
- Auditing the library

## The five layers

A reusable widget lives in exactly one layer.

| # | Layer | Definition | Home | Naming |
| --- | --- | --- | --- | --- |
| 1 | Foundation | Design decisions as data (color, type, space, radius, timing, layering) and the theme that installs them | `packages/design_system/lib/src/tokens`, `.../theme` | `AppSpace`, `AppRadius`, `AppBorder`, `AppPalette`, `AppTypography`, `AppMotion`, `AppTheme` |
| 2 | Components | Domain-blind building blocks: one element that owns a visual role or an interaction and accessibility contract | `.../src/components/<group>/base_*.dart` | `Base*` |
| 3 | Templates | Multi-slot screen compositions for a named app moment | `.../src/templates/` | `Base*Template`, `Base*Content` |
| 4 | Shared widgets | Reusable non-design widgets that depend on app types or third-party packages | `packages/common_ui/lib/src/widgets/` | no `Base*` prefix |
| 5 | Feature widgets | UI owned by one feature | `app/lib/features/<feature>/presentation/**` | feature-named or private |

Fast filter: a component names one element (a noun: an input, a card, an avatar, a divider); a pattern narrates a situation (a
sentence: "nothing here yet, do X", "something failed, retry", the page frame). The filter is a shortcut; the test below decides.

## The five-check test

A component must pass all five.

1. **Domain-blind.** Its API mentions no product noun, model, route, DI lookup or feature l10n key. An unrelated app could use it as is.
2. **A noun, not a sentence.** It implements one element with a slot for arbitrary content. Arranging a few children is fine when the
   arrangement is the element (a divider with a label, an avatar with a fallback). It becomes a pattern once the arrangement encodes a
   scenario: empty, error or retry, page chrome, a section, a screen.
3. **Decides something.** It owns interaction states (enabled, pressed, focused, loading, error, selected), an accessibility contract
   (roles, labels, tap targets) or a token-backed visual identity the consumer would otherwise re-implement. A wrapper that only
   forwards arguments fails.
4. **Slot- and primitive-driven.** It renders from structured inputs (`child`, `icon`, `leading`, `title`, `count`). A plain `String`
   label is fine; app copy and app models are not.
5. **Token-only and theme-complete.** Built from tokens and `context.colors` and `context.text`; correct in all three theme variants,
   at 200% text scale and with the platform's reduced-motion setting.

Failing check 1 or 4 makes it an app widget (shared if cross-feature, otherwise feature-local). Failing check 2 makes it a shared
widget in `common_ui`. Failing check 3 makes it a pattern if it is a recipe, and something to delete if it is a pass-through wrapper.

## Promotion gates

- **Earned.** At least three production call sites across at least two features (excluding Storybook and tests), or a standard
  primitive: button, field, checkbox, radio, switch, select, menu, dialog, sheet, toast, tooltip, tabs, nav bar, progress, avatar,
  divider, card, badge, tag, list tile. The list says what may exist, not that it all does.
- **Shipped.** Promotion needs a Storybook example and a test; a pure layout wrapper may be covered by its consumer.

## The contract

A component **must** be domain-blind, render from slots, implement exactly one element, own its states, accessibility and visual
role, be theme-complete, and ship with a Storybook example and a test. It **must not** encode a workflow, a screen state or product
copy; compose siblings into a section or screen recipe; exist only to dedupe one or two call sites; duplicate a noun another component
already owns (merge them behind one name with a variant); or wrap another widget while adding neither behavior nor a visual role.

## Placement and naming

- `Base*` is reserved for `packages/design_system/lib/src/components/<group>/`. App code, `_shared` and `common_ui` never use it
  (`BaseListView` keeps its existing name). The prefix signals a primitive.
- A shared non-design widget goes in `packages/common_ui/lib/src/widgets/` with a descriptive, non-`Base` name.
- A widget used by one feature stays in `presentation/<page>/widgets/` until it earns promotion.

## Component API conventions

There is no shared tone enum and no cross-component axis vocabulary; each component owns the enums it needs.

| Axis | Question | Form | Example |
| --- | --- | --- | --- |
| `variant` | Which skin or emphasis, with the same behavior and meaning? | per-component enum | `BaseButtonVariant`, `BaseBubbleVariant` |
| `tone` | What does it mean (a status)? | per-component enum | `BaseBannerTone` |
| `size` | How big or dense? | per-component enum or a `double` | `BaseAvatar(size: 40)` |
| state | What is it doing now? | plain booleans | `isLoading`, `isEnabled`, `isSelected` |

- Expose only an axis the component has, and use one word per axis everywhere. Color that expresses emphasis is a `variant`; color
  that expresses meaning is a `tone`.
- A value that changes behavior is a different component, not a `variant`. Never use a boolean for an axis that can grow.
- Name an enum after its axis (`BaseButtonVariant`, not `BaseButtonType`); `BaseTextFieldType` is a pre-existing exception.
- Pass enum arguments with dot shorthand: `type: .password`, `variant: .error`.

## Worked examples

| Widget | Layer | Why |
| --- | --- | --- |
| `BaseSurfaceCard`, `BaseButton`, `BaseAvatar`, `BaseDivider`, `BaseListTile`, `BaseTabBar` | Component | each is one noun with slots and its own states |
| `BaseEmptyState` | Component | the dashed empty and failure invitation with an optional action |
| `BaseApp`, `BaseView` | Root host, page shell | install `MaterialApp` and the text style; the page canvas with an `appBar` slot |
| `SkeletonizerResourceWidget`, `InfiniteListView`, `WebView` | Shared widget | depend on `Resource`, pagination or a third-party view; live in `common_ui` |

Anti-patterns: a `Base*` name on a pattern; a pass-through wrapper; a component that hardcodes copy or branches on an app model; two
components owning the same noun; promoting a widget because it happens to be used twice; demoting a shipped component because its
call-site count is low.

## Auditing the library

For each `base_*.dart`, one at a time:

1. Read its public API and behavior; do not trust the name.
2. Write its noun description and its sentence description; the one that fits wins.
3. Run the five checks and note the first one that fails.
4. Record current path, verdict (Foundation, Component, Template, Pattern or Feature), target path and name, and a rationale of at
   most 12 words.
5. When checks 2 or 3 are genuinely ambiguous, mark it borderline and state both readings instead of forcing a call.
