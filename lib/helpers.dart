import 'package:flutterstarter/app_router.dart';
import 'package:flutterstarter/stores/main_store.dart';
import 'package:flutterstarter/stores/settings_store.dart';
import 'package:get_it/get_it.dart';

MainStore get mainStoreI {
  return GetIt.I<MainStore>();
}

SettingsStore get settingStoreI {
  return mainStoreI.settingsStore;
}

AppRouter get routerI {
  return GetIt.I<AppRouter>();
}
