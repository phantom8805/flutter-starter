import 'package:flutterstarter/utils/http.dart';
import 'package:get_it/get_it.dart';

class SettingApi {
  Future<void> saveSettings(dynamic data) async {
    return await GetIt.I<Http>().post(path: 'settings', body: data);
  }
}
