import 'dart:convert';

import 'package:flutterstarter/models/base_response.dart';
import 'package:flutterstarter/models/settings/app_settings.dart';
import 'package:flutterstarter/services/data_providers/setting_provider_contract.dart';
import 'package:flutterstarter/utils/http.dart';
import 'package:get_it/get_it.dart';

class SettingApi implements SettingProviderContract {
  @override
  Future<BaseResponse<AppSettings>> loadData() async {
    final res = await GetIt.I<Http>().get('settings');
    return BaseResponse<AppSettings>.fromJson(res, (d) => AppSettings.fromJson(d));
  }

  @override
  Future<void> updateSettings(AppSettings model) async {
    final json = JsonEncoder().convert(model.toJson());
    return await GetIt.I<Http>().post(path: 'settings', body: json);
  }
}
