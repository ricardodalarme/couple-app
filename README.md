# Flutter Bloc Starter

[![Code Check](https://github.com/ricardodalarme/quickstart-flutter-bloc/actions/workflows/code-check.yml/badge.svg)](https://github.com/ricardodalarme/quickstart-flutter-bloc/actions/workflows/code-check.yml)

Base repository for application using Flutter + Bloc

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Motivation](#motivation)
- [Setup](#setup)
  - [Pre-requirements](#pre-requirements)
  - [Install Melos](#install-melos)
  - [Bootstrap](#bootstrap)
- [Running it](#running-it)
  - [Mobile App](#mobile-app)
    - [VSCode (Recommended)](#vscode-recommended)
    - [Android Studio](#android-studio)
- [Documentation](#documentation)

## Motivation

A template to build multiplatform mobile projects in Flutter. The Cubit class from [flutter_bloc](https://pub.dev/packages/flutter_bloc) is used to manage the application state.

## Setup

### Pre-requirements

Download the following installation bundle to get the latest stable release of the [Flutter SDK](https://docs.flutter.dev/get-started/install/linux).

From a console window that has the Flutter directory in the path, run the following command to see if there are any platform dependencies you need to complete the setup:

```bash
flutter doctor
```

### Install Melos

[Melos](https://github.com/invertase/melos) is a tool for managing Dart and Flutter projects featuring multiple packages. The quickstart uses it to manage the packages in the project in a easy way. To install Melos, execute the following command:

```bash
dart pub global activate melos
```

### Bootstrap

To get started, you will need to install the dependencies and the Git Hooks.

Git Hooks are shell scripts that run automatically before or after Git executes an important command, such as _Commit_ or _Push_.

Fortunately, Melos has a command that does this for us. To install the dependencies and Git Hooks, run the following command:

```bash
melos bootstrap
```

## Running it

Now everything is set. Let's run it!

### Mobile App

#### VSCode (Recommended)

- In the target selector, select a device for running the app.
- Invoke Run > Start Debugging or press F5.
- Wait for the app to launch — progress is printed in the Debug Console view.

#### Android Studio

- In the target selector, select a device for running the app.
- Click the run icon in the toolbar, or invoke the menu item Run > Run.

## Backend

- **Supabase** — schema-first database, migrations, seed, and pgTAP tests live in
  [`supabase/`](supabase/README.md). The app reads `posts` through `pg_graphql`.
- **Firebase** — dev and production client configs are committed per flavor under
  `app/android/app/src/{development,production}` and
  `app/ios/config/{development,production}`.

## Documentation

- [Contributing](https://github.com/ricardodalarme/quickstart-flutter-bloc/wiki/Contributing)
- [Code Guidelines](https://github.com/ricardodalarme/quickstart-flutter-bloc/wiki/Code-Guidelines)
- [Environment Variables](https://github.com/ricardodalarme/quickstart-flutter-bloc/wiki/Environment-Variables)
- [Troubleshooting](https://github.com/ricardodalarme/quickstart-flutter-bloc/wiki/Troubleshooting)
