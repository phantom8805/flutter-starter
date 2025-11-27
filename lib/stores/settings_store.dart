import 'package:flutterstarter/enums/is_dark_mode_option.dart';
import 'package:flutterstarter/enums/scale_size.dart';
import 'package:flutterstarter/models/settings/app_settings.dart';
import 'package:flutterstarter/services/settings_service.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore extends _SettingsStore with _$SettingsStore {
  SettingsStore({required super.scaleSize, required super.isDarkTheme});

  factory SettingsStore.fromModel(AppSettings model) {
    return SettingsStore(scaleSize: model.scaleSize, isDarkTheme: model.isDarkTheme);
  }

  factory SettingsStore.makeDefault() {
    return SettingsStore.fromModel(SettingsService.getDefault());
  }
}

abstract class _SettingsStore with Store {
  _SettingsStore({required this.scaleSize, required this.isDarkTheme});

  @observable
  ScaleSize scaleSize;

  @observable
  IsDarkModeOption isDarkTheme;

  Future<AppSettings> init() async {
    final data = await SettingsService.loadData();
    scaleSize = data.scaleSize;
    isDarkTheme = data.isDarkTheme;
    return data;
  }
}
