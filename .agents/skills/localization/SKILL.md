---
name: localization
description: Adds or changes user-facing strings with slang in the app or the design system. Covers the per-namespace JSON files and base locales, the melos l10n and l10n:analyze workflow, key naming, runtime error and enum maps read with selectOrFallback and selectOrNull, and interpolation. Use whenever adding text, labels, hints, messages or error strings to the UI, when asked to localize or translate, or when a hardcoded string must become translatable.
---

# Localization

All user-facing text lives in slang JSON files; widgets never contain hardcoded strings. The app is Brazilian Portuguese first and
English second.

| | App | Design system |
| --- | --- | --- |
| Files | `app/lib/l10n/{pt,en}/<namespace>.json` | `packages/design_system/lib/src/l10n/{en,pt}/<namespace>.json` |
| Base locale (source of truth) | **`pt`** (`app/slang.yaml`) | **`en`** (`packages/design_system/slang.yaml`) |
| Read with | `context.l10n.<namespace>.<key>` | `context.designSystemL10nOrBase.<namespace>.<key>` (`package:design_system/design_system_l10n.dart`) |
| Generated | `app/lib/l10n/translations*.g.dart` | `.../l10n/translations*.g.dart` |

Every namespace has a file in both locales. The file name is the namespace and must be unique within its package; shared copy goes
in `common.json`. App copy never goes in the design-system package, and design-system labels never go in the app.
`fallback_strategy: base_locale` shows the base string when a translation is missing, so add the base-locale key first and then the
other locale deliberately. Never machine-translate inline. Slang formats the JSON on generation (width 100); do not hand-align it.

## Workflow

1. Add or change the key in the base locale file, then in the sibling locale.
2. `melos l10n` regenerates the app and design-system translations. An "undefined getter" on `context.l10n...` means stale generation.
3. Read the key in code.
4. `melos l10n:analyze` fails on a missing or unused key (CI and the pre-push hook run it). Delete or fix keys instead of leaving
   orphans; a `@:common.genericError` link counts as a use.
5. Commit the regenerated `translations*.g.dart`; never edit them by hand.

## Key names

Camel case, with the feature name left out (the namespace already carries it). Name a key for its role with a suffix:
`title`, `subtitle`, `entryText`, `titleLabel`, `titleHint`, `continueAction`, `emptyPageTitle`. Group by screen or component only when
a namespace holds several screens. A map is named for what it maps: `titleErrors(map)`, `budgets(map)`.

Copy follows the product rules: sentence case (except micro-labels), a calm and non-guilt-inducing tone, and no claim the data
cannot support.

## Runtime maps

A key with the `(map)` modifier generates a `Map<String, String>` for codes known only at runtime. Every map has an `other` entry.

```json
{
  "errors(map)": { "unauthorized": "Your session expired. Sign in again.", "other": "@:common.genericError" },
  "titleErrors(map)": { "empty": "Add a title", "tooLong": "Too long", "other": "Check this field" }
}
```

```dart
BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));       // exceptions: always a message
errorText: l10n.titleErrors.selectOrNull(title.errorName),                       // form fields: null when valid
```

- `selectOrFallback(key)` falls back to `other`, including for a null key. `selectOrNull(key)` returns `null` for a valid field.
  Use `selectOrNull` for form errors, or a valid field would show the `other` copy.
- Validation maps are named `<field>Errors` and keyed by the validator error names (`empty`, `tooLong`, `tooShort`, `invalid`,
  `outOfRange`).
- Never show a raw server code or exception message; map it to localized text.

### Maps keyed by an enum

Keys are the enum's camelCase `.name` and the lookup is `selectOrFallback(kind.name)`:

```json
{ "budgets(map)": { "free": "Free", "medium": "Medium", "other": "" } }
```

```dart
context.l10n.gifts.budgets.selectOrFallback(gift.budget.name)
```

A multi-word value is camelCase (`so_so` is `soSo`). When an enum member is added or renamed, rename the key in every locale, then run
`melos l10n` and `melos l10n:analyze`. Never add a `value` or `wire` field to the enum to use as a key, and never look a map up with
a string literal.

## Interpolation and other slang features

Placeholders use braces (`string_interpolation: braces`): `"Welcome back, {name}!"` is read as `l10n.profile.welcome(name: x)`. Escape a
literal brace as `\{`. Declare a type when it matters (`{minutes: int}`). Plurals, rich text, lists and linked translations follow the
slang documentation; use them instead of building strings in Dart.

## Gotchas

- Tests render real translations through `TranslationProvider` in `pumpApp`; no l10n mock is needed.
- Two files with the same namespace name in one package overwrite each other without a warning.
- Interpolation is `{name}`, not `{}` or `%s`.
