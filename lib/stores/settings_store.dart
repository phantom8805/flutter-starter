// ignore_for_file: library_private_types_in_public_api

import 'package:flutterstarter/enums/is_dark_mode_option.dart';
import 'package:flutterstarter/enums/scale_size.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  _SettingsStore({required this.scaleSize, required this.isDarkTheme});

  @observable
  ScaleSize scaleSize;

  @observable
  IsDarkModeOption isDarkTheme;
}
