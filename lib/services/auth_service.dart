import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutterstarter/app_router.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/models/auth/app_data.dart';
import 'package:flutterstarter/models/base_response.dart';

class AuthService {
  static Future<void> logout(BuildContext context) async {
    final mainStore = context.storeNonListened;
    final router = context.router;

    await mainStore.authApi.logout();

    try {
      mainStore.loadAppData();
    } finally {
      router.push(AppRouter.initialGuestRoute());
    }
  }

  static Future<void> login({required BuildContext context, required String login, required String password}) async {
    final mainStore = context.storeNonListened;
    final router = context.router;

    const defaultErrorMessage = 'Unknown error';

    try {
      final authResponse = await mainStore.authApi.login(
        username: login,
        password: password,
      );

      if (authResponse.data == null) {
        final errorResponse = BaseResponse.errorResponse<AppData>(authResponse.message ?? defaultErrorMessage);
        mainStore.addMessages(errorResponse.errors);
        return;
      }
    } catch (error) {
      mainStore.addAppError(defaultErrorMessage);
    }

    try {
      final appDataResponse = await mainStore.loadAppData();

      if (appDataResponse.hasErrors) {
        mainStore.addMessages(appDataResponse.errors);
        return;
      }

      TextInput.finishAutofillContext();
      router.navigate(AppRouter.initialRoute());
    } catch (error) {
      mainStore.addAppError(defaultErrorMessage);
    }
  }
}
