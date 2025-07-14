# Localization Guide


- [Overview](#overview)
- [File Structure](#file-structure)
- [Generating Translations](#generating-translations)
- [Accessing Translations in Widgets](#accessing-translations-in-widgets)
- [Key Naming Conventions](#key-naming-conventions)
  - [1. Scope Keys by File](#1-scope-keys-by-file)
  - [2. Prefix Keys with the Component Type](#2-prefix-keys-with-the-component-type)
  - [Defining a Map](#defining-a-map)
  - [Helper for Safe Access](#helper-for-safe-access)


## Overview

This guide outlines how to use localization in this project. We use the [**Slang**](https://pub.dev/packages/slang) package to manage translations and generate type-safe accessors. The app currently supports **Portuguese (pt)** and **English (en)**.

## File Structure

All translation files are located in `/lib/l10n/`. Each language has its own directory, and translations are split into files based on features or domains.

```
/lib/l10n/
  ├── en/
  │   ├── common.json
  │   ├── login.json
  │   └── profile.json
  └── pt/
      ├── common.json
      ├── login.json
      └── profile.json
```

  - **Feature-specific files**: `login.json`, `profile.json`, etc., contain translations for a single feature.
  - **Shared file**: `common.json` contains translations used across multiple features (e.g., "Save", "Cancel", "Email").

## Generating Translations

After modifying any `.json` file, you must regenerate the translation classes. Run the following command:

```bash
melos l10n
```

This command executes the Slang builder and updates the generated file at `lib/l10n/translations.g.dart`. **This generated file should not be edited manually.**

## Accessing Translations in Widgets

To use a translation, access the `l10n` object from the `BuildContext`. Slang provides a convenient extension for this.

```dart
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access translations via context.l10n
    return Text(context.l10n.login.textTitle);
  }
}
```

## Key Naming Conventions

Follow these conventions to keep translations consistent and predictable.

### 1\. Scope Keys by File

The filename itself provides the primary context (e.g., `login`, `profile`). Keys inside the file should describe the UI element and its purpose, **without repeating the feature's name**.

**DO:** In `login.json`, use keys prefixed with the component type.

```json
// login.json
{
  "textTitle": "Welcome Back",
  "textFieldEmailHint": "Enter your email",
  "buttonSubmit": "Login"
}
```

**DON'T:** Don't repeat the feature name inside the key.

```json
// login.json (BAD EXAMPLE)
{
  "loginTextTitle": "Welcome Back",       // Redundant, "login" is in the filename
  "loginButtonSubmit": "Login"          // Redundant
}
```

### 2\. Prefix Keys with the Component Type

Every key **must** be prefixed with its primitive UI component type, followed by a descriptive name. This makes autocompletion predictable.

The pattern is: `componentType` + `Context` + `Purpose`.

**Examples:**

  - `buttonSubmit`
  - `textFieldNameLabel`
  - `textFieldEmailHint`
  - `dialogConfirmTitle`
  - `textWelcome`
  - `labelSessionExpires`

For sets of related values, like validation errors or enum states, use Slang's map feature. This is useful when the key you need to look up is determined at runtime.

### Defining a Map

In your JSON file, add `(map)` to the key name.

```json
// profile.json
{
  "validationErrors(map)": {
    "empty": "This field cannot be empty.",
    "invalidEmail": "Please enter a valid email address.",
    "other": "An unknown error occurred."
  }
}
```

### Helper for Safe Access

To safely handle cases where a key might not exist, use the provided `selectOrFallback` extension method. It falls back to the `other` key if the provided key is not found.

```dart
import 'package:quickstart_flutter_bloc/l10n/l10n_map_extension.dart';

// errorCode is a variable, e.g., "invalidEmail" or "someOtherError"
String errorMessage = context.l10n.profile.validationErrors.selectOrFallback(errorCode);
```

  - If `errorCode` is `"invalidEmail"`, it returns `"Please enter a valid email address."`.
  - If `errorCode` is `"something_else"`, it returns `"An unknown error occurred."` (the value of the `other` key).


> For more information, refer to the [Slang documentation](https://pub.dev/packages/slang).
