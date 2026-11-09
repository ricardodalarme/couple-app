// Generates the icon font and the Flutter `AppIcons` class from the SVGs in
// `packages/ui/icons/`.
//
// The sources are outline-style SVGs (`fill="none"` + `stroke`), which font
// generators ignore: a glyph would be the bare path filled solid. So the build
// first strokes them into filled outlines with `oslllo-svg-fixer`, then builds
// the font with `fantasticon` (the pipeline Bootstrap Icons uses).
//
// Both are global build-time tools, never dependencies of the `ui` package.
//
// Setup (once per machine):
//
//   npm install -g fantasticon@4.1.0 oslllo-svg-fixer
//
// Then, to regenerate:
//
//   cd packages/ui/tool
//   dart pub get
//   dart run generate_icons.dart
//
// Add or remove an icon by adding or removing an SVG in `packages/ui/icons/`;
// the SVGs are sources only and are not shipped as Flutter assets. Kebab-case
// file names become snake_case identifiers (`chevron-left` -> `chevron_left`).

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

const _fontFamily = 'AppIcons';
const _fontHeight = '1000';
const _traceResolution = '1200';

void main() {
  final toolDir = _resolveToolDirectory();
  final uiDir = toolDir.parent;
  final iconsDir = Directory(p.join(uiDir.path, 'icons'));
  final fontFile = p.join(uiDir.path, 'assets', 'fonts', 'app_icons.ttf');
  final classFile = File(p.join(uiDir.path, 'lib', 'src', 'icons', 'app_icons.dart'));

  final svgFiles = iconsDir
      .listSync()
      .whereType<File>()
      .where((file) => p.extension(file.path).toLowerCase() == '.svg')
      .toList();
  if (svgFiles.isEmpty) {
    stderr.writeln('No SVG files found in ${iconsDir.path}.');
    exit(1);
  }

  final tempDir = Directory.systemTemp.createTempSync('app_icons_');
  try {
    final outlinedDir = Directory(p.join(tempDir.path, 'outlined'))..createSync();

    _run(
      'oslllo-svg-fixer',
      [
        '-s',
        iconsDir.path,
        '-d',
        outlinedDir.path,
        '--trace-resolution',
        _traceResolution,
        '--show-progress',
        'false',
      ],
      workingDirectory: toolDir.path,
      installHint: 'npm install -g oslllo-svg-fixer',
    );

    final fontDir = Directory(p.join(tempDir.path, 'font'))..createSync();
    _run(
      'fantasticon',
      [
        outlinedDir.path,
        '--output',
        fontDir.path,
        '--name',
        _fontFamily,
        '--font-types',
        'ttf',
        '--asset-types',
        'json',
        '--font-height',
        _fontHeight,
      ],
      workingDirectory: toolDir.path,
      installHint: 'npm install -g fantasticon@4.1.0',
    );

    final generatedFont = File(p.join(fontDir.path, '$_fontFamily.ttf'));
    if (!generatedFont.existsSync()) {
      stderr.writeln('fantasticon did not produce $_fontFamily.ttf.');
      exit(1);
    }
    File(fontFile)
      ..parent.createSync(recursive: true)
      ..writeAsBytesSync(generatedFont.readAsBytesSync());

    final codepoints = jsonDecode(
      File(p.join(fontDir.path, '$_fontFamily.json')).readAsStringSync(),
    ) as Map<String, dynamic>;
    final icons = <(String, int)>[];
    for (final entry in codepoints.entries) {
      icons.add((entry.key.replaceAll('-', '_'), entry.value as int));
    }
    icons.sort((a, b) => a.$1.compareTo(b.$1));

    _writeClass(classFile, icons);

    stdout
      ..writeln('Wrote ${p.relative(fontFile, from: uiDir.path)}')
      ..writeln('Wrote ${p.relative(classFile.path, from: uiDir.path)} (${icons.length} icons)');
  } finally {
    tempDir.deleteSync(recursive: true);
  }
}

void _run(
  String executable,
  List<String> arguments, {
  required String workingDirectory,
  required String installHint,
}) {
  final ProcessResult result;
  try {
    result = Process.runSync(executable, arguments, workingDirectory: workingDirectory);
  } on ProcessException {
    stderr.writeln('$executable was not found. Install it with `$installHint`.');
    exit(1);
  }

  if (result.exitCode != 0) {
    stderr
      ..writeln('$executable failed:')
      ..writeln(result.stdout)
      ..writeln(result.stderr);
    exit(result.exitCode);
  }
}

void _writeClass(File classFile, List<(String, int)> icons) {
  final buffer = StringBuffer()
    ..writeln('// GENERATED CODE - DO NOT MODIFY BY HAND.')
    ..writeln('// Source: packages/ui/icons/*.svg')
    ..writeln('// Regenerate: cd packages/ui/tool && dart run generate_icons.dart')
    ..writeln('//')
    ..writeln('// Icon identifiers mirror their source SVG file names.')
    ..writeln('// ignore_for_file: constant_identifier_names')
    ..writeln()
    ..writeln("import 'package:flutter/widgets.dart';")
    ..writeln()
    ..writeln('/// Icons generated from the SVGs in `packages/ui/icons`.')
    ..writeln('abstract final class AppIcons() {')
    ..writeln("  static const String fontFamily = '$_fontFamily';")
    ..writeln("  static const String fontPackage = 'ui';");

  for (final (name, codePoint) in icons) {
    final code = codePoint.toRadixString(16).padLeft(4, '0');
    buffer.writeln(
      '  static const IconData $name = '
      'IconData(0x$code, fontFamily: fontFamily, fontPackage: fontPackage);',
    );
  }

  buffer.writeln('}');
  classFile
    ..parent.createSync(recursive: true)
    ..writeAsStringSync(buffer.toString());
}

Directory _resolveToolDirectory() {
  final fromScript = File.fromUri(Platform.script).parent;
  if (File(p.join(fromScript.path, 'pubspec.yaml')).existsSync()) return fromScript;

  final current = Directory.current;
  if (p.basename(current.path) == 'tool' &&
      File(p.join(current.path, 'pubspec.yaml')).existsSync()) {
    return current;
  }

  throw StateError('Run this script from packages/ui/tool.');
}
