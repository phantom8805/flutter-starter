import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterstarter/app_router.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/models/auth/auth.dart';

class AuthService {
  static Auth? getDefault() {
    return null;
  }

  static Future<Auth?> loadData() async {
    return null;
  }

  static Future<void> logout(BuildContext context) async {
    final router = context.router;

    try {
      router.push(AppRouter.initialGuestRoute());
    } catch (e) {
      context.storeNonListened.addAppError('Error: $e');
    }
  }

  static Future<void> login({required BuildContext context, required String login, required String password}) async {
    final mainStore = context.storeNonListened;
    final router = context.router;

    try {
      router.navigate(AppRouter.initialRoute());
    } catch (e) {
      mainStore.addAppError('Error: $e');
    }
  }
}
