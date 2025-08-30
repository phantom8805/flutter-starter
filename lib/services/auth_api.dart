import 'package:flutterstarter/models/auth/app_data.dart';
import 'package:flutterstarter/models/auth/auth.dart';
import 'package:flutterstarter/models/base_response.dart';
import 'package:flutterstarter/utils/http.dart';
import 'package:flutterstarter/utils/shared_preferences_facade.dart';
import 'package:get_it/get_it.dart';

class AuthApi {
  Future<BaseResponse<Auth>> login({required String username, required String password}) async {
    final res = await GetIt.I<Http>().post(path: 'login', body: {'login': username, 'password': password});

    final response = BaseResponse<Auth>.fromJson(res, (d) => Auth.fromJson(d));

    if (response.data != null) {
      await GetIt.I<Http>().setToken(response.data!.token);
    }

    return response;
  }

  Future<bool> logout() async {
    await GetIt.I<Http>().post(path: 'logout');
    await SharedPreferencesFacade().cleanAll();
    return true;
  }

  Future<BaseResponse<AppData>> appData() async {
    try {
      final http = GetIt.I<Http>();
      if (http.token.isEmpty) return BaseResponse.emptyResponse<AppData>();

      final res = await GetIt.I<Http>().post(path: 'get-app-data');
      final response = BaseResponse<AppData>.fromJson(res, (d) => AppData.fromJson(d));

      return response;
    } catch (error) {
      return BaseResponse.errorResponse<AppData>(error.toString());
    }
  }
}
