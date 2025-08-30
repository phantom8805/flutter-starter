import 'package:flutterstarter/enums/is_dark_mode_option.dart';
import 'package:flutterstarter/enums/scale_size.dart';
import 'package:flutterstarter/models/settings/app_settings.dart';
import 'package:flutterstarter/stores/settings_store.dart';

class SettingsConverter {
  static SettingsStore createDefaultSettingsStore() {
    return SettingsStore(scaleSize: ScaleSize.medium, isDarkTheme: IsDarkModeOption.no);
  }

  static void updateSettingsStore(SettingsStore store, AppSettings appSettings) {
    store.scaleSize = appSettings.scaleSize;
    store.isDarkTheme = appSettings.isDarkTheme;
  }

  static AppSettings getAppSettingsFromStore(SettingsStore store) {
    return AppSettings(scaleSize: store.scaleSize, isDarkTheme: store.isDarkTheme);
  }
}
