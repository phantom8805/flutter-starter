import 'package:flutter/cupertino.dart';
import 'package:flutterstarter/enums/is_dark_mode_option.dart';
import 'package:flutterstarter/enums/scale_size.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/models/settings/app_settings.dart';
import 'package:flutterstarter/services/data_providers/setting_provider_contract.dart';
import 'package:flutterstarter/services/data_providers/storage/setting_storage_provider.dart';

class SettingsService {
  static SettingProviderContract provider() {
    return SettingStorageProvider();
  }

  static AppSettings getDefault() {
    return AppSettings(scaleSize: ScaleSize.medium, isDarkTheme: IsDarkModeOption.no);
  }

  static Future<AppSettings> loadData() async {
    try {
      final res = await SettingsService.provider().loadData();
      return res.data!;
    } catch (_) {
      return SettingsService.getDefault();
    }
  }

  static Future<void> updateSettings(BuildContext context) async {
    try {
      final store = context.storeNonListened.settingsStore;
      final model = AppSettings(scaleSize: store.scaleSize, isDarkTheme: store.isDarkTheme);
      SettingsService.provider().updateSettings(model);
    } catch (e) {
      context.storeNonListened.showError(e);
    }
  }
}
