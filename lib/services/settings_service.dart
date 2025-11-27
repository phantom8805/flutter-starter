import 'package:flutter/cupertino.dart';
import 'package:flutterstarter/enums/is_dark_mode_option.dart';
import 'package:flutterstarter/enums/scale_size.dart';
import 'package:flutterstarter/models/settings/app_settings.dart';

class SettingsService {
  static AppSettings getDefault() {
    return AppSettings(scaleSize: ScaleSize.medium, isDarkTheme: IsDarkModeOption.no);
  }

  static Future<AppSettings> loadData() async {
    try {
      return SettingsService.getDefault();
    } catch (_) {
      return SettingsService.getDefault();
    }
  }

  static Future<void> updateSettings(BuildContext context) async {}
}
