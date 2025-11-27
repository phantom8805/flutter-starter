import 'dart:convert';

import 'package:flutterstarter/models/auth/auth.dart';
import 'package:flutterstarter/models/auth/user.dart';
import 'package:flutterstarter/models/base_response.dart';
import 'package:flutterstarter/services/data_providers/auth_provider_contract.dart';
import 'package:flutterstarter/utils/shared_preferences_facade.dart';

class AuthStorageProvider implements AuthProviderContract {
  static const appDataKeySuffix = 'app-data';

  SharedPreferencesFacade storage = SharedPreferencesFacade();
  String storageKey = 'auth-storage';

  String get appDataKey => '$storageKey/$appDataKeySuffix';

  @override
  Future<BaseResponse<Auth>> loadData() async {
    try {
      final strRes = await storage.getOrFail(appDataKey);
      final res = jsonDecode(strRes);

      return BaseResponse.successResponse<Auth>(Auth.fromJson(res));
    } catch(e) {
      return BaseResponse.errorResponse(e.toString());
    }
  }

  @override
  Future<BaseResponse<Auth>> login({required String username, required String password}) async {
    final dataToSave = Auth(
      user: User(id: username, name: username),
    );

    final json = JsonEncoder().convert(dataToSave.toJson());

    await storage.set(appDataKey, json);

    return loadData();
  }

  @override
  Future<void> logout() async {
    await storage.remove(appDataKey);
  }
}
