import 'dart:convert';

import 'package:flutterstarter/models/base_response.dart';
import 'package:flutterstarter/models/settings/app_settings.dart';
import 'package:flutterstarter/services/data_providers/setting_provider_contract.dart';
import 'package:flutterstarter/utils/shared_preferences_facade.dart';

class SettingStorageProvider implements SettingProviderContract {
  static const settingsKeySuffix = 'settings';

  SharedPreferencesFacade storage = SharedPreferencesFacade();
  String storageKey = 'setting-storage';

  String get settingsKey => '$storageKey/$settingsKeySuffix';

  @override
  Future<BaseResponse<AppSettings>> loadData() async {
    try {
      final strRes = await storage.getOrFail(settingsKey);
      final res = jsonDecode(strRes);

      return BaseResponse.successResponse<AppSettings>(AppSettings.fromJson(res));
    } catch (e) {
      return BaseResponse.errorResponse(e.toString());
    }
  }

  @override
  Future<void> updateSettings(AppSettings model) async {
    final json = JsonEncoder().convert(model.toJson());
    await storage.set(settingsKey, json);
  }
}
