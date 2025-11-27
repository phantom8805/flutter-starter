import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterstarter/app_router.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/models/auth/auth.dart';
import 'package:flutterstarter/services/data_providers/auth_provider_contract.dart';
import 'package:flutterstarter/services/data_providers/storage/auth_storage_provider.dart';

class AuthService {
  static AuthProviderContract provider() {
    return AuthStorageProvider();
  }

  static Auth? getDefault() {
    return null;
  }

  static Future<Auth?> loadData() async {
    try {
      final res = await AuthService.provider().loadData();
      return res.data;
    } catch (e) {
      return null;
    }
  }

  static Future<void> logout(BuildContext context) async {
    final router = context.router;

    try {
      await AuthService.provider().logout();
      router.push(AppRouter.initialGuestRoute());
    } catch (e) {
      if (!context.mounted) return;
      context.storeNonListened.showError(e);
    }
  }

  static Future<void> login({required BuildContext context, required String login, required String password}) async {
    final mainStore = context.storeNonListened;
    final router = context.router;

    try {
      final res = await AuthService.provider().login(username: login, password: password);
      if (res.message != null) {
        mainStore.addAppError(res.message!);
        return;
      }
      mainStore.authStore.user = res.data!.user;
      router.navigate(AppRouter.initialRoute());
    } catch (e) {
      mainStore.showError(e);
    }
  }
}
