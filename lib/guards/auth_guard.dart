import 'package:auto_route/auto_route.dart';
import 'package:flutterstarter/app_router.dart';
import 'package:flutterstarter/stores/main_store.dart';

class AuthGuard extends AutoRouteGuard {
  final MainStore mainStore;

  AuthGuard(this.mainStore);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (mainStore.authStore.isLogin) {
      resolver.next();
    } else {
      resolver.redirect(const LoginRoute());
    }
  }
}
