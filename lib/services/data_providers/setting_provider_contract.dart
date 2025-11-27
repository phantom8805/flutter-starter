import 'package:flutterstarter/models/base_response.dart';
import 'package:flutterstarter/models/settings/app_settings.dart';

abstract interface class SettingProviderContract {
  Future<BaseResponse<AppSettings>> loadData();

  Future<void> updateSettings(AppSettings context);
}
