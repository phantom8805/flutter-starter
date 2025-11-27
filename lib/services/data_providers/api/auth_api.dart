import 'package:flutterstarter/models/auth/auth.dart';
import 'package:flutterstarter/models/base_response.dart';
import 'package:flutterstarter/utils/http.dart';
import 'package:flutterstarter/utils/shared_preferences_facade.dart';
import 'package:get_it/get_it.dart';

class AuthApi {
  Future<BaseResponse<Auth>> login({required String username, required String password}) async {
    final res = await GetIt.I<Http>().post(path: 'login', body: {'login': username, 'password': password});

    final response = BaseResponse<Auth>.fromJson(res, (d) => Auth.fromJson(d));

    return response;
  }

  Future<bool> logout() async {
    await GetIt.I<Http>().post(path: 'logout');
    await SharedPreferencesFacade().cleanAll();
    return true;
  }
}
