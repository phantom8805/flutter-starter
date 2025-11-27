import 'package:flutterstarter/models/auth/auth.dart';
import 'package:flutterstarter/models/base_response.dart';
import 'package:flutterstarter/services/data_providers/auth_provider_contract.dart';
import 'package:flutterstarter/utils/http.dart';
import 'package:get_it/get_it.dart';

class AuthApi implements AuthProviderContract {
  @override
  Future<BaseResponse<Auth>> loadData() async {
    final res = await GetIt.I<Http>().get('app-data');
    return BaseResponse<Auth>.fromJson(res, (d) => Auth.fromJson(d));
  }

  @override
  Future<BaseResponse<Auth>> login({required String username, required String password}) async {
    final res = await GetIt.I<Http>().post(path: 'login', body: {'login': username, 'password': password});
    final response = BaseResponse<Auth>.fromJson(res, (d) => Auth.fromJson(d));

    return response;
  }

  @override
  Future<void> logout() async {
    await GetIt.I<Http>().post(path: 'logout');
  }
}
