import 'package:flutterstarter/stores/main_store.dart';
import 'package:flutterstarter/utils/http.dart';
import 'package:get_it/get_it.dart';

import 'app_router.dart';

GetIt getIt() {
  GetIt getIt = GetIt.instance;

  getIt.registerSingletonAsync<Http>(() async {
    final http = Http();
    await http.load();
    return http;
  });

  getIt.registerSingletonAsync<MainStore>(() async => MainStore(), dependsOn: [Http]);

  getIt.registerSingletonAsync<AppRouter>(() async {
    final appRouter = AppRouter(GetIt.I<MainStore>());
    return appRouter;
  }, dependsOn: [MainStore]);

  return getIt;
}
