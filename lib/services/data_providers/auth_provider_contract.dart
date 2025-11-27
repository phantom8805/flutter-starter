import 'package:flutterstarter/models/auth/auth.dart';
import 'package:flutterstarter/models/base_response.dart';

abstract interface class AuthProviderContract {
  Future<BaseResponse<Auth>> login({required String username, required String password});

  Future<void> logout();

  Future<BaseResponse<Auth>> loadData();
}
