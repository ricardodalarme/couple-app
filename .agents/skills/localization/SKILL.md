---
name: localization
description: Add or change user-facing strings in the app or design system with slang — edit the package's l10n/en/<namespace>.json (with a pt sibling), regenerate with melos l10n, read app keys as context.l10n.<namespace>.<key> and design-system keys as context.designSystemL10nOrBase.<namespace>.<key>, resolve runtime error codes with (map) maps plus selectOrFallback, and validate with melos l10n:analyze. Use whenever adding text, labels, hints, messages, or error strings to the UI, when the user says "localize", "translation", "l10n", or when a hardcoded string must become translatable.
---

# Localization in the app

All user-facing text lives in per-namespace JSON files under `app/lib/l10n/en/`
(with translated siblings in `app/lib/l10n/pt/`) and is compiled by
[slang](https://slang.i18n.dev) into `app/lib/l10n/translations.g.dart`.
**Hardcoded user-facing strings are not allowed in widgets.**

## Layout

```
app/
├── slang.yaml                     # slang config (the only place it lives)
└── lib/
    └── l10n/
        ├── en/                    # base locale, source of truth
        │   ├── common.json
        │   ├── authentication.json
        │   ├── account.json
        │   ├── onboarding.json
        │   ├── post.json
        │   ├── search.json
        │   ├── settings.json
        │   ├── privacy_policy.json
        │   ├── terms.json
        │   └── not_found.json
        ├── pt/                    # translated locale, same file names
        │   └── <namespace>.json
        ├── l10n_map_extension.dart      # Map<String, String>.selectOrFallback
        ├── translations.g.dart          # generated, entry point + TranslationProvider
        ├── translations_en.g.dart       # generated, part of translations.g.dart
        └── translations_pt.g.dart       # generated, part of translations.g.dart
```

The directory name under `l10n/` is the locale (`en`, `pt`) and the file name is
the **namespace**, so `l10n/en/post.json` becomes `context.l10n.post`. Namespace
names must be unique across the whole app; a duplicate file name silently
collides.

`app/slang.yaml` is the whole configuration:

```yaml
base_locale: en
fallback_strategy: base_locale
input_directory: lib/l10n
input_file_pattern: .json
namespaces: true
key_case: camel
string_interpolation: braces
lazy: false
output_directory: lib/l10n
output_file_name: translations.g.dart
translate_var: l10n
```

`translate_var: l10n` is why every read is spelled `context.l10n...`.

## Design-system strings

`packages/design_system` has its own slang setup for strings owned by the design system:

```
packages/design_system/
├── slang.yaml
└── lib/src/l10n/
    ├── en/{common,navigation,input}.json
    ├── pt/{common,navigation,input}.json
    └── translations*.g.dart      # generated, not exported from design_system.dart
```

- Read them with `context.designSystemL10nOrBase.<namespace>.<key>` from
  `package:design_system/design_system_l10n.dart`. `BaseApp` installs the `TranslationProvider`;
  `designSystemL10nOrBase` falls back to the base locale when a component is rendered
  without one, which keeps isolated widget tests working.
- Never put design-system labels in `app/lib/l10n`, and never put app copy in
  `packages/design_system/lib/src/l10n`.
- `melos l10n` regenerates both packages; `melos l10n:analyze` checks both.
`format.enabled` is on, so slang reformats the JSON files on generation — let it
own the formatting instead of hand-aligning.

**English is the base locale and the source of truth.** `pt` files are maintained
separately and must never be machine-translated inline while adding an `en` key;
add the `en` key first, then fill in the `pt` value deliberately (or leave the
base-locale fallback in place until a translation exists).

## Workflow

1. Add or update the key in `app/lib/l10n/en/<namespace>.json` (create the file if
   the namespace is new; shared copy goes in `common.json`).
2. Regenerate: `melos l10n` (from the repo root — it runs `dart run slang` in
   every package that depends on slang).
3. Read the key in code: `context.l10n.<namespace>.<keyPath>`.
4. Verify consistency: `melos l10n:analyze` (what CI and the pre-push hook run; it
   exits non-zero on missing or unused keys).
5. Commit the regenerated `translations*.dart` files.

## Key naming

- camelCase, scoped by component type, **no feature-name repetition** (the
  namespace already provides it):

```json
{
  "list": {
    "title": "Feed",
    "fieldSearchHint": "Search posts",
    "buttonClearFilters": "Clear filters",
    "textFailure": "Failed to load feed.",
    "emptyIndicator": {
      "title": "No posts found"
    }
  },
  "detail": {
    "buttonSave": "Save post",
    "messageSaved": "Post saved"
  }
}
```

Prefixes in use: `button*`, `field*Label`/`field*Hint`, `text*`, `dialog*`,
`label*`, `message*`, and `errors` maps. Nest by screen or component
(`list`, `detail`, `profile`) rather than by widget class name.

## Runtime-key maps + selectOrFallback

Keys with the `(map)` modifier generate `Map<String, String>` accessors. This is
the pattern for server or validation codes whose key is only known at runtime:

```json
{
  "createErrors(map)": {
    "serverError": "The server rejected this post",
    "unauthorized": "Sign in again to continue",
    "other": "@:common.genericError"
  }
}
```

```dart
// field-level validation from form_inputs
errorText: context.l10n.memories.titleErrors.selectOrNull(title.errorName),

// exceptions (l10nKey comes from LocalizedException)
BaseToast.show(
  context,
  context.l10n.post.createErrors.selectOrFallback(exception.l10nKey),
);
```

- Every map **must contain an `other` entry** — `selectOrFallback` falls back to
  it and also handles a `null` key.
- Validation maps are named `<field>Errors` and their keys are the validator
  enum names: `empty`, `tooLong`, `tooShort`, `invalid`, `outOfRange`. Read them
  with `selectOrNull(field.errorName)`, which returns `null` for a valid field —
  never `selectOrFallback`, or a valid field would show the `other` copy.
- Reference shared copy with `@:common.genericError` instead of duplicating it.
- Prefer `selectOrFallback` over raw `[]` whenever the key is dynamic
  (`app/lib/l10n/l10n_map_extension.dart`).
- Never surface a raw server or validation code as user copy — always map it to
  localized text.

## Slang Features Reference (Authoring Translations)

Slang supports rich features directly in the JSON trees. Because the project sets
`string_interpolation: braces`, all placeholders use `{param}` syntax.

### String Interpolation & Escaping

- Use `{param}` for dynamic values.
- Escape literal braces with a backslash: `\{notAnArgument}`.

```json
{
  "profile": {
    "welcome": "Welcome back, {name}!"
  }
}
```

```dart
context.l10n.account.profile.welcome(name: user.displayName);
```

### Typed Parameters

Parameters default to `Object`. Declare explicit Dart types for compile-time
safety:

```json
{
  "list": {
    "postSummary": "{title: String} was published {minutes: int} minutes ago"
  }
}
```

```dart
context.l10n.post.list.postSummary(title: post.title, minutes: 12);
```

### Linked Translations

Reference other translations instead of duplicating copy:

- **Absolute link**: `@:namespace.path.to.key` (required across namespaces).
- **Relative link**: `@:.siblingKey` (resolves relative to the parent object).
- **Escaping / attached text**: `@:{namespace.path.key}Suffix`.

```json
{
  "fields": {
    "name": "item {index}"
  },
  "greeting": "Hello, @:.fields.name!",
  "serverError": "@:common.genericError"
}
```

```dart
context.l10n.post.greeting(index: 3);
```

*Note: RichText translations can link too, but only to other RichText
translations.*

### Pluralization (Cardinals & Ordinals)

Detected automatically when a node contains CLDR plural keys: `zero`, `one`,
`two`, `few`, `many`, `other`.

- The default parameter name is `n`; override it with `(param=...)`.
- The default mode is cardinal. Use `(ordinal)` for 1st/2nd/3rd rankings.

```json
{
  "itemCount(plural, param=count)": {
    "zero": "No items yet",
    "one": "1 item",
    "other": "{count} items"
  },
  "leaderboardRank(ordinal, param=rank)": {
    "one": "{rank}st place",
    "two": "{rank}nd place",
    "few": "{rank}rd place",
    "other": "{rank}th place"
  }
}
```

```dart
context.l10n.post.itemCount(count: items.length);
context.l10n.post.leaderboardRank(rank: 2); // "2nd place"
```

### RichText (Formatted & Interactive Spans)

Style substrings or attach gesture recognizers with the `(rich)` modifier.

- Mark placeholders inside the string with `{param(defaultText)}`.

```json
{
  "termsNotice(rich)": "By continuing you agree to our {tos(Terms of Use)} and {privacy(Privacy Policy)}."
}
```

```dart
Text.rich(
  context.l10n.authentication.signup.termsNotice(
    tos: (text) => TextSpan(
      text: text,
      style: TextStyle(color: context.colors.actionPrimary),
      recognizer: TapGestureRecognizer()..onTap = openTerms,
    ),
    privacy: (text) => TextSpan(
      text: text,
      style: TextStyle(color: context.colors.actionPrimary),
      recognizer: TapGestureRecognizer()..onTap = openPrivacy,
    ),
  ),
)
```

### Lists & Arrays

JSON lists are supported out of the box and are indexable:

- They can hold strings, nested lists, or structured objects.

```json
{
  "steps": [
    "Create your workspace",
    "Invite your teammates",
    "Publish your first post"
  ]
}
```

```dart
final String firstStep = context.l10n.onboarding.steps[0];
```

Structured lists can also be generated as typed interfaces with
`(interface=TypeName)`, which is how `app/lib/l10n/en/onboarding.json` backs the
onboarding page data.

### Maps (Runtime Key Lookups)

Use the `(map)` modifier to generate a `Map<String, String>` for keys that are
only known at runtime, such as error codes.

- Always include an `other` key and read values through `selectOrFallback`.

```json
{
  "createErrors(map)": {
    "serverError": "The server rejected this post",
    "unauthorized": "Sign in again to continue",
    "other": "@:common.genericError"
  }
}
```

```dart
context.l10n.post.createErrors.selectOrFallback(errorCode);
```

### Modifiers Quick Reference

Modifiers sit in parentheses in the JSON key, e.g. `"key(modifier)"`:

| Modifier | Target | Effect |
| --- | --- | --- |
| `(rich)` | Leaves, Plurals, Contexts | Generates a RichText / `InlineSpan` builder |
| `(map)` | Objects | Generates a `Map<String, String>` accessor |
| `(plural)` / `(cardinal)` | Objects | Cardinal pluralization (`zero`, `one`, `other`, …) |
| `(ordinal)` | Objects | Ordinal pluralization (`1st`, `2nd`, `3rd`, …) |
| `(param=paramName)` | Plurals / Contexts | Renames the generated argument parameter |
| `(interface=TypeName)` | Lists | Generates a typed list interface |
| `(ignoreMissing)` | Any node | Skips missing-translation warnings in `slang analyze` |
| `(ignoreUnused)` | Any node | Skips unused-translation warnings in `slang analyze` |

*Modifiers combine with commas*: `"items(plural, param=count, rich)": { ... }`

## Gotchas

- `melos l10n` must finish before a new key can compile — an "undefined getter"
  error on `context.l10n...` is almost always stale generation.
- Generated translation files are committed; never edit `translations*.dart` by
  hand.
- `melos l10n:analyze` fails the build when a key is unused or a locale value is
  missing — delete or fix keys instead of leaving orphans.
- A namespace file name is global: two `post.json` files under `en/` silently
  overwrite each other with no warning from `slang analyze`.
- Interpolation placeholders are `{name}` (braces), not `{}` or `%s`.
- `@:common.genericError`-style links count as usage; keep the shared string in
  `common.json` instead of inlining it.
- Tests render through `TranslationProvider` via `pumpApp`
  (`app/test/test_helpers/pump_app.dart`) — no mock l10n is needed.
- Copy follows the design system: sentence case except micro-labels, and never a
  claim the data cannot support.
