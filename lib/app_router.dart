import 'package:auto_route/auto_route.dart';
import 'package:flutterstarter/guards/auth_guard.dart';
import 'package:flutterstarter/screens/login_screen.dart';
import 'package:flutterstarter/screens/settings_screen.dart';
import 'package:flutterstarter/stores/main_store.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final MainStore mainStore;

  AppRouter(this.mainStore);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, keepHistory: false),
    guardedAutoRoute(page: SettingsRoute.page),
  ];

  AutoRoute guardedAutoRoute({required PageInfo page}) {
    return AutoRoute(page: page, initial: initialRoute().routeName == page.name, guards: [AuthGuard(mainStore)]);
  }

  static PageRouteInfo initialRoute() {
    return const SettingsRoute();
  }

  static PageRouteInfo initialGuestRoute() {
    return const LoginRoute();
  }
}
