// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStore, Store {
  late final _$scaleSizeAtom =
      Atom(name: '_SettingsStore.scaleSize', context: context);

  @override
  ScaleSize get scaleSize {
    _$scaleSizeAtom.reportRead();
    return super.scaleSize;
  }

  @override
  set scaleSize(ScaleSize value) {
    _$scaleSizeAtom.reportWrite(value, super.scaleSize, () {
      super.scaleSize = value;
    });
  }

  late final _$isDarkThemeAtom =
      Atom(name: '_SettingsStore.isDarkTheme', context: context);

  @override
  IsDarkModeOption get isDarkTheme {
    _$isDarkThemeAtom.reportRead();
    return super.isDarkTheme;
  }

  @override
  set isDarkTheme(IsDarkModeOption value) {
    _$isDarkThemeAtom.reportWrite(value, super.isDarkTheme, () {
      super.isDarkTheme = value;
    });
  }

  @override
  String toString() {
    return '''
scaleSize: ${scaleSize},
isDarkTheme: ${isDarkTheme}
    ''';
  }
}
